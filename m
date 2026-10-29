Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.901.1793316684662051903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 16:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yXAjfMNZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1846bc43c28so139815c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793316684; x=1793921484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHQhOxsTQMm1PA2x3VBv5GXwyQJa8kiaq4j+aQWG04M=;
        b=yXAjfMNZKUJsULuvualsnMKrT+UNzLUu35fLH3HZHO8apPPsb7NatVe3h3vTHD6xoe
         e5wkdjvVM+LhWqZGuqVGPEl/PFqMOvWzbUgjEMnzJxHjV/ghVfConWBdYs+KoVBDBsmW
         3PilMCTkMpZ8snTLxktOKlh02fnlwN3wqdM69dmmpS7Tuj5IeToiVDDb3tFIKsNY3J9I
         /sUrKwJHoEy/ajFGg4D1LxysajGDuU6SlSspX+h2miS7l4oEHJYkI6aILgocJVx9SvoX
         ++46HDrAcRExV+ifXHFfVEE9PNqhS3ymkrYJYAb6ZEpu114nHH9VRfQ5FhAA4DVJUkZ3
         346g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793316684; x=1793921484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHQhOxsTQMm1PA2x3VBv5GXwyQJa8kiaq4j+aQWG04M=;
        b=aNUMrG9sySTYOKDOsGqwWBJedgrZ6ITzjQ8nNvkffKQgzLwz3zWTUwQui9Vl1PyWgu
         SFbJaiDRbMref2tfehsR32RZH3O6FjKReblrHzn1CMsq68zZI4aJn6YeaDSAEb6djU+E
         aEqYio0qCg3eoOroovRPOf1cUO1qZ4QiZqMV2vhm1j1uL9EBCKEDlDN+5Fj7PArfam/P
         00lBd3E7UlXLy9T1/jNPwedrdQza3DYQ0fy8Jbr/TjpeNAuhVlcQGJcTmrfdwFD1XUOh
         e56ubthmo5wXKCIAo1jseuJauRCeu0qLKNTxNpwO1gPXOg/FMaWma/bYSs9IGV6nLjpB
         2dSg==
X-Gm-Message-State: AFq9FYLaKDpU7qfIxCLuj++8n3Ud3lE+FCC6BiMF+WkMhyYmbbS9GTnp
	lq842LHAtrmLnUgS/KkkMl3mvEn03bbni4PxOSOQdX/snwYPK1lUQx4WeKDKHg==
X-Gm-Gg: AYBFou1Sjt2Ra7rKNs4WV0xEvyZzGyAs3CuhTVzt8XShofZAYbrs7fKwTo90LI3QW8D
	mukYElIpORbQr7LTO9G0fbO52eCPmIvilaevmBNDM9LcG/F96zC3GyzWMQTzzXQomFvAYamLIi2
	O+rHmNcwojrgT0m0GUaMs2JIl+Eq+vAnOW5C1NqBqBeTr15lGXt40t2HEbGehMdGo4quw4Bq0pM
	/22jX9o/aSyJlBeXGIXOX68nRvpg74SKiEi06NCIjbUXSg1EgYCpB8s8yyWdy6O2i8HP0CTHqgx
	IPL5qA5Jh7Nc3Mm19Npr5ovLVrdeVxH1E3H1LirV0uBGXrYUmZIXl03Dxzij5Fc1cTnbUL05mA+
	gOIyERfqchmRpcJ2lWCxbkSbOYvyNptt2U9rEtp9oUq0gMkX6337L6Zntv/iVKIdhItiu/SiX3t
	F6Oivv0B4qFxp7VxYy8Qj1/9Ar9QWpolNd2IwucjsuqQ1YwrA1RO1XEJ+wQF2Oa8JFDb3ZXr6yI
	0IuQyHQFjC5niMf7elMAbw3oMKSozxikw8S6yelXJE+8h1/6m6RXrTapMwXcBGJyXLqQ6LhY6V5
	u1zbDfua56iz0sfcfa8XIO3e9uv5WjTwkSUMj7VK/AIeQKIIpNBvU8fqZvj2fQ==
X-Received: by 2002:a05:701b:2302:b0:182:9071:3249 with SMTP id a92af1059eb24-1ac5de53bdemr609484c88.30.1793316683835;
        Thu, 29 Oct 2026 16:31:23 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm2207349c88.10.2026.10.29.16.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:31:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 8/8] lldpd: upgrade 1.0.22 -> 1.0.23
Date: Fri, 30 Oct 2026 12:31:02 +1300
Message-ID: <20261029233102.1177876-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
References: <20261029233102.1177876-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 23:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131677
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: use LICENSE file

Update SRC_URI to GitHub.

Changelog:
https://github.com/lldpd/lldpd/releases/tag/1.0.23

PTEST pass:
root@qemux86-64:~# ptest-runner lldpd
START: ptest-runner
2026-10-29T23:27
BEGIN: /usr/lib/lldpd/ptest
...
END: /usr/lib/lldpd/ptest
2026-10-29T23:27
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lldpd/{lldpd_1.0.22.bb => lldpd_1.0.23.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.22.bb => lldpd_1.0.23.bb} (91%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb
similarity index 91%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb
index 635d54931d..3d623bcf5b 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.22.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.23.bb
@@ -1,18 +1,18 @@
 SUMMARY = "A 802.1ab implementation (LLDP) to help you locate neighbors of all your equipments"
 SECTION = "net/misc"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e78ea0cffb20bf5cca7947a896d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31864e0b3df438284c0adef04a6897e5"
 
 DEPENDS = "libbsd libevent"
 
 SRC_URI = "\
-    http://media.luffy.cx/files/${BPN}/${BP}.tar.gz \
+    git://github.com/lldpd/lldpd.git;branch=master;protocol=https;tag=${PV} \
     file://lldpd.init.d \
     file://lldpd.default \
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "9587940ed2314a86774c5499f3dfb13a8eb86232a62d243a83a1f09886848e03"
+SRCREV = "d092902333a89e228b144a1c9b4c41df3b0761e8"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
