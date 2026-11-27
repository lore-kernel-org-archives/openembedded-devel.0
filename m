Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10221.1795752841968057896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:14:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IoxlqqCm;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b5786e099cso6415604c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752841; x=1796357641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqu10KQAoiUFMGbDu0UwzgrhetM9Qtcadu1vMNNc+PM=;
        b=IoxlqqCmarh3oqQG0cCp8B0A9NFQbjzVKoNuJ5kguouM3q7z6BgVRtSMlgRnqB4Hic
         CbhlsQITeNUCmGJqMBekfRPeswya2enuCX/5m95L+EV2VhlMTTg0MI2fgjKdWFDvsyrG
         ikcmIWFb5D6lhT/P1aYCAqlGrOdVwaEazAbA00NARSxD+CYBUQQvozXNtoSf21/ALV3f
         18nXr/RJ6+4hxYwqLTo7cGMtyYvNg0r1IyoVUooB7QKcBF774t/gv7FYOe5ahXTFbR0r
         rqtnimnpiGhFM/v8aqDCU2ufK954nPfTY7F9Uonvk2oHVEl6JI38g8bxQsEFKgULkbSn
         2LNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752841; x=1796357641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dqu10KQAoiUFMGbDu0UwzgrhetM9Qtcadu1vMNNc+PM=;
        b=nhPKIqyAZBCHkn9TJz2gOQH8Lm+RpnC7TvunZXdSyl7BkAhT/mInvBs7W52GsN3fuH
         /2I0nQPQqZNtJxL8uxoA/gR5eVeXKZxy+mbCSRQ+4sn8rsGiIYdkEE70rMnZqkIxuqq8
         wmNmO9Dtcip6UwskOVRdUwf7kLtlLH+YJh3XjtGKai2W293EuhEeAyrvxSHnb3fI8p37
         90AR+b+9dtKlKawmwgDoUrUHgjGsJtvgUoaUaS3rHv0yZFGc8vEXys0BY/gTlG9kF4Ip
         WSX6+ADf1OJzCLMCyH6GMT2yy2h7FZclLlGEpaSBXfvpimnv5e76GeCZ9xymCbJavLfc
         sKvg==
X-Gm-Message-State: APuU4Z9gGGkUIg1bloqY5ISLVPmwj6I6ZJjHbHWCSqslkfRoTXy3UL20
	D/OeN+M93W2mxm49UhdnyZGEvWStVDUXzwkEeH68TzaO8ksy/435VaGup3aUZTyd
X-Gm-Gg: AZFdTZdDp0Q2ZWYEdaYPp7kVW/ERoS49qzwF3O+y0aI4/TnypfHwuHStWEmvd04eJa/
	vkJZA2oc8ZxTqamGJNgKi93/XO9GTDOLCOW79nwSQOf3SYJTLaa+hjyycA4cUlbLHv7GCzSqjsD
	/dj51DprQngo9WMvMEfsUVHrw1vE2NNc8BClKxVWV7kO+bHCvs/KvHazkztl8YWEiM4znDyg02x
	15xRkxjAr6CZLN6Q2aUcwsFrk70agYpT82KbfFBsxbSPHeESbU7xfiXd7GnR5BSVAarQwiMSN0N
	F8mZUBvIaQgfOtXWDxYEJW0IQpurgdrc2HUTohyNCiPxP3UQ1LTcQKqCjQUdca+u9sCiFaAe8Ap
	GwQMB9PnRMOtGek1DwWjRlTxSlw83HRgjAQUM7xk0Z/rQT8+IuZmQPZJY3svCo7Vounyfsup9dc
	uNB5CSckbWNtUzt7bKTKJnc0+axBsTmm//fI4q1ScIHontPTkUV5Y3dXHrzvsWBvDk74vjo44l3
	Fmmrmgd59/GMwOBEvZGZw6H5oAchd4+/U36PLJxV2d6l1foWhPQaGSNE4O9zZKHKZESNxoHO2Pz
	aDxqP3OKFMKNB7zRwZE+yTkj7ub4mtTRPmI9nGSHdIAxdKIz80K2jDT11+q6zjuc/RhT0gKEqNK
	rm2MVnW9vwiuiD4wyElBm7+y/8jF+URnAjc5GJIr3ybWEz3eEOIa/ovJlAAmfm+6RBOq+2VAKio
	jbvBsp1/jNpG0YETJZgtCVOpiD56WLMVy/YbXfhjVECpZ7l5JnCEfdqcyGWaTzEn3d5ITtq6l42
	ryorc1quUqqFaZCjuHwuvBuU4uAX4TxJpqW4yqnPYq9cWsMEq4ULUn6ePCHPUh1xLKAYVQrLjcp
	kLvJ
X-Received: by 2002:a05:693c:69dc:b0:386:aff0:6109 with SMTP id 5a478bee46e88-386aff061f8mr15013259eec.2.1795752841272;
        Thu, 26 Nov 2026 20:14:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:14:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 39/39] libraqm: Extend to native
Date: Thu, 26 Nov 2026 20:13:43 -0800
Message-ID: <20261127041343.1772294-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
References: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133209
Content-Type: text/plain; charset="utf-8"

python3-matplotlib-native builds against the system libraqm, so it and
its users (smem-native) were unbuildable:

  Nothing PROVIDES 'libraqm-native' (but virtual:native:.../python3-matplotlib_3.11.2.bb DEPENDS on or otherwise requires it)

freetype, fribidi and harfbuzz all have native variants. Also match the
vX.Y.Z release tags in the upstream check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb b/meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb
index 6dc2762469..cd0a8fd37d 100644
--- a/meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb
+++ b/meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb
@@ -16,6 +16,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=af4502a870b471d3ac78abacb7abfa37"
 SRC_URI = "git://github.com/HOST-Oman/libraqm.git;protocol=https;branch=main;tag=v${PV}"
 SRCREV = "08ee1537e63f93bf926498e12b12ed15ee383216"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 DEPENDS = "freetype fribidi harfbuzz"
 
 inherit meson pkgconfig
@@ -23,3 +25,5 @@ inherit meson pkgconfig
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[sheenbidi] = "-Dsheenbidi=true,-Dsheenbidi=false,sheenbidi"
+
+BBCLASSEXTEND = "native"
