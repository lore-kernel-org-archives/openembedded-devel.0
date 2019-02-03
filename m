Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8441060721
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 12:05:33 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id n23so2933233lfl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bsLzdUDHszIbZ1nDFxjENm1sw906JWRXkMEoQT603lI=;
	b=dDZszHWApiMBOP/ux5Xy104deJx3NUSHq3FO9zWL5AVt3mwJLvBG07uRA3X9Ndzchz
	tKFhiCDUhDzSzWTQevROoNHBH+ocZZbg2sHLtZqH1z1VqejYdp/uvlOMHEVjlltKUgKa
	gt6o1KbgP2LXnfwiDyxkmQFCOz8dDq+NpWgtGKAq9nRc5RaLDCp+SC+aqrTXRR/6FJJz
	UFxLHhTGY3GL/I9Yw57LROxLxUNbj+FAS6DuXMQiHcD0Mjgole0QXnDZLf60HIb98SU6
	ZxlTYW1abhyh8PBHev2FRivJ4xggSgBSUQ2FsdT1KYtLK2yGgcwf7n8NXvkEW8r75Hq7
	uaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bsLzdUDHszIbZ1nDFxjENm1sw906JWRXkMEoQT603lI=;
	b=o1DD+fpAgqjWU0JzxdEeZOnXJMJDwBK+3w9OBz+vdQvxcquK2j7BmaP/wkPLC70sKU
	OCXRTqYMWj2zMDHWkTzQnvAaYUd6CIAn4Nt3alIbNzUJFZebk8lX/e3ev1lpZrVSgDDP
	z9zZWz6RVHCRViCOgYyx5/sQdVOn/BcjHBDbizpvLx+QtGuHQwS86yay2xmJbLFZtojk
	z3F1gN9pKdihWAeup9P1VDAtDHAaQE0eYqzePEF8v6K69+5hO2rrYAFeN5RKpS2R2NY6
	FFJaD1KoPqD1WjF9D19pHDaBtG6WaboZpTc2sg1iG+8b3vrlWcqI0jeNX/CyHGNVpZYv
	lRgg==
X-Gm-Message-State: AJcUukdKTdsPL82HnjIPq1RB01w5D2UqJePnFT4rkwgxsMmsrVR38YpH
	0AL5R4kkp1KVtwGzZg2v8dIuTbbh
X-Google-Smtp-Source: ALg8bN6UnX0dFFllKUDOIGLiJojrJOKU7QlbNy/ew9VLOQQDfATfC/NFkJtnmUaGlkPyg81u2GKBBw==
X-Received: by 2002:a19:a28e:: with SMTP id l136mr36361028lfe.87.1549195533662;
	Sun, 03 Feb 2019 04:05:33 -0800 (PST)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	j18-v6sm2213238ljc.52.2019.02.03.04.05.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Feb 2019 04:05:32 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 13:05:23 +0100
Message-Id: <1549195523-5426-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: patrickvacek@gmail.com, luka.pivk@toradex.com, stefan.agner@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] lshw: BBCLASSEXTEND to native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Feb 2019 12:05:33 -0000

From: Ming Liu <liu.ming50@gmail.com>

In case some recipes might need it, for instance, the aktualizr-native
of meta-updater.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-devtools/lshw/lshw_02.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
index b344fbf..d1a7334 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
@@ -30,3 +30,5 @@ do_compile() {
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


