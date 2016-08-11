Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1807721D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:14:55 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u25so189087qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zRzzdFPxeIV1x0nnFt1BLICq+IpIQzC015cXrTzdPsU=;
	b=ZXzmQUmmQ+bKc/oNYEzV6QrSj/nYLTPjODwdid/1A/8iuh1NP1P1JPzQ4AktSCoufU
	/PQPCcJe3cXMgg3fDjgUHBrMrx3EUGGNUTkiPzeBDaDRdY8SSVfZYD7J/9s6UPVKJTmm
	g/YhXTB80TaliVhBPahcL/AB9CGsV0nd1EJ8L3HhlJV30waqqL37Tm/ANnoUOZVSVXce
	ffg4wG0yzv6cX3IyGB0uouxIU+I/Yxl7O3/ljr2Nm9xDbhCnwmuGdtpfAsHw0DDTtpyW
	ixpqVE27tINp98ZwhIFFeriWJZentG5WaNCDbTiASFwbT1oEOl+ZE89IQW9Mu697qF/6
	+M2w==
X-Gm-Message-State: AEkoouto+Ae//bhslD7XBXviB1dznSgvKbeJQjZ/hrjA4aWT/3uT4YBw7i1n0DWzHx6eLA==
X-Received: by 10.200.49.100 with SMTP id h33mr12931307qtb.86.1470942895633;
	Thu, 11 Aug 2016 12:14:55 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	t15sm2293987qtc.26.2016.08.11.12.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 12:14:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:14:39 -0400
Message-Id: <1470942879-28353-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] utouch-frame: fix build errors associated with xmllint
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
X-List-Received-Date: Thu, 11 Aug 2016 19:14:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/utouch/utouch-frame_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/utouch/utouch-frame_git.bb b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
index 8fc8733..9bd18fc 100644
--- a/meta-oe/recipes-support/utouch/utouch-frame_git.bb
+++ b/meta-oe/recipes-support/utouch/utouch-frame_git.bb
@@ -16,5 +16,6 @@ PV = "1.1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git/"
 
-# http://errors.yoctoproject.org/Errors/Details/74486/
-PNBLACKLIST[utouch-frame] ?= "BROKEN: Fails to execute xmllint"
+# Fix non-deterministic issue with a2x being found in the environment (asciidoc-native)
+# and failing to complete xmllint due to missing dtd files
+EXTRA_OECONF = "ASCIIDOC='/bin/false'"
-- 
1.9.1


