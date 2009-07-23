Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MTuLm-00081G-8U
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 11:12:32 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MTu7x-0005Bs-Iy
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jul 2009 12:58:13 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jul 2009 12:46:26 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.30-1-amd64; KDE/4.2.4; x86_64; ; )
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<200907230948.13502.khimov@altell.ru>
	<1248336291.14790.19.camel@dax.rpnet.com>
In-Reply-To: <1248336291.14790.19.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200907231246.26866.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9133 [Jul 23 2009]
X-SpamTest-Method: none
X-SpamTest-Rate: 0
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
X-List-Received-Date: Thu, 23 Jul 2009 09:12:56 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 23 =D0=B8=D1=8E=D0=BB=D1=8F 2=
009 12:04:51 Richard Purdie wrote:
> On Thu, 2009-07-23 at 09:48 +0400, Roman I Khimov wrote:
> >        /-8
> >   /-2--+
> > 1-+    +-9
> >
> >   +-3  \-10
> >
> >   +-4
> >
> >   \-5-6-7
>
> Images 1,2,5 and 6 need to specify they have dependencies on other image
> rootfs tasks with something like:
>
> do_rootfs[depends] +=3D "some-other-image-task:do_rootfs"
>
> Is there some reason this doesn't work?

Well, that would work, obviously, but seemed like a bad style to me, we hav=
e=20
DEPENDS for recipe dependencies, so why images should be that different? An=
d=20
in my case it would be

do_rootfs[depends] +=3D "image2:do_rootfs image3:do_rootfs image4:do_rootfs=
 \
	image5:do_rootfs"

compared to

DEPENDS +=3D "image2 image3 image4 image5"

which worked well for quite some time.

If there is any way to keep this DEPENDS behaviour?


