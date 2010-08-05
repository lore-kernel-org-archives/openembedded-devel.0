Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OgwN8-0000JK-55
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 11:04:20 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 259E44669
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 13:08:49 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Aug 2010 13:04:05 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <E1OguCD-00023v-03@melo.openembedded.org>
	<201008051241.24091.khimov@altell.ru>
	<AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
In-Reply-To: <AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008051304.05706.khimov@altell.ru>
X-Altell-MailScanner-ID: 259E44669.82798
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : bitbake.conf: trust server certificate when doing svn over https
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
X-List-Received-Date: Thu, 05 Aug 2010 09:04:20 -0000
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =FE=C5=D4=D7=C5=D2=C7 05 =C1=D7=C7=
=D5=D3=D4=C1 2010 12:55:05 =C1=D7=D4=CF=D2 Frans Meulenbroeks =CE=C1=D0=C9=
=D3=C1=CC:
> 2010/8/5 Roman I Khimov <khimov@altell.ru>:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =FE=C5=D4=D7=C5=D2=C7 05 =C1=D7=
=C7=D5=D3=D4=C1 2010 12:24:40 =C1=D7=D4=CF=D2 Martin Jansa =CE=C1=D0=C9=D3=
=C1=CC:
> >> I don't know if it's worth it to force builders to upgrade subversion =
or
> >> add their FETCHCOMMAND_svn UPDATECOMMAND_svn to local.conf.
> >
> > IMO we should not break support for major stable (or LTS) distros, so my
> > patch is broken.
>=20
> I agree that we should not break support for major distros. but
> without your patch some of the recipes cannot be build easily.
> The solution of Martin seems a good inbetween.

Unfortunately, "--force" wouldn't solve untrusted certificate problem:

build@build2:~$ svn --non-interactive --force co https://svn.ntop.org/svn/n=
top/trunk/PF_RING
svn: OPTIONS of 'https://svn.ntop.org/svn/ntop/trunk/PF_RING': Server certi=
ficate verification failed: issuer is not trusted (https://svn.ntop.org)
build@build2:~$ svn --version |grep \ version
svn, version 1.5.1 (r32289)

So it either stays as it is or we need svn-native to really fix the problem.


