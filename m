Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4E47689C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 20:09:29 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so7883725qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=S0dCmlt5l+immEe87DBPmPIHHuNG+BTKTjjFhoiWHn8=;
	b=mQwRHLbJkM9gpNKj+dK4ivKYa0rikzsPV0Xjlh4/Hj8kmxj7xycMwbfyD1SnoHDly+
	diu38G/tBeGwWKXqoXU6Vkvp/lnrN+pWX1WllFO24LkfAH0EkVhm0O6niE0GPgwPnSs0
	cbd9vr0S3SJXT561beh41jZzQAOMFL3Pp5OxUdcmVaRnmitl8Q9eLJXWtPpDjoIv7ekE
	5ryZr4dML+Wix1Wy9joC1KPAbZUQgJWkzWe1AzOm+I51ihKFkSVg7Sbfy7ZBlRJqTCka
	U1hl5sBxegcrJ2bPkCGkDjzDLGQlmd23OD8NMs1mzpBGqUEe4Kf4yrp1JBq7wS0bMcgw
	Sz6g==
X-Received: by 10.140.100.181 with SMTP id s50mr16278936qge.71.1439928569645; 
	Tue, 18 Aug 2015 13:09:29 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.148])
	by smtp.gmail.com with ESMTPSA id
	f106sm10753656qgd.30.2015.08.18.13.09.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 13:09:29 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2015 17:14:31 -0300
Message-Id: <1439928871-17797-3-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 3/3] rxtx: drop dependency on fastjar-native; depend on virtual/javac-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 20:09:34 -0000

fastjar-native must be provided by either virtual/javac-native itself
or by a recipe virtual/javac-native depends on.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index b9b3027..564df32 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Full Java CommAPI implementation"
-DEPENDS = "fastjar-native"
+DEPENDS = "virtual/javac-native"
 LICENSE = "RXTXv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32303a23463f90b12a7d1dafb8deabf4"
 PR = "r2"
-- 
2.1.4


