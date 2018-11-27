Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3686C589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 18:44:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q70so15230326qkh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 10:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=tRaIj6zz+9+rafqWOSFX0DsgE794NmUrYXOQBF4ifAc=;
	b=kTDzkw3xAg5FrXwVc7DJTZSkpZ0J0xZP9YUGAdQW+yujMENSllmdqxZdoFUB1puFko
	m4Uczq2s3V+MG3oBDVM1bcIggFoXiK7NOb/OXXuyYcKVNctuyeuNue0/ObMjBKFDU2SV
	ur5r93yV7h3hHVWNQyen7FIKzsJtTbqr/tkEPTmIziB8VcBZ1CpyokvQUSDfP/v8giSs
	lTPOz4B6/1woRMjl31/7mK8RaFCLDxqzSAdDJk7ENMI1EKBtCD0hrnXz0GtQ5XS98TU6
	bAHzQNbl6RIQJAvqBW1r3b832ilk0eohKMOsoTmzyIcUhMlqAG9PdkDxP+HJNlFPQOkA
	VkwA==
X-Gm-Message-State: AA+aEWYyHeSJ29g4B1WUDPsAr7kURJJqa6pJuwwDrF/rbOMrxNUBoCBz
	OxJJG7S6nBZYT10ddktoxCv/5caY
X-Google-Smtp-Source: AFSGD/UUQkla+Az6gLIRDyVpQxsA1Chy7RuVnxTG+37nW1v+eWXOMjS/FnHxwrbmriArZRM1zgj1AA==
X-Received: by 2002:a37:3c06:: with SMTP id j6mr30634781qka.298.1543344263896; 
	Tue, 27 Nov 2018 10:44:23 -0800 (PST)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	f201sm1850819qke.0.2018.11.27.10.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Nov 2018 10:44:22 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 27 Nov 2018 16:44:17 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 16:44:17 -0200
Message-Id: <20181127184417.10514-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mozjs: Avoid use of X11 from host when X11 is disabled
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
X-List-Received-Date: Tue, 27 Nov 2018 18:44:23 -0000
Content-Transfer-Encoding: 8bit

The mozjs build system makes use of host headers and libraries if not
passed an invalid path for `--x-includes` and `--x-libraries`. This
fixes host contamination while building in a development host.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
index 0dfe2f848..440a25b74 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -49,7 +49,7 @@ EXTRA_OECONF = " \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},,virtual/libx11"
+PACKAGECONFIG[x11] = "--x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--x-includes=no --x-libraries=no,virtual/libx11"
 
 EXTRA_OEMAKE_task-compile += "OS_LDFLAGS='-Wl,-latomic ${LDFLAGS}'"
 EXTRA_OEMAKE_task-install += "STATIC_LIBRARY_NAME=js_static"
-- 
2.19.2


