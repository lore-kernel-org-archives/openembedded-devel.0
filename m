Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD837F899
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b10so16034614pgd.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nMNloLatl2sUvxTXHykZO3O7CCOCcpLO8NJiab7qcU0=;
	b=U6zCwgjjT4pb6+9ZLFpSzPn9hC5Fbg/3WACltj1f2OV7PNjjj2z/ZQ93GGM1c7EeuT
	b8WnnTXKizm0o2HFBxmEy8/Km+VCeIXrDf/sY+9hkiDn2GcR/zROqjPI6oYYL0gvglR6
	XsKPEWGW+R0/owBz7TdP2iTmBaOjf16EARqm3MTreGIQyt8yUrDDuk4IBdp3OiErL3ud
	9N+8WMCCfIq5XJNsq+0yn6eS2geHkSXww94keia8SKXhK7rxSQK2NZJ+o+AiZ8SVNaSt
	Ale4gu9PaWUF1ezolJMiuK7gQmUjhV8Tl0HaHRtHjYTQZf0fcuRuWORgEXmxUwuyGkXt
	ZmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nMNloLatl2sUvxTXHykZO3O7CCOCcpLO8NJiab7qcU0=;
	b=fIT0cxQ7buj2aJxWmdt85MCK7MJqhK9t8/0i1+M3V3sbzsRjAANLVsDFubG69x3P68
	pPvoU1KDD1tOTAkE0RN1zV8PUBT0bBK/KBDtOy0magE0bktopNer0f21XZrAH8wvgUhz
	CCgwZwEuQ4N+FyQf70lmP8wJZi8rwVLi1IO2r/cPqt4noO14Nb0Y3OUZCQOpQZHBKR79
	k3Pe3rWL8o+xxiGbM3Vx9IF/P6Uriq/1GIB1PAi4pusfNJBwp35EtnZav8oG2vNpnhVo
	VFmUpWYwSLwapTtcf8B7caEgnV444BLYpwsNQnMLDY4IghJboKnmkTpYJH9f/u9aMxbR
	AFQw==
X-Gm-Message-State: APjAAAXIvraHbfPvvblyWbp4KRVTzYOHqc+qqGDvAfuD4c+YDAlBsr9/
	8OHYJdFl+DETlgjp6zXBhgRXzzI9
X-Google-Smtp-Source: APXvYqze+ckX3r0u5ssszlxOHU0fOOEfqE5ypi1hOtJdLw58wQvAPnVlBKMov526DmgHcPE+4buntw==
X-Received: by 2002:a63:fc1d:: with SMTP id j29mr18013751pgi.343.1575137455982;
	Sat, 30 Nov 2019 10:10:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:37 -0800
Message-Id: <b6d1134bc84b909d91fdbd6313699d6ba4c4ec98.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 07/15] samba: fix installation for minimal build
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:55 -0000

From: Andreas Oberritter <obi@opendreambox.org>

| chmod: cannot access '.../image/etc/sudoers.d': No such file or directory
| sed: can't read .../image/usr/bin/samba-tool: No such file or directory

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/samba/samba_4.10.8.bb           | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
index d824eac..4ab8b26 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
@@ -189,15 +189,17 @@ do_install_append() {
         sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
     fi
 
-    chmod 0750 ${D}${sysconfdir}/sudoers.d
+    chmod 0750 ${D}${sysconfdir}/sudoers.d || true
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
     
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba-gpupdate
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_upgradedns 
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_spnupdate
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_kcc
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba_dnsupdate
-    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-tool
+    for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc samba_dnsupdate; do
+        if [ -f "${D}${sbindir}/$f" ]; then
+            sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/$f
+        fi
+    done
+    if [ -f "${D}${bindir}/samba-tool" ]; then
+        sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-tool
+    fi
     
 }
 
-- 
2.7.4


