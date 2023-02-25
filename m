Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498D0C64EC7
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 17:19:09 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.48263.1677345548346680736
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Feb 2023 09:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o0ag4L0t;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id c19so2558969qtn.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIcYiuVCpNFcbhwghDUx5pzvDB2TRBw4iRpO1Sm/wPc=;
        b=o0ag4L0tcMlfPz9ouoQjWSHOpYycmMELxJj01q+UFGoKsmhfRqTSZbU6nYmIDmQdTK
         r0DcYcj9Ae+n6CESChDzKy8lOnmsN9yiYLZMfWq1p91HQylA+kx+xxP8zOTiBPaUJw4d
         wulhzLhWfU7lRYe3fs1twB3uTbsmwKzBnf8WGkFvwXk/8PCicpg+maw/tdt67xuU1Qkk
         YuZelP18duzhVZvUpKlJ+2kRMBNriIS3T64/2Ziv56R53EC6qdNSMMjjZ6xtkulIJANg
         tf6NucWUf08Z8JXf6RWeCx0VZlzegtWEaS7RuXWOTbqYD+SBwbJKdqHKlQDTnjwFhNqe
         1Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIcYiuVCpNFcbhwghDUx5pzvDB2TRBw4iRpO1Sm/wPc=;
        b=fmbrKYWagP8AMTtqD+PISBgn+SBtd4Ax9gawKbYQa5niWRw9DQkJI1YK64BlaTpf0b
         pWoWYN0zL0IcmVukyCcRjiV3BC5sulRc9J3HOpGDEM4zeT/akeazMNr6sLbeAon4C47T
         ykn3XA3pzWPbe5/+gaq7BVvPj4RoGgEJ4KvG3AZnogcf2UqmwxDCh6FdrVbI0xZ+cCeh
         BtEZgnIi8e3RKiZj/66pYPQcCUtxh8Lb4Kk889ToD82dnuGPpAllMtAz9QTAp2my1abU
         CTiIW/1j5iQG40ZqHUyNaxp45A85smCMJ2BjPVBD9LZFFncG8h7VFauYfrYMEKeQ/Unu
         1skA==
X-Gm-Message-State: AO0yUKVb6Pun2MdYNpmGI+Z68QOtf4TAx4Lz1LmINOKnq7DKPWiUSrYf
	Uf7c9TmshE+sKx2UmozhmstDCoggfNs=
X-Google-Smtp-Source: AK7set8qi34BRR2MZoMQMGBQgmhbOnSsg9Ao6sApNljoqE+Dyrav/tKEuNlPBY7HNKmHXcju8yEKgw==
X-Received: by 2002:a05:622a:1910:b0:3b9:b1eb:ad38 with SMTP id w16-20020a05622a191000b003b9b1ebad38mr23085903qtc.50.1677345547448;
        Sat, 25 Feb 2023 09:19:07 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:e5ea:9bdf:4891:2b34? ([2600:1700:9190:ba10:e5ea:9bdf:4891:2b34])
        by smtp.gmail.com with ESMTPSA id o15-20020a05620a110f00b007422fa6376bsm1494941qkk.77.2023.02.25.09.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 09:19:07 -0800 (PST)
Message-ID: <3e87d1a1-b6fa-808e-8511-17d203be0a52@gmail.com>
Date: Sat, 25 Feb 2023 12:19:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [kirkstone][meta-oe][PATCH V2] liblockfile: fix do_install
 failure when ldconfig is not installed
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20230224043904.3306228-1-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230224043904.3306228-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 17:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101252

whats in V2?

-armin

On 2/23/23 11:39 PM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> liblockfile do_install task will fail since syntax error when ldconfig
> is not installed on the host.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   ...install-failure-on-host-without-ldco.patch | 62 +++++++++++++++++++
>   .../liblockfile/liblockfile_1.14.bb           |  1 +
>   2 files changed, 63 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
>
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
> new file mode 100644
> index 000000000..5103f910d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch
> @@ -0,0 +1,62 @@
> +From 0f78a746fee8553082c73beb2217d08fc5aaaa83 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Fri, 24 Feb 2023 02:57:35 +0000
> +Subject: [PATCH] Makefile.in: fix install failure on host without ldconfig
> +
> +* fix syntax error when ldconfig is not installed on host
> +
> +when ldconfig is not installed on the build host, install will failed with
> +error:
> +ln -sf nfslock.so.0.1 /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/lib64/nfslock.so.0
> +install -m 644 lockfile.h maillock.h /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/include
> +if test "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" = ""; then ; fi
> +if [ "mail" != "" ]; then\
> +          install -g mail -m 2755 dotlockfile /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/bin;\
> +        else \
> +          install -g root -m 755 dotlockfile /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/bin; \
> +        fi
> +/bin/sh: -c: line 1: syntax error near unexpected token `;'
> +/bin/sh: -c: line 1: `if test "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" = ""; then ; fi'
> +
> +* only run ldconfig when it exists
> +
> +Upstream-Status: Submitted [https://github.com/miquels/liblockfile/pull/21]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + Makefile.in | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index bfa0acb..e29763e 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -9,6 +9,7 @@ NFSVER		= 0.1
> + CFLAGS		= @CFLAGS@ -I.
> + LDFLAGS		= @LDFLAGS@
> + CC		= @CC@
> ++LDCONFIG        = @LDCONFIG@
> +
> + prefix		= $(DESTDIR)@prefix@
> + exec_prefix	= @exec_prefix@
> +@@ -58,7 +59,7 @@ install_shared:	shared install_static install_common
> + 			$(libdir)/liblockfile.so.$(SOVER)
> + 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so.$(MAJOR)
> + 		ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
> +-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
> ++		if test "$(DESTDIR)" = "" -a -n "$(LDCONFIG)"; then $(LDCONFIG); fi
> +
> + install_common:
> + 		install -d -m 755 -g root -p $(includedir)
> +@@ -79,7 +80,7 @@ install_nfslib:	nfslib
> + 		install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
> + 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
> + 		ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
> +-		if test "$(DESTDIR)" = ""; then @LDCONFIG@; fi
> ++		if test "$(DESTDIR)" = "" -a -n "$(LDCONFIG)"; then $(LDCONFIG); fi
> +
> + clean:
> + 		rm -f *.a *.o *.so *.so.* dotlockfile
> +--
> +2.32.0
> +
> diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> index bac3a2c0b..eefc25dc4 100644
> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
> @@ -10,6 +10,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz \
>       file://0001-Makefile.in-add-DESTDIR.patch \
>       file://0001-Makefile.in-install-nfslock-libs.patch \
>       file://liblockfile-fix-install-so-to-man-dir.patch \
> +    file://0001-Makefile.in-fix-install-failure-on-host-without-ldco.patch \
>   "
>   
>   SRC_URI[md5sum] = "420c056ba0cc4d1477e402f70ba2f5eb"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101245): https://lists.openembedded.org/g/openembedded-devel/message/101245
> Mute This Topic: https://lists.openembedded.org/mt/97200207/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


