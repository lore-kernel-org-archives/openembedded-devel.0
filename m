Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OejDs-0003sK-UD
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 08:37:37 +0200
Received: by iwn34 with SMTP id 34so1089153iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 23:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=6a6s0P8lMozEEuxoPYyvY/dE6H0BF1vBRsaEBel0f0I=;
	b=n8GXwvyGldZwLUaPQ4bzhFpO9iQYY2LNPtzlPEBO5UwFOCp3rte0hr0ZY3C+JVIe8R
	6p6nC0FL7jhzwssi1mc/M1EjuSAQQLW4QPrnyK+7R8zMgHG6+utqQWrcKsdGG7K1ng6O
	lA9mpWLnCuy8HMHE6/pyXxjlfCqIN8+1+Gt6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ez3CtVg7m4j8wqZTxD+c8YZRvonvdFJhDIRP+rS321FJuwZKB6bYQliN5Pwv6Q+Wgv
	b8ABrydniI1YHSItqpWsZ1bjAe70SwHWK52jr3KfvZxG1YVor/r2cCMWiYNi2gzxm0lt
	unSc03ivc3b4qX8w++KAsrl9ilqmVZcQEapkw=
Received: by 10.231.193.81 with SMTP id dt17mr1200378ibb.177.1280471806161; 
	Thu, 29 Jul 2010 23:36:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Thu, 29 Jul 2010 23:36:26 -0700 (PDT)
In-Reply-To: <4C523E6D.8040109@mentor.com>
References: <4C523E6D.8040109@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Jul 2010 23:36:26 -0700
Message-ID: <AANLkTiketBU=4fc1w37V-34Ge1HHRbxxB8hCdX2w+vRh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v4] Make multi-machine toolchains to co-exist (revised again)
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
X-List-Received-Date: Fri, 30 Jul 2010 06:37:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2010 at 7:52 PM, Tom Rini <tom_rini@mentor.com> wrote:
> Hey all,
>
> As one of the folks who suggested something else, here's my take.
>
> We modify the prefix for cross stuff to dump everything into
> MULTIMACH_TARGET_SYS in the sysroot.
>
> Pro: It should work for all the cases
> Con: We're back to having a 'special' directory of cross stuff
> Pro: It's separate but still valid for $ORIGIN mangling, which is the
> other problem we had before.
>
> I've got a qemuarm console-image and then beagleboard console-image build
> going now and that's going to take time.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

hah indecently I have been testing similar patch per our discussions on IRC
but trying to get program-transform-name to generate unique compiler names
which can coexist in <native sysroot>/usr/bin meanwhile I work on that this
portion looks ok to go in.

Signed-off-by: Khem Raj <raj.khem@gmail.com>


>
> diff --git a/classes/cross.bbclass b/classes/cross.bbclass
> index db86192..b3f74a2 100644
> --- a/classes/cross.bbclass
> +++ b/classes/cross.bbclass
> @@ -44,9 +44,9 @@ target_base_libdir :=3D "${base_libdir}"
> =A0target_prefix :=3D "${prefix}"
>
> =A0# Overrides for paths
> -prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> +prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS=
}"
> =A0base_prefix =3D "${STAGING_DIR_NATIVE}"
> -exec_prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> +exec_prefix =3D
> "${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}"
> =A0base_sbindir =3D "${base_prefix}/bin"
> =A0sbindir =3D "${exec_prefix}/bin"
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index d523519..23281fd 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -299,7 +299,7 @@ STAGING_DIR_JAVA =3D "${STAGING_DIR}/java"
> =A0STAGING_DIR_NATIVE =3D "${STAGING_DIR}/${BUILD_SYS}"
> =A0STAGING_BINDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${bindir_native}"
> =A0STAGING_SBINDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${sbindir_native}"
> -STAGING_BINDIR_CROSS =A0=3D
> "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
> +STAGING_BINDIR_CROSS =A0=3D
> "${STAGING_DIR_NATIVE}${prefix_native}/${MULTIMACH_TARGET_SYS}${base_bind=
ir_native}"
> =A0STAGING_BINDIR_CROSS_BASEPKG =3D
> "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
> =A0STAGING_LIBDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${libdir_native}"
> =A0STAGING_INCDIR_NATIVE =3D "${STAGING_DIR_NATIVE}${includedir_native}"
>
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


