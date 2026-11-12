Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6840.1794458695079692065
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=C4V01Lh/;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1763141b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458694; x=1795063494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FKr6IdO3AGErrp84q6Y01mG8CJRDIV41AlHUtn2j/s=;
        b=C4V01Lh/6Fejs+cT0XCZVtSKZ4jNxCPq3b+lzQBnOMjTFVj03igUtpxIgjE4WRcGKu
         P6j/s5V/GIiXrckiRouwie0DHNotDs96Eroi2afIqu+qg7KrfHFi+CDBdBsBge1/9DiR
         ZixhMzNlwh6/Ou0CpvRPU5ykMpd24ZxNfSE1lUS+udgVuR5KmG1ufvzMjfEnV4hLElqA
         2vV/WisusorNye5Z3Qe3KVy9QmOH4GRNVjocYkD84VkpjfSIG1Mg0s3+fh6iULREX5hY
         9NA9DHXXs837xg9vjfD08LqGl9Y4a+sxjvmS8ffsTiHRPUyHqnfngrHCbgFJpVlc04nK
         0MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458694; x=1795063494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3FKr6IdO3AGErrp84q6Y01mG8CJRDIV41AlHUtn2j/s=;
        b=Heu/aXT+Nu1l/u2qU2Ow0Q74y2qrHEwJqXa9Rx+LcuvXzyZjAdqFfIU1YOZR9wvtIF
         k6F+z9aLioKm0+Tebcb2nyQmvIlRPVYdE9HOJJ/f/pdMS8NAxcSGidGPIcTyiM6UrHu4
         EyaWaxiX0VynG4zRaRj3aUXBVXZpEL9LNYesRF4IpmEB6NzP2Zn4/SvSiUgvXbZgI6Ft
         mUTIOoxvHwjHNmxlbx60YmEiScp+P4HaCvcsYHfXWEFnLI6duscF+VRljH4ENWMCp0yE
         7DzVGwHZswFWqEf8j2wqgj7PrrHAyl+m11hNIgtAeBW0t8+O8RCvgiZAJ1pOyjK4vZBC
         /BQg==
X-Gm-Message-State: APuU4Z/MDwB1o5jsWVJ/WUS9dxvIJ87yjsVFMZAXqV3AplO99BU/Bf6D
	A99U1ums/gVLpUzcKuniVDHt2CyBOwoiCBiHe04qbtm/SO+YKN45PAofXY6Uaw==
X-Gm-Gg: AYBFou2l5adS17YbehqX+GW+FE8no/vxzd2ASg4Nd74/VyqVe/9QARZC7LqjGyp46hs
	MgYjf0KYktfLlKxfXQNeKVxo1JGr2Y5wgoz/eN+CeQ64KBOdH8848oHM9s+r5Lipz6UF/5e0KKv
	+OAtT4FAtz7BJkwt0+nkT3xv3fmlNy9hA4x9oMI5va5CsuyK8ZZCqOdZ8CLun5PKjgxTSsw249x
	81bCJDuW+rzgWQeNJzPiPu2NzgFMSdMBftbJOjpJev0vlq4im0zR6LA7NxjQ9A0X6c98jb/g75+
	+rEhSKv+tNve6kpAIW3KjibDL0nNbnKVIuc0GDYoFFGUY3khI63z/z0wCq+Sy7S2Llq54wOP3cx
	5BPe3aELEMPE8zPxfgWGg6xIz8ZXX3ZxOLmCiwF/KitwZZqU7MTJ+b1zx7qeCG/8kVx5GfaL3lK
	LTp1da2mogUsjY401x32oSv2OGSHXaQuS+0y5FsWW65jNfsrDrfS/K5nKhaPwAoF385hg11sLeg
	r9CeuyhoJKmhghlZ24qnBquCn0pWMj52cTl4tbV0fuKm6y4q0cfFyFpGk2oSxOdSg3EZofascIZ
	H+VDsrL8rCyDs6e1qgH2qFtcVqN9hLXiGncz2NB2y6OMSHG3nHbb8kJu3R8Sq3FIKDnEXhNdUDf
	I71N0ECk=
X-Received: by 2002:a05:6a21:a91:b0:3e2:6fe6:9b91 with SMTP id adf61e73a8af0-3f2fa4934f1mr4686421637.12.1794458694413;
        Wed, 11 Nov 2026 20:44:54 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:44:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 9/16] webmin: patch CVE-2026-125392
Date: Thu, 12 Nov 2026 17:44:19 +1300
Message-ID: <20261112044426.3933391-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132160
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-125392

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../webmin/files/CVE-2026-125392.patch        | 26 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_2.653.bb   |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch
new file mode 100644
index 0000000000..f357eb703a
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch
@@ -0,0 +1,26 @@
+From 261c858c1f09b734add7239b835c1085eab3106c Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Sun, 8 Nov 2026 17:20:57 -0800
+Subject: [PATCH] Add HTML escaping in all-records mode
+
+(cherry picked from commit 224cbd91467c98c3147df695fe9abc8149183356)
+CVE: CVE-2026-125392
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/224cbd91467c98c3147df695fe9abc8149183356]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ bind8/edit_recs.cgi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind8/edit_recs.cgi b/bind8/edit_recs.cgi
+index 2141c0a12..627143b37 100755
+--- a/bind8/edit_recs.cgi
++++ b/bind8/edit_recs.cgi
+@@ -268,7 +268,7 @@ for(my $i=0; $i<@_; $i++) {
+ 		if (length($joined) > 80) {
+ 			$joined = substr($joined, 0, 80)." ...";
+ 			}
+-		push(@cols, $joined);
++		push(@cols, &html_escape($joined));
+ 		}
+ 	if ($config{'allow_comments'} && $in{'type'} ne "WKS") {
+ 		push(@cols, &html_escape($r->{'comment'}));
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
index e4380e16a0..8598994a17 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.653.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
            file://CVE-2026-125391.patch \
+           file://CVE-2026-125392.patch \
             "
 SRC_URI[sha256sum] = "9acc680d3d45cee876f36fc8810ce68bb6e44a0365e245a4298a180e0d016696"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
