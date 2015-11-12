Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id ED648771C2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 05:10:52 +0000 (UTC)
Received: by wmww144 with SMTP id w144so185369813wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 21:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=GJztJreLSqDPdwMZ1Keno5iwRQMimAqFelhfkIrPvTg=;
	b=ARhgnrA9mDWs0ZgCCBN88W/F96soy6tkO5cG8Eq2R5mEZqpRX4kmtFn4Fhbvvvsd/H
	5KP5ERxhPs3/YIRVkEOUyJSHws3WV9GQ39XpFIPzi2qLLeVDrrXleEksGS0V1E7d/OaH
	9odCts6e67mSUfx7/80dZ7yzlKgi+Z6tumaCU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot_bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=GJztJreLSqDPdwMZ1Keno5iwRQMimAqFelhfkIrPvTg=;
	b=tbsNXvi7vJyqgvbjmn8AzbEvB1blTM8182oTteHGZlY9TTWtFIxUuBwu/pyxx6t9e/
	LMUotmvcvp0c7K2QFgjS6+wuewGD90CFjxdzyujUo9ikFWwdypi4QjqMSrXcy4Kjm1ju
	iUyS5bbmTCAqheGMbXmw4HfHHElLR7n9s6SpqPCnE1w+n815nMLL5jt1AnjUaH0tm9/J
	OadSScq+NedoHkWOgzBhzYhQnmf/RYntuX3q1Ih5oiiwi4YwBgCKUls+AAUmXFNqyNwO
	xQdfMijpyIit0FjjlelcskF30U6kc0mtc9azS/aFhKVk4W+sVw2yckgAPpUokNu7Ar5l
	2Nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=GJztJreLSqDPdwMZ1Keno5iwRQMimAqFelhfkIrPvTg=;
	b=D72XL2YdM+41wPklzqfiIHFBwz6jczo5leOwwnDW/dVk9yq3Ht0HJt/e6n4yNI8KPR
	EdCj8CPmc5zTctdmbpCnwyZ2dOOCAZXGnywYd8Xfls56LXpwvxIwwf70O8MuccxXFw85
	tJsCUAGxua8ql7Arh0SaU4Gf0nVhs+hpytXeDjD0ROmTo0cKr0YQOSfmpR37hA9CX3aP
	l+ZNBnxodB/GTTClo1/DvVO/ZAl0/dLItTvHDYdwPeENCW+D2lVJho9FfEROnHBEoLKr
	a68Z1OE5gEwU9/sG0/kE+2aXrnGx8FdQOXSaGx5S/NoY+jAGxTl2oHPs9ncIQ5AYMR00
	kbBA==
X-Gm-Message-State: ALoCoQmYbnifG7TF8YlO3kn0qB+63T4oGe7mL+mezxmue8qGdH3fKjknWysVXfplBPyoq4mU6p35
X-Received: by 10.194.94.137 with SMTP id dc9mr15741834wjb.48.1447305052267;
	Wed, 11 Nov 2015 21:10:52 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-234-219.w86-214.abo.wanadoo.fr. [86.214.17.219])
	by smtp.gmail.com with ESMTPSA id
	197sm28643050wmx.23.2015.11.11.21.10.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 21:10:51 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 06:14:37 +0100
Message-Id: <1447305277-4751-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-multimedia][PATCH 1/4] dleyna-core: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 05:10:53 -0000

dleyna-core is a library of utility functions needed by
other dLeyna packages (most notably "dleyna-connector-dbus"
"dleyna-server" and "dleyna-renderer").

It provides APIs for logging, error, settings, task
management and an IPC abstraction API.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../recipes-multimedia/dleyna/dleyna-core_0.6.0.bb     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
new file mode 100644
index 0000000..a3b2793
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Utility functions for dLeyna libraries"
+DESCRIPTION = "dleyna-core is a library of utility functions that are used \
+by the higher level dLeyna libraries that communicate with DLNA devices, \
+e.g., dleyna-server. In brief, it provides APIs for logging, error, settings \
+and task management and an IPC asbstraction API."
+HOMEPAGE = "https://01.org/dleyna/"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://libdleyna/core/core.c;endline=21;md5=139cba0c634344abc9456694fbb5083b"
+
+DEPENDS = "glib-2.0 gupnp"
+
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "27a3786ec013f64fd58243410a60798f824acec3"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
1.8.3.1


