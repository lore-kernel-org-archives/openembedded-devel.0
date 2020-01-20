Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id A0E847FBA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 01:55:54 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s7so6327774pjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 17:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IFEU3jN9mt2ODpUjali5XO7IM/0iVI390Oz5NjBxmkw=;
	b=mCjTDcwAU1w1UDjNOPVucTHz4+ufTWOBNJJSjvxMWsP+i4w0/dBjyIapWdtQC5lPQx
	n09l1WJmpEqQe6AxQPgSTIT9VnYPRUNb4zFL2Ofx5ccgdoppkzSblx7+eeEOltgE0KE2
	FMvHlcQWPh0bjvPMefxjcR6ADRnsDW+9JuBJEG0CXVoNZ19VBREM8gWDLHOJF1pQFUAH
	h3paVf/nRqL6wc+Ddx5L0mv8ZG/H97f+CiygeEVEGet+3Treatymck//8oxbAVnI0+af
	63ChGh9cMeYPL0lxCtZKcZQ08Qb/qQDg4S6rG20j5dzu0MCkJalCyv6ESXZxYJMH0Jjy
	pa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IFEU3jN9mt2ODpUjali5XO7IM/0iVI390Oz5NjBxmkw=;
	b=MST/DT/CLd5nEyQiXHGfp1dL2y0e+aBZEMLDVPN04Wc3q1WmTatwWHdm9u4nrW3yg4
	z3i3ndReRhClqu+d2cyUg+2J3bpZE2gH3ce3u5ToOXbypBIIje5S3nlZe0R73jbAS0Ih
	6TCCV7C55rt8Ixb5dr69e8qArfDltAD+eLAGcwoChq4D8cmrAqDu1j4mfv6PgfpcG5mD
	cJfjOpgci4+SCWV/GBn9nDvGRVFkIA+e6on0sMXQVoRXaAqrXa38NXL+BeJkzX2avP3j
	RDGIyibIk8vMtPX1+9Dc7TX2cGcMB0FAydaDwnoaujrIalZ9Dd9qKvl8RPK+qHdjriUj
	azbg==
X-Gm-Message-State: APjAAAXYVTG9wLiIE4zcnERCGvYmMsBCCYwVV+UDyXqRJVXffhFsBoIX
	mvr88vx28yKKT9BT7hkthv7MhxyXVkk=
X-Google-Smtp-Source: APXvYqzIr5y8kyU0r5fN/OJfAUrJ3mYpqtl2DgnsizYbpFdLKCkdgZnJTC+26MOlFcO4pAZPdF/i+A==
X-Received: by 2002:a17:90a:246c:: with SMTP id
	h99mr21028440pje.134.1579485355749; 
	Sun, 19 Jan 2020 17:55:55 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	m101sm15318488pje.13.2020.01.19.17.55.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 17:55:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jan 2020 17:55:34 -0800
Message-Id: <20200120015534.32752-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] packagegroup-meta-python2: add pyton-soupsieve
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
X-List-Received-Date: Mon, 20 Jan 2020 01:55:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 8ee9bad9..41ba3abd 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -57,7 +57,7 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-aws-iot-device-sdk-python python-constantly python-bitarray python-flask-wtf \
     python-parse-type python-ipaddress python-dbus python-cpuset python-distutils-extra \
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
-    python-netifaces python-configargparse python-sqlparse \
+    python-netifaces python-configargparse python-sqlparse python-soupsieve \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
-- 
2.25.0


