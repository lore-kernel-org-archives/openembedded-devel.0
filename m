Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DBE1371C7A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 16:07:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i5so6892709pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hLgG+PsuWG2YR1Y65wPOzB7pPPtQJED7W2Nxu16ofcY=;
	b=V65gTQ2eTGOLHnita9FUhMnJxXhZkjH3LCWH03Z2m6oFz6K2SylmwMMHYHjn7qboMm
	XzTno92469mC+Wm5Gez8RDpl00lUlGq8zz2tTAzsA39dPxhOvQmmiUSDLrAGN8DT6ujy
	uQoh8W+tws1cPT5nUW3V7YynFNB7PArksm552lQMQSkQFLV/NrEsLT0WdRhhzC4QncLe
	XPFQZFXOZePOiqZxDdYsfchCxvoA5Y0WLHUeW+IMzDqxPPK+8QJa43gFkgeHvrXIx6PH
	gRmayPqmvR5vn9SewFNz+raxeN+uesHK+IyQJ1ABw9Buae7G6YBQCMKCkJ/czKV9DbTP
	MEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hLgG+PsuWG2YR1Y65wPOzB7pPPtQJED7W2Nxu16ofcY=;
	b=nxZz7wm/rpx7q2xIjCN17QaS3r+YHYme5z/XLzHFoDuyFyAIOriIaXmRFqlKZe9p75
	AiFdqhCcRuy99JIhjYwvfKp6hSKVfaa2qDbDJXnGt9b/rT7ngjsBUDo8Amt9tBkG6ENb
	YSvfbd+oEb9QfVh66rWFIB5Wwm3DXBVKsRPiLKS0bkmHsDtq3ZMnOeZOeAmcv9A3Ehfc
	QHtrTejWvSZ+rOVRele5t0L1o+UxuvXaZvyc8sd6Oa1YoxYCgU2iwtgTd2Ieu256u/HW
	YJncorM9tWFk8nv3LTNayn8ZHDftbgrzZPap68+L55OLu+3Y/C4Xpxm2Auime0Lsj99y
	6pig==
X-Gm-Message-State: AMCzsaVV/YYPSW9rOzud22fjcW0pwvtJNWTClHQfDY8lI/mT7MaEEUOO
	sJYuNem/81dmYqsm6mVAdjkHAWTbJYdDw0xnico=
X-Google-Smtp-Source: ABhQp+Rboit0SwbDix9N+czVN72D23GdOZe2FPgNaQa8eaxv1l+bvcawRzK93ixyGEWInfNUXN++DmayG3OLoE+ydG0=
X-Received: by 10.98.102.132 with SMTP id s4mr2038326pfj.168.1508429221459;
	Thu, 19 Oct 2017 09:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Thu, 19 Oct 2017 09:06:30 -0700 (PDT)
In-Reply-To: <1508397130-81256-1-git-send-email-li.zhou@windriver.com>
References: <1508397130-81256-1-git-send-email-li.zhou@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Oct 2017 09:06:30 -0700
Message-ID: <CAMKF1sqT6EK4f1vzUDZfi8mXfc+6_Uror0UtbfALPgQ2kDNatw@mail.gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] bridge-utils: modify the AR to cross toolchain
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
X-List-Received-Date: Thu, 19 Oct 2017 16:07:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2017 at 12:12 AM, Li Zhou <li.zhou@windriver.com> wrote:
> The Makefile uses the host =E2=80=9Car=E2=80=9D tool when it should be us=
ing the
> ar from the target toolchain.
>
> Signed-off-by: Jiwei Sun <jiwei.sun@windriver.com>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  ...ridge-Modifying-the-AR-to-cross-toolchain.patch | 34 ++++++++++++++++=
++++++
>  .../bridge-utils/bridge-utils_1.5.bb               |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-u=
tils/0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch
>
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/00=
01-libbridge-Modifying-the-AR-to-cross-toolchain.patch b/meta-networking/re=
cipes-support/bridge-utils/bridge-utils/0001-libbridge-Modifying-the-AR-to-=
cross-toolchain.patch
> new file mode 100644
> index 0000000..e477f41
> --- /dev/null
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/0001-libb=
ridge-Modifying-the-AR-to-cross-toolchain.patch
> @@ -0,0 +1,34 @@
> +From 689e24ef05bd1772b2149e4eb48b058ca8361cf4 Mon Sep 17 00:00:00 2001
> +From: Li Zhou <li.zhou@windriver.com>
> +Date: Thu, 19 Oct 2017 11:34:18 +0800
> +Subject: [PATCH 2/2] libbridge: Modifying the AR to cross toolchain
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The Makefile uses the host =E2=80=9Car=E2=80=9D tool when it should be u=
sing the
> +ar from the target toolchain.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + libbridge/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libbridge/Makefile.in b/libbridge/Makefile.in
> +index 11c0829..59d7355 100644
> +--- a/libbridge/Makefile.in
> ++++ b/libbridge/Makefile.in
> +@@ -1,7 +1,7 @@
> +
> + KERNEL_HEADERS=3D-I@KERNEL_HEADERS@
> +
> +-AR=3Dar
> ++AR?=3Dar

perhaps AR=3D@AR@ would be better

> + RANLIB=3D@RANLIB@
> +
> + CC=3D@CC@
> +--
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.=
5.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
> index 6032ab0..723ae5f 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
> @@ -7,6 +7,7 @@ SRC_URI +=3D "\
>      file://0003-bridge-fix-some-build-time-warnings-errno.h.patch \
>      file://0004-libbridge-add-missing-include-s-fix-build-against-mu.pat=
ch \
>      file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
> +    file://0001-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
>  "
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df9d20a453221a1b7e32ae84694da2=
c37"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

