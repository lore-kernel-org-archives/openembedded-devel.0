Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1RHHbX-0000Aq-Es
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 18:05:55 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9LFun2A015584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:56:49 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9LFunju012237
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:56:49 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9LFunYt023908
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:56:49 -0500 (CDT)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Fri, 21 Oct 2011 10:56:49 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] sourceipk: dereference symlinks in sourceipk
Thread-Index: AQHMh4Kb0CgRRC7i5k+nHGhb4hrzyZWHBQCA
Date: Fri, 21 Oct 2011 15:56:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010350412A@DLEE12.ent.ti.com>
References: <1318274820-23565-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1318274820-23565-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] sourceipk: dereference symlinks in sourceipk
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
X-List-Received-Date: Fri, 21 Oct 2011 16:05:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ping.  Any objections to this?

Sincerely,
Chase Maupin
Open Platforms
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

> -----Original Message-----
> From: Maupin, Chase
> Sent: Monday, October 10, 2011 2:27 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH] sourceipk: dereference symlinks in sourceipk
>=20
> * Added the -h option to the tar command to make sure that any
>   patches that may have been applied by the recipe are actually
>   copied instead of made as symlinks to the recipe directory.
> * This is so that people can see the actual patches and unapply
>   individual patches as desired.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  classes/sourceipk.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
> index 1b63996..546ec67 100644
> --- a/classes/sourceipk.bbclass
> +++ b/classes/sourceipk.bbclass
> @@ -122,7 +122,7 @@ sourceipk_do_create_srcipk() {
>          fi
>=20
>          #Write the data tarball
> -        tar -C $tmp_dir --owner=3D0 --group=3D0 -czf
> $srcipk_dir/data.tar.gz .
> +        tar -C $tmp_dir --owner=3D0 --group=3D0 -chzf
> $srcipk_dir/data.tar.gz .
>=20
>          # Create the debian-binary file
>          echo "2.0" > $srcipk_dir/debian-binary
> --
> 1.7.0.4



