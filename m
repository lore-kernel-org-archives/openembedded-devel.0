Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC2A7F610
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 03:49:18 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y24so10768558plr.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 19:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mGI5Gd8rzAmyYGgGeYcJKbNa0r7E47vIGkM0bWg6bkM=;
	b=XpWpQoKLOKJbOAB/xpKNVSzrogbU3TTA7phk18II/wPtOCpMJVqo+tf8YM1C+4WVon
	rm4Mn2xeH5CiF/xeBjJVsElHMTMFos4AUlemzhH44L6zMHz9GatYIMGekpYo/qD3qL3k
	R7SdzOvawDXN+qx+A0okWI1DRdmjVoLRcx6P4OJWCnribmQzNCzHaMG9UOw69fiwdffD
	zPTQPFCrbDLyp6XwzMzk+0LJ38ZIsK5Fhg6TWnerpDtT+UPgRuvT5neVdYNpn21PyIc5
	xtDa224/s5reZzIrz05thrCvxY86HydUvDFru9mNhiW2aaYBmoxBGzQkudlQDZC+9zUH
	DAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mGI5Gd8rzAmyYGgGeYcJKbNa0r7E47vIGkM0bWg6bkM=;
	b=IpljtOHSRdAnjwvUPF0hv3yKIpDDD+D8J/JGEhbiiz43SrffTJBze2UxtyqjHnLUQf
	4VqBpFn/FL8frlrf3x541UKjrDyM4a05JlJk9rcvAZDJhz8oI2+BPXNPzPEa2PnSkwTY
	xQWWekyOho0PnOdDK5i65ZF3BwBX7m4CktPZ4ea5Ul/rF0wudJnEE+DPKB50tWWVQDkJ
	BRNhjPozO7q3wfr7FIMS8u8rUyJ431kU0W3nP1HL4jgBbh+gtePl4UoOPle091oc4D3b
	nvldzr8iopgH4RR9JGX+y3+jswefLApQ7m+umB7mUfl6nC1OM3tuCnG3uSkNqk9BG2wN
	DJDg==
X-Gm-Message-State: APjAAAWvXYh3PHTaEs++H6miROMTB5H8o2LnW2a3KiyJFJQM5UiAcmEa
	zXOfPPrAeKWWOLHRYsuMnZjVyvMMeTA=
X-Google-Smtp-Source: APXvYqwBmIvg/tkFdyt7fGUG8mZfUZPX82a/5qPeoHsjAhzB2UTiIG5p6xvCHzXI2APGXBDqZxFNrQ==
X-Received: by 2002:a17:902:7d96:: with SMTP id
	a22mr310425plm.318.1573012158877; 
	Tue, 05 Nov 2019 19:49:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id 39sm912407pjo.7.2019.11.05.19.49.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 19:49:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2019 19:49:02 -0800
Message-Id: <20191106034904.2815791-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] ifplugd: Include stdint.h for uintXX_t
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
X-List-Received-Date: Wed, 06 Nov 2019 03:49:19 -0000
Content-Transfer-Encoding: 8bit

stdint.h is standard header which should provide these types
Fixes

../../ifplugd-0.28/src/ethtool-local.h:27:9: error: unknown type name 'uint8_t'
typedef uint8_t u8;
        ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ifplugd/ifplugd/Fix-build-with-musl.patch        | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch b/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
index 4bd40606b0..35665bd3f2 100644
--- a/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
@@ -9,13 +9,14 @@ Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
  src/ethtool-local.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/src/ethtool-local.h b/src/ethtool-local.h
-index 200476b..0edc7a9 100644
 --- a/src/ethtool-local.h
 +++ b/src/ethtool-local.h
-@@ -22,9 +22,9 @@
+@@ -20,11 +20,11 @@
+  * along with ifplugd; if not, write to the Free Software Foundation,
+  * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
   */
- 
+-
++#include <stdint.h>
  typedef unsigned long long u64;
 -typedef __uint32_t u32;        
 -typedef __uint16_t u16;        
@@ -26,6 +27,3 @@ index 200476b..0edc7a9 100644
  
  #include "ethtool-kernel.h"
  
--- 
-2.20.1
-
-- 
2.24.0


