Return-Path: <mario.goulart@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 98A3674030
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 20:59:49 +0000 (UTC)
Received: by qkx62 with SMTP id 62so15136889qkx.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 13:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=S0dCmlt5l+immEe87DBPmPIHHuNG+BTKTjjFhoiWHn8=;
	b=usXvfOKKH+azP3wIPrxP2mntonuhCVbrvy9NfBjcEbGtwWj0PVT3/lbseyuu7B/Ot+
	YPnjpBjVUmxeYqG0EulJNmh8jmJ8ASgMoKMMCO6RrkUmB3fSPcFxBswX/39p8woZjVYp
	Xo7jXPyYQyEtu6TTmsLUXTbqDEYdkJpSqbx6fk6V5ELhWZpx8gs38KG5pEqQz8BUhaN8
	aNI4aUNLymYaDCLk34luhHBzZ/IH57g2zF2hzRMYCn74GgUXsc3Phyuq0AsYB2h7RCR6
	GQekDyFOJINVsTDcWNJkH+DUUb1r3l9tPU4pDqwI29YCAztXDAOoTu3NuaNkcIBVtAAp
	0IFA==
X-Received: by 10.140.23.35 with SMTP id 32mr22535099qgo.106.1431464390798;
	Tue, 12 May 2015 13:59:50 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id
	s91sm14195551qge.44.2015.05.12.13.59.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 May 2015 13:59:50 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2015 18:01:08 -0300
Message-Id: <1431464468-20750-3-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431464468-20750-1-git-send-email-mario@ossystems.com.br>
References: <1431464468-20750-1-git-send-email-mario@ossystems.com.br>
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
X-List-Received-Date: Tue, 12 May 2015 20:59:49 -0000

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


