Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0889560069
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 23:54:36 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id t8so132601vke.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Mar 2017 15:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t6be64AyfgnkaChL5dYTAGtQ/hpbyTaQpqmLeOzST04=;
	b=CdcnQdxSsii6FHb9OABg6AwWe1tDbq1XbAWSeAgCXMHG3XpeGQYvlXnbmzz67pkqdh
	AmDenTyOExTol7VlVuijzev350XwqWXKtEV5zXOmoJV6zDu4TZ6PMbl3dPGHdqkwoMEy
	coqJNFa2MUQfFYq3Qsh3DlYb4jSUQVP5b6eWGdS71CRaXOhl7sPIBWA+DQwXSpiZ24CC
	Wi9UOGNdHu4m80ft7/33lPCfmS2IDxmu18xFGSHVVEenuDgEvmBmGipurctl6NTCRkQm
	MXcOWqDydwI6iK2fynwRGJe7Dw3KeW+oeK39ETiZzYniOCWZADIxRQIJxl2WxdiljSXB
	zm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t6be64AyfgnkaChL5dYTAGtQ/hpbyTaQpqmLeOzST04=;
	b=BXrW0ukmeYSIsQC9KHQ2bspYHajPZccghW/d4RQyke4bM0dUcyCMVCH/QqqAXjYncS
	j4Bg/2yvRxDXVbN1yGhL0mc2zTyuUQlK6xMiAr00pmpFBYTu8IQOfRYmo6QO5lvhHb+S
	Auq+7citTQy5QF7jaCVGcOiHySoq6QFU8C6/DEP5H9OrXuZixA7gT1/XVCw9LzJi8m+y
	EGDB+pARaejtnL44MQzNvWVOnAEjuABGmGRiUAAZOztTzVz4EgHmt77U51Cz3JGenWFp
	ovm138Q/fpH6G8DGc+UTkot9js75T23LawMZYOumDKqIvnJ+zKp1kADSob3aAnxpHpjr
	Rl7g==
X-Gm-Message-State: AMke39nxYnqN1/WbqlB2lVZwA7CBXTLr7sLqWdaTzGdDIUNmmE3pbboijbF/FpEHzQ5qSx82CqKmq2wX73d6Fw==
X-Received: by 10.31.197.196 with SMTP id v187mr1885578vkf.84.1488930877738;
	Tue, 07 Mar 2017 15:54:37 -0800 (PST)
MIME-Version: 1.0
References: <1488884894-30925-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1488884894-30925-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 07 Mar 2017 23:54:27 +0000
Message-ID: <CAMKF1spXrXsng36SwA3zvE7yO1dSfhkubRqm=Zp=R7oTnCHSzA@mail.gmail.com>
To: liu.ming50@gmail.com, openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [meta-oe] [PATCH] rsyslog: fixes musl libc build
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
X-List-Received-Date: Tue, 07 Mar 2017 23:54:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 7, 2017 at 3:10 AM <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> - struct timeval is defined in sys/time.h with a musl libc.
> - GLOB_BRACE is not defined in posix and thus not implemented in musl libc.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  .../rsyslog/rsyslog/0001-Include-sys-time-h.patch  | 33
> ++++++++++++++++++++
>  .../rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch | 35
> ++++++++++++++++++++++
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb |  5 ++++
>  3 files changed, 73 insertions(+)
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
>  create mode 100644
> meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
>
> diff --git
> a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
> new file mode 100644
> index 0000000..23c0f25
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
> @@ -0,0 +1,33 @@
> +From 3c3c21f4735eb215206273bc714c57c969926d3d Mon Sep 17 00:00:00 2001
> +From: Ming Liu <peter.x.liu@external.atlascopco.com>
> +Date: Sun, 26 Feb 2017 14:10:21 +0100
> +Subject: [PATCH] Include sys/time.h
> +
> +struct timeval is defined in sys/time.h with a musl libc.
> +
> +Upstream-Status: Inappropriate [musl libc specific]
> +
> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> +---
> + tests/msleep.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/tests/msleep.c b/tests/msleep.c
> +index 26a8206..ca818be 100644
> +--- a/tests/msleep.c
> ++++ b/tests/msleep.c
> +@@ -26,11 +26,7 @@
> + #include "config.h"
> + #include <stdio.h>
> + #include <stdlib.h>
> +-#if defined(__FreeBSD__)
> + #include <sys/time.h>
> +-#else
> +-#include <time.h>
> +-#endif
> +
> + int main(int argc, char *argv[])
> + {
> +--
> +1.9.1
> +
> diff --git
> a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
> new file mode 100644
> index 0000000..7903bb1
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Undefine-GLOB_BRACE.patch
> @@ -0,0 +1,35 @@
> +From 6746e3a9615d1566bf228e9012d0841b15178810 Mon Sep 17 00:00:00 2001
> +From: Ming Liu <liu.ming50@gmail.com>
> +Date: Sun, 26 Feb 2017 13:50:33 +0100
> +Subject: [PATCH] Undefine GLOB_BRACE
> +
> +GLOB_BRACE is not defined in posix and thus not implemented in musl libc.
> +
> +Fixed by defining it to 0 if it is undefined.
> +
> +Upstream-Status: Inappropriate [musl libc specific]
> +
> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> +---
> + plugins/imfile/imfile.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/plugins/imfile/imfile.c b/plugins/imfile/imfile.c
> +index d20471f..f9aff81 100644
> +--- a/plugins/imfile/imfile.c
> ++++ b/plugins/imfile/imfile.c
> +@@ -85,6 +85,11 @@ static int bLegacyCnfModGlobalsPermitted;/* are legacy
> module-global config para
> +
> + #define ADD_METADATA_UNSPECIFIED -1
> +
> ++/* fixes build with musl libc */
> ++#ifndef GLOB_BRACE
> ++#define GLOB_BRACE 0
> ++#endif
> ++
> + /* this structure is used in pure polling mode as well one of the support
> +  * structures for inotify.
> +  */
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> index 62126f8..d81117c 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
> @@ -26,6 +26,11 @@ SRC_URI = "
> http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
>             file://rsyslog-fix-ptest-not-finish.patch \
>  "
>
> +SRC_URI_append_libc-musl = " \


Do they have to be applied conditionally?
I would suggest to make it portable across All libc

>
> +    file://0001-Undefine-GLOB_BRACE.patch \
> +    file://0001-Include-sys-time-h.patch \
> +"
> +
>  SRC_URI[md5sum] = "ad0f25f429aa2daa326732950a5eeb6c"
>  SRC_URI[sha256sum] =
> "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

