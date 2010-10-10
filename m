Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4pZ9-00063l-8M
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 08:39:28 +0200
Received: by ywl5 with SMTP id 5so753578ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 23:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=Zi5pI3N9R7q+OXlOFM56yH06Np+VfRLtXM3Zs98pelc=;
	b=IxVYR9jw4w07iM27T0f5u9aN3RIU+Fo81cWMZmm4TRrg7a5KLynbwzgZOOtSdWZddj
	OgeHt2rdIsX8+wkbwNXy3/BaapyWlHXAmO8lMTr1dOOgcjbOAkOq3LxFmz3INZ1ycJOw
	v4GDsaLGv/h8LKU5ZmWYgNpfQd572grKzkmHg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=h98S0G6hXqQGmLi7Pna4g8sT2RfWlpKK01OJKUPp2rJUQUyCkziE2ZFnnMgfv07dcx
	zuAtYeunLNH5JgTHlI7o574sh6Nj23psKPVWShr6EljO4sZPz1NIyZfbC6cWQE674WIe
	Dom6Ma1qg880FuvB6o4pLo5D/bN+Daa38VU9w=
Received: by 10.90.106.9 with SMTP id e9mr2386377agc.147.1286692742325; Sat,
	09 Oct 2010 23:39:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.77.10 with HTTP; Sat, 9 Oct 2010 23:38:42 -0700 (PDT)
In-Reply-To: <1286689119-25553-1-git-send-email-kergoth@gmail.com>
References: <1286689119-25553-1-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Oct 2010 23:38:42 -0700
Message-ID: <AANLkTimRXH=4E4-qwBC2UTVuYo59VQXCT4cf50FWdE=5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] bitbake.conf: fix pkg-config relocation issue
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
X-List-Received-Date: Sun, 10 Oct 2010 06:39:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 9, 2010 at 10:38 PM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> By default, pkg-config falls back to checking the default search path for=
 .pc
> files, which is the native location. =C2=A0If you relocate it, it will be=
 unable to
> hit that location, which can cause problems in certain cases. =C2=A0In pa=
rticular,
> gnome-bluetooth requires gtk-doc-native to run its tools, and uses pkg-co=
nfig
> to determine its availability.
>
> Fix by adding the native pkg-config locations to the PKG_CONFIG_PATH.
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0conf/bitbake.conf | =C2=A0 =C2=A05 +++--
> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 4e80d97..71f15a8 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -636,8 +636,9 @@ SLOT =3D "0"
>
> =C2=A0# Other
>
> -export PKG_CONFIG_DIR =3D "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_V=
ENDOR}-${TARGET_OS}${libdir}/pkgconfig"
> -export PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconf=
ig"
> +export PKG_CONFIG_PATH =3D "${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADI=
R}/pkgconfig"
> +PKG_CONFIG_PATH .=3D ":${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATA=
DIR_NATIVE}/pkgconfig"
> +
> =C2=A0export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR}/${BASE_PACKAGE_AR=
CH}${TARGET_VENDOR}-${TARGET_OS}"
> =C2=A0export PKG_CONFIG_DISABLE_UNINSTALLED =3D "yes"
>
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


