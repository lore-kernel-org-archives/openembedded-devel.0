Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD4E731E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:09 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id 90so56324962qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=LynFynGxSyaSHiNzA5GrouWLrAjxcPetW5N8ALLyaSE=;
	b=lxZgGA8mLk21i2iEjNzFjg97G9SPD0N6zO1eScecIewF4XRhS740Xz31Vic7AgRHzm
	Km48Y3gecRm0KGffxXDXEz39zPtuEhXvarG/4bMYlb3NiS5/TwDlpw9hZKVe71Jnu39R
	n1SdWdV8GD3/NMJwrq4qFJS0kgw+tWgEqLo+KanLBbjOYbUbCwtpltxKDcLXlqw5JOyD
	82HtMGrLBPtgdU86n3XY/6gRz2so0bRlHCDEU15B/xwc4snRnHQjMYPIGrb1Y1k0VYQb
	u0P8bjp13E2weuhFRRJRBsX5fsgrGfatah8D+EI1rHv5aqi5YPyAbHHCaSRgE3Uxig7m
	GMkg==
X-Gm-Message-State: AOPr4FXX6obAZTHIkdtHgz5YYnJAarIYc9GjRlBQ2rAu5FAPTKK8Mm64pND/QOoQy2fKow==
X-Received: by 10.141.5.197 with SMTP id h188mr2202436qhd.97.1462543270588;
	Fri, 06 May 2016 07:01:10 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c68sm5783399qgc.12.2016.05.06.07.01.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:09 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:01:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:39 -0300
Message-Id: <1462543259-7206-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 02/22] dovecot: fix QA issue and remove from blacklist
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
X-List-Received-Date: Fri, 06 May 2016 14:01:10 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Modify FILES_${PN} and FILES_${PN}-dev to fix QA issue and remove dovecot
from blacklist.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
index bdfd5a2..d7a7cc5 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
@@ -59,9 +59,9 @@ USERADD_PARAM_${PN} = "-r -d ${libexecdir} -M -s ${base_sbindir}/nologin -g dove
                       -r -d ${libexecdir} -M -s ${base_sbindir}/nologin -g dovenull dovenull"
 GROUPADD_PARAM_${PN} = "-f -r dovecot;-f -r dovenull"
 
+FILES_${PN} += "${libdir}/dovecot/*plugin.so \
+                ${libdir}/dovecot/libfs_compress.so \
+                ${libdir}/dovecot/libssl_iostream_openssl.so"
 FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
-FILES_${PN}-dev += "${libdir}/dovecot/*.so"
+FILES_${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
-
-# http://errors.yoctoproject.org/Errors/Details/35133/
-PNBLACKLIST[dovecot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
-- 
2.8.2


