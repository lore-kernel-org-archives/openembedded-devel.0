Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NwcPL-0004Fs-8Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 16:27:08 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NwcMA-0003v5-9g from Tom_Rini@mentor.com ;
	Tue, 30 Mar 2010 07:23:50 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 30 Mar 2010 07:23:49 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 30 Mar 2010 14:23:04 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	30 Mar 2010 07:23:03 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1269886592-669-1-git-send-email-k.kooi@student.utwente.nl>
References: <1269886592-669-1-git-send-email-k.kooi@student.utwente.nl>
Organization: Mentor Graphics Corporation
Date: Tue, 30 Mar 2010 07:23:03 -0700
Message-ID: <1269958983.6277.37.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 30 Mar 2010 14:23:49.0879 (UTC)
	FILETIME=[9DCBE870:01CAD014]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] gcc-cross: fix gfortran -> g77 linking logic
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
X-List-Received-Date: Tue, 30 Mar 2010 14:27:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-03-29 at 20:16 +0200, Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>

Acked-by: Tom Rini <tom_rini@mentor.com>

>=20
> ---
>  recipes/gcc/gcc-configure-cross.inc |   13 +++++++++++++
>  recipes/gcc/gcc-package-cross.inc   |   14 ++++++++------
>  2 files changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-config=
ure-cross.inc
> index 1c37de8..7dde9de 100644
> --- a/recipes/gcc/gcc-configure-cross.inc
> +++ b/recipes/gcc/gcc-configure-cross.inc
> @@ -51,5 +51,18 @@ do_stage_append () {
>  		sed -i "s|dependency_libs\s*=3D\s*.*|dependency_libs=3D'-L${CROSS_DIR}=
/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/=
libsupc++.la || true
>  		sed -i "s|dependency_libs\s*=3D\s*.*|dependency_libs=3D'-L${CROSS_DIR}=
/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/=
libstdc++.la || true
>  	done
> +
> +    # Link gfortran to g77 to satisfy not-so-smart configure or hard cod=
ed g77
> +    # gfortran is fully backwards compatible. This is a safe and practic=
al solution.
> +    if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> +           currdir=3D"$PWD"
> +           cd ${CROSS_DIR}/bin/
> +           ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
> +           if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then=20
> +               cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> +               ln -sf gfortran g77 || true
> +           fi
> +           cd $currdir
> +    fi
>  }
> =20
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-=
cross.inc
> index 6c4f9bb..0f91861 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -63,16 +63,18 @@ do_install () {
>                 ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* ||=
 true
>                 ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.=
so.* || true
>                 ${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.s=
o* || true
> -	fi
> +       fi
>      =20
>         # Link gfortran to g77 to satisfy not-so-smart configure or hard =
coded g77
>         # gfortran is fully backwards compatible. This is a safe and prac=
tical solution.
> -       if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> +       if [ -f ${D}${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
>                currdir=3D"$PWD"
> -              cd ${CROSS_DIR}/bin/
> +              cd ${D}${CROSS_DIR}/bin/
>                ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || tru=
e
> -              cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> -              ln -sf gfortran g77 || true
> +              if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then=20
> +                  cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> +                  ln -sf gfortran g77 || true
> +              fi
>                cd $currdir
> -       fi
> +        fi
>  }


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


