Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwXjg-0007LQ-UJ for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 11:27:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NwXgZ-0001YC-DB for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 11:24:35 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:24:35 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:24:35 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 30 Mar 2010 11:24:21 +0200
Message-ID: <hosg05$t7h$1@dough.gmane.org>
References: <1269886592-669-1-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100318 Shredder/3.0.5pre
In-Reply-To: <1269886592-669-1-git-send-email-k.kooi@student.utwente.nl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 30 Mar 2010 09:27:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Any comments?

On 29-03-10 20:16, Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> ---
>  recipes/gcc/gcc-configure-cross.inc |   13 +++++++++++++
>  recipes/gcc/gcc-package-cross.inc   |   14 ++++++++------
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-configure-cross.inc
> index 1c37de8..7dde9de 100644
> --- a/recipes/gcc/gcc-configure-cross.inc
> +++ b/recipes/gcc/gcc-configure-cross.inc
> @@ -51,5 +51,18 @@ do_stage_append () {
>  		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libsupc++.la || true
>  		sed -i "s|dependency_libs\s*=\s*.*|dependency_libs='-L${CROSS_DIR}/${TARGET_SYS}/$d ${LIBGCCS_VAR} -lc -lm '|" ${CROSS_DIR}/${TARGET_SYS}/$d/libstdc++.la || true
>  	done
> +
> +    # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
> +    # gfortran is fully backwards compatible. This is a safe and practical solution.
> +    if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> +           currdir="$PWD"
> +           cd ${CROSS_DIR}/bin/
> +           ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
> +           if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then 
> +               cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> +               ln -sf gfortran g77 || true
> +           fi
> +           cd $currdir
> +    fi
>  }
>  
> diff --git a/recipes/gcc/gcc-package-cross.inc b/recipes/gcc/gcc-package-cross.inc
> index 6c4f9bb..0f91861 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -63,16 +63,18 @@ do_install () {
>                 ${TARGET_PREFIX}strip ${D}${target_libdir}/libg2c.so.* || true
>                 ${TARGET_PREFIX}strip ${D}${target_base_libdir}/libgcc_s.so.* || true
>                 ${TARGET_PREFIX}strip ${D}${target_libdir}/libgfortran*.so* || true
> -	fi
> +       fi
>       
>         # Link gfortran to g77 to satisfy not-so-smart configure or hard coded g77
>         # gfortran is fully backwards compatible. This is a safe and practical solution.
> -       if [ -f ${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
> +       if [ -f ${D}${CROSS_DIR}/bin/${TARGET_PREFIX}gfortran ]; then
>                currdir="$PWD"
> -              cd ${CROSS_DIR}/bin/
> +              cd ${D}${CROSS_DIR}/bin/
>                ln -sf ${TARGET_PREFIX}gfortran ${TARGET_PREFIX}g77 || true
> -              cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> -              ln -sf gfortran g77 || true
> +              if [ -d ${CROSS_DIR}/${TARGET_SYS}/bin/ ] ; then 
> +                  cd ${CROSS_DIR}/${TARGET_SYS}/bin/
> +                  ln -sf gfortran g77 || true
> +              fi
>                cd $currdir
> -       fi
> +        fi
>  }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLscNFMkyGM64RGpERAvzdAJ9ThKJilQssdNmTWBacsGLO8gWWEACfXusn
P57vKbezse7N9wjUTjI++JY=
=Jn6k
-----END PGP SIGNATURE-----



