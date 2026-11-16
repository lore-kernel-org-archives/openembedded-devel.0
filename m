Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22035.1794808936841386756
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hcxycMOi;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37000e7234bso2388160eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808936; x=1795413736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZLfzn4q3idfr3976Rc3U3eL6AQs5VzNDfpDCVY477c=;
        b=hcxycMOi5y7kYrxwuZap4hJQAPbc40j+mDMKWBcO0d8MbhfqVlS0EM3TfrYF67q+Ip
         eT4hf1RYSHHVFq3o81oRIbfiJE3u2/R72Jlz8NvBMsLU4jp6I2I6IZpgFwQ3O2O3aFm/
         focGkjoCl3NG4Mb5tjC2yxEqXX3nYioqSMIfZUIqbE4jfqk6OKelLbeIrwJ5tkdypFw9
         z/KHxNPM3TMIYVzOzw9raKtex0gdM/i5SQ+VL0i0n4+r5x29KcI12HcNCFJr9A3Yor1T
         0LIgxT+omrXKe7RTyt4jnhpsBBgkFE8JmMzeFsUbWLQkJoxiC801XMaCzHz3WAiaoL0Z
         toxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808936; x=1795413736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZLfzn4q3idfr3976Rc3U3eL6AQs5VzNDfpDCVY477c=;
        b=GSkP7fLXOxFkqSIZnCvGb9bpxrUo5d+D/VhFj/qkAqQCWaZC9D2VLuM1Q9W/ZD/Nhm
         FSprc4wJgN1gTuvAIltKN7bSbKS9n64sLSNTRwTHfRaqiECQAEOSZq5Y7294T5cw8zFK
         HXZXI1EkXDzmW3TJqYyG8C8a2ZgpyQwXbjt/F7zK95Ak6je5TyjlXUAnPYhjBFrGn8CG
         axw8POnnlUJ8ZlMaFCn6e71A1hEQdlgksT7I+uCZKzIMBUauKHFIYIKk3XFgRAclb4Ac
         6r0YQF9R/BjnJkVTEY1X3uygNvBuUYLCf1debOS8AF4wxoWnkGBm92smg7zr8zm0eCY8
         yteg==
X-Gm-Message-State: APuU4Z8tG7hQkEpdJ/DWv9U8PpctBbeGpFrgQ5lHnzH42An2QrIjPSrj
	Z+JhxXy+AcAT/5qOCDqOp6/6oJrlJOLa9yywmK+dS9wNliSfekMMTgVcdVKBrOCD
X-Gm-Gg: AYBFou1PJlQauSBIchngc7D1V2gyx9dPR3meqjXMH8yC1HCfJWMZqQ/+lMPFSLDWfMa
	oQzreB0WcG9FgZhjhRgO8x+yGs1svH9lvas9h19ST8+dsEntekd2oURBDZOq0bAIWVW8Ok5krRz
	Yd5qsNoKVmS9FaJFM8seoLOCeJazttAb9+UgUeprcxjUqlwpTj7R5MM7DovEoVTJ3ErftjZZ31Y
	5SC5sHhm5vbMtgpEMMCfy4NQiKKMUlA4OQQqrVA0EulZfmim3uPxfYfuo5EWDONUKpg+m75XloE
	EfLnk2ZWJjPcvh5ixQ/qnPlxJ63JgftvYJrJe3OHblp7clqqOkdae/zpBeOSI2s/CBB7ri9h4/s
	f1MmFk4ZSdeg4lI6zxc2AVXVng9uNE8I69eUI5lk8SXoOoTv1x/4Geoomb6Qj5zdRyRCnY+RG2v
	VwQfjiPM9JDNQrmtvErRBNclX0y1xgRMd4pqxkXJvKYfRDv2Rr7bt7e5ftEbF4Z2KU2W0Pj2xs+
	JBoJcTku9nPTDxKbynOB01oZqa7Vgsfg7xaK2RSJsuB1jeAYyFD1IiJko99apqjxTdCiBdUTuk/
	Ay3WiVgiF7eeoiGo0uAEH8qQNCyRALaQxHmAa7073c2MBaiGOsujTLxJmk3T/pX4n8pZ32s6a+Z
	Z5TMp5evgtdEa5z2vY4SMlwcbAWsscWjXkmgwVl7HRkXg1VsDUjrdaSgwuMiVzRazh63Ip7Bd32
	CcGoidNya9RNkTbVRJR7UhUClsfffG03Up3PKcA8208O68t/ZJw9ETjcsQazURLcdXDF3s5vzfr
	GhC4bsh1nMyDdXNi0yVJ7Hmdel7PCh0ajneGyhFVMfqfRee48+8xlEPFFn+4t6MSLwulUzEaB0x
	jC84
X-Received: by 2002:a05:693c:88c3:10b0:36e:4aaf:6c7b with SMTP id 5a478bee46e88-3796740c786mr9250821eec.39.1794808936036;
        Sun, 15 Nov 2026 22:02:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 04/30] libcgi-perl: upgrade 4.72 -> 5.02
Date: Sun, 15 Nov 2026 22:01:42 -0800
Message-ID: <20261116060209.2916444-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132402
Content-Type: text/plain; charset="utf-8"

Security release, fixes CVE-2026-120631, CVE-2026-120632,
CVE-2026-120633, CVE-2026-120634, CVE-2026-120635, CVE-2026-120636,
CVE-2026-120637, CVE-2026-120638, CVE-2026-120639, CVE-2026-120640,
CVE-2026-120641, CVE-2026-120642, CVE-2026-120643, CVE-2026-120644,
CVE-2026-120645, CVE-2026-120646, CVE-2026-120647, CVE-2026-120648,
CVE-2026-120650 and CVE-2026-120651. Some defaults changed to fix them,
see BREAKING CHANGES in Changes.

Remove the new t/taint.t from the ptest like the other tests that need
perl -T.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcgi/{libcgi-perl_4.72.bb => libcgi-perl_5.02.bb}        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.72.bb => libcgi-perl_5.02.bb} (92%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_5.02.bb
similarity index 92%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_5.02.bb
index 9eeb59b691..9b91da9a3f 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.72.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_5.02.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "babc1ca72db188083a1c3812debe88c4473b943b1f7c662281cd57c580a8bdd9"
+SRC_URI[sha256sum] = "47637ad0413c527e00e1249d14dba0c234073ad4bef09746fafd73dd85ded665"
 
 S = "${UNPACKDIR}/CGI-${PV}"
 
@@ -26,6 +26,7 @@ RDEPENDS:${PN} += "\
 do_install:prepend() {
     # requires "-T" (taint) command line option
     rm -rf ${B}/t/push.t
+    rm -rf ${B}/t/taint.t
     rm -rf ${B}/t/utf8.t
     # tests building of docs
     rm -rf ${B}/t/compiles_pod.t
