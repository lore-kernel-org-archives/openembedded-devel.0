Received: from f43.mail.ru ([217.69.128.200])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nyrl@mail.ru>) id 1PTBy9-00075w-HE
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 12:25:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail; 
	h=Message-Id:Content-Type:Reply-To:Date:Mime-Version:Subject:To:From;
	bh=x4RGn45EdioleNEIAAxEn7Rz7vbrYvaSLDKCxoG/G58=; 
	b=ED/48M2/h7CrpfW9EnD1JrBAF9c+dVQ9RcFjOc4t73nll9fE1/WknU/5FfI0EC7F69jycdK1KYo95JotUNBe+Vrux1PVEHDkp/gNpcrs8ifYtwSMMZsMCb/QTWnL291l;
Received: from mail by f43.mail.ru with local id 1PTBwY-0002OI-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 14:24:18 +0300
Received: from [79.173.78.16] by win.mail.ru with HTTP;
	Thu, 16 Dec 2010 14:24:18 +0300
From: =?koi8-r?Q?=E4=C5=CE=C9=D3_=E4=D9=C4=D9=DE=CB=C9=CE?= <nyrl@mail.ru>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0
X-Mailer: mPOP Web-Mail 2.19
X-Originating-IP: [79.173.78.16]
Date: Thu, 16 Dec 2010 14:24:18 +0300
Message-Id: <E1PTBwY-0002OI-00.nyrl-mail-ru@f43.mail.ru>
X-Spam: Not detected
X-Mras: Ok
X-SA-Exim-Connect-IP: 217.69.128.200
X-SA-Exim-Mail-From: nyrl@mail.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	HTML_TAG_BALANCE_BODY,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [RFC] Local files search in overlay folders first
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Dec 2010 11:25:58 -0000
X-Groupsio-MsgNum: 27217
Content-Type: multipart/mixed;
	boundary="----AyMh6DQF-KEs2YRSt1KYIg35z:1292498658"

------AyMh6DQF-KEs2YRSt1KYIg35z:1292498658
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit


Hi,

I am using OE with my own overlay and I want to adjust linux kernel settings with minimal efforts. I have the following structure:
oe/
  recipes/
    linux/
      linux-davinci.inc
      linux-davinci_git.bb
      <others-includes>
      linux-davinci/
        <patches>
        omapl137/
          defconfig
overlay/
  recipes/
BBPATH="<topdir>/overlay:<topdir>/oe"

What I generally want is to simply replace defconfig with my own without changing recipe and touching other patches. I consider that having this structure could be fine for me:
overlay/
  recipes/
    linux/
      linux-davinci/
        omapl137/
          defconfig     (modified)

It does not work for release-2010.12 of OE and it does not seems to work in master either.


I believe that changing FILESPATHBASE so that it will look in "recipes/linux/linux-davinci/omapl137" subfolder for each entry in BBPATH in defined order would solve my problem. For given example having FILESPATHBASE defines as "<topdir>/overlay/recipes/linux:<topdir>/oe/recipes/linux" would be enough.

I created recurrent-filespathbase.bbclass which redefines FILESPATHBASE so that instead of FILE_DIRNAME it is defined with each BBPATH's root followed by suffix derived from FILE_DIRNAME. It only does so for paths known by BBPATH.
To use this one has to define INHERIT += "recurrent-filespathbase.bbclass" in local.conf and then one can put just overriding files for any patch or source.

I attach this recurrent-filespathbase.bbclass. Please consider whether it is a safe approach to solve the problem I described, and whether it should be included into OE.

Thank you in advance, Denis.


------AyMh6DQF-KEs2YRSt1KYIg35z:1292498658
Content-Type: application/octet-stream; name="recurrent-filespathbase.bbclass"
Content-Disposition: attachment
Content-Transfer-Encoding: base64

IyBSZXBsYWNlIEZJTEVTUEFUSEJBU0Ugc28gaXQgd2lsbCByZWN1cnJlbnRseSBsb29rIGluIGV2
ZXJ5IGZvbGRlciBkZWZpbmVkIGluIEJCUEFUSApkZWYgY29uc3RydWN0X0ZJTEVTUEFUSEJBU0Vf
YnlfRklMRV9ESVJOQU1FIChkbiwgZCk6CglpbXBvcnQgYmIKCWJicGF0aExpc3QgPSBiYi5kYXRh
LmdldFZhcignQkJQQVRIJywgZCkuc3BsaXQoJzonKQoJZm9yIGZwIGluIGJicGF0aExpc3Q6CgkJ
aWYgZG4uc3RhcnRzd2l0aChmcCk6CgkJCXN1ZmZpeCA9IGRuLnJlcGxhY2UoZnAsICcnLCAxKQoJ
CQlyZXN1bHQgPSAnJwoJCQlmb3IgbGkgaW4gYmJwYXRoTGlzdDoKIAkJCQlyZXN1bHQgKz0gJzon
K29zLnBhdGgubm9ybXBhdGgobGkrIi8iK3N1ZmZpeCkKCQkJcmV0dXJuIHJlc3VsdC5zdHJpcCgn
OicpCglyZXR1cm4gZG4KCkZJTEVTUEFUSEJBU0UgPS4gIiR7QGNvbnN0cnVjdF9GSUxFU1BBVEhC
QVNFX2J5X0ZJTEVfRElSTkFNRShiYi5kYXRhLmdldFZhcignRklMRV9ESVJOQU1FJywgZCwgMSks
IGQpfSIKCg==

------AyMh6DQF-KEs2YRSt1KYIg35z:1292498658--
