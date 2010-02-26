Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nl3sj-0005ss-GJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 18:21:42 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nl3q1-0004XR-Bn from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 09:18:53 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 26 Feb 2010 09:18:52 -0800
Received: from 172.30.80.81 ([172.30.80.81]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Fri, 26 Feb 2010 17:18:52 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	26 Feb 2010 10:18:49 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
Organization: Mentor Graphics Corporation
Date: Fri, 26 Feb 2010 10:18:49 -0700
Message-ID: <1267204729.18176.572.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 26 Feb 2010 17:18:52.0969 (UTC)
	FILETIME=[C4E84190:01CAB707]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Generating slightly different images for different IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 26 Feb 2010 17:21:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2010-02-26 at 17:39 +0100, Martin Jansa wrote:
> Hi,
>=20
> on om-gta01 we had problem that even our minimal image
> shr-lite-image is too big for its 64MB NAND chip
>=20
> We're slowly stripping packages not really needed, but it would be=20
> nice to remove whole /boot with kernel-image.
>=20
> Problem is that when we're booting on gta01, than /boot/uImage is used so=
=20
> it should be installed in .tar.gz image. But when booting from NAND, then
> kernel is usually in different NAND partition and /boot on rootfs partiti=
on
> is useless.
>=20
> In patch is what I used now to generate images like this, but it's not op=
timal at all
> 1) It copies whole rootfs 3 times if you have all jffs2/ubi/ubifs in FSTY=
PES,=20
>    instead just once for -no-boot version (it's possible ie if we expect =
certain order=20
>    of making FSTYPES or prepare -no-boot always with normal rootfs and do=
n't remove it
> 2) task-base still depends on kernel-image and I don't see how to easily =
remove that=20
>    dependency, without defining different image recipe and building it se=
parately.=20
>    So with next kernel upgrade user will get new kernel-image which will =
probably fail
>    to install because of lack of space.

Here's one more thing you could try.  Assuming U-Boot, apparently you
can have it load a kernel from jffs2 or ubifs, so rework flash layout a
little bit and load /boot/uImage.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


