Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C91CA5FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:06 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.124.1790811065807537220
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fACu/8BI;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso4048398b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811065; x=1791415865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/q+ldkOoW+dbtxTzZuARgpspagvmAyJRWKGOpr2f8A=;
        b=fACu/8BIH6EYfKv+FN/2n/XXTfskHvir0d4f4P3q4py4sK7jmKDvAHQblFIhoocyM3
         hPofd/6YhjIoK0wzbhogApvhblrS4dpMGNLqaIe47nwTjXBVtSENkXis6IjhZSxMqDH8
         Kc1DKzXNcuMyTNvMt0odW4b79OZOZbIWKPk0033mErezYq58Ls0D7V7BUdXhAVJqqpwq
         36aysm/xmd7Y/ieQ2Il6nAvuhqMwp2tLEGo+jF171CYtHMnCXK+5irwGw7hoL7TEn+Gc
         xRbRWGRToqxVK9Cv5DCHkNHeMrkPBPjCWLZ9fA9jhrU8o+syjre0Czjxw0cwCJJsUvwK
         ZyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811065; x=1791415865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/q+ldkOoW+dbtxTzZuARgpspagvmAyJRWKGOpr2f8A=;
        b=MtgOVZNGnWy3TrNi+KF/HRgJv+aSj1j/59UMwuvtUfIOzjvJK2utsFalvHC8XUFyXM
         hn+WNitDKjSOpb0y70wRXmMr8bSQUlWqt4r1x+avz2ZFk5hgOrjqVVAPL38iiQf0krjs
         6UuMQGU234OBtSvTnJCk0fyKreVZNbjFtwgwqh1F38P6oa6DzT6SHEmlBkDzlDMQ4tWp
         BDJw77e9R0aGNA406OnTW8oExyRGmU4xzvbb2gAGnw0WCAZ7lQc9Wq3ux5MKKommdw9K
         3fuE7JRA5r9APRTjR64vWuaohq3Sel5/F+3YxIeepCNrSI6vM9vomAGHsbKww2+bOzFK
         dv0g==
X-Gm-Message-State: AFuF++kCov7Nf9mjTAIz3LjVfb40Q+Jei8g58N1+q0G2fbj3B5b9cZ9F
	rwsGykLrizpROuaf8D8vq09WYtewisb25tHoCQScOymYbkgD+5OKcog0coVduw==
X-Gm-Gg: AYBFou3qaYaSzD9xQ2WlO4T4k9hxJvb+/Kucdyzl5CcB4elaoW2WFEmsvvTlowqFHNM
	YwhU035LCIiP9pWot4dtcC7s1nNN/66RJb56KURSWlCbNNtYbu179/HhTcyE/Q23+JZASM1xh25
	+ZCZnj2fD5GKrjeglH60+hqSQZmdul577juhRrtnE721XcfkpJMB3TMu/1Mr49dms7eTS9uQ69Y
	2u3hOIhAnZTjwHhQJ9FG+ogEe6+C2/zKx6ZCEHVj6botZc+4AIaz5j5Da/aG/9TkLLCauBQ9cNM
	jEb249vKi8JVSwhPFhvBufRuqHvn42bZLxpysHP2sTS+DsmvgzBLnoGRefWCuCitkENI7TRnEbo
	ZBqhOtaQPtLCNAeOoWJ7Gfp/CKxBuCpp3pv4ZfMWs0OWUDeqy9BGEMPtCEa7yN+h6Wh5JVD1IoS
	KcOIIPE/q1SEMNAH2EOKGOSXxob1pv0/MkuNIrGK1QDxyLpD2ufzYxKbY9XGTaVdzGRjxLAW0ms
	X+UjEFblP0RvE+PmPD01ybJ3F7XZLdFgg==
X-Received: by 2002:a05:6a00:4009:b0:886:cae0:fa28 with SMTP id d2e1a72fcca58-8874ba26fa4mr2191569b3a.40.1790811065097;
        Wed, 30 Sep 2026 16:31:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:31:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 11/14] overlayfs-tools: rename PV v2025.01 -> 2025.01
Date: Thu,  1 Oct 2026 12:30:31 +1300
Message-ID: <20260930233034.659237-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130544

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also update tag and add UPSTREAM_CHECK_GITTAGREGEX, SRCREV is unchanged.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...overlayfs-tools_v2025.01.bb => overlayfs-tools_2025.01.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/overlayfs/{overlayfs-tools_v2025.01.bb => overlayfs-tools_2025.01.bb} (83%)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
similarity index 83%
rename from meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb
rename to meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
index c83233a9a0..8583a0e2cb 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
@@ -4,11 +4,13 @@ LICENSE = "WTFPL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
 
 SRC_URI = "\
-    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master;tag=${PV} \
+    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master;tag=v${PV} \
 "
 
 SRCREV = "6e925bbbe747fbb58bc4a95a646907a2101741f6"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 inherit meson pkgconfig
 
 DEPENDS:append:libc-musl = " fts"

