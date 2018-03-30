Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 431C9746F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:11 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l49so8080040wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JCMWcLIlPfpYujpbBpk2e+G4Rzdpjp/zLksZy/E+4+s=;
	b=apId7OPjrxz0iVnW+4KvNrzTlJ3lJlLA3/rECdnUpjO+pCfihxLfNB1zoWg3oKPC6Y
	JvpXhnzxCSGf4mmRZ2UeSndNwIYa+VJG2/nXHq/DhquaMsucbDSs1f7TTa+q9vd0bSmJ
	+5dmncMRwZ7kufG94yVgc13G3w8fSTit8JWwYgU3/aw3IuffB7KNY3+Olgk4PScnogUv
	i5OAuMrer5a12ImuLW7vDQHc/L0kZQJvEBWSUPh5Xx6LfuSXZ+r9Wf/kjqhBlg9NySdP
	oLObFmNBcafvCjjkJLtHp2nUsPJwRHTlKEB6pgm5VyAzCP7t/iQE58vQqNj/cwIS5FAn
	YGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JCMWcLIlPfpYujpbBpk2e+G4Rzdpjp/zLksZy/E+4+s=;
	b=khHf6xlXl1GFwNh9h+R6nvLud2/GrFqQnbdLcO5bK0G9ONQcOk1oT4e6PNKEwDZLNc
	Yhcd5YNirOA3pOMS+cG+JERHOW9wSdUTX+cFVSWt6rl6vgVMVH6RMSPJade4wjUpd7PA
	1gShqrWEA629iuPoJ4EGMz5ydhApZs38CaN97ZkeMD6Z+xMcd2B+OXpR+YLai0EmjHCw
	C+vNiD2E8hjK/orgvucdBC6W/DC+5ZUXWA5zCqjxqs8U0V+vwzupfEWZBfvVWFliZEOn
	y3ZsHtEnqeMhQTmnh8AH7S5gzZDtFLDuEEFqorrdMQpBfxLPfy5Vw7epipxj4gD7+xKE
	YXaw==
X-Gm-Message-State: AElRT7H8Mh5B7/Z1ywP4Z8Tr5CRhxdSyqylWUwdA6+SBYstCL9hYcbee
	EEONF6HGbt0ai1y2bfTiX3izMQ==
X-Google-Smtp-Source: AIpwx4/WuELGlQ7bXJfbT/48bwQprppM7rMde6DARVg77O+bznFin/MSBATkPsRpY1TNCYRsEp/iSg==
X-Received: by 10.223.150.56 with SMTP id b53mr10247054wra.79.1522416731717;
	Fri, 30 Mar 2018 06:32:11 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:18 +0200
Message-Id: <20180330133151.25882-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/39] krb5: refresh 0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-aclocal-Add-parameter-to-disable-keyutils-detection.patch | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
index f0c310c5e..cbd5d71fd 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
@@ -1,18 +1,19 @@
-From ecb62f3467f493cc0d679323f05367eebbf0fb67 Mon Sep 17 00:00:00 2001
+From a9e4057bfda190ad365b503af058b460ab8c7616 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 1 Oct 2013 22:22:57 +0200
 Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
 ---
  aclocal.m4 | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/aclocal.m4 b/aclocal.m4
-index 210c473..83b1f02 100644
+index d6d1279..80ce604 100644
 --- a/aclocal.m4
 +++ b/aclocal.m4
-@@ -1650,11 +1650,15 @@ fi
+@@ -1679,12 +1679,16 @@ fi
  dnl
  dnl If libkeyutils exists (on Linux) include it and use keyring ccache
  AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
@@ -28,6 +29,4 @@ index 210c473..83b1f02 100644
 +fi
  ])dnl
  dnl
--- 
-1.8.3.2
-
+ dnl If libkeyutils supports persistent keyrings, use them
-- 
2.14.3


