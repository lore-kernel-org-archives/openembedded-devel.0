Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ov9nI-0000Wz-F8
	for openembedded-devel@openembedded.org; Mon, 13 Sep 2010 16:14:11 +0200
Received: by pwj1 with SMTP id 1so1692601pwj.6
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Sep 2010 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=fZXF3kCt2vMo3W8fLfPWOn2hremIS8mMbi0Vl2cC3n8=;
	b=kUGjxLtY8bvlcT3AUc86p+OMqrbTvM7eh8twLXf4qE07MWnRawJ9MPdHuY2jMoGNPr
	2m9YtHSDeJnmFwojXPrsFsfkbBgNjthjZJaO/6HVKTdl07yEP58gypdMLIqeziCI/XyA
	ZUsRVrFP69SgOkT5H1H2Yz/vQeiAetr85aMDI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=he46X3MNhfv/a8eW0WB6mZvc6nff62kSaw8Q77C7yKCd+R7spk1Xj5jgp38/hOWlEz
	HkbskHPW2RlzMlf/jjDr+nakC/8C6CdpCjBAtnSRfwqsWBsoEuEk8cEVcbTpU0FCD9Oi
	db+QOK/m/Gqkxm6d08s+DMMQC4JRrRXShc/Xk=
MIME-Version: 1.0
Received: by 10.114.15.5 with SMTP id 5mr5553819wao.200.1284387192219; Mon, 13
	Sep 2010 07:13:12 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 07:13:12 -0700 (PDT)
Date: Mon, 13 Sep 2010 16:13:12 +0200
Message-ID: <AANLkTikTMse1YUD3ERQsBbOdMYCGhsNd3+c1GH_SHSyg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: how to override SRC_URI ?
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
X-List-Received-Date: Mon, 13 Sep 2010 14:14:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I was wondering how to override the SRC_URI in a recipe.

linux-libc-headers_2.6.34.bb contains:

SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
          "
SRC_URI_nios2 =
"ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball
\
          "

I am building for neek (which has nios2 as TARGET_ARCH).

When I build this recipe I see that both tarballs are fetched (but I
would like only to get the last one).
What seems to be happening is that bb.fetch.init
(lib/bb/fetch/__init_.py) is called twice and triggers FetchData for
both URI's (but I had expected it to be called only once (for _nios2)
as I did not use +=

is my understanding correct?
is this a bug in bitbake or am I abusing things?
And is there perhaps a way to fix the recipe in a way that it does
what it intends to do (use the 2nd uri for nios2 and the first one
otherwise)

Thanks alot!
Frans

PS: this is with bitbake from the todays git head (hash
c07cc08f7fd503ac3013ccc43c79198c4c3b7b29)


