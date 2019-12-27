Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 038627CED3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b19so9111294wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9J08pr9wufDpImxTVPcWXkv2Um6M0RDS9lWReDKojWw=;
	b=scFpQBGnvVh3UYT3yJxvOdQgcVSmNBw+2CP69EifRCt5aTsCX8bNhEuGTEnmfn/k6c
	nL3y+E2cn/O5uIxB1a+DE7RwAfee0TtFc/sQyOs7s7LrqQsy9gcitwGE3gxdUVek5o9u
	4aVsRQVLPY4FWzhz8AM5wViKPQwVVHyMO82JYDywJg4EopwesvwEEMPRcyvFXCy+g8Uk
	WQTTA0SrZJZ/7zrH1t4ZQVvwxxtB7K69OYvMyOU4Rnagq77uOtk2RiQVn5qA973Z7ODJ
	jHGSyjjdrKJXOlMje03naxRUSj9ZzCB+gwk6vnqNrqQLL05N6JMINEHnbLBKTslJIMiE
	d5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9J08pr9wufDpImxTVPcWXkv2Um6M0RDS9lWReDKojWw=;
	b=lmsx08WlY3d9ppEcN6pNXreFpeZrTrzk8fb3yweYjJQd4tUAeMjVc9gcbZaHCB/VG4
	Rf/tQsC1knEiP802XEwkn6ayFVYp0mP63lrfk/cuTWtEP0Tt9NNmXryzwPtQ6rTiM3zn
	jl3DQAeg+WZHIIRmaLlRL+k6eWgVHmBBeXWhcpy6uM2dz6d0HP5997H5JgkFpKmJA44C
	9y34RxEa+Vtfht8hTqCdm7RXgUQ0Liqc6h7NtY4jp7uVFxY8ndgu0VfZVhktCE6LtDTQ
	gxeYt7dmNHICPPLqICKW1JplTtvDtI8/oX+zlVp0H2Aa0p15yFXVd/UR8L5rkqjSq5cu
	ZSHQ==
X-Gm-Message-State: APjAAAX5BYcB0rsi6C1ZfGZWFpxA9KoNIyrOdyUM3hJ3V4T5YW6qnTYG
	6Rh2/gDpjEP84AOND35HvfKygYC7qjA=
X-Google-Smtp-Source: APXvYqyVbtmoZt4q/i6qHYISzRNvwkvmx02kY+RI62R7aYPMLQBz4OlA0iiCHDY7OsKDKc+8iz7ISw==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr21694051wma.78.1577482305655; 
	Fri, 27 Dec 2019 13:31:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:20 +0100
Message-Id: <20191227213120.3930-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/23] yelp-xsl: upgrade 3.34.0 -> 3.34.2
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

commit a18fa29f9be524d08e739b18013eb8e8bd4da64c
Author: Danial Behzadi <dani.behzi@ubuntu.com>
Date:   Sat Sep 14 20:47:26 2019 +0000

    Update Persian translation

 po/fa.po | 396 ++++++++++++++++++++++++++-------------------------------------
 1 file changed, 160 insertions(+), 236 deletions(-)

commit def23391ba926c4038c82c24b50976c5a7e1713b
Author: Shaun McCance <shaunm@redhat.com>
Date:   Mon Sep 9 09:25:23 2019 -0400

    Version 3.34.0

 NEWS         | 5 +++++
 configure.ac | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

[1] http://ftp.gnome.org/pub/gnome/sources/yelp-xsl/3.34/yelp-xsl-3.34.2.changes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../yelp/{yelp-xsl_3.34.0.bb => yelp-xsl_3.34.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-xsl_3.34.0.bb => yelp-xsl_3.34.2.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.2.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.2.bb
index 20052cf16..38947d1be 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.2.bb
@@ -10,8 +10,8 @@ inherit gnomebase gettext itstool
 
 DEPENDS += "libxml2"
 
-SRC_URI[archive.md5sum] = "f8c4e777aee8b055251c333ef48a0cd0"
-SRC_URI[archive.sha256sum] = "e8063aee67d1df634f3d062f1c28130b2dabb3c0c66396b1af90388f34e14ee2"
+SRC_URI[archive.md5sum] = "b9c1c53a9114b42054789f212ab37f59"
+SRC_URI[archive.sha256sum] = "0c3fe6146113df26fb1295901b1c7baed9f0fe67a87f4345e11543aefe7cb7ad"
 
 RDEPENDS_${PN}_append_class-target = " libxml2 itstool"
 
-- 
2.21.0


