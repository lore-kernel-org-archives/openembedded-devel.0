Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TwtNG-00078H-Nl
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jan 2013 12:47:43 +0100
Received: by mail-ea0-f174.google.com with SMTP id 1so2027741eaa.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jan 2013 03:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=dnefq8IN6AjEKVRo/NY9y9WjW7kJ3bovRii1sERF7L8=;
	b=dbXfdgj/TZ6+z6CnUeFIIWpYFCC3sFKEcz/sCCUH0UCU1g8p6S/Wo9irkujK2C1FEr
	vzHXRA+GTgHEXF3rArUySwjBCUbtmEIxbtnXTbl7+SfxQLx123iRCIJPi3LHa45APM/1
	kO6b1zwyLbauHtCnShqPf8z0x7/d1/HGrDzgm0Tj9qriLnF7R5mZUCbj6J+HnoF8dKps
	1B7lq/wWUnxXEJMDVMDQXv7xSuzDzf7a4fOVIqL+mcNBq0lPhqj4S9rH/d0AxQOC1DXb
	yyB6NoHcOBoeb/v8sQubU/Z6lUBhHpjpbB7TirgUk50AttWJsq6gxvV0bzlqqgWOBYEu
	xnaQ==
X-Received: by 10.14.174.132 with SMTP id x4mr47612678eel.39.1358681535294;
	Sun, 20 Jan 2013 03:32:15 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k4sm16888656eep.15.2013.01.20.03.32.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 20 Jan 2013 03:32:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jan 2013 12:32:02 +0100
Message-Id: <1358681528-19761-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQkhY/lu79PPOFqSYGWWO+I0FZ0l3il7Qkl/Y1kfF1Ra0g0MXrguFMtgii36wy8QeiEO6bDB
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH v2 1/7] yasm: import from meta-intel and update to 1.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 11:47:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/yasm/yasm_1.2.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/yasm/yasm_1.2.0.bb

diff --git a/meta-oe/recipes-support/yasm/yasm_1.2.0.bb b/meta-oe/recipes-support/yasm/yasm_1.2.0.bb
new file mode 100644
index 0000000..466f6e6
--- /dev/null
+++ b/meta-oe/recipes-support/yasm/yasm_1.2.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "x86 (SSE) assembler supporting NASM and GAS-syntaxes"
+LICENSE = "BSD"
+HOMEPAGE = "http://www.tortall.net/projects/yasm/"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=26c9f3d11f88911950f9ff62189d3d4f"
+
+SRC_URI = "http://www.tortall.net/projects/yasm/releases/yasm-${PV}.tar.gz"
+SRC_URI[md5sum] = "4cfc0686cf5350dd1305c4d905eb55a6"
+SRC_URI[sha256sum] = "768ffab457b90a20a6d895c39749adb547c1b7cb5c108e84b151a838a23ccf31"
+
+S = "${WORKDIR}/yasm-${PV}"
+
+inherit autotools gettext
+
+BBCLASSEXTEND = "native"
-- 
1.8.1



