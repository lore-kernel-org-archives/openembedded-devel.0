Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 31BF26D03A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:13:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Nov 2013 05:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="433182311"
Received: from unknown (HELO helios.localnet) ([10.252.121.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2013 05:13:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Mon, 11 Nov 2013 13:13:04 +0000
Message-ID: <3733774.a8GcKzRnyp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1383844369-15682-1-git-send-email-eric@eukrea.com>
References: <1383844369-15682-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: javier.viguera@digi.com, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v3] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Mon, 11 Nov 2013 13:13:13 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 07 November 2013 18:12:49 Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb=

> b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb index
> 8cfe58f..45b232a 100644
> --- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> @@ -9,7 +9,7 @@ PR =3D "r9"
>=20
>  DEPENDS =3D "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURE=
S',
> 'pam', 'libpam', '', d)}"
>=20
> -SRC_URI =3D "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${P=
V}.tar.gz
> \ +SRC_URI =3D
> "http://www.cherokee-project.de/mirrors/cherokee/1.2/${PV}/cherokee-$=
{PV}.t
> ar.gz \ file://cherokee.init \
>             file://cherokee.service \
>  "

Patch merged to meta-webserver master, thanks.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

