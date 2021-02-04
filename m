Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.57.1612459521756024709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 09:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qIWQrWRj;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id z9so2190769pjl.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 09:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/enbVrHNwf/J3yRhXKhBiHhO1NsErHNIBahycfGtHEs=;
        b=qIWQrWRj6oNUsHQsZ24PyalWGs2F6XG0QHxnWW/bhWh0x7fep3JTn5YOUEMrReFCev
         Bwd6t5bAC63rUFjoswZ+mfVq09SfH7LNjtuSP8trL3FPkhEEwPxNyXD1geqZzyguLigM
         22CNz3EE4pExAoshQEgvrkNz56jO/iPfQT3wudSqLFz65VSWEDlGTDnUT6w0+yYjwQUS
         lJ/OhW65wsBCJYJjWh0MNELBunPoqlLARbNk+ZRNkmvZ9VTbP7KHiQ+idE/OmO9NaPKx
         n4j5wc1Yz6MhEUbQVJYktRyR6pViIjm6jdMp6868fJNEyq6ivamVWzqw2AcHLwvrMsog
         pLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/enbVrHNwf/J3yRhXKhBiHhO1NsErHNIBahycfGtHEs=;
        b=pL/xbP/yHC9xKpYjaLGoLOmSl353smqbyL8X9Tt6AZ2LtmOFEFkl5e7+ZiPVAI8bdB
         o4rJ2WXbbA+GZ+z29pdEY319rq88juCSuZyk/dp8yN4YKRotdOyeajLnpg5ABZK4Q6ns
         TsZ0gBovS69PvABjk+/0UXPYjVTZH9Fky15KsDuWLFhuFRd9P46Hk8Jqmslj2gu61sQH
         9fZrCzFVv38lRG7mxgkrdenV3g9iP3EaAsJPWNsM9lO5u0kO34DwvoOcFy78ErugNgb3
         6ES6g4Te7M9SMS0W5v8haDmQfchZkfViIi++i/BuSMZm2XhF0aCPmLbppxOuzcQfkYoR
         vhkQ==
X-Gm-Message-State: AOAM530c/NKK4qWwctfLhOXnEV3wrPkdRLyyCq5Zse/vZ4+1UgIPWJu5
	DSW5b/qF945CxJHXiY851QHjbFUp5vAR8Q==
X-Google-Smtp-Source: ABdhPJxQADK+WD0YRDysrnb4qLIq5MJMmJyJvbc+BGGgEa64HcjyBB7XdR2KWdJHzot9xMNfcl/45Q==
X-Received: by 2002:a17:90a:ab17:: with SMTP id m23mr59585pjq.0.1612459520813;
        Thu, 04 Feb 2021 09:25:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::2914? ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id l2sm6261232pju.25.2021.02.04.09.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 09:25:20 -0800 (PST)
Subject: Re: [meta-networking][PATCH] lksctp-tools: make conpatible to autoconf-2.70
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20210204103441.98459-1-hongxu.jia@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <440305ac-6868-7086-1329-ddaa36d21d0c@gmail.com>
Date: Thu, 4 Feb 2021 09:25:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204103441.98459-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/4/21 2:34 AM, Hongxu Jia wrote:
> ...
> ./configure: line 16398: syntax error: unexpected end of file
> ...
> 
> Backport a commit from upstream to fix it
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   .../corosync/corosync_3.0.3.bb                |  1 +
>   ....m4-make-conpatible-to-autoconf-2.70.patch | 89 +++++++++++++++++++
>   2 files changed, 90 insertions(+)
>   create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
> 
> diff --git a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
> index c0531d386..7e0b5d5ca 100644
> --- a/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb
> +++ b/meta-networking/recipes-extended/corosync/corosync_3.0.3.bb

should this be 
meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb 
instead ?

> @@ -8,6 +8,7 @@ SECTION = "base"
>   inherit autotools pkgconfig systemd useradd
>   
>   SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
> +           file://0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch \
>              file://corosync.conf \
>             "
>   SRC_URI[sha256sum] = "20eb903eb984f6a728282c199825e442e8bba869acefd22390076ef3a33a4ded"
> diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
> new file mode 100644
> index 000000000..484af4e0f
> --- /dev/null
> +++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
> @@ -0,0 +1,89 @@
> +From d6d7130f0a2e3b81880fca29966e42c1b2be40a7 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyfox@gentoo.org>
> +Date: Fri, 8 Jan 2021 22:22:52 +0000
> +Subject: [PATCH] m4/sctp.m4: make conpatible to autoconf-2.70
> +
> +On recently released `autoconf-2.70` generated `./configure`
> +fails as:
> +
> +```
> +$ ./configure
> +...
> +checking for struct sctp_event_subscribe.sctp_stream_reset_event... yes
> +checking for gcc options needed to detect all undeclared functions... none needed
> +./configure: line 16464: syntax error: unexpected end of file
> +```
> +
> +This happens becuase new autoconf generates less whitespace:
> +
> +```
> +{
> +if ...
> +...
> +fi}
> +```
> +
> +It requires at least whitespace between `fi` and `}`.
> +
> +As input already has newlines the change just drops extra `{}`.
> +
> +Tested on `autoconf-2.69` and `autoconf-2.70`.
> +
> +Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> +Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> +
> +Upstream-Status: Backport [git://github.com/sctp/lksctp-tools.git]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +---
> + m4/sctp.m4 | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/m4/sctp.m4 b/m4/sctp.m4
> +index 6593517..94527a6 100644
> +--- a/m4/sctp.m4
> ++++ b/m4/sctp.m4
> +@@ -6,7 +6,7 @@
> +
> + # Macros to assist on probing kernel features
> + #   Probes if a type is defined
> +-AC_DEFUN([LKSCTP_CHECK_TYPE], [{
> ++AC_DEFUN([LKSCTP_CHECK_TYPE], [
> + AC_CHECK_TYPE([$1],
> + 	AC_DEFINE([$2], 1,
> + 		  [Define if $1 is present.])
> +@@ -22,10 +22,10 @@ AC_CHECK_TYPE([$1],
> + #ifdef HAVE_LINUX_SCTP_H
> + # include <linux/sctp.h>
> + #endif
> +-])}])
> ++])])
> +
> + #   Probes if a struct has a given member
> +-AC_DEFUN([LKSCTP_CHECK_MEMBER], [{
> ++AC_DEFUN([LKSCTP_CHECK_MEMBER], [
> + AC_CHECK_MEMBER([$1],
> + 	AC_DEFINE([$2], 1,
> + 		  [Define if $1 is present.])
> +@@ -41,10 +41,10 @@ AC_CHECK_MEMBER([$1],
> + #ifdef HAVE_LINUX_SCTP_H
> + # include <linux/sctp.h>
> + #endif
> +-])}])
> ++])])
> +
> + #   Probes if a declaration is present
> +-AC_DEFUN([LKSCTP_CHECK_DECL], [{
> ++AC_DEFUN([LKSCTP_CHECK_DECL], [
> + AC_CHECK_DECL([$1],
> + 	AC_DEFINE([$2], 1,
> + 		  [Define if $1 is present.])
> +@@ -60,4 +60,4 @@ AC_CHECK_DECL([$1],
> + #ifdef HAVE_LINUX_SCTP_H
> + # include <linux/sctp.h>
> + #endif
> +-])}])
> ++])])
> +--
> +2.27.0
> +
> 
