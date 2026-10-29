Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11246.1793278603093987003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e5Izoz+Z;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1724240f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793278601; x=1793883401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gpuwXQCy9+ECZbe8ZYMM1PbNjmtd6PxV40rqEIvoMg=;
        b=e5Izoz+Z9RIM3w1kaMny62l4j4FVFnHlMEOHYZXeU29qfSOTco7+orNI03iJObeVBX
         jZ781Ck7yxZp/GTa1zbZoyq/o7xDB4hKXna4rz99KzjUqt622ZpfBMB1oXnh3AAjmBo1
         X7BE+crv8XBFpBDZKMarIkE7Kf19C4pmSC+uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278601; x=1793883401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gpuwXQCy9+ECZbe8ZYMM1PbNjmtd6PxV40rqEIvoMg=;
        b=BhzuqlecCHOXllKtGmimrtM7u+bXncXlAicKP+LwiK954H72Lie7PNU9aVw45cNgQ+
         xYK+M+bupBWpSsUc9y7UJz+RGUu3AfRcQ4N2UqQlBdz32jyrdwq3hpIcSiv+UoFcj4yK
         hLdG6hjJBrP7r5SkjrkVJPcSaU/+Od39Qsm3bQboNvPz5Mz67jFGWvzo+hXeH4igNlbJ
         GcfbEwR8fqO4XHPmzWWjdnPbscrI1kXDz7i+F+dH3FeWzhX4T8SIMnpSWHdXzv0Yo2mL
         KLmIj4dpMZI6HHT1dqfOCBz/TzPQk1qHPu97pB8Q8856RKoW8cwhAzuv1/TMwgids179
         S9gQ==
X-Gm-Message-State: AFq9FYLRRvfb3meTIPLAU1JcFLGX8SbfcCkPdOZNazbde5MhXA+GMVfJ
	TLJkH/uVQ8BzTKE+2vObUXuH/iDEtSFot60ExpGMioa2lL5Zdj/aqwO59JJvIrMJkFL7LbfJQJz
	ylJ1Z
X-Gm-Gg: AYBFou01AfdXhnFNQlcKMYcVvN3TOkhuht1IJ4YeHEQdo9a5R9gsgeKhptMDHgM6Xd0
	vOO5q9J+rxgWQKN1cl+UHXmGBIwaV0GJP1HNbPMkCJZyflE0cDc+lNLqdDGtBkwE3iFBjtVBFJ4
	K5JQMyZEZF8aldZuecOMwU7IqhCtHj9ibIXjp4Rb4dZxd3Qh5qoicmoVJb4qYPOKV8fWGZzI69d
	tMq+kbGOFhZYUd7N2GAa0jcS1xbMStOQpdTTA/Pr5O0TIjColZJ7Vf5v2Fl6Z3bJXuWSYjETh0N
	CqcTKDOpqaJT78idaiuIyFbB5LHZ9ssyPkn/0ACYndnzMVyksgLCcP/xAkEgRBA1Cb6FqQDCYlv
	Y6DxreMxhPd84CsH7cZSWQVVznCA959bH0q5N+xQbvq7Msh7RWAqhyFgQEx7cLtruUHl5jVHTWU
	xnPM4x3cQ7hkXV3Q2FCX2vIf3I4LWF5MIdoJhw5AJ6OoCgIXxBlYlSVDMd4Hc1khTGqpXGSOBNm
	XOBBJotSMQovjeYzJyD33pbI6R8sUokcz7RTxuYK0NFjs1sZru+XU2zAAUQ79gsRthPBPXlPoMO
	hbK1M7LRrLHrFKnZNq8USDfHcm+KdNhPoF35xGFJsh98WuqOMw2WfD2YzgfuKQqatNbxDFEVLhx
	InMXkn/pjRLiWYuqW7nL0AMrL3hF8Jqrb+wRNLBVXn3VJUde8jvt28g==
X-Received: by 2002:a5d:6191:0:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e5d288b60mr9286622f8f.7.1793278601242;
        Thu, 29 Oct 2026 05:56:41 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm36160335f8f.28.2026.10.29.05.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:56:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 2/4] python3-opentelemetry-sdk: Add recipe
Date: Thu, 29 Oct 2026 14:56:35 +0200
Message-ID: <20261029125637.811856-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029125637.811856-1-leon.anavi@konsulko.com>
References: <20261029125637.811856-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 12:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131661
Content-Type: text/plain; charset="utf-8"

Add recipe for OpenTelemetry Python SDK, release 1.45.1:

- Fix thread leak bug in resource initialization logic for long
  running resource detectors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-opentelemetry-sdk_1.45.1.bb           | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb
new file mode 100644
index 0000000000..3f7bdd725b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "OpenTelemetry Python SDK"
+DESCRIPTION = "Python SDK for OpenTelemetry, an open source \
+observability framework for cloud native software."
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "63d24a6ca645019a631e6a51999c73e93adcac1196ca640b8ae78a7cc4762bf3"
+
+inherit pypi python_hatchling
-- 
2.47.3

