Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P647Q-0003Od-Ub
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 18:23:57 +0200
Received: by yxj4 with SMTP id 4so1923107yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 09:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=49o2A7fo6OqZpSsN0Vkk/CubvMO4vvlpdlAwI3VuGJA=;
	b=wDfiIK9JmEWbNGMtACPYWdFpviAtIGtnBzPwJCIvMMm7reNd1ARq7tBLK6PkTYMKF3
	CotR8bZbh6Y7kpOs7ag1yihenTfumkokCz3oUtwQ9kvcOIlIcD4oA/kwlKwvpIA/M9d6
	eVGdIfAv4yfDJkMs6SMew7fkxJi7sH3ogVLFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=PJSJJ0diNxYkutYknsInsGqOJWP2FT3NXE1Lqe5vCJ7EOUnZGe+F4/DdD0z9kGi73j
	7gsAjFpCNqH9bLlRiSde4NA8le4MogqKa5dbJd7gKUwgomTScNDGS1iQHzd7GlwMxo/7
	30gbxIcIRtfAH+E/NxmASzql6nw2oz6HipT4k=
Received: by 10.90.78.8 with SMTP id a8mr4135398agb.161.1286987007364; Wed, 13
	Oct 2010 09:23:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 13 Oct 2010 09:23:06 -0700 (PDT)
In-Reply-To: <1286971290.3904.6.camel@mattotaupa>
References: <1286971290.3904.6.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Oct 2010 09:23:06 -0700
Message-ID: <AANLkTimanta=-eaEnYmx1J9XSfwm2QzrfbdjB8-51tNr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eglibc-initial-2.12-r15.6+svnr11762: commit d8ce8a: `do_install` fails with `cannot remove `/usr/include/limits.h': Permission denied`
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
X-List-Received-Date: Wed, 13 Oct 2010 16:23:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2010 at 5:01 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ bitbake console-image
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[1]: Leaving directory `/oe/build-minima=
l-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6=
+svnr11762/eglibc-2_12/libc'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[1]: Entering directory `/oe/build-minim=
al-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.=
6+svnr11762/eglibc-2_12/libc'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-eglibc/minimal-dev/sysroot=
s/i686-linux/usr/bin/install -c -m 644 include/limits.h /usr/include/limits=
.h
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-eglibc/minimal-dev/sysroot=
s/i686-linux/usr/bin/install: cannot remove `/usr/include/limits.h': Permis=
sion denied
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[1]: *** [/usr/include/limits.h] Error 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[1]: Leaving directory `/oe/build-minima=
l-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6=
+svnr11762/eglibc-2_12/libc'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make: *** [install-headers] Error 2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| FATAL: oe_runmake failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| ERROR: Function do_install failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NOTE: package eglibc-initial-2.12-r15.6+svnr11=
762: task do_install: Failed
>
> with `minimal-eglibc` for `MACHINE =3D "beagleboard"`.
>
> It tries to delete a file of the build system. I guess the Makefile was
> changed in the latest version bump in d8ce8a [1].
>
> Should I CC the eglibc folks when experiencing such problems?

hmm whats your host make version ?
I do not see this problem on ubuntu 10.10

>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd8ce8=
acea72b7e7e5512accce434aa4b892cf0a8
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


