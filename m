Return-Path: <liu.ming50@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 486D277FC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:47:56 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id 5so95260ybp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Jan 2018 17:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vNIX0b8UzBXSu2MWmWQ9p92Afg8tfv/JGi845eEbUSw=;
	b=Bl9hhH02CUHok5cJtHpnpkmOQJYr3rWF+yuEd2KrIXjkXxMUrLq//4iSwlS3oqVSS6
	VBIvsEzP3gUUhmIsBT3IyCETyYCjJtbOmFEKOJkn2M1tvTfkAYmnpdtozGMHfmvqK9dT
	hOcjBbBgYD/kFIB8Ne0qO7A8gKjToZ8k7LAARai+ZRlwRUv6CdbEpAkpyo89ZLb008Rr
	Eh+qVCQ2qwWjOAmZlMRCKz/eBRsHk6rYDtln5q5JL2qktPTMbO9Y9hbDCmIHIKPw9mB1
	FMoTBVQvVpKOCbUSFmOp2iLlrKZG7kI3XCWU7u7xJjkL622Pwj+yHrxV/KplrKRMRcfA
	DW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vNIX0b8UzBXSu2MWmWQ9p92Afg8tfv/JGi845eEbUSw=;
	b=gYqCNi7ftQKLMustTuLn4nT/l0x6KvhGk4yzd7EfYuNohxAn7TQuq5T1qQs6sOOC6f
	FNOa5znhmJ6E8ed/LV/cehwsxd8xf2T6qa1SU5n86VXNMBtK9JMxCYyZqn7LBZHYNh2A
	LQ0+6LgpEH7U8ghQRAtefyKLeywUXV9MbrusaeDEB3VeJBzIqfFMFlQtNj7ld54sDMJL
	UW6igMpqrq8dLD+YmlAflMqto8lm/gKi4KVA6qTS9KyJB10/YqnZ7ZaIshM2Bl4xbQN+
	G4Ei7cD+SaVAa6QbpHoQnIhKeb3iUGIBCSpqw/VygQMrQEuz4lcQ5usZ/WiIpmx1r2dx
	n8Cw==
X-Gm-Message-State: AKGB3mJyydgwf5J+SEWx7Vf0C5qX5jpIatlEmQVL8rR1Yk12EcszMVm9
	4TEl2d4Vgd0o8DdJIwCrNQR95UdX
X-Google-Smtp-Source: ACJfBotMVAmIxQeW0Dax2rt6kDDFRkw+TZBTqiMpMIOix+LQU71r6LINStSxMFhx7hq2JGOyZ9tPKQ==
X-Received: by 10.37.38.19 with SMTP id m19mr36178508ybm.45.1514944077404;
	Tue, 02 Jan 2018 17:47:57 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([45.77.34.21]) by smtp.gmail.com with ESMTPSA id
	h133sm20457657ywb.52.2018.01.02.17.47.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jan 2018 17:47:56 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 02:47:26 +0100
Message-Id: <1514944050-12039-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
References: <1514944050-12039-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-java][PATCH 3/7] commons-cli: extend native bbclass
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
X-List-Received-Date: Wed, 03 Jan 2018 01:47:56 -0000

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-core/jakarta-commons/commons-cli_1.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/jakarta-commons/commons-cli_1.1.bb b/recipes-core/jakarta-commons/commons-cli_1.1.bb
index 52dc0ce..68ba187 100644
--- a/recipes-core/jakarta-commons/commons-cli_1.1.bb
+++ b/recipes-core/jakarta-commons/commons-cli_1.1.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "Java argument parsing helper classes"
 
 SRC_URI = "http://archive.apache.org/dist/commons/cli/source/${BP}-src.tar.gz"
 
-
-
 SRC_URI[md5sum] = "ccc1aa194132e2387557bbb7f65391f4"
 SRC_URI[sha256sum] = "929eb140c136673e7f5029cd206c81b3c1f5e66bba0dfdcd021b9dd5596356d2"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


