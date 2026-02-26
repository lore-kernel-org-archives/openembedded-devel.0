Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDFDFCE06A
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:38:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68889.1772109486638776621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q8DbRYer;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso7370425e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 04:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772109485; x=1772714285; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q/AlIxy8JHGcb4rsm9f/rLguf06JrqgLkiYIodRfA9E=;
        b=Q8DbRYerJ95wZhRlUziamk/bapsQOnm3UghX2gQVDiJhZ2wYFhtPIWuXkb7mqTPF5I
         F7E63uAL9fJ8dPEG5YgbEkFaleIYhrOOr7060WcmDD0BIj9bsIfRhFm8nLq6bCxU6inx
         RB8HELjOL6SsJjB5Y3UD072f7/HPcsSJxRVkxbKYNLDD9FhGF32FllKVWHV2V3+vdFxm
         NdNg7fhhqgxMRUU490GbTYzR5zBhdscNEzaL7PqyM8Cu6kqxMvMtNWulNFvJm3PNrdKM
         PH78i4b6Wt/zaqKn1H5MtEAjZOpHyqlPmnjzJzdjxIdaALsciIcJ3TztEeppZowr+hWu
         L+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109485; x=1772714285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/AlIxy8JHGcb4rsm9f/rLguf06JrqgLkiYIodRfA9E=;
        b=eYEcNnLZYznUAWoJXaB5gfd77XsS11vgjMoP5pdZEWocfP++fitejO9+sGSTjl9J6e
         oxWhkdsOj35RsQT0MBldTrh7oQx+cRmfH7mdZT1gQs6m4DvGNg13b7sFKWtkWWCOdBje
         Ix6yMknNx85sdxevxKo9Bme6SkCyTSQT7zJcVDv4E2KXv57yVN7DuWLyGrZI5Z3ep0Kq
         GnGSS05cWeSyqsMmJe/FcK7ur15VUsl770g0UaDZIGRcGBUB6DW+f8nXJmgR9dp7Ht/k
         Vb32QxPtWWIKIkmWhL4h9NSZdkldKnxg3YXDnm8Dj6lOvBpY5+C9Vs4eP3k9ed1U4Zl+
         2gdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfy/7xM4QtMiT2NKNKrpIIzROdlgEfaUGsu+u4WwgVeH2j6BzOiEKkE0NIu+Ere0AzXVRpnN2gx9kTmxFqn+kzuPw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yze66sLy1t5OjGV3K6wnCVRv5lNBxzD7U5hWL6Y8kfJNhtA6L8M
	b2aVM8HYNLJX9Swl75O/TDLUyej5fM0gwklqCKXd7BQfXln/L9/dLh5G
X-Gm-Gg: ATEYQzxs+BBhyPRg6WvNlmwmxXuboM7mX86TEP8UFtR81KB0ZRFE4jCHP3ihT3ZRtQU
	9FGyd6AyDzTBuJrlZDBrmRNEhttwnOZoHocXNYMAYsNqzGlxKxe8hBvV7nzA8+LKp46URi9dMnn
	6eR5TtQk1/SDgBrm7QIYD539nLnCJxQuPapbf0eQx9Z/ejf3cs10F06sURtK+yKR5mLAEnLpwwv
	qprBuyM4mAfdVgw+R0J9dUoeuQMwPNDIku7T5RnsVfFTbNqzN/nXVFcXFcoWYVqGc3Q0+jf78ZK
	lp9sh8cvJ1dWJhVITuCtfpQUBCI4uidXL6US/QAIHmnJHwNxb5wH51mUjmdvfnWMRVJl/8yB95M
	Ydu05cGUiLHlDuVOsG+KUvTwWjCTdfsY7Z6HcSKPiTP+La83c5D/MBHVgZogChCs/FzISjVUCds
	tcF11Ca5V48puB9qOJG31K0sT2v5VvTAh1DqXoYWb0qA==
X-Received: by 2002:a05:600c:3587:b0:483:a27e:6706 with SMTP id 5b1f17b1804b1-483a95fc063mr337954145e9.9.1772109484701;
        Thu, 26 Feb 2026 04:38:04 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm142293015e9.7.2026.02.26.04.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 04:38:04 -0800 (PST)
Message-ID: <0ff67b9a-3ee7-46bf-a698-806031439594@gmail.com>
Date: Thu, 26 Feb 2026 13:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.20 ->
 14.21
To: hprajapati@mvista.com, openembedded-devel@lists.openembedded.org
References: <20260217115833.113044-1-hprajapati@mvista.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260217115833.113044-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 12:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124672

On 2/17/26 12:58, Hitendra Prajapati via lists.openembedded.org wrote:
> It contains Security fixes for CVE-2026-2003, CVE-2026-2004,
> CVE-2026-2005, CVE-2026-2006 and CVE-2026-2007.
> It also contains other bug fixes and for more details refer Release note.
>
> 0001-configure.ac-bypass-autoconf-2.69-version-check.patch
> refreshed for 14.21
>
> Release notes: https://www.postgresql.org/docs/release/14.21/
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 4 ++--
>  .../postgresql/{postgresql_14.20.bb => postgresql_14.21.bb}   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_14.20.bb => postgresql_14.21.bb} (71%)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
> index 76363cd26d..81cfc47c4f 100644
> --- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
> +++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
> @@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
>   1 file changed, 4 deletions(-)
>  
>  diff --git a/configure.ac b/configure.ac
> -index bbbb204..0919d2b 100644
> +index bc0b44d..1a616ac 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
>   
> - AC_INIT([PostgreSQL], [14.20], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
> + AC_INIT([PostgreSQL], [14.21], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
>   
>  -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
>  -Untested combinations of 'autoconf' and PostgreSQL versions are not
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
> similarity index 71%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
> index 04d8723f15..64af5fd07d 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
> @@ -1,6 +1,6 @@
>  require postgresql.inc
>  
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10ad6fd3d4b124238bc893ba2904cf0f"

A small note: during testing my build failed due to incorrect license
checksum.
I have amended this patch manually[1], so I don't think that a v2 is
required, unless you want to add something else.
Anyway, just FYI.

[1]:
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=631e0ac2f08dc3db4554f9602e7da257929e8107

>  
>  SRC_URI += "\
>     file://not-check-libperl.patch \
> @@ -11,7 +11,7 @@ SRC_URI += "\
>     file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
>  "
>  
> -SRC_URI[sha256sum] = "7527f10f1640761bc280ad97d105d286d0cf72e54d36d78cf68e5e5f752b646b"
> +SRC_URI[sha256sum] = "5b30f19347efff32b6e09ed2cdff0b04e9aee913ec9bb7414de2b7c17b17f1f9"
>  
>  CVE_CHECK_IGNORE += "\
>     CVE-2017-8806 \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124449): https://lists.openembedded.org/g/openembedded-devel/message/124449
> Mute This Topic: https://lists.openembedded.org/mt/117855111/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


