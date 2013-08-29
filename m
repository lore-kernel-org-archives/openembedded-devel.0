Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5F64E6BD7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:06 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so341690ead.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=+mx8sZw7XSdmXaWUDpz1o6Tu6QFEWBOJt0zmPlqztOw=;
	b=bIPt1U69oqzywHP04WCBR3+gtLUXqwe58iR9GkGnEbVLEl4f594DpECUzUbOpX4KjP
	VrWwy++yk5EQ8ULx4FFaqNOIzSfpGFw0rocPEWbiI/Lm1oZfA3oGuhBOkp7HREZwBwYs
	nTe6OF6uB8ac2e7aDDjvZt1rvvk+18jll8Ndq4z6YO9xQyjmn6PlNC9AZKsNWrVNihVd
	xVpKrQH3jjv1DQcwpXZ3V4s410QqhJUltLTcIVSLLea052XtVlFhDO7S7BqVcAd2XCnP
	RlzNFjNQtxGqAR5+bGOjsl8odrm+5mkvxV858aEJw1nZlzwr7dUkYJlR8IQUDo2eI1rk
	We/A==
X-Received: by 10.14.199.3 with SMTP id w3mr5409820een.33.1377791526799;
	Thu, 29 Aug 2013 08:52:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm47166189eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:51 +0200
Message-Id: <02381636ac624c0f1ecc6b5ff43e0f7d9ee254a7.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 58/66] tumbler: Add PACKAGECONFIG for gstreamer
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
index 3860716..a4fe817 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.29.bb
@@ -16,6 +16,9 @@ do_install_append() {
     ln -sf ${libdir}/tumbler-1/plugins/cache/tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumbler-cache-plugin.so
 }
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gstreamer] = "--enable-gstreamer-thumbnailer,--disable-gstreamer-thumbnailer,gstreamer1.0"
+
 FILES_${PN} += "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
-- 
1.8.3.2


