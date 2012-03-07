Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S58qn-00084X-G6
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Mar 2012 05:51:45 +0100
Received: by lagw12 with SMTP id w12so7181210lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 20:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=k56BvOiIPkdShLHne6AejPNgHAEic3MrSGfUBjVKr34=;
	b=FQPfq8Ue1wr6WyIYJ1tLpjtJDl/C2iufUUMhhRV2pEbfQmTaiQ1Mvk3OAQQU5i8kxd
	fM75oXtchsoUEjN2ytDBD30PjRKpCHDXrCqlaENhNLRCg4/A9Zz/p6yoiE6xYWgGK96Z
	0VNjvRwHL5JWb/ckBGWCmmR/qv+01UeL7E9dDU+DdnDXy/2wVul4JlklBpqI/rORLDrs
	J3AaZMMf9t1HaVeHG54LMYa9QHXNlonu4qO997+ojk1xizhzzIngN7HDF9o5MSW6eQRg
	xdYBbLCix5AKB6+Evk84coTVX6iF4W0XtMT8cWUfoN5amTxvTuf1wyclbBSsLr7VxDIK
	yleA==
Received: by 10.152.132.132 with SMTP id ou4mr411661lab.26.1331095388828; Tue,
	06 Mar 2012 20:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 6 Mar 2012 20:42:38 -0800 (PST)
In-Reply-To: <A57ACED2-3733-4037-ACC9-870532921768@me.com>
References: <A57ACED2-3733-4037-ACC9-870532921768@me.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Mar 2012 20:42:38 -0800
Message-ID: <CAMKF1spiEDy+R5xVvjCyRtcQmEZJsibTGxFPCQL-1-FFxeDKJQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils recipe: new SOURCE_URI
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
X-List-Received-Date: Wed, 07 Mar 2012 04:51:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 5:43 PM, Daniel Zauner <daniel.zauner@me.com> wrote:
> Changed the Source-URI from (currently?) dead openmoko SVN-Server to new =
git-repository at git.yoctoproject.org / my first submit, be nice :D
>

thanks for the patch. Can you rebase it against maintenance branch ?
and send a pull request thats the last stable branch out of oe.dev

http://www.openembedded.org/wiki/2011.03-maintenance


> dFence
> ---
> =C2=A0recipes/opkg-utils/opkg-utils_git.bb | =C2=A0 27 ++++++++++++++++++=
+++++++++
> =C2=A0recipes/opkg-utils/opkg-utils_svn.bb | =C2=A0 27 ------------------=
---------
> =C2=A02 files changed, 27 insertions(+), 27 deletions(-)
> =C2=A0create mode 100644 recipes/opkg-utils/opkg-utils_git.bb
> =C2=A0delete mode 100644 recipes/opkg-utils/opkg-utils_svn.bb
>
> diff --git a/recipes/opkg-utils/opkg-utils_git.bb b/recipes/opkg-utils/op=
kg-utils_git.bb
> new file mode 100644
> index 0000000..6adc7c1
> --- /dev/null
> +++ b/recipes/opkg-utils/opkg-utils_git.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "OPKG Package Manager Utilities"
> +SECTION =3D "base"
> +HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +RDEPENDS_${PN} =3D "python"
> +RDEPENDS_${PN}_virtclass-native =3D ""
> +SRCREV =3D "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> +PV =3D "0.1.8+gitr${SRCPV}"
> +PR =3D "r0"
> +
> +SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://index-ignore-filenotfound.pat=
ch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arfile_header_split.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mtime-int.patch"
> +
> +S =3D "${WORKDIR}/git"
> +
> +# Avoid circular dependencies from package_ipk.bbclass
> +PACKAGES_virtclass-native =3D ""
> +
> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D}=
 install
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/op=
kg-utils_svn.bb
> deleted file mode 100644
> index 3ddafdb..0000000
> --- a/recipes/opkg-utils/opkg-utils_svn.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION =3D "OPKG Package Manager Utilities"
> -SECTION =3D "base"
> -HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
> -PRIORITY =3D "optional"
> -LICENSE =3D "GPLv2"
> -RDEPENDS_${PN} =3D "python"
> -RDEPENDS_${PN}_virtclass-native =3D ""
> -SRCREV =3D "4747"
> -PV =3D "0.1.8+svnr${SRCPV}"
> -PR =3D "r7"
> -
> -SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dopkg-utils;=
proto=3Dhttp \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://index-ignore-filenotfound.pat=
ch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://arfile_header_split.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mtime-int.patch"
> -
> -S =3D "${WORKDIR}/opkg-utils"
> -
> -# Avoid circular dependencies from package_ipk.bbclass
> -PACKAGES_virtclass-native =3D ""
> -
> -do_install() {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D}=
 install
> -}
> -
> -BBCLASSEXTEND =3D "native"
> -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> --
> 1.7.2.5
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


