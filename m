Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C3C3E60267
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 07:55:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id s14so1260323wrt.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 00:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2JCoeRxen3kXgFS6D79vlIYLKp6q6f6N2L/YqEfHv7s=;
	b=gYkWIPS1VahV2NZEP8zWfFGTp2nW0CIWFhrWSVPcwkPWSgH0oXc+tkyQyoc/sBr6Gs
	eHD4HiDdDOA2MtRWvgVAcLBjeuAVz12Q315DG2tJqLZW9Xq95wyHqPrm0h6HYvEYR8m/
	kjsb34bX3g3uNNXDTdJikSeJVnRCQAfgot1JMSX/cw01g8fMPAt32Z7vrA5iBysTuR26
	Eu70JC1X4ayvufYI05YI8b9RxED4nhn4Ud4YEf/oGm7CFnA/DrfhvqL4m1jiucBSq/yl
	cx24CoRTWKnxHWFlAGK+xHbJTK+w6fKm+BPE4M+e/MJSYQEtl/HGwmNQLJ9n6KapREdP
	wFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2JCoeRxen3kXgFS6D79vlIYLKp6q6f6N2L/YqEfHv7s=;
	b=Dbo9RETElBc/L+Oevp72D/TZhAB/NEzqlkHZ9m8NPS2QsxgcJhpzEEuZQy763mc9L1
	8PK/R4iBLS0E9SB2rLDtvd4wFZTJv728TGn3Y5QF/Cojo4fTeaC4tMS08xOk6NDu5UEP
	LYmEREQ5fF2+todsEc77GBGP+EL7UBhhLXmha7UtN+OhCJQ+k1oT278T8S+KER2Ya7Uk
	aM+aLKBXKPlE+222HRWL5mO8Y8KSuQ00krt/U7mhNFBvu8ck7Jwv+kxrE8HOWvwncghL
	p6ikIpXMNlth1/i5eJnvrL0oXpOSyrZf/5deXXx0rpvZyWH0VaA6QO+EazphTAekc/fN
	nrRw==
X-Gm-Message-State: ANhLgQ2F2y29aM1tyBVETmHYtSQ2AQTDg3zNrmDQQNSNaoY72Y3LEwPe
	LvP0m/wrVCbtLQbDUEm0JlGCI6J94EIaqg==
X-Google-Smtp-Source: ADFU+vuGEeZrpt1ki3VkH8lizSOEQEmH8nYh3YWBl77J7pUykvRSF8V4kSoR+GJ+yfZLAZWvFlRrOA==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr2785400wrs.119.1583913326008; 
	Wed, 11 Mar 2020 00:55:26 -0700 (PDT)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id f3sm7344636wml.24.2020.03.11.00.55.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 00:55:25 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2020 07:55:14 +0000
Message-Id: <20200311075513.9491-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
Subject: [meta-oe][PATCH] smem: matplotlib is an optional depencency
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
X-List-Received-Date: Wed, 11 Mar 2020 07:55:26 -0000
Content-Transfer-Encoding: 8bit

smem doesn't need matplotlib and numpy to run, is an optional dependency only
needed to produce graphs.

This is needed to avoid to include and build matplotlib and numpy by default

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-oe/recipes-support/smem/smem_1.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/recipes-support/smem/smem_1.5.bb
index 90db9c3f3..446325e93 100644
--- a/meta-oe/recipes-support/smem/smem_1.5.bb
+++ b/meta-oe/recipes-support/smem/smem_1.5.bb
@@ -20,6 +20,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/${BPN}-${HG_CHANGESET}"
 
+#PACKAGECONFIG ?= "graph"
+PACKAGECONFIG[graph] = ",,,python3-matplotlib python3-numpy"
+
 do_compile() {
         ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
 }
@@ -34,7 +37,6 @@ do_install() {
 }
 
 RDEPENDS_${PN} = "python3-core python3-compression"
-RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
 
 PACKAGE_BEFORE_PN = "smemcap"
 
-- 
2.20.1


