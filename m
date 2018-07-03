Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 526AF7754B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 09:20:26 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id z13-v6so1457410wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KayEzWfAAkIR0EGHaeRWtyUhH08rIIg6npcAXCMkqHo=;
	b=q9W1ZYtH1rdqVnQBXuuK2CtY9zNarms/NtqMZbCb8q0jJEYKrX0Fs8CK+l8k0LHJfX
	qB4lT3ptLfj9jHNSCvmBxxHZ9es6cdg7es9ejYspGVcj1DPOvBxSgHHqshur/k6cgGpL
	tftUe8dpkImzRe3Z5ckPx+JfrdVvmDSMWgEE5Dn7C0Xu2F7WlQEeWlJYiv+J9MBzCnNB
	Tkw3LP/yAZhxXbpGLhHe0beyz0rGsJTnvRQ5XIppSuzeValHpvOtflL71wFoNmQSxS9/
	1lD2fRs+raNAsA/pdRkcAAilNU1BWqT99KnG/ONC4LC0jjsuLPwQ84anFe/zXoNhKP8F
	HaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KayEzWfAAkIR0EGHaeRWtyUhH08rIIg6npcAXCMkqHo=;
	b=c0qZQM3jknnupRUh0doEOiHmd28alNjjcJDZZzCpPcGVvskXQsa5Ye9Yhqej7QssOR
	P8XkxBTHMkmyYlDf6myMPRIlYO+vcMGy1/qA1qkZYcfCtnRFWBUs2xQT1ll2F5iUQ5Ok
	iivFTljl8KnuKhyQ8kW28rFc4UCJo73s6u0ay9H7538qBXxZhXeOeAKqmZRum+WJXD6U
	VgRYlLMoPlvVt+fW+Ru26YznkFTp7y/HlMZMjHVqLKd5u8sX8hKwvu7vl/GQmXQxdDLd
	V8y0dsAHpLdDSdnoYnQDfw5t3iqzW8nq0IDd9BC8IcTQ2krJtthceIX6gTNyKIH0izwE
	6tjw==
X-Gm-Message-State: APt69E3a3h3oofANr2iqFEgWOmLdVUaKbYrgUABJhDzeDtonN6IulNY9
	xqt6VLhMzqg7VtGPoJVoiTZcGl9F
X-Google-Smtp-Source: AAOMgpfoNuNb1QVv7Jn8z2JmLZ4AERIZg6eZgid0EsxUqphohzKJwjAUEpoKT3mP18uWmFY34M/uzw==
X-Received: by 2002:a1c:c8:: with SMTP id 191-v6mr9949110wma.115.1530609626694;
	Tue, 03 Jul 2018 02:20:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm1041872wmd.38.2018.07.03.02.20.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 02:20:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jul 2018 10:20:18 +0100
Message-Id: <20180703092018.5018-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180703092018.5018-1-ross.burton@intel.com>
References: <20180703092018.5018-1-ross.burton@intel.com>
Subject: [PATCH 4/4] p7zip: simplify recipe
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
X-List-Received-Date: Tue, 03 Jul 2018 09:20:26 -0000

The plugin-based 7z binary is mostly useless because it can't find the
libraries.  Simply just install 7za, and install a compatibility symlink for 7z.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index d986da9043..13479a90fe 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -17,26 +17,9 @@ SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
 S = "${WORKDIR}/${BPN}_${PV}"
 
 do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/bin/* ${D}${bindir}
-}
-
-# all3: to build bin/7za, bin/7z (with its plugins), bin/7zr and bin/7zCon.sfx
-EXTRA_OEMAKE_class-native = "all3"
-
-do_install_class-native() {
-    install -d ${D}${bindir}
-    install -d ${D}${bindir}/Codecs
-    install -m 0755 ${S}/bin/7* ${D}${bindir}
-    install -m 0755 ${S}/bin/Codecs/* ${D}${bindir}/Codecs
-
-    # Create a shell script wrapper to execute next to 7z.so
-    mv ${D}${bindir}/7z ${D}${bindir}/7z.bin
-    cat > ${D}${bindir}/7z << 'EOF'
-#!/bin/sh
-exec "$(dirname "$0")"/7z.bin "$@"
-EOF
-    chmod 0755 ${D}${bindir}/7z
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/bin/* ${D}${bindir}
+	ln -s 7za ${D}${bindir}/7z
 }
 
 BBCLASSEXTEND = "native"
-- 
2.11.0


