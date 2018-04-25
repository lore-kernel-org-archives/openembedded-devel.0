Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A36F774503
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:21:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t11so614926wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+b7ZJJmq8NmFaox1uHR2Ih0NZ0/Xl5u7fTqCbEHZ8k0=;
	b=l2CVLhGEyNY5qNSQivWXh+HXNOzu4f334hkWnXi8l6bSBl1GP0UfrQJaD/7eJFcSFB
	mqtE//ab18naaajpnEQNd0jgpnyDqikAWDwv9N+Jp9bG1bwNtKs49cNlZS0i28QrNyv8
	vbIvjEbV+0vKa4FO6ai6PhDSt+uTmqhG2eBn0GcmD4He/alAkXoGCyNDjMCjAqW6/mox
	RZBKZi5zzFZ2p3/4KgNYUjOsyk/wVTtAzUR2vryyD4J7JWn6hUxK8pXr9JANl6VcPoYE
	PfmD+R4EkdjBiih7N2tj3CPOnTvJt5r9iXBUD/+D8WxIfgVxxvdVnGiRS+7+8BPMhwDD
	Sy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+b7ZJJmq8NmFaox1uHR2Ih0NZ0/Xl5u7fTqCbEHZ8k0=;
	b=GDfZxz2oQcVZseybgfi6lR9J/oKUCQAs3OEXp8CRjrQT3gKO6oWMMyVQLbXlnhsX5J
	8hKBoy0Qi1LwDA8QJ3PInxATZSWKzg7JOBOE+ESUHgw01/xk6tg+89VcV6dZecSSSdbu
	htljhVizo+uvLDsJJ7tPeGqCBmOGM50KnBluWvGdbAL1KiVTbi1f2lQSVuQppL3s97GR
	SP99Zkt5cSDQqfFaua4XxsUOF6IfmkmBCHUBWsOq6LablmuPDSyaeXoaslbty4Fdcy+J
	B//4LYRV64nOSsiCmPXUDUiKfp9rcUKBJ2K8jTIqQps1g0hjjQPRAQmDlRRKWTbJZBD0
	zBWw==
X-Gm-Message-State: ALQs6tAnW+ijvz/1QK1LP6Zg1mxu2jf1WzEUNGY8FtDq6IgT59NKtJcA
	zGOwwKbyB6dgmj7fJ8cJIxO68gB3uEmbFcZYAvM=
X-Google-Smtp-Source: AIpwx49RUM7WpNYqyjfo3k5VKXzeXKmJryb2V/p+xiTndjeKzlsIjmGbvC2Yd8IAs4HnpCigK2s31mdDkKlxpPW9zAY=
X-Received: by 10.28.156.4 with SMTP id f4mr15825250wme.79.1524666100041; Wed,
	25 Apr 2018 07:21:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 25 Apr 2018 07:21:39 -0700 (PDT)
In-Reply-To: <1524665609-7709-5-git-send-email-akuster808@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
	<1524665609-7709-5-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Apr 2018 16:21:39 +0200
Message-ID: <CA+chaQfKr7LHe5rZD7SOCg7bGgFwJ-hWZTdKma5Ex9DButKsSA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/6] android-tools: refresh patch
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
X-List-Received-Date: Wed, 25 Apr 2018 14:21:39 -0000
Content-Type: text/plain; charset="UTF-8"

Is something wrong with https://patchwork.openembedded.org/patch/149993/ ?

On Wed, Apr 25, 2018 at 4:13 PM, Armin Kuster <akuster808@gmail.com> wrote:

> Applying patch preserve-ownership.patch
> patching file system/extras/ext4_utils/make_ext4fs_main.c
> Hunk #1 succeeded at 47 with fuzz 2 (offset -2 lines).
> Hunk #2 succeeded at 81 (offset -2 lines).
> Hunk #3 succeeded at 144 (offset -2 lines).
> patching file system/extras/ext4_utils/make_ext4fs.c
>
> Now at patch preserve-ownership.patch
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../android-tools/preserve-ownership.patch           | 20
> ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
> b/meta-oe/recipes-devtools/android-tools/android-tools/
> preserve-ownership.patch
> index 85af81f..fc350fb 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools/
> preserve-ownership.patch
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools/
> preserve-ownership.patch
> @@ -9,11 +9,13 @@ Upstream-Status: Inappropriate
>   system/extras/ext4_utils/make_ext4fs_main.c |   10 ++++++++--
>   2 files changed, 14 insertions(+), 2 deletions(-)
>
> ---- a/system/extras/ext4_utils/make_ext4fs_main.c
> -+++ b/system/extras/ext4_utils/make_ext4fs_main.c
> -@@ -49,13 +49,15 @@ extern struct fs_info info;
> +Index: git/system/extras/ext4_utils/make_ext4fs_main.c
> +===================================================================
> +--- git.orig/system/extras/ext4_utils/make_ext4fs_main.c
> ++++ git/system/extras/ext4_utils/make_ext4fs_main.c
> +@@ -47,13 +47,15 @@ struct selabel_handle;
> + extern struct fs_info info;
>
> - extern struct selabel_handle* selinux_android_file_context_handle(void);
>
>  +extern int preserve_owner;
>  +
> @@ -28,7 +30,7 @@ Upstream-Status: Inappropriate
>         fprintf(stderr, "    <filename> [<directory>]\n");
>   }
>
> -@@ -81,7 +83,7 @@ int main(int argc, char **argv)
> +@@ -79,7 +81,7 @@ int main(int argc, char **argv)
>         struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
>   #endif
>
> @@ -37,7 +39,7 @@ Upstream-Status: Inappropriate
>                 switch (opt) {
>                 case 'l':
>                         info.len = parse_num(optarg);
> -@@ -144,6 +146,10 @@ int main(int argc, char **argv)
> +@@ -142,6 +144,10 @@ int main(int argc, char **argv)
>                         }
>   #endif
>                         break;
> @@ -48,8 +50,10 @@ Upstream-Status: Inappropriate
>                 case 'v':
>                         verbose = 1;
>                         break;
> ---- a/system/extras/ext4_utils/make_ext4fs.c
> -+++ b/system/extras/ext4_utils/make_ext4fs.c
> +Index: git/system/extras/ext4_utils/make_ext4fs.c
> +===================================================================
> +--- git.orig/system/extras/ext4_utils/make_ext4fs.c
> ++++ git/system/extras/ext4_utils/make_ext4fs.c
>  @@ -67,6 +67,8 @@
>
>   #endif
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

