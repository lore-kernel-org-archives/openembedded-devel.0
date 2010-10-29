Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBt0o-0007Fe-Ql
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 19:45:12 +0200
Received: by gyf3 with SMTP id 3so2241510gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=kWmVmVUBYQb4BrIrspe/dm+RxlhK/LviU4N2aReFtxk=;
	b=BMO2bAWCUhpF0VEkRbIsNvc3IbnDgH9SJ397Yui3FCAGG9ITlZMEfD4Wf6WGUn2U/F
	wK3z0WrYJdGgAlkqTLLIt/Wr5ncHfL/vV+dfvMdwtDdQ6cQWjhnp/pkv7330be5xTFF1
	1k1CnfZNftPn9LZmSlVkNKwTAie+nxO7W4e5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Q0HpN2z9Q2tPbUcjTkaTIWe3uItRADCKqUe6NFeI2AdoiOIM+wAYgO/0qQQdZz8wS1
	Bx77n8uQLXI19fw5dycSX1ZzwH2TrbVfzyz5IIytWDh1h0BNO07WcSBu0HlLktV38EOF
	CrlHw0Tt1ocIIJPfe0IF+ZXgQVnMKLn/b2PkI=
Received: by 10.90.15.31 with SMTP id 31mr4778878ago.10.1288374264492; Fri, 29
	Oct 2010 10:44:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Fri, 29 Oct 2010 10:44:04 -0700 (PDT)
In-Reply-To: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
References: <1288361334-17427-1-git-send-email-thoughtmonster@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Oct 2010 10:44:04 -0700
Message-ID: <AANLkTimePo8ZCChK8k6Js+kpvmgov5TEr9gzF_gtXyA+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Alex Ferguson <thoughtmonster@gmail.com>
Subject: Re: [PATCH] classes: Modify rootfs_ipk.bbclass for -force-overwrite.
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
X-List-Received-Date: Fri, 29 Oct 2010 17:45:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 29, 2010 at 7:08 AM, Alex Ferguson <thoughtmonster@gmail.com> w=
rote:
> Rationale: In Jlime we ship a package called jlime-extras which
> contains several files (configuration files, scripts, etc.), some
> of which conflict with files provided by other packages. This is
> intentional, and is for distro customization purposes. For example
> we ship a modified version of the /usr/bin/startx script, some
> alternative icons for applications, some modified .desktop files
> and so on. Building an image with this jlime-extras package fails,
> of course, due to conflicting files.
>

hmmm ideally there should be no conflicts and update alternative methods
should be used to provide alternatives.

> To overcome this issue, I have added a base-conditional to
> rootfs_ipk.bbclass, adding the PACKAGE_FORCE_OVERWRITE variable
> to IPKG_ARGS which enables -force-overwrite for opkg, and which
> can be used in image recipes individually without affecting others.
>

you could have added distro specific overrides or even your own layer
to provide these
files per recipe instead of collecting them into a another recipe
which would step
on everyone. I think if we let this happen it can be chosen as a quick
workaround by
many and thats not good.

> I believe this functionality might be useful for everyone and comes
> at almost no additional cost, which is why I'm sending this patch
> for consideration by the OE developers.
>
> I'd be more than happy to help in any way in order to get this in.
>
> Thank you.
>
> Signed-off-by: Alex Ferguson <thoughtmonster@gmail.com>
> ---
> =C2=A0classes/rootfs_ipk.bbclass | =C2=A0 =C2=A03 ++-
> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> index a4a8563..dd8586a 100644
> --- a/classes/rootfs_ipk.bbclass
> +++ b/classes/rootfs_ipk.bbclass
> @@ -9,9 +9,10 @@ do_rootfs[depends] +=3D "opkg-native:do_populate_sysroot=
"
> =C2=A0do_rootfs[lockfiles] =3D "${DEPLOY_DIR_IPK}.lock"
>
> =C2=A0IPKG_TMP_DIR =3D "${IMAGE_ROOTFS}-tmp"
> -IPKG_ARGS =3D "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DI=
R} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)}"
> +IPKG_ARGS =3D "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} -t ${IPKG_TMP_DI=
R} ${@base_conditional("PACKAGE_INSTALL_NO_DEPS", "1", "-nodeps", "", d)} $=
{@base_conditional("PACKAGE_FORCE_OVERWRITE", "1", "-force-overwrite", "", =
d)}"
>
> =C2=A0PACKAGE_INSTALL_NO_DEPS ?=3D "0"
> +PACKAGE_FORCE_OVERWRITE ?=3D "0"
>
> =C2=A0# What support to provide for online management of packages at run =
time?
> =C2=A0# =C2=A0full -> traditional system, opkg is installed with all meta=
data
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


