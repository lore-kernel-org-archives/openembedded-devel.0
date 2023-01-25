Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC14AC61DA3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:56 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.44967.1674653489724429460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S6Ba3QaT;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id j10-20020a4aa64a000000b004f9b746ee29so3156738oom.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNBaQhRo2Hsigqi1idgJwknuCxvXZCBpYo8fWS2cXBE=;
        b=S6Ba3QaT4ZudIG76d8y84nBbiAwrING6j2nUKWEFsQnMzsnY8tUaYspc559FiLnC1J
         dIgcJd625Eom0CjxwJKZaQb5jzr2yt+RuWpWZQLjJexwek4UA1B3V/LD2P6jla5x42vh
         Hszx9jj5B9kU1rRj3sRGTN8iC9UHotQUnQ3s5Mx1+7oxNIpMSYTztFclgQlTv952Aho3
         ismy5ZvzOaGh8XXeNVDPEhF+ZqcqHBLSw/jqE7zUNszkn6OJIq1KTeS8vot6cg+CGyUT
         39FzH3NvaSOFSlKDK9Y9HgQZBJSV32bf51KQU53qTPtxNGjP5UDUrlgosceQpgv2TeVg
         phfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNBaQhRo2Hsigqi1idgJwknuCxvXZCBpYo8fWS2cXBE=;
        b=Wn86hgxh1BKOAtZff6BDPZPjRmEgKjcuaBIKNLBVOI+73wDnGOgzOFXxU3ARPSsTjr
         pe193NQolWfM3N57MqTxy8jXP1CEZGyhzcGTDtIBOhkMeINWqE+gk9c8uSfacVZ7I4P0
         3WxxF2SqmU0N6RgUFF7Wu5LuQRN1afvWLP8jQMVYy2iNRHJCJdGXwavXuCyjDpgchweq
         KyoL+FfXhm1pJiOaManQtychAh2wdOvHQCosx6mLPPOER08SoiWsFNOgQjejE9IE8Iq6
         t69qmxQVxso0b+/PDLrmIrMbechB2VndFhcF1r1e9p8LxoXv3qgRzVXG0FZZ0fOHIt11
         HAAw==
X-Gm-Message-State: AFqh2kpHGdeHqmT8nhs/Ty53r41P8jmBQ8RkrmwP909xWT6xVpV2fXyo
	bFWlQflTsJxTLWAJsu/8bSe/MLhvmqM=
X-Google-Smtp-Source: AMrXdXsDX3SZ/8RiAXytucRPMogSgPuZU7t4Rv0zsUNA4BzMGKKB/A9Bjw+bt35qYWUsUJQUKy+z5g==
X-Received: by 2002:a4a:3745:0:b0:4f2:cf1:36ee with SMTP id r66-20020a4a3745000000b004f20cf136eemr14934888oor.1.1674653509096;
        Wed, 25 Jan 2023 05:31:49 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 23/41] networkmanager: fix dhcpcd PACKAGECONFIG
Date: Wed, 25 Jan 2023 08:31:05 -0500
Message-Id: <971a33338ff7fc9b90b4063c273c3df79dca2905.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100758

From: Chen Qi <Qi.Chen@windriver.com>

Without this patch, even if dhcpcd is enabled, the NetworkManager
cannot find it. Below are the messages from NetworkMananger:

  dhcp: init: DHCP client 'dhcpcd' not available
  dhcp: init: Using DHCP client 'internal'

The problem is that dhcpcd needs to be specified as a path, otherwise
NetworkManager tries to find it in /usr/sbin/dhcpcd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 178123a0066c40db1e75d018dc65f056fb03b826)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.40.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index 10241e12a6..110b499aaa 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -104,7 +104,7 @@ PACKAGECONFIG[ovs] = "-Dovs=true,-Dovs=false,jansson"
 PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
-PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=yes,-Ddhcpcd=no,,dhcpcd"
+PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
 PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
 
-- 
2.25.1


