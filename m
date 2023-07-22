Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3378EB64DA
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 11:47:17 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.3871.1690026435398418056
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jul 2023 04:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SsFNZ2mn;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5768a7e3adbso57864917b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690026434; x=1690631234;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93cSXCgS+NX9Lkw4GQ2Ap/q2d7qNGn3+x0J5PN7NvwY=;
        b=SsFNZ2mnzu5UxcqYnSs8VqYtAdfJz74eyHgM6VSQF123TV31EE8gvSadCyLrepyChC
         DhZgyNBmmbsGNzWRaOE8rZQWr1GNvpCrL/+v6fkrvIvTFEYJv6G2yfdEPKD8OXb+X9VW
         MPRsxwftUZUNmYjfC/kb85jlAcyDQxur+tEAPsMp6qYWR1jfxzoVqYp2aFsJ23I9BGyo
         3Uz6xDVXF9kZRcpxrBp5Ll08iGKa6timg/ogxZxJanYUKcJ/k3fa2JOqRr3Wtkezvpn6
         4vjYb4TTju9GR2APrD1+dVc7G2kh2oQsfvk9/xgpxD2BNrfAzxL1Wf9kO5Q1qNoNi0qA
         zDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690026434; x=1690631234;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93cSXCgS+NX9Lkw4GQ2Ap/q2d7qNGn3+x0J5PN7NvwY=;
        b=ZoG0+qc9wTn0LMYocLZYzb5uAPrdKn3pZZ/Pr8Aw9ieO3SRA3nVjvnVVihYEnZ1ZaU
         xVz3KL9stNwd9QknaUBTzlrnGqjZDfZG1G4Jm/u2nMgRGhUpm9+2eTQo+j+e6wQ3P7V/
         DJ6ENEqvFj5N+e8RcfKk+Al3ikXlWT4Okdua9mO4fgW097nkPzyfu3/Ri6wVh1xpEtwz
         Lip4/daggQXJpMQzd20/Yh7+SqYuY/tizwxeCC5+eP+t5n9fAMTBdk79DAyUweKdOhnO
         2CmvNUgTZAvX4bGEFkumnnYjrWchUaB/o4/q7a2Ab/eXWvr3Zi9xdnOExmrBYS5wcYaK
         /GTA==
X-Gm-Message-State: ABy/qLZQcxIHP9Gm0J32Iz0heM8WPlGbg5SxO0KgY9hz6tCaqs/L4lpp
	8rGsEo+O+iTWqWNL4e5THA8=
X-Google-Smtp-Source: APBJJlHwUsLra0dcnkAEeF+0LlMp2xJJjxMBBRWRllqBbkZR65Jo4aJedaVkn7z8qreUJzLkY9VagA==
X-Received: by 2002:a25:ae05:0:b0:d03:37fe:5ae6 with SMTP id a5-20020a25ae05000000b00d0337fe5ae6mr3468195ybj.22.1690026434274;
        Sat, 22 Jul 2023 04:47:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:314f:57ff:9115:b8e5? ([2600:1700:9190:ba10:314f:57ff:9115:b8e5])
        by smtp.gmail.com with ESMTPSA id w15-20020a25850f000000b00d0069942a3esm1140967ybk.43.2023.07.22.04.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 04:47:13 -0700 (PDT)
Message-ID: <0e3b616e-5001-c0de-3976-8ef6f4367878@gmail.com>
Date: Sat, 22 Jul 2023 07:47:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe][meta-oe][dunfell][PATCH] c-ares: CVE-2023-32067 0-byte UDP
 payload Denial of Service
Content-Language: en-US
To: Vijay Anusuri <vanusuri@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230718025221.51690-1-vanusuri@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230718025221.51690-1-vanusuri@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jul 2023 11:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103986



On 7/17/23 10:52 PM, Vijay Anusuri wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>

Any chance of getting a kirkstone fix?  I will be updating Micklerdore 
to 1.19.1 (master) to address this issue.

-Armin
> ---
>   .../c-ares/c-ares/CVE-2023-32067.patch        | 84 +++++++++++++++++++
>   .../recipes-support/c-ares/c-ares_1.18.1.bb   |  1 +
>   2 files changed, 85 insertions(+)
>   create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
>
> diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
> new file mode 100644
> index 000000000..63192d3c8
> --- /dev/null
> +++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2023-32067.patch
> @@ -0,0 +1,84 @@
> +From b9b8413cfdb70a3f99e1573333b23052d57ec1ae Mon Sep 17 00:00:00 2001
> +From: Brad House <brad@brad-house.com>
> +Date: Mon, 22 May 2023 06:51:49 -0400
> +Subject: [PATCH] Merge pull request from GHSA-9g78-jv2r-p7vc
> +
> +Link: https://github.com/c-ares/c-ares/releases/tag/cares-1_19_1
> +
> +Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/b9b8413cfdb70a3f99e1573333b23052d57ec1ae]
> +CVE: CVE-2023-32067
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/lib/ares_process.c | 41 +++++++++++++++++++++++++----------------
> + 1 file changed, 25 insertions(+), 16 deletions(-)
> +
> +diff --git a/src/lib/ares_process.c b/src/lib/ares_process.c
> +index bf0cde464..6cac0a99f 100644
> +--- a/src/lib/ares_process.c
> ++++ b/src/lib/ares_process.c
> +@@ -470,7 +470,7 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
> + {
> +   struct server_state *server;
> +   int i;
> +-  ares_ssize_t count;
> ++  ares_ssize_t read_len;
> +   unsigned char buf[MAXENDSSZ + 1];
> + #ifdef HAVE_RECVFROM
> +   ares_socklen_t fromlen;
> +@@ -513,32 +513,41 @@ static void read_udp_packets(ares_channel channel, fd_set *read_fds,
> +       /* To reduce event loop overhead, read and process as many
> +        * packets as we can. */
> +       do {
> +-        if (server->udp_socket == ARES_SOCKET_BAD)
> +-          count = 0;
> +-
> +-        else {
> +-          if (server->addr.family == AF_INET)
> ++        if (server->udp_socket == ARES_SOCKET_BAD) {
> ++          read_len = -1;
> ++        } else {
> ++          if (server->addr.family == AF_INET) {
> +             fromlen = sizeof(from.sa4);
> +-          else
> ++          } else {
> +             fromlen = sizeof(from.sa6);
> +-          count = socket_recvfrom(channel, server->udp_socket, (void *)buf,
> +-                                  sizeof(buf), 0, &from.sa, &fromlen);
> ++          }
> ++          read_len = socket_recvfrom(channel, server->udp_socket, (void *)buf,
> ++                                     sizeof(buf), 0, &from.sa, &fromlen);
> +         }
> +
> +-        if (count == -1 && try_again(SOCKERRNO))
> ++        if (read_len == 0) {
> ++          /* UDP is connectionless, so result code of 0 is a 0-length UDP
> ++           * packet, and not an indication the connection is closed like on
> ++           * tcp */
> +           continue;
> +-        else if (count <= 0)
> ++        } else if (read_len < 0) {
> ++          if (try_again(SOCKERRNO))
> ++            continue;
> ++
> +           handle_error(channel, i, now);
> ++
> + #ifdef HAVE_RECVFROM
> +-        else if (!same_address(&from.sa, &server->addr))
> ++        } else if (!same_address(&from.sa, &server->addr)) {
> +           /* The address the response comes from does not match the address we
> +            * sent the request to. Someone may be attempting to perform a cache
> +            * poisoning attack. */
> +-          break;
> ++          continue;
> + #endif
> +-        else
> +-          process_answer(channel, buf, (int)count, i, 0, now);
> +-       } while (count > 0);
> ++
> ++        } else {
> ++          process_answer(channel, buf, (int)read_len, i, 0, now);
> ++        }
> ++      } while (read_len >= 0);
> +     }
> + }
> +
> diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> index 152d91332..2aa789760 100644
> --- a/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> +++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
> @@ -9,6 +9,7 @@ SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
>              file://CVE-2022-4904.patch \
>              file://CVE-2023-31130.patch \
>              file://CVE-2023-31147.patch \
> +           file://CVE-2023-32067.patch \
>             "
>   SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103892): https://lists.openembedded.org/g/openembedded-devel/message/103892
> Mute This Topic: https://lists.openembedded.org/mt/100209081/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


