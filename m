Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEA2609B2;
	Fri, 22 May 2015 11:46:35 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so38113876wic.0;
	Fri, 22 May 2015 04:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=9AVrfEqqH/LdRc+8ytNChp5rCI+8kPETC6NarLq1ldc=;
	b=o/uiINGbPuHqcB/CIdQnZ2WyYGkalnkK1ujbxYEGMRB+0fO2SmK7h7zwuNqzdtDe16
	rvqjbH2dOUhniuanX9HH66YPzqOTUuLjO7TG2wNmwfr35Hqa9ZhGr0/eUkYbqa1jZuRl
	W0WHFRDEef8rl8cQRPAoQDtimUTd2SgwCqtYJt3bxmhftfybsi0yYyGvlod7YrqsGoMr
	/yO9cxh9wxLoindThjTzozktYoDXPVNxcAoo8+l8qftJ146GqfkcO77+W6BRpnMHhAZZ
	m47yRFg5PtAf/MRKrJX1OX2FLkvRcvY3kfVSpyzihl97VzZ76X02xCstMOnkB6uQYGol
	ZnOg==
X-Received: by 10.180.86.234 with SMTP id s10mr6736678wiz.50.1432295196517;
	Fri, 22 May 2015 04:46:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id ch2sm7137338wib.18.2015.05.22.04.46.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 04:46:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 May 2015 13:46:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150522114658.GC2376@jama>
References: <20150501064023.6E7B950467@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150501064023.6E7B950467@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Roy Li : elfutils: Security Advisory - CVE-2015-0255
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
X-List-Received-Date: Fri, 22 May 2015 11:46:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2015 at 06:40:23AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4a65944b89a76f18c8ff6e148f17508882d387cf
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4a65944b89a76f18c8ff6e148f17508882d387cf
>=20
> Author: Roy Li <rongqing.li@windriver.com>
> Date:   Tue Apr 28 14:22:54 2015 +0800
>=20
> elfutils: Security Advisory - CVE-2015-0255

So is it CVE-2015-0255 or CVE-2014-9447 like the link bellow says?

:/

CVE-2015-0255 is "X.Org Server (aka xserver and xorg-server) before
1.16.3 and 1.17.x before 1.17.1 allows remote attackers to obtain
sensitive information from process memory or cause a denial of service
(crash) via a crafted string length value in a XkbSetGeometry request."


>=20
> Directory traversal vulnerability in the read_long_names function in
> libelf/elf_begin.c in elfutils 0.152 and 0.161 allows remote attackers
> to write to arbitrary files to the root directory via a / (slash) in a
> crafted archive, as demonstrated using the ar program.
>=20
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2014-9447
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  ...f-Fix-dir-traversal-vuln-in-ar-extraction.patch | 59 ++++++++++++++++=
++++++
>  meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
>  2 files changed, 60 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fi=
x-dir-traversal-vuln-in-ar-extraction.patch b/meta/recipes-devtools/elfutil=
s/elfutils-0.161/0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch
> new file mode 100644
> index 0000000..7e4e492
> --- /dev/null
> +++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-libelf-Fix-dir-t=
raversal-vuln-in-ar-extraction.patch
> @@ -0,0 +1,59 @@
> +From 147018e729e7c22eeabf15b82d26e4bf68a0d18e Mon Sep 17 00:00:00 2001
> +From: Alexander Cherepanov <cherepan@mccme.ru>
> +Date: Sun, 28 Dec 2014 19:57:19 +0300
> +Subject: [PATCH] libelf: Fix dir traversal vuln in ar extraction.
> +
> +Upstream-Status: Backport
> +
> +read_long_names terminates names at the first '/' found but then skips
> +one character without checking (it's supposed to be '\n'). Hence the
> +next name could start with any character including '/'. This leads to
> +a directory traversal vulnerability at the time the contents of the
> +archive is extracted.
> +
> +The danger is mitigated by the fact that only one '/' is possible in a
> +resulting filename and only in the leading position. Hence only files
> +in the root directory can be written via this vuln and only when ar is
> +executed as root.
> +
> +The fix for the vuln is to not skip any characters while looking
> +for '/'.
> +
> +Signed-off-by: Alexander Cherepanov <cherepan@mccme.ru>
> +---
> + libelf/ChangeLog   | 5 +++++
> + libelf/elf_begin.c | 5 +----
> + 2 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/libelf/ChangeLog b/libelf/ChangeLog
> +index 3b88d03..447c354 100644
> +--- a/libelf/ChangeLog
> ++++ b/libelf/ChangeLog
> +@@ -1,3 +1,8 @@
> ++2014-12-28  Alexander Cherepanov  <cherepan@mccme.ru>
> ++
> ++	* elf_begin.c (read_long_names): Don't miss '/' right after
> ++	another '/'. Fixes a dir traversal vuln in ar extraction.
> ++
> + 2014-12-18  Ulrich Drepper  <drepper@gmail.com>
> +=20
> + 	* Makefile.am: Suppress output of textrel_check command.
> +diff --git a/libelf/elf_begin.c b/libelf/elf_begin.c
> +index 30abe0b..cd3756c 100644
> +--- a/libelf/elf_begin.c
> ++++ b/libelf/elf_begin.c
> +@@ -749,10 +749,7 @@ read_long_names (Elf *elf)
> + 	    }
> +=20
> + 	  /* NUL-terminate the string.  */
> +-	  *runp =3D '\0';
> +-
> +-	  /* Skip the NUL byte and the \012.  */
> +-	  runp +=3D 2;
> ++	  *runp++ =3D '\0';
> +=20
> + 	  /* A sanity check.  Somebody might have generated invalid
> + 	     archive.  */
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/reci=
pes-devtools/elfutils/elfutils_0.161.bb
> index 0dbe9f9..e111b34 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
> @@ -16,6 +16,7 @@ SRC_URI +=3D "\
>          file://Fix_elf_cvt_gunhash.patch \
>          file://fixheadercheck.patch \
>          file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals=
=2Epatch \
> +        file://0001-libelf-Fix-dir-traversal-vuln-in-ar-extraction.patch=
 \
>  "
> =20
>  # pick the patch from debian
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

