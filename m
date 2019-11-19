Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0C12F7F7D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 18:49:59 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id o14so2966294pjr.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ikZO0bM10HnQYMXQI9rHlIPBR+bHmcxUZc6ahvWPeYg=;
	b=k/Yh5x/2BrXfzK4EL0fCkpbnX5uMMClKTkotn0FLybZBeFBFy8poE4npzVnSJjpqLf
	5E3ARFl9xoVOKRuY7ka8ZkgMzMexAaDdX7aX8/dBxDSP+wlOAT2IiRKh1l0BdwHLKUol
	hc2lTQcqOWMgZ5JwESBts2dh7tD26/83CriPcXPG9Mk+trrGGoP9XXrkGQqHp3Uu86uy
	Nky5LeLWg+5fyVpKBJqVMZXLQ/S2tSKWLP44z0qevrXVN+P74CUcqK1RAz4xyZmlGLAU
	Sb4aWY3tpqJBB9+vP9ra/7RvT/ZGu52kqePbeBK7dZxhJET5Y9FlL6JgDk0fept9ne7S
	877g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ikZO0bM10HnQYMXQI9rHlIPBR+bHmcxUZc6ahvWPeYg=;
	b=j1vFm5RuVNVV7Yu8eF5c0woN8wYorPUDxK8bvgILY3O/W8sEcplSkR3vEsRiwH0ARh
	ravYmJNSi56f9UZ5Vzw0j6Og8+bkZTLtrz7LDS0ZOAnaWT4nFgZOhXlWCt3zR2mFR9zY
	5iC26pgu4RDlJ61SXghMvd0k73LGdxa7CS7GN8uvMGTW8vvu2b+dusgcDroq5JHXcv2l
	Prsqdfj1r5NAc/Po5VjfxzpMyUhhAgTyc2OxoMJrJkQI/MN2YG0a+SZF19a1hdg3bVzr
	2PUgv0NesyG9ZDlC2Z06687xWtQ5WgewYAs4ZKKnxQqttOQtsd/DWbuhGjOOEvxtAviP
	xCng==
X-Gm-Message-State: APjAAAWUyHeZ7KdJFmhWlPpaw4K+zhjAl7bdbD96C8NyKslObZcFj1ja
	gMBzC+MgRQMnwfZYOJqqmM616CZz6Fg=
X-Google-Smtp-Source: APXvYqyIhbQD9XgMXXOmSd/My+SQ0r09Nh775ed9rVLgC3H2hkngnmaB2UKK7G4w341L/vAT0sXA8w==
X-Received: by 2002:a17:90a:4803:: with SMTP id
	a3mr8487572pjh.101.1574189400480; 
	Tue, 19 Nov 2019 10:50:00 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	i5sm25338879pfo.52.2019.11.19.10.49.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 10:50:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 10:49:43 -0800
Message-Id: <20191119184943.2681930-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dlm: Drop -fstack-clash-protection for clang
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
X-List-Received-Date: Tue, 19 Nov 2019 18:50:00 -0000
Content-Transfer-Encoding: 8bit

-fstack-clash-protection is gcc-only option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-extended/dlm/dlm_4.0.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
index 876462d2f0..6345c8141b 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
@@ -36,6 +36,10 @@ export EXTRA_OEMAKE = ""
 
 DONTBUILD = "${@bb.utils.contains('PACKAGECONFIG', 'pacemaker', '', 'fence', d)}"
 
+do_compile_prepend_toolchain-clang() {
+    sed -i -e "s/-fstack-clash-protection//g" ${S}/*/Makefile
+}
+
 do_compile_prepend() {
     sed -i "s/libsystemd-daemon/libsystemd/g" ${S}/dlm_controld/Makefile
     sed -i -e "s/ ${DONTBUILD}//g" ${S}/Makefile
-- 
2.24.0


