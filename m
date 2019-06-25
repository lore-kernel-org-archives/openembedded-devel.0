Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 121847DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id s49so25769823edb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=M7RI4oRVjae1+0Fc2H5zjwpdbT7thInQWE73i0JWHms=;
	b=ptTuNpMGQZwOEzTunFmH6nSzsPGLs2USeUMl2waAN5XI74txnDscna6zwED1FXQQ7a
	LCnlIRca1OH+QMsxEz79lRWKZ2fBRPcACJlui8fA+T7NWNsgrIg+IUm6By3mB8N9CfJx
	v6EPwGMPIB+8jcfjLV0FlyYH7MSh7xDXT7xXUu+kHWWT8y98s+DIAq/oshpKZqYSOb3m
	mSmLGhQ44LpEg/uMYYEXscUY6k7Fvwz08nIlj9EMUo99VsfGjoKQq0kTiYIq1zUf4Y2z
	VO7Zua0KdgKfJmkMOHn9yWFakh8j94jZeYcmB4ZFn3VUS6RTu35hiqRuetXwwDAZBFaN
	+AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=M7RI4oRVjae1+0Fc2H5zjwpdbT7thInQWE73i0JWHms=;
	b=GGX8f4Mq+xKOHIYJzD7+TN0V4GC6SGZJWPcJMVj678EXAvxGD4PVOXZJwH5AIMqaVd
	kf49zcrJamOmqjUXRG0JEKKF+FcoQC9qFD9cDJN+YqLczu2aNH3gJRi1EAI3eUMLMmtw
	HhtKnncUCP8lZHhU7j9cBkg3CmWxqbQgOtv6fT4qOjiGVG1CdcEf+arCrfWYD0qBFcuD
	NPTEDmG1AyiXkLIBlaqNl3bhcCd6Di+F4IRD1GO0ym8szWRELBjT9dDwjujR86HtomcT
	ITfYYU1ZvIZVM+ynegMVWsr4k2O9TuX/6IPakJsFCtarGkhFJOKBH/WT3XF7bQcfOMHP
	mgBQ==
X-Gm-Message-State: APjAAAVBk+dSOE5PTK1TifHdiqpX/fuhWv1JnHYmhphZaeyZtGmnFHlt
	Vy1D0LmLXBpwAZ4n3Pb57zwkh0QCTZU=
X-Google-Smtp-Source: APXvYqxEdlBRxhNnlpa0q8ROb9k7AtMa1nXlUvlRrnHBGslQzkCnuq5idFBlrKtF+iYG2NJSUDz0vw==
X-Received: by 2002:a50:87d0:: with SMTP id 16mr116619851edz.133.1561449158369;
	Tue, 25 Jun 2019 00:52:38 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:37 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:08 +0200
Message-Id: <20190625075223.13585-9-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 08/23] jdon: Fix location of S
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:38 -0000
Content-Transfer-Encoding: 8bit

Otherwise License files cannot be found.

Fixes:
WARNING: jdom-1.1.3-r0 do_populate_lic: Could not copy license file /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/jdom-1.1.3/LICENSE.txt to /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/license-destdir/jdom/LICENSE.txt: [Errno 2] No such file or directory: '/workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/jdom-1.1.3/LICENSE.txt'
ERROR: jdom-1.1.3-r0 do_populate_lic: QA Issue: jdom: LIC_FILES_CHKSUM points to an invalid file: /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/jdom-1.1.3/LICENSE.txt [license-checksum]
ERROR: jdom-1.1.3-r0 do_populate_lic: Fatal QA errors found, failing task.
ERROR: jdom-1.1.3-r0 do_populate_lic:
ERROR: jdom-1.1.3-r0 do_populate_lic: Function failed: populate_lic_qa_checksum
ERROR: Logfile of failure stored in: /workdir/build/tmp/work/all-poky-linux/jdom/1.1.3-r0/temp/log.do_populate_lic.4246
ERROR: Task (/workdir/repo/poky/../meta-java/recipes-core/xml-commons/jdom_1.1.3.bb:do_populate_lic) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/xml-commons/jdom_1.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/xml-commons/jdom_1.1.3.bb b/recipes-core/xml-commons/jdom_1.1.3.bb
index 8997bcc..8073819 100644
--- a/recipes-core/xml-commons/jdom_1.1.3.bb
+++ b/recipes-core/xml-commons/jdom_1.1.3.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "d471718c4ac7a1a2f10715b93cb3fcd2ecbab60384b73ad1c089712e47
 
 inherit java-library
 
+S = "${WORKDIR}/${PN}"
+
 do_compile() {
   mkdir -p build
 
-- 
2.20.1


