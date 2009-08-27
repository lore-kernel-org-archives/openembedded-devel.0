Received: from [209.85.221.191] (helo=mail-qy0-f191.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Mgh2C-00034p-9q
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 17:37:08 +0200
Received: by qyk29 with SMTP id 29so639852qyk.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Nig/B/iVFv8SCN++OMZaq2PAASPiT5u1Lqpdcp+huTs=;
	b=vZGTGXWSye/idPVPpKkeRgmTTPlVSdzICPvlm1Nmux5MoIeJroN9G5YPMcNSIrPy2B
	pYnKuBirnl7+gBchSBEtZsiSDUy8J+G57zn/sqATBH3tzfCLS9JrNcYCCzEbym65WE/3
	srZkS8DuGmUz+wAt+b1edh988z28Ist++GbNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=wyBvcAZ4fGdbowSVjdICWIL1nouccnegr+Tq51RlYN1xhTlMikLnPExYztwPji27qg
	/jgsxCnq9GP+lpP3f6GXkjysZI0LIHgCFlbJe4EowjJGsDRrI3lu65Lo6435OZ636/QD
	4AXiKea5OMyfV4nkcvU0LtxrMQjLsdtXoJ8Qk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.33.15 with SMTP id f15mr2911228qcd.59.1251386342092; Thu, 
	27 Aug 2009 08:19:02 -0700 (PDT)
In-Reply-To: <4A965026.3020701@dresearch.de>
References: <4A965026.3020701@dresearch.de>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 Aug 2009 08:18:42 -0700
X-Google-Sender-Auth: 259129056e5a73ae
Message-ID: <b6ebd0a50908270818o57a5119q9a72ba7552bbd0e0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: nfs-utils-1.1.2 problem
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
X-List-Received-Date: Thu, 27 Aug 2009 15:37:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

That sounds like a case of someone installing the libtool wrapper
script into the rootfs instead of the real binary.  The do_install may
be directly using 'install' to install it.  It should be changed to
use a normal make install, or call out ${S}/${HOST_SYS}-libtool
--mode=3Dinstall install <rest of install command>.  NOTE: This is
conjecture, I haven't read the recipe, or tested, but it's similar to
an issue I hit last week.

On Thu, Aug 27, 2009 at 2:21 AM, Steffen Sledz<sledz@dresearch.de> wrote:
> I see a problem with mountd from nfs-utils-1.1.2 (Angstrom, current OE de=
v branch):
>
> starting mountd: /usr/sbin/mountd: line 148: /usr/bin/sed: not found
> /usr/sbin/mountd: line 148: /usr/bin/sed: not found
> /usr/sbin/mountd: cd: line 1: can't cd to /home/DRESEARCH/production/META=
BUILD/20090826190001-hydraip-build-1978/OE/tmp.3/wor
> k/armv5te-angstrom-linux-gnueabi/nfs-utils-1.1.2-r4/nfs-utils-1.1.2/utils=
/mountd
> arm-angstrom-linux-gnueabi-gcc: mountd-mountd.o: No such file or director=
y
> arm-angstrom-linux-gnueabi-gcc: mountd-mount_dispatch.o: No such file or =
directory
> arm-angstrom-linux-gnueabi-gcc: mountd-auth.o: No such file or directory
> ...
>
> The first problem is that /usr/sbin/mountd uses /usr/bin/sed but sed is i=
nstalled under /bin/sed.
>
> The second one is that /usr/sbin/mountd contains a relink_command which u=
ses pathes from the build host:
>
> relink_command=3D"(cd /home/DRESEARCH/sledz/work/HydraIP/OE/tmp.3/work/ar=
mv5te-angstrom-linux-gnueabi/nfs-utils-1.1.2-r4/nfs-utils-1.1.2/utils/mount=
d; =C2=A0...
>
> Could someone please have a look at this.
>
> Thx,
> Steffen
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


