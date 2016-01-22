Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB79977041
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l65so477033wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HiR7dRQ+jCYpRSjgjseLPsq8dPVf8pQ+k68idozt+8s=;
	b=GUTKGal6eL8cK1rKqwg2Uhx8uhlPmmQSF+R84hdTotTDrtf15mCLEb9P8hyTyM4sWy
	laRXFXdRQGN0bjtGc4PD/FjfTVBr/AteUFFxw6TURE9mjc99AUNPPH8CazVZ2PCC6bIC
	03MyQK9vZSGcmVyYrWOm0kW6Io1NBUb6kppA8mD+4IbsU1fZ09AsMd7e0CPGSR/Up+Am
	gS8K6Z/w0U2EQKTCz3KJviJL89E8zeLoOHkBy14y6+m55E6OAq+zf2XcvtOQ5YHncs0H
	HP/x1Fj9MGIbWZ5zq4AGVt4fibvfcSUazao8JrnqFHDwtCYb9BD97BkK2AIyFBlWZPb0
	inJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HiR7dRQ+jCYpRSjgjseLPsq8dPVf8pQ+k68idozt+8s=;
	b=TgDna4VpzstrDJQk0e/ROHj28NT767LtpauC5GBC+mXwrsM5QKFUJl2dCIrX5XOOzO
	rKnOyK7Yy2+p2mr53Z+RTGV7ho4vuKOej6cOAa+VNT0DbVwoNixNJUxASufqgadQJkVy
	hzbIME8mvguDVFDs0KbQMhjfyA6ouUkYhZYp9zsOSh2rExE44dJiI5B+AWjLJdtuLioC
	eY6VuuGUcIIo+JGsqINuX1cI/5JcGserJEsdQZGuwZXDZMWl9LHLGgzKFJ16aLR2rrSD
	S5c5DLNOvi+9y1D1pMtn9Cf7kqsdEP5sWjZOlsv8TLssQicN5eum81OCPHeDathb1PKX
	F6LQ==
X-Gm-Message-State: AG10YOQvWil8lCuUevHfo3mgd/uCKhPoAqPKFl40u1n48Kbl1eYljpajs3GJTkcxxU2LSQ==
X-Received: by 10.194.175.198 with SMTP id cc6mr5713869wjc.24.1453505450508;
	Fri, 22 Jan 2016 15:30:50 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:49 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:08 +0100
Message-Id: <cd9bd7800d2e6187926bcec11b4e2b2a89011042.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 06/21] python(3)-itsdangerous: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:52 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-itsdangerous.inc      | 9 +++++++++
 meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-itsdangerous.inc
 create mode 100644 meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb

diff --git a/meta-python/recipes-devtools/python/python-itsdangerous.inc b/meta-python/recipes-devtools/python/python-itsdangerous.inc
new file mode 100644
index 0000000..73951fa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-itsdangerous.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
+HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b61841e2bf5f07884148e2a6f1bcab0c"
+
+SRC_URI[md5sum] = "a3d55aa79369aef5345c036a8a26307f"
+SRC_URI[sha256sum] = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"
+
+CLEANBROKEN = "1"
diff --git a/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
new file mode 100644
index 0000000..350925d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-itsdangerous_0.24.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-itsdangerous.inc
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
new file mode 100644
index 0000000..8c791cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-itsdangerous.inc
-- 
1.9.1


