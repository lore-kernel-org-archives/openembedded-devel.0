Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA18478925
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jan 2018 16:51:50 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j3so5108455pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jan 2018 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=4lHwAt/bU2K5/5m5nff9UKhIyaENBCQ0zMC3QNt0IWs=;
	b=E2LPZ736YAICyBrC3x2BUVoCTYN5QCIF+5TU74kj7h9aj4WdmUGRJULN0qyx3ZgEZS
	n3QPVJI6z+vnulFwv8S7xtkTfUCrr4g85B+oy++KWyijS3OMoGf0cNWYHgTES3qDe71j
	tOTBkYmoOtz4V6JLiNZBH0lsJwFQn7eY1paHXqz2FX2urUnf2m1Ngl39rQtWJwuV4sD+
	Zt2ryu+wuHNcdH5FvAALBkTlmw+xqOyzgLXD8JdkRYrvaC/EPS+bg2h1jGukMU/Q9um2
	7BPO2EPvu1KdU/fdEgv741+GPoSYL6M+wuTknTVwsStfO6hZjL4dn8cQCrDheETOYQFi
	kRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4lHwAt/bU2K5/5m5nff9UKhIyaENBCQ0zMC3QNt0IWs=;
	b=L4xqHDJCdwr5f2hf9tA1mm+i5fqLzQ2eIs3kWaN1Com2Qr2Uajc3MbOZ56OrRsYUkg
	5Y+5kEadAjMEEKfiBBBGzXvZLUsuTRkUc2l4dDsI77EnxiVaDzJukbmetfLEJgqPZXLd
	8aFHEsRWsATMkDqFugL5XuKv4xYp35JxZqBYt31H4BOnzX5B19O+qVyyvvL8gjUjVG7r
	A0EzaCQONErocyfYpVE33LkPEQm5g1H7inwVn2aKgm6MZ0j5T71kseNSjnozxYB0Ajra
	5q6Wh2Au5yjhbJOpRoAVg3KQfqcMbnzW4wkzr+EsS7JCK3RA4Z49qafvaQf24xmEPsBl
	y3zQ==
X-Gm-Message-State: AKGB3mIh2lmkSRJaSTeBep97KhPoY6CLJVdIy6JjuDZz+sOVQcLizNXV
	9LL5NlJfiQoDdjSCDQwOIxk=
X-Google-Smtp-Source: ACJfBosBLPTAY3RWNVBQRnCTeXg1oFCArHzDu9Hvsm4XS6Ub4anzMbL0ITvUPl+P1si8J+pkA0aGRQ==
X-Received: by 10.99.125.74 with SMTP id m10mr12756474pgn.223.1515516712217;
	Tue, 09 Jan 2018 08:51:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:553c:1986:3dd2:36a8])
	by smtp.gmail.com with ESMTPSA id
	d81sm35168813pfj.163.2018.01.09.08.51.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jan 2018 08:51:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jan 2018 08:51:49 -0800
Message-Id: <1515516710-23797-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] luajit: exclude for aarch64. not support in this version
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
X-List-Received-Date: Tue, 09 Jan 2018 16:51:50 -0000

make[1]: Entering directory '/home/jenkins/oe/world/shr-core/tmpfs/work/aarch64-oe-linux/luajit/2.0.5-r0/LuaJIT-2.0.5/src'
| lj_arch.h:55:2: error: #error "No support for this architecture (yet)"
|  #error "No support for this architecture (yet)"
|   ^~~~~
| lj_arch.h:294:2: error: #error "No target architecture defined"
|  #error "No target architecture defined"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index 73c3811..0ae3e1f 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -90,3 +90,5 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
+# Aarch64 is not supported in this release 
+COMPATIBLE_HOST = "^(?!aarch64).*"
-- 
2.7.4


