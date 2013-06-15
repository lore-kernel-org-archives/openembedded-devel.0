Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E07516A48E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2013 12:47:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2013 05:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,871,1363158000"; d="scan'208";a="329943109"
Received: from unknown (HELO helios.localnet) ([10.252.122.9])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2013 05:47:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2013 13:47:27 +0100
Message-ID: <1894119.75TubD1pJZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-23-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <1371255429-32747-3-git-send-email-raj.khem@gmail.com>
References: <1371255429-32747-1-git-send-email-raj.khem@gmail.com>
	<1371255429-32747-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH 3/3] nspr: Match the bbappend to OE-Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Jun 2013 12:47:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 14 June 2013 17:17:09 Khem Raj wrote:
> Remove PRINC not needed with PR server
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> CC:Eric B=E9nard <eric@eukrea.com>
> CC:Denis Carikli <denis@eukrea.com>
> CC:Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../{nspr_4.9.6.bbappend =3D> nspr_4.10.bbappend}    |    2 --
>  1 file changed, 2 deletions(-)
>  rename recipes-support/nspr/{nspr_4.9.6.bbappend =3D> nspr_4.10.bbap=
pend}
> (93%)
>=20
> diff --git a/recipes-support/nspr/nspr_4.9.6.bbappend
> b/recipes-support/nspr/nspr_4.10.bbappend similarity index 93%
> rename from recipes-support/nspr/nspr_4.9.6.bbappend
> rename to recipes-support/nspr/nspr_4.10.bbappend
> index 3153bf3..3296e91 100644
> --- a/recipes-support/nspr/nspr_4.9.6.bbappend
> +++ b/recipes-support/nspr/nspr_4.10.bbappend
> @@ -1,5 +1,3 @@
> -PRINC :=3D "${@int(PRINC) + 1}"
> -
>  # nspr-native is needed by nss
>  BBCLASSEXTEND =3D "native"

Could we just get these changes applied in OE-Core and avoid the need f=
or a=20
bbappend?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

