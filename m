Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8966C4BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:29 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id gn14so1982125plb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MOdxSKr/2AtYt8H5O1uIZuwOquS58usAvByy0MRPLKA=;
	b=MM6SxD1AgoOkLhJktU6RjWotWeKKG4Fn4FSZUFN10OyTF3+TizkrhxUV71QA5ENIVb
	nEnr1YbPgupqBD8zqJjwd3uBOJQrKMl487eTXCKME8nn1rkdnH/oClY8dvUPCwrL0YLc
	LIZnxGV4fFAfR9pEhMKX+dBJKeYKZXj+om4Bszgsla3PZJghYPmgy/Ru7FHdwTZsj2nd
	I+kpfyDIJI6i4xIfdlefjkok2HNNF0q1yQevu+ZoRJavIOUh0rHEdwtnY3Hd/RB4zcN0
	85fm+7uHrGrk/tx91qZxTVoKONthnqHefnPvEFFDvYPZzIUn4Au/NO37z33TimIokR7h
	uB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MOdxSKr/2AtYt8H5O1uIZuwOquS58usAvByy0MRPLKA=;
	b=nvezb9W7ORaBcIIELyhPx5wSQiVA1UBwOzOwXOP2W5TBnzIoZAYnp5TgFRKzmSi75w
	o0p+KCbOGXvK4Ped2qXgb1hB1+d6FNyJtrSiofP0ECPrhitY8yaITSS7qG406eZ+AZMC
	004VJBlQCsJE9fXmB379tAZtjOACwhhq9AwwHm/7eqjc/F5/GTp0p5aI88SoDy/W5PJQ
	COQ0YjQVZUxH+Si0XEmoAW8I59P4EwS33rbl5sz/A/4ZU0Msv3PPRQs4aQdPXpulJ8+2
	A0mMFeBS7ddKXLPIows3+OrAzTjBQKfgvRGkIeBhNhflw87TN0PVfCwC3CJ9/FJ5Cdf8
	Zlww==
X-Gm-Message-State: AA+aEWb9PfDq2bTg9B4ixj3SJ/+34l9g0pcDrTuSf4Zf54btWgQhDobc
	LPfquR0jGpfwb1zEzx3s0h/ZCkP+SYc=
X-Google-Smtp-Source: AFSGD/UPrkVZDU6ZhHUHf0lLsO1VcQ+e/dpujf6y9gWjbBr3oSwwKR3XNybhsQOSWoEe/v1gWYYZwQ==
X-Received: by 2002:a17:902:a50a:: with SMTP id
	s10mr3599012plq.278.1542746310124; 
	Tue, 20 Nov 2018 12:38:30 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:11 -0800
Message-Id: <20181120203814.11500-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Tristan Ramseyer <t@ramseyer.email>
Subject: [meta-oe][PATCH 07/10] Copy breakpad .sym file in appropriate folder.
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:29 -0000
Content-Transfer-Encoding: 8bit

From: Tristan Ramseyer <t@ramseyer.email>

Google breakpad requires a very specific folder structure which is only known after dump_syms has been executed.
Therefore the .sym file's first line has to be parsed in order to move the file where breakpad wants it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/breakpad.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/classes/breakpad.bbclass b/meta-oe/classes/breakpad.bbclass
index 36f11ff480..cebe559a7f 100644
--- a/meta-oe/classes/breakpad.bbclass
+++ b/meta-oe/classes/breakpad.bbclass
@@ -25,6 +25,9 @@ PACKAGE_PREPROCESS_FUNCS += "breakpad_package_preprocess"
 breakpad_package_preprocess () {
     mkdir -p ${PKGD}/usr/share/breakpad-syms
     find ${D} -name ${BREAKPAD_BIN} -exec sh -c "dump_syms {} > ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}.sym" \;
+    HASH=$(head -n1 ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}.sym | rev | cut -d ' ' -f2 | rev)
+    mkdir -p ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}/${HASH}
+    mv ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}.sym ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}/${HASH}
 }
 
 PACKAGES =+ "${PN}-breakpad"
-- 
2.19.1


