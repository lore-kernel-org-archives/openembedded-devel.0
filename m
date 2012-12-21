Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tm39B-0002K9-45
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:00:21 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 05:45:35 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so3531186lag.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 05:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=bwtGfgatVD7h9dZQiutWt60siZpVcSkj2QWF//9QHAU=;
	b=l4mCcqZErTMApezQE3hEfBtxo2Q+KidxSasgbNgBxswqfElNTsmTo6UF7KtAqFRxf1
	KE9jOXrj8hmelMSmlOvOBHTga/S8NE6XjMotKaPqnWuofOev4NQd0W9gq9Nan0tp8Tbf
	lHZezrmcGw3DMxW4JoouBz3d23+P8MhHMHLZP5rtBncwbDnZYHqSdfuuilgKJR10r5/9
	pVYYn/ydiI6UpzGBvUOGRbXR7i1riKPLd+bg5Op5BXXpepLLbG1rwwMWlXMPhCVYg6nq
	mYpvy5EY20pNfVTsUBEiub8KR+7Br5SVIIpJE+PNdidT6kY2Nqw+ToPkjGQIdDXOJcLT
	Zvxg==
X-Received: by 10.180.73.80 with SMTP id j16mr22994523wiv.5.1356097533604;
	Fri, 21 Dec 2012 05:45:33 -0800 (PST)
X-Received: by 10.180.73.80 with SMTP id j16mr22994515wiv.5.1356097533547;
	Fri, 21 Dec 2012 05:45:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm20701213wib.0.2012.12.21.05.45.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 05:45:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 13:43:42 +0000
Message-Id: <1356097422-11920-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
References: <1356097422-11920-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnhz91k9+8h7WcCJ6kLHVep2dPkAOV+N94DfATsWr6dr+cDIlLgR7QZ+w1ytxvlm/s96a86SIJ7StzlEceDlr1YSaH+utPuYfw3sBmgk08TZTHZDjtoWRqcQFmQyC38u0strP/hnsv4rVVJrxAJbv+c3zosJUolmQ3FGpORMY849eUOT+HC7qtqDc9hpy2Wzu6rRnP8
Subject: [meta-multimedia PATCH V2 6/6] gupnp-tools: add 0.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 14:00:23 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb         |   11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
new file mode 100644
index 0000000..7a26453
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Tools for GUPnP"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://src/network-light/main.c;beginline=1;endline=21;md5=033bf37c030780c5a72165846b3003f6"
+DEPENDS = "gupnp gupnp-av gtk+ gnome-icon-theme"
+
+SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "cafc2a4f2d1a91a8c1228799073d1d7d"
+SRC_URI[sha256sum] = "57d5ca899f8da7e4ae69e5f98d75d1603aa7f388022f9ccb357f90abb22b75b6"
+
+inherit autotools pkgconfig
-- 
1.7.10



