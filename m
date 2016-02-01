Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9C69873289
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:19:45 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id x125so90548873pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=63MBfMiQEdD0u+KqR6usxt25EaP4BfrxQTmqAaDItm0=;
	b=rE8V3pZn6BPNMByyVurQ0TcCymFT0oMtUtql/f2AmBHwx/vpRhnS7o3zw7Vg2Gs3Pz
	RbSTTZvpK7qNzz9X/ZyGItK5Meq8ew1n4nrSp4SuWVNLciA5hpvCmNp1yllduvZMRXVM
	YIUhOYPtB/S2brDsly7Rdmw24TQyApI6Ea5cSETV7yhDXT3JD4OfE6/h4T4TkWgwwzCo
	wnNrxIJwspAnySrSansjeIjRzkAzAc+TYaNXZe95IxhExAb+0QlA34YJVOkQuoMUlkHM
	+oLUqSgumnnScPBmeIVe4qvaia/8xrXy5goenzzLGZ3TSEf+b9PbK5LLZm9Q1P+4JCad
	wRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=63MBfMiQEdD0u+KqR6usxt25EaP4BfrxQTmqAaDItm0=;
	b=fy8v7LTjoMYnqh4CW2GaPDwpgD8eZMEAK6hIX3vyH257+SgILngXqRsprDmEQN65+x
	ZsWWaKoHML6r40lgIcxXtSZlqSioJzJw82rR9mJ5+VivM8bKr4BZRebseLi+LRI/iWL9
	v4It+UV8LL8cEaZ0PLAwh/2gOiCP96ovYB12QFMKttgSJxFlnnYqS0UxOmaTLwvqqWm+
	zyCrQlO68zCeaBfw/+pfSc2FrnDj196FhsKx9Rl2N1T1Q7R/YRQXsKh3ZjCMoo6INvkB
	xvbNdmk7PuZasXbf4efeINnDSA2iIoBlGQMIQFa6vBaOcsVkbuw2wUVwB84m0cKUCJob
	Tf2g==
X-Gm-Message-State: AG10YOS/YV0jHLo0slNYMhed1CNNkgcmj8WNnSKydtUFxGdpA0bH+lY67shQwX5NFNrZOQ==
X-Received: by 10.98.69.155 with SMTP id n27mr41862722pfi.68.1454361586138;
	Mon, 01 Feb 2016 13:19:46 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	t87sm26722124pfa.14.2016.02.01.13.19.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 13:19:44 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Feb 2016 13:19:39 -0800
Message-Id: <1454361579-12806-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-multimedia][PATCH] gst-plugins-base: add perl runtime dependency to gst-plugins-base-apps
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
X-List-Received-Date: Mon, 01 Feb 2016 21:19:45 -0000

gst-plugins-base-apps contains /usr/bin/gst-visualise-0.10, which is
a perl script.

Note that the gst-visualise-0.10 script was dropped upstream prior to
the first gst-plugins-base 1.0 release:

  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=227be98c0b65a1616c0d0689db6fa7576bcbe434

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index aa6b3a1..c86834f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -38,3 +38,6 @@ do_configure_prepend() {
 FILES_${PN} += "${datadir}/${BPN}"
 
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+
+# /usr/bin/gst-visualise-0.10 is a perl script.
+RDEPENDS_${PN}-apps += "perl"
-- 
1.9.1


