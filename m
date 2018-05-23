Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 251C471A9D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 11:37:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so8312638wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2018 04:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BpMPHwpatY9LOiQnIw/Q1FDlymfiAmwlteSqtcECg3E=;
	b=rA5Gx7EIYUVJXCg0+UhhEEcr3pyVD40XphvXxrFbKHc6xHEX0Yw72HnSY7l/lcuQY3
	fHxQkNQxPWoiy6c35CioL+bibw4D4oZpCvVjl6CdNbb0zpz8pcUfIrlFp0sLqpnimCMb
	MshbBV3VhyefKf/EGtxoqK3ogkR6j8tZV17eLPMev1HwjHACWaObQB0qKayz87CaOuKx
	qBCvgYzsRd2HjQWrHrsd4eQYVBk3jEmMrkZC707vdNWK2/3iAiADjS/QqrEkGYayQI/a
	xcczx3kshw/+vAo/Ve0XzSFFtRCiY4p+CDMojNIk5OUqWrYMqtxXOiANRUOmZmGGjJTB
	mVcw==
X-Gm-Message-State: ALKqPwdV2M0/i7/cJAYuyvbTGwa++yn7Yky8UoIXapsjtBBO53T2UmYc
	OCL5R4+yN0ugQz3+uvgXIetWy6F/
X-Google-Smtp-Source: AB8JxZpAqM4fpLRGQI5bkOdmv/sc36Xu+Ym/NB9F/02GRAu2Ud+ZVytdDmzloCumqbUwiZ8XLsAyIQ==
X-Received: by 2002:a50:a245:: with SMTP id
	63-v6mr6880346edl.295.1527075423209; 
	Wed, 23 May 2018 04:37:03 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	s14-v6sm9985582eds.10.2018.05.23.04.37.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 May 2018 04:37:02 -0700 (PDT)
Message-ID: <19e8db9186f9b2d072389e82461daedf0cb58cad.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2018 12:37:01 +0100
In-Reply-To: <20180425150724.9102-1-git@andred.net>
References: <20180425150724.9102-1-git@andred.net>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-8: update aarch64 version to 8u162b12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 11:37:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It looks like the files have changed, as the checksums for this 162b12
update aren't right anymore...

Starting to look into this, I wonder if the URLs used by the OpenJDK-8
recipes are actually meant to be stable? The URL pattern is

http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}/archive/${OPENJDK_FILE}

Considering 'archive' in the URL, and considering you can download an
archive of tip if you want to, and the fact that the server doesn't send the
size in bytes of the file - are these created on demand, and can thusly
change due to timestamps? (Similar to the github archive problems we're
having).

On the other hand, the previous checksums for the 161b15 release are still
valid.

I'd suggest to switch the OpenJDK-8 recipes to fetching from hg:// directly,
rather than using those archive URLs?

So, are those archives meant to be returning the same file forever? Any
thoughts?


Cheers,
Andre'

On Wed, 2018-04-25 at 16:07 +0100, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>  recipes-core/openjdk/openjdk-8-release-161b15.inc  | 33 ---------------
> -------
>  .../openjdk/openjdk-8-release-162b12-aarch64.inc   | 33
> ++++++++++++++++++++++
>  recipes-core/openjdk/openjdk-8_16xbyy.bb           |  5 ++--
>  recipes-core/openjdk/openjre-8_16xbyy.bb           |  5 ++--
>  4 files changed, 39 insertions(+), 37 deletions(-)
>  delete mode 100644 recipes-core/openjdk/openjdk-8-release-161b15.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8-release-162b12-
> aarch64.inc
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-161b15.inc b/recipes-
> core/openjdk/openjdk-8-release-161b15.inc
> deleted file mode 100644
> index 0a4434c..0000000
> --- a/recipes-core/openjdk/openjdk-8-release-161b15.inc
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -require openjdk-8-release-16xbyy.inc
> -
> -CORBA_CHANGESET_aarch64 = "f73da600c483"
> -SRC_URI[corba.md5sum] = "bf884b82fcc6de466946fcb87d24ebf3"
> -SRC_URI[corba.sha256sum] =
> "ebf73d96185fc05e502088ae89a8d6494c3971dd220458deeff3876f72396b6c"
> -
> -HOTSPOT_CHANGESET_aarch64 = "a600839824fa"
> -SRC_URI[hotspot.md5sum] = "20c88ba26f8f45a2769f4edf32afd593"
> -SRC_URI[hotspot.sha256sum] =
> "6d0d1b9c2df3392ad6e21ca3eae39d06b50632a4a419da3d4363248943ea8b97"
> -
> -JAXP_CHANGESET_aarch64 = "b1e2af899046"
> -SRC_URI[jaxp.md5sum] = "219582b26d7de2973b75f4329b53ec7d"
> -SRC_URI[jaxp.sha256sum] =
> "907cc4dfb01a3a2a6d74dfa90fa6fcb5b3df55600f41ba44dcdc94b47e85a382"
> -
> -JAXWS_CHANGESET_aarch64 = "0002ed323fe5"
> -SRC_URI[jaxws.md5sum] = "44935b81e3405fcaef675d5d08c2149e"
> -SRC_URI[jaxws.sha256sum] =
> "0d1d52f1cf254a643ece1bd6cd8628fae1a4d56e8b59388cc9ad73b3caf151a1"
> -
> -JDK_CHANGESET_aarch64 = "c2ba2ed87d18"
> -SRC_URI[jdk.md5sum] = "f4c0393a157dcb8b90ee7c7d80cbdfbf"
> -SRC_URI[jdk.sha256sum] =
> "c84a17451b47242f9d96bf431011607afc3776f285a6ad9a60190fba2d434c49"
> -
> -LANGTOOLS_CHANGESET_aarch64 = "cdb217c578cb"
> -SRC_URI[langtools.md5sum] = "608cf07781259d916d1663d6a5ced26d"
> -SRC_URI[langtools.sha256sum] =
> "ad28e75bfaba1b64fdd02ea316db3ba3cba68007f90c5fa2be2418ce8bc0074d"
> -
> -NASHORN_CHANGESET_aarch64 = "505d0eb2fafe"
> -SRC_URI[nashorn.md5sum] = "be981a6c55f9e602ff129fed65505a8c"
> -SRC_URI[nashorn.sha256sum] =
> "14419ccd773e1db83b600d05aca3cbac9f24be77abda9a132d12305d8821d6d7"
> -
> -OPENJDK_CHANGESET_aarch64 = "917454da25c1"
> -SRC_URI[openjdk.md5sum] = "1e4b3eca032742b7448731f9b8fcb426"
> -SRC_URI[openjdk.sha256sum] =
> "1e17e2d8384a7b808a89b982e7c09c4feb8598b7a66b93697bfb8759c1005974"
> diff --git a/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
> b/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
> new file mode 100644
> index 0000000..ed3e957
> --- /dev/null
> +++ b/recipes-core/openjdk/openjdk-8-release-162b12-aarch64.inc
> @@ -0,0 +1,33 @@
> +require openjdk-8-release-16xbyy.inc
> +
> +CORBA_CHANGESET_aarch64 = "2c6daa746022"
> +SRC_URI[corba.md5sum] = "2ca2413f1e6eaeb49b1c138c5cafcb30"
> +SRC_URI[corba.sha256sum] =
> "3ffcd358e45b4af5a62d9ac1c8abea2e33a9d25b34096084bc77349d846cf4f4"
> +
> +HOTSPOT_CHANGESET_aarch64 = "b08b1e9e2963"
> +SRC_URI[hotspot.md5sum] = "bb632eba37ad0f54e0535c1e0ae3440c"
> +SRC_URI[hotspot.sha256sum] =
> "fcf8369ff8871dbee81de7a15432b625dd2c6dcfe43d2dd5194d9273de0fdbfc"
> +
> +JAXP_CHANGESET_aarch64 = "413640f7312d"
> +SRC_URI[jaxp.md5sum] = "3232a514db9b7ed2ffbc9ebd69acb4fd"
> +SRC_URI[jaxp.sha256sum] =
> "05ed49cea8559bcbd2ef285c8cfcb0b2026aefb1178ec531f9c72e3918c97a9c"
> +
> +JAXWS_CHANGESET_aarch64 = "8b27752a1bbe"
> +SRC_URI[jaxws.md5sum] = "6688b2d40a0c1d5edff1f5594b6ac7a0"
> +SRC_URI[jaxws.sha256sum] =
> "c818df20d14411af78654cb53cd7f87b1c5b42ed0158775869571a42f75f3c84"
> +
> +JDK_CHANGESET_aarch64 = "9944f808c91d"
> +SRC_URI[jdk.md5sum] = "77b1caebd3d9b89af6ee8d57958334f8"
> +SRC_URI[jdk.sha256sum] =
> "d401a0611c90b52d08424d427cb43e81234dda46645a02d90531dbcbb9976b80"
> +
> +LANGTOOLS_CHANGESET_aarch64 = "7b393a96b373"
> +SRC_URI[langtools.md5sum] = "11e7742f439070bfd697866ad6d1a535"
> +SRC_URI[langtools.sha256sum] =
> "bf85f6e224c4634a9f07eae7dd61786b68803bbf95b0cd022553c80abf457967"
> +
> +NASHORN_CHANGESET_aarch64 = "31efd519fdb3"
> +SRC_URI[nashorn.md5sum] = "47c7267b6e3e3dc30fd18b4d87869c20"
> +SRC_URI[nashorn.sha256sum] =
> "bb8aa4e4d9cf5878dd56528b34002c69d3078adaa4de03e6715d6fd56dbf819d"
> +
> +OPENJDK_CHANGESET_aarch64 = "f8e58f4c29ae"
> +SRC_URI[openjdk.md5sum] = "39cc58bdee52d8997d9674a7b4162935"
> +SRC_URI[openjdk.sha256sum] =
> "66fef9d2abfc8a6769fc6ae552891e984921c55312bf06937b2ce619dc97678f"
> diff --git a/recipes-core/openjdk/openjdk-8_16xbyy.bb b/recipes-
> core/openjdk/openjdk-8_16xbyy.bb
> index dd0ed1d..0802078 100644
> --- a/recipes-core/openjdk/openjdk-8_16xbyy.bb
> +++ b/recipes-core/openjdk/openjdk-8_16xbyy.bb
> @@ -1,7 +1,8 @@
>  PV = "162b12"
> -PV_aarch64 = "161b15"
>  
> -require openjdk-8-release-${PV}.inc
> +INC_FILE_SUFFIX = ""
> +INC_FILE_SUFFIX_aarch64 = "-aarch64"
> +require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
>  require openjdk-8-cross.inc
>  
>  do_install() {
> diff --git a/recipes-core/openjdk/openjre-8_16xbyy.bb b/recipes-
> core/openjdk/openjre-8_16xbyy.bb
> index e6454ea..ab78339 100644
> --- a/recipes-core/openjdk/openjre-8_16xbyy.bb
> +++ b/recipes-core/openjdk/openjre-8_16xbyy.bb
> @@ -1,7 +1,8 @@
>  PV = "162b12"
> -PV_aarch64 = "161b15"
>  
> -require openjdk-8-release-${PV}.inc
> +INC_FILE_SUFFIX = ""
> +INC_FILE_SUFFIX_aarch64 = "-aarch64"
> +require openjdk-8-release-${PV}${INC_FILE_SUFFIX}.inc
>  require openjdk-8-cross.inc
>  
>  do_install() {

