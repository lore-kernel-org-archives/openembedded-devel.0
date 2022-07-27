Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22155C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:25:33 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.25460.1658957125657854228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 14:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U16IT/jv;
 spf=pass (domain: gmail.com, ip: 209.85.166.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id h16so91236ila.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=FKFx/g9R1iwBKPVNfbAkDhP2oo/YDbT7jcUUvj2n4wg=;
        b=U16IT/jvjrBa7xa8VAFA90SPvbtRHCPt56zi9eSlxbcAm+ZKyLcYS42YStGXkCD7vH
         e+PlRmusGRreNh0CmI5o21ChFOv3H4WLK6FqwhVzqhbvMngZGJQs/zWlopk1QYNHKE0L
         ykAW1sHYAimepfX1vu33KGLeAF5w/engBDM9vv3rL8hZy7ILa+11n61Rx8dxiOJyjZgw
         v0F+f0w03BPNVqy8nBjGwpiL7Vzu1NNEa1PDqm+kVdyMMjnGx/QhAoelY4T23lTMkFlI
         nQM+66aE5aXG1EqnqMdwP4Aetngk9zzXKRrvq16xuZHTmWaz70x7BBqWqlvQ4mDWU1Za
         pNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FKFx/g9R1iwBKPVNfbAkDhP2oo/YDbT7jcUUvj2n4wg=;
        b=PCmWI2xCIzHXDr45ze7AFJDa8ZhekzfMcjmShNqrF+HU3JYqYWgvDfRm3z7sTE+sjT
         XZZLYotYavRaahxrf/G00ZV4aIPoixq+jljRt8gZs3cSMm0ye6HFlXQhbhOBdaVYZsJZ
         FISjbKsX5cxZrZMvDye1aPnWSj+dWoLkDFESOP+Z/A+uSXC9ZdZ6PD1BFSnGwXa4zNTU
         oBYy8UQexVOr987dZsSKHGxYX9LHvnGAY+Bv+V/2sGXvPM7bTjgN53DMbkgCi0ni9sH6
         U0TtFGZW5h23/APAbEpSfknjJA5IdUSlAl40tk9uVhpPbuGM0qnbUtdyovULp8kr8fzC
         2YgQ==
X-Gm-Message-State: AJIora/wBg4Ega1Z8okDOmyC9mdVX+ln008TvW7l+pGoFmaKeL3ndfwy
	WYZqt/ZW+9bKX0mTaCJ5eSg=
X-Google-Smtp-Source: 
 AGRyM1szcPTsN7LmrT+k05mgddlfuIK7kF9ipluiPV/sgfBKeiZ3W1TOOx/IoMhJJ+fYRoOb88W1hw==
X-Received: by 2002:a92:ce81:0:b0:2dc:fbec:d023 with SMTP id
 r1-20020a92ce81000000b002dcfbecd023mr9318493ilo.155.1658957124865;
        Wed, 27 Jul 2022 14:25:24 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:e8b7:596a:a352:5d5c?
 ([2607:fea8:95df:9730:e8b7:596a:a352:5d5c])
        by smtp.gmail.com with ESMTPSA id
 x24-20020a0566380cb800b00339bae1dab9sm8157114jad.40.2022.07.27.14.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 14:25:24 -0700 (PDT)
Message-ID: <3f85772a-416b-5311-656a-ccf5f1a22932@gmail.com>
Date: Wed, 27 Jul 2022 17:25:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [oe] [meta-networking][PATCH] sshpass: add recipe
Content-Language: en-US
To: Mike Petersen <mike.petersen@ni.com>,
 openembedded-devel@lists.openembedded.org
References: <20220727181928.34114-1-mike.petersen@ni.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220727181928.34114-1-mike.petersen@ni.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 21:25:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98020

There are newer version in some layers on layerindex e.g.

https://layers.openembedded.org/layerindex/recipe/106509/

perhaps use that as starting point.


On 7/27/22 2:19 PM, Mike Petersen wrote:
> From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> 
> Needed for automating ssh logins, used in auto-tests.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> Signed-off-by: Mike Petersen <mike.petersen@ni.com>
> ---
>   .../recipes-connectivity/sshpass/sshpass.inc           | 10 ++++++++++
>   .../recipes-connectivity/sshpass/sshpass_1.05.bb       |  8 ++++++++
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass.inc
>   create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
> 
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass.inc b/meta-networking/recipes-connectivity/sshpass/sshpass.inc
> new file mode 100644
> index 000000000..b19ae4313
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Non-interactive ssh password auth"
> +HOMEPAGE = "http://sshpass.sourceforge.net/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
> +
> +INC_PR = "r0"
> +
> +inherit autotools
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
> new file mode 100644
> index 000000000..a345dbd95
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.05.bb
> @@ -0,0 +1,8 @@
> +PR = "${INC_PR}.0"
> +
> +require sshpass.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI[md5sum] = "c52d65fdee0712af6f77eb2b60974ac7"
> +SRC_URI[sha256sum] = "c3f78752a68a0c3f62efb3332cceea0c8a1f04f7cf6b46e00ec0c3000bc8483e"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98018): https://lists.openembedded.org/g/openembedded-devel/message/98018
> Mute This Topic: https://lists.openembedded.org/mt/92655179/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

