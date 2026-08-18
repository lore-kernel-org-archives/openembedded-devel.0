Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3D6C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:19 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2334.1787029337986442351
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hFBZPLIN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2992908a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029337; x=1787634137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSqxPxbunawL9qn7MoT578/2gacx2YRgnHg1/FOM9ag=;
        b=hFBZPLINW1DnJi1f1Gu5xJK926+K8PpJ7gOter1f89gOiNyr6kiK0H5iw6CVPRDXNq
         PXfxCjk/XoqFE2qDoQOU2iTsxSNhk+mr6y6lh89KxbJc6cx+q0ZP8/X3gm9qqjmROvRd
         z/QlJy90RPnk9lN1Ig5dD/v8sxLFlRKENn0hfDc68z+XAsdCCwK4S/KT0MIRCQRv1I7I
         LZvzrYVkqML7WgDfmrlChD7YqpuKYGpyrShcNxoNuV1P7l4k4/J6GUqW38q0wV3wV446
         F9NjGyGkwlrXizB3mYloShWke5RDagwYWJANVbW9kivVgVk6bo8VnxbIyuqrKDxsyriy
         yD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029337; x=1787634137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSqxPxbunawL9qn7MoT578/2gacx2YRgnHg1/FOM9ag=;
        b=MIDR6No3fsxP0VOfHrh+nvcnyJGglKcHAp1DIcSndPlDAzswj0XBwcdsxVkVhLaAQg
         A+FEvErLrN1C1kyG9fX4HyLmO7/szbwgphW4cwUUYWhwRhQLhx/UDUbzNIxopf0xFND9
         FDfXFJBXjoF9r97MSLA27Rgs9OhTsvdfHQDb+zmX1UYEuZJ9vPPf845XWaoeRQpfnZG+
         R7AjW7Jam80BnoPgScVqUR9YkhalFFEFSI3GUPC8y9Cl95jMjqaj1uOQbdDFGk9VCPsD
         yj44mDPatNBr5JfZu+Nh3UE3OF+nNnNbjV5OZzGgPofAcuuSJxVKBXD5rCNlmtM+DTrH
         Lg+Q==
X-Gm-Message-State: AOJu0YxtuA/6ZYQh4/Wrpb37a3ItXEmI7pMJJPdAHmXJk4yiFHi5ge3R
	lrSVwFpEnDJwRN3fx4kb++N1g0pNWXsvT5e9ERTEQBg+oxIyXm2BV2NVTQzdiYgm
X-Gm-Gg: AR+sD11bU9idHK23dzy8hrEHhe3inlaMN/00c/UhNIiItH8QzGqwHFVtSO4JvXp8PHH
	pkfrzTlounkV5vZr4FkSe76n8oQb+ESHfGAwMU7254J4mYthlOnFP9S//8sEKOj7JktPTY/tF6K
	3sWDeasZMLn8jTGA4uxj/kdjsRN/bHW24vUBs/IctFM/htgI/wHKW0Iql1kztTJ8Kp7UUP+fFT/
	/BeRqgvxaPZ8mIu7DOUrpARz9MclKxLsGdW/qCLa99pbGacbC8g5Hg9UFPLxO4LqYSqt6ZtbI5e
	2lcWF/HAL2bPMG+8PK1d2T7gTNg4eZkJWwWGSs5P3+dN0xd0Pg5YpjlRymFFNjtvuvRF65adr82
	EqAqfZhlu//CMlW0rJAqSZo5Bho5BSmuMVJ0v4uepe/Kv0P5N7J1ZPCA8KHvV+hd7Tnx13DXlat
	CBAgNxm38kJKuDtU2nsnwvBNDw+DBWhODkO8ZrJi+I5th6u6AP5oqn3vg4J+/JJymr62ZByTxiy
	eAdS/lAfjyW
X-Received: by 2002:a05:6a21:69c:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3cc71e182f5mr31685057637.13.1787029337245;
        Mon, 17 Aug 2026 22:02:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 15/27] libcoap: add UPSTREAM_CHECK_GITTAGREGEX variable
Date: Tue, 18 Aug 2026 17:01:10 +1200
Message-ID: <20260818050123.2901739-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129214

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libcoap
...
INFO: Current version: 4.3.5b
INFO: Latest version: 4.3.5
INFO: Latest version's commit: 851533c3cf63d16984d370ce39d586ecb3694971

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index e8864dcf34..e5bbdb9e27 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protoc
            "
 SRCREV = "851533c3cf63d16984d370ce39d586ecb3694971"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+(?:[a-z]))"
+
 # patch releases often use alphabetical suffixes
 CVE_VERSION_SUFFIX = "alphabetical"
 

