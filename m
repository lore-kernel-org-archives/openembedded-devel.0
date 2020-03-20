Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 124DC61ADC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 14:45:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t16so2564048plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fXVhqkf2wUM+4WLu/fk0PIK10wpxVIvqNtyDIEiCAFI=;
	b=tRHBAh5JsQ4ncliYFN1zLH+kH/X5TgjQwaaVWYYqYiX4fEq1d9rVMWrDql/SplBPoq
	LihIZUwwbjRPhOlII7YhLE/zsyq+b1W1IY9y+qQdyTxW2kwwCa32MdHup69T/74IL6/0
	+B63qtmgwOmqceuXMeEblzCa3Fel8cDTQwjRp60KmOpqkCsGgdNAdoU2N7AqcbzDgR4U
	MFwhaeu+2dCBJBPl9JW/U6I6GbQ3sKfAwVWQsXIux5p1yJSg1rVzgxeMSSDpSUQFmjmV
	IlAFkYTMoLL3BuoOjpjGylbnfwD5XMfx5LKf6geXmlmsdHO1vCoEj9GWQgPiEFtU6vLN
	PuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fXVhqkf2wUM+4WLu/fk0PIK10wpxVIvqNtyDIEiCAFI=;
	b=Rxq3LhNKmdnI1t8u6edkKd4EHSmoPKnbILVtrMvzs8KxhNyYm4PCwD3ODgQXzrJEcg
	bWkbuHFGMi8YVYe3c5RtkM2XiAIURpOmlSnkvxjGDeDAGMKCaWrybzow6wF8xxF/Bguh
	OjFYE0K7GpAn15YEejk6Jjvyo5Ue4LEuNjzeFRHotBnB2Y+lLQoaiU3NEqZ/O0DHXD/p
	CBLdekNujGcURgbXrmFLBx7a42ECg6i1wyCpH8z1SkWvhHBJSmj3hgM3TggNUTztCt7B
	z3sWRXuaNsB1DbZQYknsGnHyj3SptasZ8yO7jq4uUPaY8xl59kyCk4QzQTLYV7UqFmh0
	jVLQ==
X-Gm-Message-State: ANhLgQ362EdQuTI/MNWnEsUhFapdG2TJTMNvZdmYrGZ2PSO+ajTo8Xwz
	JA++k2+l7vecJGU+koIuJ1TD56twW1A=
X-Google-Smtp-Source: ADFU+vug7BMJbqyCc6yXWNHmMT0hoZR4quRZKLvKERToq6eWcv3wCe/fcZGYWgY2L4hykhABbl91BQ==
X-Received: by 2002:a17:90a:8806:: with SMTP id
	s6mr10027254pjn.141.1584715541463; 
	Fri, 20 Mar 2020 07:45:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::81bf])
	by smtp.gmail.com with ESMTPSA id
	k24sm5872176pgm.61.2020.03.20.07.45.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Mar 2020 07:45:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2020 07:45:51 -0700
Message-Id: <20200320144553.2587659-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] node: Enable cross-compiling options and disable dtrace and etw
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
X-List-Received-Date: Fri, 20 Mar 2020 14:45:41 -0000
Content-Transfer-Encoding: 8bit

dtrace and etw are hardly used for embedded usecase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index a482c6b4ca..28b4136a5a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -99,7 +99,9 @@ do_configure () {
     export LD="${CXX}"
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-    python3 configure.py --prefix=${prefix} --without-snapshot --shared-openssl \
+    python3 configure.py --prefix=${prefix} --cross-compiling --without-snapshot --shared-openssl \
+               --without-dtrace \
+               --without-etw \
                --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                --libdir=${D}${libdir} \
-- 
2.25.2


