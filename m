Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6726E7AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:47:49 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jy13so4788727veb.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 03:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=klG3Csdpypqd/TevCcsXVKU1+tU0pV7U9Xf/+b2JhHc=;
	b=hkgN7LiLKPskYMYJL9Z9YgwCvWElmzriimHT3ndF/KnWlaeHty93hCfo3wsMXr8Kq8
	pv+KpBPZM3zlJT9kRmLtmnkNGZ5zn6OTRd1NKuFm3cLb0MZI6wmZkpTPCKqJVXgL6LAL
	PpGsPQVP9UkZV2XZQny5XG3DoD4etfKK5d+BGJ950+czmcHaRR4qgjDP1nB2Y9k6Xfas
	w4ozuSwCwNeOa7uQzFEx5FE8h4xdIGfeciPKSPDq1l87ju/ornRh49CuQ313OeHvEMQx
	gh+pRkCzgzNPVp/yNuF9Tp9CzDBBVed270QA884uW/k9TMZ+nddV3A+Xm3/j+dJ+vRgl
	bJCg==
MIME-Version: 1.0
X-Received: by 10.52.171.68 with SMTP id as4mr19787294vdc.0.1392032869797;
	Mon, 10 Feb 2014 03:47:49 -0800 (PST)
Received: by 10.52.28.41 with HTTP; Mon, 10 Feb 2014 03:47:49 -0800 (PST)
In-Reply-To: <1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
References: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
	<1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 10 Feb 2014 12:47:49 +0100
Message-ID: <CALbNGRQwnmOWkUC9dTWTBHnh0odWSUm5L8s9Xz8wOK7pKtz86w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch
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
X-List-Received-Date: Mon, 10 Feb 2014 11:47:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2014 at 5:48 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> libraries based on cmake and depending on qt5qml failed to configure with=
:
>
> |   The imported target "Qt5::DBus" references the file
> |
> |      "/home/a.mueller/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/=
qt5/qdbusxml2xml"
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch     =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_B=
INS-to-determine-pa.patch b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EX=
TERNAL_HOST_BINS-to-determine-pa.patch
> index e3f1b72..ea3364e 100644
> --- a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-=
determine-pa.patch
> +++ b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-=
determine-pa.patch
> @@ -54,7 +54,7 @@ index 1d94715..617efa8 100644
>       set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR=
}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
>   !!ELSE
>  -    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SU=
FFIX\")
> -+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxm=
l2xml$$CMAKE_BIN_SUFFIX\")
> ++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscp=
p2xml$$CMAKE_BIN_SUFFIX\")
>   !!ENDIF
>       _qt5_DBus_check_file_exists(${imported_location})
>
> --
> 1.8.3.1
>
This one is back in 5.2.1. Shall I send a patch?

Andreas

