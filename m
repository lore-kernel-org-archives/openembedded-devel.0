Return-Path: <rjpdasilva@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB3D77D6D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 16:06:30 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f8so1910892wre.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8Q7MoCMQ2Fk0Iccgrwkz/3MR+kNAwRYU3GMwVmNARcA=;
	b=RfHkPnf2V/kSmYbLCiGNwpYTVV/ZtiodeW5OzJTcNvfMCga6/QjfZKc/R+abfKkWxR
	FawLZp7GnSZoY1ZcjXwCj2S6cX2dIRq96br5HzGc9l0QtFNXaTPs3qhY+9QWOFMcwD3T
	tx7VC202yuxtnG35MF6or8XQ9aUNQc1iSBg0d/o8PGrRqvO0La8I3e2dN6MythSGABwW
	Uom9vJ1HhDdjrFSROYeIFSqq/9EZ3m7i6vryvdDIfvw8dchVwlBOeAh8FiRdJNMyn0lw
	604zOSnwJk0TIXGmkcbE7bUnlpVXZguQ4fgR3fdR4qAMlTZ6yriIhyMQD7E5Y7r6sj41
	9HEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8Q7MoCMQ2Fk0Iccgrwkz/3MR+kNAwRYU3GMwVmNARcA=;
	b=iLvyZn5EMIWXQKI7vfaSqQ+X5ax6bvSGTfxu6qkmHtvKCYKxXyVYQJ/Y/MOoO8A9No
	9gMU0Xt447kJEKhu6G2INvCDCybu6dIXVO5Lh0V3SYqt/QEAU7KXPKg7whzOjJzMypBU
	IUCpBpBNnJRNsIzhiNPOAmtYQXZ7vf+BaWPo5FbiIxVEG3ZR4XmgR60vyp9C4kzS8KxB
	SzveQzTZskwNvWhz69fZOyNCtdeIQoaxRXzVxvy8CRSj0/cIIETVv/FMdht6JaF5dL4Y
	29z5cCJAaNcVZtLxoJ1EILrJm6Mup0IzsWaekQ0vZstiKjOr7e5+MkIEYJ6NAxLgqF9P
	IRlw==
X-Gm-Message-State: AKGB3mL8CAaqjPxvecQSkgRz/vMp5U9SQM7zUuMaeX8hIqTAesEOPkBT
	fR9oO7DbeurHl9ESjC+ER3JVCQ==
X-Google-Smtp-Source: ACJfBounatrkoQ65UMQxqDLGuhBVegZorJrw5zOP971UAPjqBZgDtlIiuhwdJPooMY0CCcf9ufLgrg==
X-Received: by 10.223.166.242 with SMTP id t105mr45387wrc.106.1515081990961;
	Thu, 04 Jan 2018 08:06:30 -0800 (PST)
Received: from localhost.localdomain ([2001:8a0:6606:9100:7f03:4efc:e311:2e44])
	by smtp.googlemail.com with ESMTPSA id
	g17sm1409657wra.6.2018.01.04.08.06.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 08:06:30 -0800 (PST)
From: Ricardo Silva <rjpdasilva@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 16:06:23 +0000
Message-Id: <20180104160623.23830-1-rjpdasilva@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-python][PATCH] pycrypto: Add recipe to have support on python3
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
X-List-Received-Date: Thu, 04 Jan 2018 16:06:30 -0000

The pycrypto module sources can be used for both python2 and python3,
but a recipe for python3 was missing, so add it.

Recipe is basically the same as for python2 (python-pycrypto_2.6.1.bb),
but using distutils3 instead.

Signed-off-by: Ricardo Silva <rjpdasilva@gmail.com>
---
 .../recipes-devtools/python/python3-pycrypto_2.6.1.bb       | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
new file mode 100644
index 000000000..2878c8599
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -0,0 +1,13 @@
+inherit distutils3
+require python-pycrypto.inc
+
+SRC_URI += "file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+           "
+
+# We explicitly call distutils_do_install, since we want it to run, but
+# *don't* want the autotools install to run, since this package doesn't
+# provide a "make install" target.
+do_install() {
+       distutils3_do_install
+}
-- 
2.15.1


