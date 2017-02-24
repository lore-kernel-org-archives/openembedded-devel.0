Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC196011A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 21:34:06 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id o22so2806515wro.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pqSSCrXh52EHT1pJLZupJ/YkVrKu07bLcumTfXFSZV0=;
	b=nKJNibyI+srn0XwFPyh72npI8fjh5iNi7Y1s+Hfs2P1MMvmGYyejvfDM5LEy09lqNy
	5JONxgMrs2HIITHvBpXDlW78muvXupzOCMM+DcK6XSI7L/xo244Cf53VzgPhjZf+xXP8
	VyduSU/XQmiHiZG3xjFoNc4a3mqlAh9Cn3smr7MsWUNegUjuSBt6JF2lTMgs4zYVyfRZ
	1kZw6kOVN7X72aWDXSIWOHVd9NfskVk4hbJxLMHXDxtXW14LisRxLqRKIXxxA3PFDqkf
	8TNi3Q5t7777/u1AfQQCYf02vPBDjndTXnfY1dSwT7cEmgS2HdBNC6UhnE5n039yCORT
	PvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pqSSCrXh52EHT1pJLZupJ/YkVrKu07bLcumTfXFSZV0=;
	b=K6TXyyvOZFf1aMXSgNawGNNjt9rVckep9mrjaXYWABo8pK0qmmrcNip9lt6EYZN0a2
	ge9YVI/rspdq2a+Gtt41x42JI6tfuCCpOD1R8Zjyiw5LQVyiU8NadLl/qTNQSk+DLKIq
	QfWoubmnRJLzGxpgz6cYCQ1I5tHDM3pPK/wc+O0WeKRXHm3Qv8hS7a+BV9D+6d61xpJk
	iDNiCKJxE2wKKHj/mHbrr6CjU8gVu15PsusiKcIU7Wz4jRM1CHmrJHus1wztv+/TX+HF
	btyELD1vwfKAbxWBQPbm4vIMZo5gMiI2EIZEfpwfakemtKhIt3NKHlvV65g5T/UFdMFW
	8bTA==
X-Gm-Message-State: AMke39n3yzgGTUVJpRHUFhVkBL4N3uYLn8a6wDDLIIeWmK/LwhaQSwANWt5cc6jPuN3SMhBxy12qodYZDcLpjw==
X-Received: by 10.223.136.79 with SMTP id e15mr4543823wre.14.1487972048015;
	Fri, 24 Feb 2017 13:34:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.208.207 with HTTP; Fri, 24 Feb 2017 13:34:07 -0800 (PST)
In-Reply-To: <1487971493-28136-1-git-send-email-derek@asterius.io>
References: <1487971493-28136-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Feb 2017 22:34:07 +0100
Message-ID: <CA+chaQd=bR6pdo+9Jj89mLZ3Ee608w605wK604qgCLfRofkMsg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] postgresql: update inherit to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 21:34:08 -0000
Content-Type: text/plain; charset=UTF-8

This was already fixed in master:
http://git.openembedded.org/meta-openembedded/commit/?id=18b373d1429172f13d30bc389687424163076a20

On Fri, Feb 24, 2017 at 10:24 PM, Derek Straka <derek@asterius.io> wrote:

> Resolves build issue exposed by RSS
> See http://errors.yoctoproject.org/Errors/Details/131632/
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-support/postgresql/postgresql.inc       | 4 ++--
>  meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc
> b/meta-oe/recipes-support/postgresql/postgresql.inc
> index 314c23d..cce513f 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -19,7 +19,7 @@ DESCRIPTION = "\
>  "
>  HOMEPAGE = "http://www.postgresql.com"
>  LICENSE = "BSD"
> -DEPENDS = "zlib readline tzcode-native gettext-native"
> +DEPENDS = "zlib readline tzcode-native "
>
>  ARM_INSTRUCTION_SET = "arm"
>
> @@ -37,7 +37,7 @@ LEAD_SONAME = "libpq.so"
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL = "${LDFLAGS}"
>
> -inherit autotools pkgconfig perlnative pythonnative useradd update-rc.d
> systemd
> +inherit autotools gettext pkgconfig perlnative pythonnative useradd
> update-rc.d systemd
>
>  CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
>
> diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
> b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
> index 4787e57..5498350 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
> +++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb
> @@ -9,5 +9,3 @@ SRC_URI += "\
>
>  SRC_URI[md5sum] = "1171df0426fe4da5a29f6cdaf2e8b812"
>  SRC_URI[sha256sum] = "7061678bed1981c681ce54c76b98b6
> ec17743f090a9775104a45e7e1a8826ecf"
> -
> -PNBLACKLIST[postgresql] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/131632/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

