Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id DA9547C420
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:35:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id r2so5639906wrv.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QljvcId0O4TJ/+/O3JdBD7DGyp/SADfwg20mubE0iEw=;
	b=vhWosDfn5KT9nRuUi+sVaO46eQ70S+OeVTXNNPTGUJa99rEzSPkw8lrUvPJB2MTvIb
	6SvVUQAWAySbUtbO1rpvtlAJ7D3B+vx1Qf1LxK4thXUB/5g43SuoP7RArraFe/djrVOU
	OJGtDPybp1lp6VJ60qavqKqP00EBSKOhoIL18IyH0JFwXlzROcf0fj2IEBJglInzGUNc
	KNqaeqt6Jzo42ccssQo7N6k4B0/JvpeGG29RnXFBljx2FX7MB6LOs6tn5qZ6SrufkvlE
	imBPwPYayyrjJ7QnF6NV9YkqphhGOw6zOU6I7b+2XUqXKm9JsHpEbhue6rCAB3wKit/w
	4fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QljvcId0O4TJ/+/O3JdBD7DGyp/SADfwg20mubE0iEw=;
	b=TUXlVsosKKDhgpxkTXme5a3M4z/1jTa5p+8sBsrZLrE8qbO2bnb5lZY53hSnYS/NOY
	CNmI8kCeU9RXQjVn0yWQxztWpeBEetPqbtXf3/VUN4mNOpdaLdJDyFg7qpsQ4pmsXOvn
	4lPIkV+GCxeVovkLglVSHtDK5k8v589SYdcR7mVnla4Y4cacfW/iALS7rESYR6xrOWgn
	JKBa6yJyfRsrlui0y32DrRgtj46mfiTNuFYKcZ+JcPcysvmhoPPy4cDcv9qAjtrRCUQg
	5B2zfSdYSY/LV8MPFhWZxVPXBCC3qKU8a0ocSlhrU2b1AA0YP+INA26yVRK/WY9lryay
	aD2Q==
X-Gm-Message-State: AHQUAuaNK2Lqd0HDY4Tq26niGt7RT8impmyx1GWsorbTjTRA1ZxMhxGw
	UtjbpdyO+0v2PcMfXLIdK3pqyt3x
X-Google-Smtp-Source: AHgI3Ia2fTQK0XY+4sKm1X4APJpVYZoBQmJmAyd28XEhN6+z2R5lE+GLod8CEwfklV3rPGx3OwvjOA==
X-Received: by 2002:adf:e80c:: with SMTP id o12mr1946133wrm.114.1550136951424; 
	Thu, 14 Feb 2019 01:35:51 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id e6sm1258232wrt.14.2019.02.14.01.35.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Feb 2019 01:35:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2019 10:35:33 +0100
Message-Id: <20190214093534.10835-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214093534.10835-1-schnitzeltony@gmail.com>
References: <20190214093534.10835-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] libsass: initial add 3.5.3
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
X-List-Received-Date: Thu, 14 Feb 2019 09:35:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/sass/libsass_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/sass/libsass_git.bb

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_git.bb
new file mode 100644
index 000000000..4c229cdb7
--- /dev/null
+++ b/meta-oe/recipes-support/sass/libsass_git.bb
@@ -0,0 +1,13 @@
+SUMMARY = "C/C++ port of the Sass CSS precompiler"
+HOMEPAGE = "http://sass-lang.com/libsass"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
+
+inherit autotools
+
+SRC_URI = "git://github.com/sass/libsass.git;branch=3.5-stable"
+SRCREV = "39e30874b9a5dd6a802c20e8b0470ba44eeba929"
+S = "${WORKDIR}/git"
+PV = "3.5.5"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


