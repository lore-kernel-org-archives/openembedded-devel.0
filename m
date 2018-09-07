Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id DC8D8797B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 10:46:37 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j19-v6so11896746ljc.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=167sTuF2NUf0limAz2kP2ULQoAQPkY3ozJGW1RW+kPA=;
	b=JLNUuiq4imvNh6DEEipi4SfXCSGyPhqx3XZ2BMp69PxEh+CQHG6BjexvhTcQKRyhyX
	fUN8V5t3sF4Hznbx1WOilWU8LiLt0+tGaMyp6BaUQXKr2475TRxuGFJal54uiztnIgqF
	9UmE0q4VWNgqfP2tTj4yU45b/8ApQpqVrnaB0823S4K+hRucZKog72/sJv/tq/XV2tHt
	aUVfsInIAR94Uk1jpBG7zBgwPY0GmsFQNsfkWGfszCibbcF3MvE1qLLEfIGYZBz0IGH6
	M5BgRCkRavw/igB7LRkO37MD78wybExHsWFiNZHSCEUNsvAKHO+90NoBVYls5AA/Uypq
	mQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=167sTuF2NUf0limAz2kP2ULQoAQPkY3ozJGW1RW+kPA=;
	b=Xv1YeKiLj97ecAMnTpyELA53HTJgohnH12opxLMTNWg71uDvBRzEW7rq5YQW10CeQ5
	xV8M2NycjG5lRL7HqXcxPXj6dzAzNmeYQRCPjM7yBuEjPgGOeSAUNU7TrFPPTiVYKOnL
	V3kxP5iV3tU5aOuqQUOu4lCiNChDpAaMo/eKnYyVU/a+6DlSBXyrN3k6+joYqvQsVct4
	7RDzXmrK/zWTWlpVY2j1M+ZFNUVszyQb4n4Hadu+Iy5SLtt45wknCRfpDzCQD1+Njox/
	RNGX3JHSGFXsl+FFAAeQ5yQxdFUHiqr5+8hrH+7f9Dv1rdGmHoOqxPlWiL6T/7ws4XLS
	0peA==
X-Gm-Message-State: APzg51ANeRhKuC2yiQ7Ot9y2T1D8ZvQZUbswsV3KWpyJI1al9KSw1lme
	762M18VI8SGJnPdOv2Mq2LsVX3Y6HRI=
X-Google-Smtp-Source: ANB0VdY7x13N40EyF6OfYQCYBYE94+Onu+wde19c2jUhDbZaM+7wKlXxdyKTI9o1hE/q7ddoSK6Q9Q==
X-Received: by 2002:a2e:8743:: with SMTP id
	q3-v6mr4539805ljj.139.1536317198213; 
	Fri, 07 Sep 2018 03:46:38 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	l141-v6sm1245115lfg.55.2018.09.07.03.46.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 03:46:37 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 13:44:31 +0300
Message-Id: <1536317071-17077-1-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-java][PATCH] openjdk-8, openjre-8: Fix PROVIDES assignment
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
X-List-Received-Date: Fri, 07 Sep 2018 10:46:38 -0000

PROVIDES is a recipe-specific variable, not package-specific like RPROVIDES.
This bug would prevent you from having recipes DEPEND on java2-runtime
or java2-vm (assuming you have set PREFERRED_PROVIDER correctly).

Change-Id: I602d98241d2a6f42a13a1fa1edad049d4e8792b0
Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
---
 recipes-core/openjdk/openjdk-8_172b11.bb | 4 ++--
 recipes-core/openjdk/openjre-8_172b11.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_172b11.bb
index c1c6e1e..22d0113 100644
--- a/recipes-core/openjdk/openjdk-8_172b11.bb
+++ b/recipes-core/openjdk/openjdk-8_172b11.bb
@@ -47,10 +47,10 @@ FILES_${PN}-doc_append = "\
 
 FILES_${PN}-source = " ${JDK_HOME}/src.zip "
 
+PROVIDES = "java2-vm"
+PROVIDES = "java2-runtime"
 RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_172b11.bb
index dd29691..d8d4ba8 100644
--- a/recipes-core/openjdk/openjre-8_172b11.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -35,10 +35,10 @@ FILES_${PN}-doc_append = "\
     ${JRE_HOME}/THIRD_PARTY_README \
 "
 
+PROVIDES = "java2-vm"
+PROVIDES = "java2-runtime"
 RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
 RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
 
 inherit update-alternatives
 
-- 
2.7.4


