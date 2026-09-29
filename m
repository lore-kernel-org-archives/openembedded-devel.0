Return-Path: <sergio.prado@e-labworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71356CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 23:44:45 +0000 (UTC)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2228.1790725481813999299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 16:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e-labworks-com.20251104.gappssmtp.com header.s=20251104 header.b=cT5ktFGd;
 spf=none, err=permanent DNS error (domain: e-labworks.com, ip: 74.125.227.42, mailfrom: sergio.prado@e-labworks.com)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so1938618e0c.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 16:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=e-labworks-com.20251104.gappssmtp.com; s=20251104; t=1790725481; x=1791330281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tr7MXG9iklU6Lv1ZUouECjCL2jCByB2q1EsghAu2xw0=;
        b=cT5ktFGdHcpWMlAJsm+O+sJA8B0nko6aMup1gU53EvsmmCfdrXz834gdbCvgtb3vk6
         5njROawMIHhZnoXCH5gVev+lNNU3GiX/tSoj4llI3Pq5LoRo3hmGqqBGm0P0SUYk0cEL
         A2wiALZmo4UMUkMdMtEy2gzPRVuLJEEP2h0vZpQibYJdB0RuAFAPYxSFZlX37Y0PiMLa
         YLViS0qBBVvvCsUXVQWTr0I+dLSsRoef5QFHMWfNCU0GFb5F+CJOh1UxAqsxJAGyvfkW
         d26DHc8lYGT2ocV16hkGumAapgc5BZADbQzcuWRWbbCMOPoZ9PHpa17+ftpO290i3bHT
         a0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790725481; x=1791330281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tr7MXG9iklU6Lv1ZUouECjCL2jCByB2q1EsghAu2xw0=;
        b=Y9m0ADxPZB1kYf/vLrk/iNwlQio0x6EFj3t5NRv0dRjAvjmPQrtaqWat7Ilw19wa50
         B3/Kzv6nfBjS5tlhV7K+pOS4lmmuIl5afN537We1/pTC7HKzsBLKVHQA1NzS3iO+n87B
         n6JL87+1v35+qaQSE3Ul0spFH8JQS8yPn9a/tIVmHow6scUFHwWgsXp6K5Z1iMHsy21e
         Xr3Y5GWU0lkLF2o1xsoAzceuJtLssDu0N+f9RKsbQPzv2TJCiRI/Hs636OLj2E2GSgoH
         DeT/X+BT3JTo5Xg88pXPHilre+u5tzOnniEPke3vn4dn1yHqE2jH2LxarRMpJrx1nV3u
         gpFg==
X-Gm-Message-State: AFq9FYK/EdbnVgx+eQE6RK0GDzDnG2HfXNqAtkYXBBmFk1gsFKqcDwvl
	A6N1U+4998X+QXsW6IcrryA3zJjaFZ/mtLSyxWy2MJX4j6sLoivuGOgrwcNB0fCDT+DozWGgZvz
	cxmwC
X-Gm-Gg: AYBFou2hBNNCpAZPHdARPcsq7WpQie5LURGzESR5JQsvMozmxj8kJytlzRtLJvtvFDq
	8eQr8uMbyhUn/eRyJuIOO5GYdWx8Dl8xRXFAPaw0WWqMPwtJB82hIGgg6z9NK0SmyuzLP+TSNiC
	MleoyFLz8XJr/n+CALb4G+Cg1BiNb+2zSn/hhDKQngIlH8IDrRcl7EtmxLBdFaZbva2E02WBRVe
	aEh9axoUKXCZVjVw/fEIWcGNIXKztDyJJ69lzjMIVQ9gXLFGl2Kqn1N9FnNUI31G/mrIi8vbtla
	d4OJ08sXzWzcL26+V9nJoIvWqG+v9NP6eTBW7WR/5d7ym4DHoP+UNoNSF9jseMXMzJtNkDZ/FOw
	SNmKVOiVSH95UiNtbWy7245tr1w6OzUGv8FD6L5SA8m79G95/d1fdCbBxEcQAhLLi+oVeVr5Pfz
	cZfJREUWZ+WvUhXm+vBY9UMrauh9/9bgkrsWVWxxTtFczpJFDTofwtO9IY2jeeTRKjbd5PdVqyU
	ngChxc=
X-Received: by 2002:a05:6122:3a03:b0:5c9:a60b:e5c6 with SMTP id 71dfb90a1353d-5d51835af8dmr392750e0c.9.1790725480558;
        Tue, 29 Sep 2026 16:44:40 -0700 (PDT)
Received: from notebook.. ([186.248.173.98])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4ea61e861sm1558215e0c.17.2026.09.29.16.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:44:39 -0700 (PDT)
From: Sergio Prado <sergio.prado@e-labworks.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Sergio Prado <sergio.prado@e-labworks.com>
Subject: [meta-oe][PATCH] polkit: fix /etc/polkit-1/rules.d permissions
Date: Tue, 29 Sep 2026 20:44:20 -0300
Message-ID: <20260929234420.876217-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 23:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130516

The recipe installs /etc/polkit-1/rules.d as polkitd:root 0700, but
polkit's own tmpfiles.d entry declares it as root:polkitd 0750:

  d /etc/polkit-1/rules.d 0750 root polkitd - -

As a result, systemd-tmpfiles changes the ownership and mode of the
directory at every boot, and on a read-only root filesystem it fails
with:

  systemd-tmpfiles[241]: fchownat() of /etc/polkit-1/rules.d failed: Read-only file system

The polkitd:root 0700 ownership was added to avoid rpm conflicts with the
polkit-group-rule-* packages, which no longer install into /etc since
commit d5e90541f8e3.

Match upstream instead. This is also the stricter setting, as polkitd
can read the rules but cannot modify them.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---

Tested on master with qemux86-64, systemd, package_rpm and a read-only
rootfs, with polkit and all three polkit-group-rule-* packages installed:
do_rootfs succeeds, the fchownat() error is gone, and polkitd still
loads rules from /etc/polkit-1/rules.d.

Please consider this for backport to wrynose as well.

 meta-oe/recipes-extended/polkit/polkit_127.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/recipes-extended/polkit/polkit_127.bb
index 91be8858cd0f..10b3fbfe47f0 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -61,10 +61,10 @@ FILES:${PN}-dbus += "\
 "
 
 do_install:append() {
-	#Fix up permissions on polkit rules.d to work with rpm4 constraints
+	# Match the ownership and mode set by polkit's own tmpfiles.d entry
 	if ${@bb.utils.contains('PACKAGECONFIG', 'libs-only', 'false', 'true', d)}; then
-		chmod 700 ${D}/${sysconfdir}/polkit-1/rules.d
-		chown polkitd:root ${D}/${sysconfdir}/polkit-1/rules.d
+		chmod 750 ${D}/${sysconfdir}/polkit-1/rules.d
+		chown root:polkitd ${D}/${sysconfdir}/polkit-1/rules.d
 	fi
 
 	# Polkit unconditionally installs a systemd service, remove it on SysVinit
-- 
2.43.0


