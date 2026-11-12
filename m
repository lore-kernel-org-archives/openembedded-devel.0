Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6945.1794458710459515217
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 20:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=REx5CUhT;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1914976b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458710; x=1795063510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+W+3ebitfH7Z2kx9Dq0ky1ws67GrYQknPDAcWL2i/bE=;
        b=REx5CUhTRf8aGCHQhrr+NelpH9fEsXyUw/MoOx4Tf3HP6GUBaGfulNNWhMdsIqCK7a
         H4HP4aTfwMexzasp21x/iRczqHENdjUbvJ+a2EORmSqw30dw+NxdpTzBSy8XeiCRIvFh
         c93zoope93sgvTZkIpG4pCsvtFESInmXWzjrj3hLGOEfNHHbSz+Qc9wq3o89/MLAUQ3t
         sh125biFzMkFPy78d1nPQdj3YKOqSFjTpUQFHnO1EuLuJhDQf/ND4K/Ix4vteI8+Lc5D
         rFZ2hgiMuGVwF8CNOVWH7pYvQ8R2K/B81UESLBNJLGzeNURwMcuMJBrXfOtokGUm//8b
         PWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458710; x=1795063510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+W+3ebitfH7Z2kx9Dq0ky1ws67GrYQknPDAcWL2i/bE=;
        b=2OQxhd55nNa1MZ8gH/NYqi//OSVrWgEbBcYPdb50KBruH1rUu4QfPicVlL7Lksgeju
         M7VNWLve9qfTiWqMgs5kYYX9KDeaDIoAl3aK9/MbK2rPfwrRA6zY+ldlIMurPffK+WUB
         eGKpaezVLap8+e25f8dFzPK+8nbJ+81QHOXcWO584YG0IhhZPx3I9Ue/y8QJigPQrIwi
         zknsrJXqynBbOHxeiem7Pd8Zsz1sfs+x31q8gFoeaPVZb/43XBJXFe5GMgS8NbrQMHal
         5AE0gJBWCVmhsRTRnF72RkJfRUTcMe8dHXzVHquA3SFvr6yU/EOuuOQbjMAvQ9xgxY5A
         E6vA==
X-Gm-Message-State: APuU4Z9hwr4MN9QhwaWXAmdNpyII1IiRFry8jEVf/DpMhBZ4iW+SJcyZ
	/OgZvYC9whGY3umEOpiksjMxMulLzHJ76H6R9USph2OlI9r1MsaDL+nRahsT+A==
X-Gm-Gg: AYBFou0KZy+GhD1dfCtWzevE/l1fvQwkDpS/kRHE5S/fVlC9dx2noM7wgRcNsHiV/ah
	dbRLkqk0oyzZqSuAYoT79rjdGRIguZB5ke9cQQClxONudlDmw3OyNSYbvQksZpmyiU9O9OM/ZMy
	fVErSRVlpIG1xIitrFyznQTW3at9aE/HKlqg9y20sZJPeZasbsSwIpTc9IWTNYDNhuKg1NnjiIc
	H46AA++cY6KyhF0td8EaFl8PrUg7pn7TpzDWQTR5uWCBLvdu1ICu7TCMzV/Z6EU1ZS7Pa33udU6
	a7ojkZvwF6PlgRUku9pkhN8C3pUK/JFB2cNGf/fQjr0STVdz2HoOznU89+MAY8SNE4t2vREzvGR
	OryfNfRkb/koafwzFvfRSa9O46s6MKPT0Fl2Ob64pL9SRm2n8ENRe+1NR1rBH4Rotdsv8UvR68C
	/EJNfpsWKzkfIzjBXY+qd2cl6r991SR0NJ2xJPiEo+SsSc9xv/DZOiBhKdBTBOy381sEOVCutD6
	a0LltdOZfDODI1ip5FYJL9jsNDDCnKud296Re80VcAIYiZ7UAyrKpDSmRNfPBex8iy9WVylOBnJ
	/lqmJ07bcyqTsR5vepMS9VpnDK+QAxHbbCDLEgl2Zm8Dvuqo7eTISTrfrSvMjquGGpl6Za1PQIr
	jQNOHd0w=
X-Received: by 2002:a05:6a20:cf88:b0:3e0:c955:cd5a with SMTP id adf61e73a8af0-3f2ffdc33demr5004318637.68.1794458709764;
        Wed, 11 Nov 2026 20:45:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm2238527a12.30.2026.11.11.20.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:45:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 16/16] python3-filelock: upgrade 4.0.4 -> 4.0.12
Date: Thu, 12 Nov 2026 17:44:26 +1300
Message-ID: <20261112044426.3933391-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
References: <20261112044426.3933391-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 04:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132167
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-5
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-6
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-7
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-8
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-9
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-10
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-11
https://py-filelock.readthedocs.io/en/latest/changelog.html#release-4-0-12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-filelock_4.0.4.bb => python3-filelock_4.0.12.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.0.4.bb => python3-filelock_4.0.12.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb b/meta-python/recipes-devtools/python/python3-filelock_4.0.12.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-filelock_4.0.12.bb
index 23cc4484c8..cfb84f1c7e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.0.12.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "90999ed63a26ccf86b93b959ab10cf1017f422d816be454ed54cbed263e71ab5"
+SRC_URI[sha256sum] = "cf42711a7ac791818b299fab0332a088c65aeeefa36290de98db92c434303b0c"
 
 BBCLASSEXTEND = "native nativesdk"
 
