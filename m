Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1PTmup-0001l4-8Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:52:59 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id oBGMPaZe008956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 16 Dec 2010 16:25:36 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id oBGMPavc020730;
	Thu, 16 Dec 2010 16:25:36 -0600 (CST)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id oBGMPa7x011872;
	Thu, 16 Dec 2010 16:25:36 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 16 Dec 2010 16:25:36 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Dec 2010 16:25:34 -0600
Thread-Topic: [PATCH] sourceipk: copy over hidden files and dirs
Thread-Index: AcudajsUfQEDycXTQe29g5Fvmh4MkAABddCQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080329E92CF1@dlee06.ent.ti.com>
References: <1292535782-19714-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1292535782-19714-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] sourceipk: copy over hidden files and dirs
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
X-List-Received-Date: Sat, 18 Dec 2010 02:52:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch for now.  I forgot the case where there are no hid=
den files and I need to update to handle this.
> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Thursday, December 16, 2010 3:43 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH] sourceipk: copy over hidden files and dirs
>=20
> * Copy hidden files and directories such as eclipse
>   project files.  Currently these files are not copied
>   (particularly for the top-level directory) which makes
>   applications with eclipse project files not usable with eclipse.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  classes/sourceipk.bbclass |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
> index 97068de..213bff9 100644
> --- a/classes/sourceipk.bbclass
> +++ b/classes/sourceipk.bbclass
> @@ -106,6 +106,12 @@ sourceipk_do_create_srcipk() {
>          # Copy sources for packaging
>          mkdir -p $tmp_dir/${SRCIPK_INSTALL_DIR}
>          cp -RLf ${S}/* $tmp_dir/${SRCIPK_INSTALL_DIR}/
> +        # Copy any hidden files in the source directory such as
> +        # eclipse project files.  Use a regex to avoid trying to
> +        # copy the . and .. directories.  This is only required for
> +        # the top-level directory as the hidden files will be copied
> +        # for subdiretories.
> +        cp -r ${S}/.[a-zA-Z0-9]* $tmp_dir/${SRCIPK_INSTALL_DIR}/
>=20
>          if [ ${SRCIPK_INCLUDE_EXTRAFILES} !=3D "0" ]
>          then
> --
> 1.7.0.4



