Return-Path: <fahad.usman@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 872FF77058
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:37:47 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id z8so687708ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=yWPLuQCP+xJ6xiYHcxrlUNX/FT53ABCLymV/RTNc1qQ=;
	b=SwSHmbka/rlipHxe8uehSw/Xz5Tp6OcFijNPJzaCHLrfDdeLxLRUU5mVoKEEDPQRyq
	CEaSRMerA9nHZp3Oq9fjyXpXA9y+FjI/nuvsqrdgeH6OnEU0Rt0hetTETb+tOW4nhPu+
	Jm9+Hj+ez+xoG5VSlFK6b6hj5CBBh8IM4MW3qZKuUTdU/LZkaekYa0X3QwQvXorFeXyr
	fVoNFFPwCxoI80ogZsrBCeIzi8odEialaCfJqglqM9/cnHHQbB5QvBykO8aqcPICLIGo
	+TP79oTQ4vid6xBbF5M5LcLxkfHCsL2/wcJ0P7uPwYLQwYWc5zxc+1RxKTw6lRvfLnBX
	CjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=yWPLuQCP+xJ6xiYHcxrlUNX/FT53ABCLymV/RTNc1qQ=;
	b=F2MOJXrGoX/0oUJjBFqbIMsoKQ67QlLwY1e6R3PGaoQG5N2D+xNC5itAU2kt7HP7zf
	ODcuJlbewd3LC05MZ1XzLcf7uZ66ipo1o5ElS9gN4vY52hUHF4i1Cjdm9VnJ03hVS2Eh
	Zutzi7OLJj//CaXpu/7xohqp4VUgq5q0danv2uOJJQ1UD4WJor4x/QzLpRJWzbu36rpI
	43pT1MHrT+oNqJeNBgolbD2v2iZo4Yn+OfqSf3kgG1Kfv8C96vlAyvgGyJO09gTduBhw
	o+h+C4uaAtFKeYgCgTzkDpVLu+C7Wd6A1qe3HstfH8Vle6iZ3/CpSFNKg9WGIX/Cs4km
	3OKQ==
X-Gm-Message-State: AEkoouv61hGtad50ptskE+IAhc8tiQM1uayt0EIM9jPfppgHTVTNYxbgo11F+ObkYY/7lQ==
X-Received: by 10.129.112.148 with SMTP id l142mr5264571ywc.222.1471603068455; 
	Fri, 19 Aug 2016 03:37:48 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	t67sm1337625ywa.33.2016.08.19.03.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Aug 2016 03:37:46 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Aug 2016 15:36:38 +0500
Message-Id: <1471602998-44867-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH v2] testfloat: Fix No GNU_HASH in the elf binary warnings
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
X-List-Received-Date: Fri, 19 Aug 2016 10:37:49 -0000

These warnings are observed when testfloat is cross-compiled with certain
external toolchains.

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch b/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
index cc124b3..71ca343 100644
--- a/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
+++ b/meta-oe/recipes-extended/testfloat/files/0002-Makefile-for-cross-compile-TestFloat.patch
@@ -79,7 +79,7 @@ index 0000000..a89326a
 +  ${CC} -c -Werror-implicit-function-declaration $(TESTFLOAT_OPTS) \
 +    $(C_INCLUDES) -O3 -o $@
 +MAKELIB = ${AR} crs $@
-+LINK = ${CC} -o $@
++LINK = ${CC} -o $@ ${LDFLAGS}
 +OTHER_LIBS = -lm
 +
 +OBJ = .o
-- 
2.8.1


