Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BEBC3ABC5
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 22:46:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.1810.1746744388672928852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 15:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bV+Ffla1;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso11304025e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746744386; x=1747349186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N87T7A4BBUoKdDRJBAaBct4sPdjCF3EXSwkmPE8WHOo=;
        b=bV+Ffla1GMuzatyZbOBwf2TUiymWbBQeakbW6fx9TKA1jmhwaqXfqMlUGp2Sq3nrqd
         uOnULEHYkl0GvIVyX6YQhnFZSR9JTSImC1rNF2S+tbDGJT17euBNevouNtY2PHVbChxv
         gQYfhzzEG30d0/RdcIodFu9XCgqphuIFA82KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746744386; x=1747349186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N87T7A4BBUoKdDRJBAaBct4sPdjCF3EXSwkmPE8WHOo=;
        b=l7ijCd3fSLVcZCVGA1DYe0ANyEVLUumQGeiPlaKnvRBPK0wPHkbx9ln5RLHtTrjmm6
         X0p7iANO2eVWiEHQ0RjWN7EPIFp1EGFOUOvnSGjHcbKbF2QuiBss6usuZw2EhywtGUpB
         C1Iv3byGETyOKh1cMePj9X6DbFn1ktdMTv6UtUSFbelA9+BBfoPIvKgDeocs1wYCwe9N
         aZvUjpU1YrGnv9dG93ClyGHoFU0ZmBBo8DJYXzyPn8K62MdTnakki9gA0SDlqZKjlfIZ
         w0bxaVsoDB9oqNULNV3pxR31o0LOdHgXasbHOE9rIyqc2Bq0DG1g2xclJTu91si7wHWs
         1T9Q==
X-Gm-Message-State: AOJu0Yya2ThYqVasRhk/H2yLNhUrWTu+L5NJub1CpbbluogYVkY+oMX9
	qxL2g/3XEnIO1ur1ZGQ5uchXalp7XgqgrmfFRyzykY8TtNKiLVaUoDSThAwBFEOHA2RvymdYk5O
	I
X-Gm-Gg: ASbGnctzvIouMtMbg30WjHEB1dK8ffGfBFNbBKG2+hzhMxo9odGvpNCJdn4pomXsFiE
	jH3GZ8q+8BoX0zc2E/FXXDqrb+1OLCyPkRVYk5Zj1enOG0N0+irITpftQxzxABHXn4DzloxfdNy
	M2reeX7+Q/tEc8bGgFvsF/Wqqf5L0OwM7B5BNbR+UXWHrBQ5fKXiNzK4KIHTZJUz8kuElB53GGM
	CTwtAUfyYmYEhrMYa0nqNj5WH8QEhorfMzx22wCWVhxUKkDG+LLlfKf6T/ZaZMI5Z1m6H4QHGr/
	Ll2fC315qkuQvRzIAnX1Uk65qruftxzYM5FM77259RTnHDCPF4FNrqDZ+uyNldhAsN2P/SuMyRX
	fCqqjLOtpAiMSseFN60+Odq2K7Zivw6Jwt4yB5mg/tU3u/II6
X-Google-Smtp-Source: AGHT+IE0PUl4J1+/CETF56VYob8AQmF1hBCAmfATlCN6Dk1sxLVhC1bAu5+fViyvdUqV6pjhSGyVUw==
X-Received: by 2002:a05:6000:4007:b0:3a0:b733:f264 with SMTP id ffacd0b85a97d-3a1f64200f7mr885705f8f.11.1746744386267;
        Thu, 08 May 2025 15:46:26 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0087b736f9b546e683.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:87b7:36f9:b546:e683])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c804sm1260756f8f.95.2025.05.08.15.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 15:46:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-webserver][PATCH] meta-webserver/README: add example git send-email line
Date: Fri,  9 May 2025 00:46:18 +0200
Message-Id: <20250508224618.1002727-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 22:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117372

From: Yoann Congal <yoann.congal@smile.fr>

As the other layers of meta-openembedded, this line makes it easy to
send a patch by copy-pasting and reduce slightly the probability of
error.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-webserver/README.md | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index d1b743887c..17c7c76d94 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -52,6 +52,11 @@ Maintenance
 Send patches / pull requests to openembedded-devel@lists.openembedded.org
 with '[meta-webserver]' in the subject.
 
+When sending single patches, please use something like:
+```
+git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
+```
+
 Layer maintainer: Derek Straka <derek@asterius.io>
 
 

