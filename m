Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MTrP4-0002kE-Tw
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 08:03:44 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MTrBG-000IQf-Rn
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 09:49:27 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jul 2009 09:48:13 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.30-1-amd64; KDE/4.2.4; x86_64; ; )
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<Pine.LNX.4.64.0907220859010.3621@juice.ott.cti.com>
	<1248301473.14790.5.camel@dax.rpnet.com>
In-Reply-To: <1248301473.14790.5.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200907230948.13502.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9124 [Jul 23 2009]
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: low}
X-SpamTest-Method: none
X-SpamTest-Rate: 30
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Thu, 23 Jul 2009 06:03:48 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 23 =D0=B8=D1=8E=D0=BB=D1=8F 2=
009 02:24:33 Richard Purdie wrote:
> Our rootfs_ipk class has:
>
> do_rootfs[recrdeptask] +=3D "do_package_write_ipk"
>
> which means do_rootfs runs after every do_package_write_ipk task that
> do_rootfs can recursively depend on.
>
> do_package_write_ipk depends on do_package which depends on do_install.
>
> The image.bb file itself actually has a do_package_write_ipk task just
> like any other .bb file and do_rootfs should come after it yet we insert
> it before do_install.

If recrdeptask is supposed to apply to the package that wants recrdeps, the=
n=20
it's wrong, sure. How to fix that is the question, we can't do

do_rootfs[recrdeptask] +=3D "do_rootfs"

And yet we want to run do_rootfs for image after do_rootfs's for dependenci=
es=20
were made.

> Multiple image generation works fine in Poky without that FWIW too.

It can't or we're talking about different multiimage situations. I've writt=
en=20
already here, suppose you need different images that depend like this (real=
=20
example, BTW):

       /-8
  /-2--+
1-+    +-9
  |    |
  +-3  \-10
  |
  +-4
  |
  \-5-6-7

So when I'm building image number 2, I need to have images 8, 9, 10 to be=20
built to place that images on image number 2. Same with 6-7, 5-6 and 1 to 2=
,=20
3, 4, 5. Without that patch bitbake started do_rootfs for image number 2=20
before do_rootfs for 8, 9, 10 was done.

In order to solve it using standard package deps mechanism that commit was=
=20
made.


