Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0CB782F1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:59:16 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id a12so31929649ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jul 2017 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3Q1iQxBmkLAZEd7QFBphRTIR8iHWYbR59QTMfv0eMbk=;
	b=l9gGBDyyVDgrvIbu8ZTZz2kHg7LS9nBk1Z6GUStaEqSPF238FJofp+Hs/NbIeZfJwk
	zBlAJwxXdc5mtFWv6766aWbBcCWkWKt4/sPU50eSQo7kd+ZTrgn6FFpj2TWIx0GZu0Ox
	wHz6KizQSEVsmirnijSCTCk5qnahwTydVUDjUN/Ucy9f34gUCmpCrhOZ7PMteEx3aU/L
	pBYRiiKPe+guo6Wq9ldC0/f8Jfl+iz75tAXfPve8BFgz8YIj9G2mMHrae5EVneaXFRlJ
	DidEp2cHmI3YRl+QxGYqi1uRCcvJNU8WwpfCh38I1dfJV/qE5RfdTTv+qUzQBOCWerbW
	onow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3Q1iQxBmkLAZEd7QFBphRTIR8iHWYbR59QTMfv0eMbk=;
	b=Y+ANzU07KpY+d/xLWmFxHUuDWr7/vslnN78fS7sw/XiFWTBNPvCmUOXa2Q4rB/jT76
	bNPChhsxsA5Lj544Po7QoVQ5ZkdL+250L0fMiT2V5r0sVSw/tW3h/FH8M3gU2mJ6yWrx
	KiC1cQJb0JCGqaYKDL2Pdv/MkygaEm1bapzWwjsKzSz/Qy5oUcj7cdVWca5y2/HUIC0H
	SrnvOKgkAs+LhQIVLjJW0ownROAjAYRuOmoXvDffhyaE2s775rCU6RaI5AaLyz9G/ELw
	+3WpyoRwrgu3VSE/m5ztf96kS6G4uPMw76HjSSTAjeIz1BFnwsU/FXpqfLmNxJPC/g0t
	fkBw==
X-Gm-Message-State: AIVw110d/RuVSnRZDx+0NFdPlO2SsonYi80pGUQX+YHwY1tIYegTB+T6
	WxfBdca734LDZWGSb27cTSBhpRiRkw==
X-Received: by 10.129.73.141 with SMTP id w135mr9190934ywa.414.1500717558079; 
	Sat, 22 Jul 2017 02:59:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Sat, 22 Jul 2017 02:59:17 -0700 (PDT)
In-Reply-To: <5d10992c138933e79ec7d1bec6d7fd03caec20bd.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
	<5d10992c138933e79ec7d1bec6d7fd03caec20bd.1500621886.git.hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Jul 2017 11:59:17 +0200
Message-ID: <CA+chaQfEi1RG_Ji7opKrs2mFx9Xb7wC_b2kuW-wi65frBnsrEA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 10/10] xmlrpc-c: add recipe 1.31.0
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
X-List-Received-Date: Sat, 22 Jul 2017 09:59:17 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build with:
http://errors.yoctoproject.org/Errors/Details/148212/

On Fri, Jul 21, 2017 at 9:34 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ix-compile-failure-against-musl-C-library.patch | 52
> ++++++++++++++++++++++
>  .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   | 23 ++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-
> compile-failure-against-musl-C-library.patch
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-
> compile-failure-against-musl-C-library.patch b/meta-oe/recipes-devtools/
> xmlrpc-c/xmlrpc-c/0001-fix-compile-failure-against-musl-C-library.patch
> new file mode 100644
> index 0000000..234d696
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-
> compile-failure-against-musl-C-library.patch
> @@ -0,0 +1,52 @@
> +From 950b27f8320b841490cafcb3e6e3b818c7174c0d Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 20 Jul 2017 22:32:50 -0400
> +Subject: [PATCH] fix compile failure against musl C library
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + test/cpp/server_abyss.cpp               |  2 +-
> + tools/xmlrpc_pstream/xmlrpc_pstream.cpp | 10 +++++++---
> + 2 files changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/test/cpp/server_abyss.cpp b/test/cpp/server_abyss.cpp
> +index 2458a8f..82f91da 100644
> +--- a/test/cpp/server_abyss.cpp
> ++++ b/test/cpp/server_abyss.cpp
> +@@ -18,7 +18,7 @@
> + #ifdef WIN32
> +   #include <winsock2.h>
> + #else
> +-  #include <sys/unistd.h>
> ++  #include <unistd.h>
> +   #include <sys/socket.h>
> +   #include <arpa/inet.h>
> +   #include <netinet/in.h>
> +diff --git a/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
> b/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
> +index d39e105..1fd8900 100644
> +--- a/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
> ++++ b/tools/xmlrpc_pstream/xmlrpc_pstream.cpp
> +@@ -15,11 +15,15 @@
> + #include "xmlrpc-c/girerr.hpp"
> + using girerr::throwf;
> +
> +-#include <features.h>  // for __BEGIN_DECLS
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> +
> +-__BEGIN_DECLS
> + #include "dumpvalue.h"  /* An internal Xmlrpc-c header file ! */
> +-__END_DECLS
> ++
> ++#ifdef __cplusplus
> ++}
> ++#endif
> +
> +
> + #include <xmlrpc-c/base.hpp>
> +--
> +2.8.1
> +
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
> new file mode 100644
> index 0000000..9050d66
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "XML-RPC for C/C++ is programming libraries and related
> tools to help you \
> +write an XML-RPC server or client in C or C++."
> +
> +HOMEPAGE = "http://xmlrpc-c.sourceforge.net/"
> +LICENSE = "BSD & MIT"
> +LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea9
> 51"
> +
> +SRC_URI = "git://github.com/ensc/xmlrpc-c.git;branch=master \
> +           file://0001-fix-compile-failure-against-musl-C-library.patch \
> +"
> +SRCREV = "81443a9dc234cc275449dbc17867ad77ae189124"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "curl libxml2"
> +RDEPENDS_${PN} = "curl"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-D_lib:STRING=${baselib}"
> +
> +BBCLASSEXTEND = "native"
> +
> +TARGET_CFLAGS += "-Wno-narrowing"
> --
> 2.8.1
>
>

