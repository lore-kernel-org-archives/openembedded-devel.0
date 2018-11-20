Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 47DE16C4BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 20:38:31 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u6so1983073plm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 12:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=alRLtDX+B3kO928TasEismhSo8b7VEf5J9985R44iVE=;
	b=pFEhlCzLpKJ8HnJAcsI6kAQIWkhTYLiyjXITEE67d/Mc6kX4NzrfBJjEO3VmBnzHEQ
	+bmd9HxJZTVi6EHQkF68wMvbVEzfmoIeO9cMCXVnEg2Fx8lTvGUdVNPJxm9wkZElzY2e
	wyflkBfrTw0VRpuR3mJLTYfmPnb2Ed02ZeTrHUtSKY4AkH3EMWW9840NZ5hUgfKbKNi0
	m/OiWsJ5j3o+YM0MKiu6d5wHPsVfojFxfhEQX16sgn6bHZRCcTfSj6ZzBoHCPWE/1Nbf
	fBkol2NjtsOMe+Al8wk3oqgGR7iK/ncl9ierzY9+B+9eYj3h7gHH+ZCssfijn6N5pVSd
	9sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=alRLtDX+B3kO928TasEismhSo8b7VEf5J9985R44iVE=;
	b=ZLlSNNV978x9E2afYzEY/LmYzafbVHirvi0jQenpd44XWiKgYpkVyjO2rW1T3KoPoO
	6inQ7IvX18yT5viEFgJmnDW5bKx7kFyokFr9ZvkEEFsMxFx7/yvrfNykrz0ubkQYnJSU
	hpzLZB2BmTmrpSJ/J9IiC9oM6a64wKw3Ezh38ntLd0SSbTMs2gBERetLWNF5tX8anJgj
	6dpIg6R44HRIvgWYWS79a8QqKmr4RVcA5Bejk4QsGgzonzfMDdOVgqnEFahK3Yi8s6IH
	Ajs3i96wvnChDGqNE5MRJE+j/PrcFAr+Msqcoc0gXi7YW4Bf6mw8ovbiVrhw3YW54F4d
	qmZQ==
X-Gm-Message-State: AGRZ1gJYTM/+M6AtMVI4SFCK0hSCT/o03YzhiIAGavaOPEQsnTAl/YLr
	JBck1NWe6OMAK7FEWkilpzgRpIliJy4=
X-Google-Smtp-Source: AJdET5cZ8+FqcOZNEc0CCAd19G5GKlI4Lqhfq3m23e9254kPVsjLJiuZz9+wcobv/8id31+UGBvQDg==
X-Received: by 2002:a62:9302:: with SMTP id
	b2-v6mr3738969pfe.108.1542746312081; 
	Tue, 20 Nov 2018 12:38:32 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	x26sm24325479pfn.50.2018.11.20.12.38.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 12:38:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 12:38:13 -0800
Message-Id: <20181120203814.11500-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181120203814.11500-1-raj.khem@gmail.com>
References: <20181120203814.11500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Bryan Gillespie <bryan.gillespie@hughes.com>
Subject: [meta-oe][PATCH 09/10] modemmanager: Update flag for disabling mbim
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
X-List-Received-Date: Tue, 20 Nov 2018 20:38:31 -0000
Content-Transfer-Encoding: 8bit

From: Bryan Gillespie <bryan.gillespie@hughes.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
index dec4b67973..50114dd399 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG ??= "mbim qmi polkit \
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
 PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
 # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-PACKAGECONFIG[mbim] = "--with-mbim,--with-mbim=no,libmbim"
+PACKAGECONFIG[mbim] = "--with-mbim,--without-mbim,libmbim"
 # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
 PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 
-- 
2.19.1


