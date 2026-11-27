Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11775.1795762880890560398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cU75F1B4;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b59dfe466bso47723c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762880; x=1796367680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iVMchW6ZT+Q1rUNX4OlSuOTInVQhsS4occemrqbx+U=;
        b=cU75F1B4S83gO3miDfremnRWlxu0AZ2IefgYPT4JDtPcCErEmrkiPzX2l/SilLYcQ7
         S+LEu6khC2mAkS6sffzg5A4CqkpaoLazjaF680YTm4Z349f056AsQXGqz5Wq2r38oryx
         P3Gt/nxnhEL3yjXXYYm5NOC7VjMYN7pCkgyxKOPKxiiOlhtn1HeTyv/2kQUtUj2gbio2
         70TMX6tCnMYzymA60KTw95HMQpwcN6ZDl21XRGwvV8A4Q6OMArp4lMm61n6WUvbcvzRA
         ddQvPcZ49rjDLOSjQkH3ejdCsZagMsTlK3x4SIuVe70sbxHnEZOKRq1VeUxV2UXzIX65
         Kxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762880; x=1796367680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iVMchW6ZT+Q1rUNX4OlSuOTInVQhsS4occemrqbx+U=;
        b=pOSPcUL0FZcIpB+M9+WY+55wHDxF4qeZ3jw6cJIt+oa5rXNP90ebLbDiMNLNoACYsh
         fcOpYn53vPim53rYxRu109gWYNfhkac/8xEWAIMiqizbiggaklVNLSmi4P9tb+1ivn+N
         Eo7UrLer0WxMJ9UW/tri/q+mS5q6ieLNsAIDCTtBw7b9wPil/sNU/5LCCPnD5BHYOszB
         Hh3ooa+2YYiZOMLHIxH5wYjYrUBdx/mqH8C/kwe0gRdUvzP8/u2E7WiWyY+yWJzyjxQi
         SqfVLE1u3vfOQAYSRDhPVrKV4SivUSAKNbcJ18eNm9qvvRBQAVJNguxP81eb6gzxnLcf
         Qg2Q==
X-Gm-Message-State: APuU4Z9Vyn0LT00Tnpm9yxbzXpE0hkj0NTA5bbNiPg2rDWsPImTgc78a
	xQYsuIx0VOAiZp9r+j4qM8ZVLBOZcANPZdMt+bCOoc2O+jSNlHk5HMBJtR/y80O4
X-Gm-Gg: AZFdTZeFFQE/zO4QDa76CodlTUEp8iEyj/+05GeTRsqP7DBHUYyzXnMCsRIHT9Uoch7
	jJVAAxBvsos16g3tusN1wmCD8z0welHozWM0SJFvmSxGlATubsJVeIIAQ7NPCpr2QlZ5n3vhV3Y
	Exn4hNEzFePs4P+zex0J3/AMeagmHRrSctkXzLc9B2TchgKj5L0OCFSTIqOXGMFq3A/dI5q2DHc
	ff49xOKtGEBUxy9NLhNYawOuVmkp+Wl7TvisqWia4Lv1ZXomLdn8a0c7FN3+oCVTZd3X1sp1VEd
	IxS2eyJlNzoIgRcxVZLz+BI4JD/KmViyUTddEBfFCpxwPsJ//Kbvvvf4lQKRgH3W0RrvrzIIYUh
	bw2TyLkonPxbWhJRCC3Kmsccl70IkfsmLL3/Ol9ZiQbF/xOaQnp+r7qlrLJveFwRXZYeeyvUh9u
	HJDPANfE+NqVCwLVepN8BtddJkaijsUELoNDYipzYi5PzZ75wF3+F9SXjMBuqV1TdLHAznqfL1s
	9NXZZqB0LN1J0IbBNCMFCDwcjhBvAAjBxjh3uMQHef993FT3QXpPUiZT2GWBvzmLdyKk4cyB1xz
	w/gAzsSQlK052DNbN6jB1ecD5UEBh0/4xdrNjNB8NtP+grvepXvitHFw0xzkINNeOw34DU0hG2D
	SlGr34uZUl52de3uAAsbvELdT6JzSozw9rbOvLScGVYf9SBnoWmFzhw+0N7MRu4mQKUrYaVPmYS
	MPukuK7FvXkBvBLJXC9MpR16EQreep+C8Od5+0PEFyooS13Nm/OFiIyZx0tti3n+GddFVsdaWhd
	AXPUIseBFl7ynSSXTht6f6jKepuK9zD32OcVjOmmeC9qfc/MWbqglgS79GnjeNhr0/8XdW3pklE
	N17V
X-Received: by 2002:a05:7022:b886:b0:19c:c396:37aa with SMTP id a92af1059eb24-1b5568e1d36mr21509205c88.22.1795762880135;
        Thu, 26 Nov 2026 23:01:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 04/14] vo-aacenc: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:02 -0800
Message-ID: <20261127070112.2273685-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133309
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Check the vo-aacenc folder of the opencore-amr SourceForge
file listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb
index ce3736294a..1ed60bbb2e 100644
--- a/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb
@@ -10,4 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
 SRC_URI[md5sum] = "b574da1d92d75fc40b0b75aa16f24ac4"
 SRC_URI[sha256sum] = "e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/opencore-amr/files/vo-aacenc/"
+UPSTREAM_CHECK_REGEX = "vo-aacenc-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit autotools
