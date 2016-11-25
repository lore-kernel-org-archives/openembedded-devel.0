Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFFD71B98
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 15:18:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so8139395wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 07:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+u6OAgl8g4yOsif5LF3uJdkhlZ0k3hXLS3Sgiot3tEM=;
	b=a8LDpbjM66SF5Dt/uHe8RA1KQj1asz6s8ZqSQPCZOjAwHp4ZH6qIJ53VlHEjCX/Cxk
	YiOvS9MQg83Tk8ATwD7lNWI9YJk9QhrhDnC4xno2mgCexKnJR7gvhwsHq8zrFU+lRtYw
	VBNAq8MkCaB7n/ct26OLgbS0QHJxwEUo/3khweZ20UWtbmdezJo4hzsUFFYXZEujjLwi
	dCGmJosHyEIyHmh6T06O5swaQ13NbfpWzQ3Lvt6I14awtfTyrOCFRHIMItf2PvTR55lw
	aJ3vUsKfmdpBk9UfbGSOmv+br04w5W+9J9v2JHKUZX+MM/AS0Y9K6diDG4zMrxWIMHFy
	t76A==
X-Gm-Message-State: AKaTC02HXW9U1LJj4hS3Q+9Gb6if7bHY043nmaKsxUT4pss6MNgWZ9EUI5OfgvuDLJqZjw==
X-Received: by 10.28.191.130 with SMTP id o2mr8576194wmi.97.1480087087163;
	Fri, 25 Nov 2016 07:18:07 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 6sm47458981wjt.5.2016.11.25.07.18.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 07:18:06 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 15:18:03 +0000
Message-Id: <20161125151803.22278-2-git@andred.net>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161125151803.22278-1-git@andred.net>
References: <20161125151803.22278-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] meta_oe_security_flags: disable PIE for libdbus-c++
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
X-List-Received-Date: Fri, 25 Nov 2016 15:18:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

The short version - it ain't working.

The long version:

For shared libraries made from C++ sources, configure
runs some code to determine how to link shared libraries
(from libtool.m4) using g++. In particular, it calls
g++ ${CFLAGS} -c conftest.c
g++ ${CFLAGS} -nostdinc -shared -v conftest.o
to then parse the gcc -v output.

If CFLAGS contains -pie -fpie, g++ adds Scrt1.o to the
objects being linked together to form the final output.

Once Scrt1.o is pulled into a shared library, it becomes
impossible to link this DSO against a final binary. I
didn't investigate why, by I suspect because of
-Wl,relro -Wl,now

libtool takes note of Scrt1.o (and all other libraries
added by gcc, but those don't matter here) and adds it
everywhere a shared library is being created, see
predep_objects= and postdep_objects= in the
'LIBTOOL TAG CONFIG: CXX' section.

In other words, the the shared library created during
the build can't be linked against. This includes
some applications that are part of the libdbus-c++
source tree, but also any other external user.

While I am not sure if the root of the issue is in
- gcc (should it really add Scrt1.o despite -shared),
  or in
- libtool (should it filter out -pie -fpie during the
  configure step), or even in
- OE (should it really be adding -pie -fpie to
  everything, even shared libraries by default and
  unconditionally),
we can make things work by using SECURITY_NO_PIE_CFLAGS
instead.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 2559948..f027008 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -1,4 +1,5 @@
 # Build errors with the pie options enabled
+SECURITY_CFLAGS_pn-libdbus-c++ = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-lvm2 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
 
-- 
2.10.2


