Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE3E77BC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:48:03 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id q26so88131ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RW0In6FdkwtsBXoi4q32+IAPUyHN0t9YNjNdQO661EY=;
	b=E3zLfiQi4uK9K236CtY7mA7sJAfGsy9YGGEIgxGdxcG9t1U9YWUaDf5gETbPbNTds2
	DJYw4azM3Ji9NdSNwMgw9NY8SppD5goWd4dKXAHnOKXY8XxcI1SdR6EdkNzMUhMhwdoH
	yhnalwQV8VMaUk2jtjcWGx6Xxnfmt9dFznwRVdTW3I3gNmrO570F0bWdGEKfp37Ch5rM
	0TBaLokW+4mQdwpfiSFwXpeos/zvF9ngxf6qktQEtx4NkG6Vwsk3tnuT2UA+9J/DsvVJ
	UMtKdocpD5RXzZYtMefE1GUvJrm58xHnqIBWLx27l6WKWGCJoN8YT4hmn7Dt3oj2QHqd
	AcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RW0In6FdkwtsBXoi4q32+IAPUyHN0t9YNjNdQO661EY=;
	b=pMY2QwwGpSSw8GEGevIdWHQ+jjjELgmXMtMgP4yrz4idYWCacGn5WDL5d1wXI/jg00
	sBXoVTzjG34GMfuyaEClgcqbDbl9sOdPlgMIU5IlJFH8hD1ZKC/PJJ6o6/FEK6vMV98d
	ahjCPffnA7+nv3oJrFfBTW/gze0xDui2GUpYizRfgw6rHAxYIR9RiEE5vk1EakWm4X8g
	Ye2GbKIS8+tNISLnuJj91zwI4M/XE5q1x3ZpCO1uzgZ9N9qTIaRlEFx2kRYvIn7CnKPH
	xNFll90MtoSfI2U/HQHs6AOg4YQU42LGGrAnB8G10xHCX/bPiTcj2C6KKuETjMRllBax
	uIXQ==
X-Gm-Message-State: AKGB3mJXe5aCqNPPf90imqegTh2DV2W1Q5hCDwAOakjR6wjwx7ZfjDPA
	uXpxKr/kflY7tAA1RJPCiifOnUeS
X-Google-Smtp-Source: ACJfBoticujoY05pELYJojPjbFL5wzZ1e2vw4o/J/fN8jBcktRPmVLVNNRitrD1R98k/kf5HZkAZZg==
X-Received: by 10.129.39.74 with SMTP id n71mr33712456ywn.22.1514944084564;
	Tue, 02 Jan 2018 17:48:04 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.48.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:48:04 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:28 +0100
Message-Id: <1514944050-12039-6-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 5/7] commons-httpclient: extend native bbclass
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
X-List-Received-Date: Wed, 03 Jan 2018 01:48:03 -0000

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jakarta-commons/commons-httpclient_3.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
index dffa9a0..8daed1b 100644
--- a/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
+++ b/recipes-core/jakarta-commons/commons-httpclient_3.1.bb
@@ -11,9 +11,11 @@ S = "${WORKDIR}/${BP}"
 
 DEPENDS += "commons-logging commons-codec"
 RDEPENDS_${PN} = "libcommons-logging-java libcommons-codec-java"
+RDEPENDS_${PN}_class-native = ""
 
 CP = "commons-logging commons-codec"
 
-
 SRC_URI[md5sum] = "2c9b0f83ed5890af02c0df1c1776f39b"
 SRC_URI[sha256sum] = "f9a496d3418b0e15894fb351652cd4fa5ca434ebfc3ce3bb8da40defd8b097f2"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


