Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D97D56FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:21 +0000 (UTC)
Received: by pfbo64 with SMTP id o64so28452313pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bLAzR/erdaphY/ERq3UN8VEFDDwaIT+mqs1Ub4mJaIQ=;
	b=vwFATI5Ml+KqgYPvPAVU3PmuzEj6ol++78EkHas8YxSA3nLShXCAnGno8kXEc+yCF8
	0c7pKZffxpVRpLv6x49Dy9gG/nP5Xcf/4Kc1+WK3iFXDX8jrAoQc1FM7rTpnsNe8UOpx
	CK6gtBDjfFRTAUUFyv2gPshglgQhHHQ4gyhIjDPn15Ah8xLHjQHVKjD6Cc/e81Loygm+
	nijcOtWuzz9A7iXI8ZPjZ0d6/CMLwP2cyd/46Xe7RHY6Cj+VynQUoZ+aK2nFVE5FvB2O
	WCGxM3396TYpiFBqkQMybSjnZ1R3imjXaysqqu/4zqu64QWiwUA4/DmlvSRzjIUDgp4U
	822Q==
X-Received: by 10.98.64.7 with SMTP id n7mr26934247pfa.139.1450107262710;
	Mon, 14 Dec 2015 07:34:22 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	x7sm10883248pfa.16.2015.12.14.07.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:20 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 8FF02FCC83C; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:00 -0800
Message-Id: <8fb85a6e4f05822442603642ffd9a979b125f8aa.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 07/14] lldpd: configure the systemd unit file dir
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:23 -0000

From: Roy Li <rongqing.li@windriver.com>

configure the systemd unit file dir, otherwise it will be auto-checked
by 'pkg-config --variable=systemdsystemunitdir systemd', but if systemd
is not built firstly, and the the unit file will not be installed, and
lead to below error:
    ERROR: Function failed: SYSTEMD_SERVICE_lldpd value lldpd.service does not exist
and disable sysusersdir, since sysuser is not used currently.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
index 47d3c38..ba7f09e 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_0.7.17.bb
@@ -24,7 +24,10 @@ GROUPADD_PARAM_${PN} = "--system lldpd"
 EXTRA_OECONF += "--without-embedded-libevent \
                  --disable-oldies \
                  --with-privsep-user=lldpd \
-                 --with-privsep-group=lldpd"
+                 --with-privsep-group=lldpd \
+                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
+                 --without-sysusersdir \
+"
 
 PACKAGECONFIG ??= "cdp fdp edp sonmp lldpmed dot1 dot3"
 PACKAGECONFIG[json] = "--with-json,--without-json,jansson"
-- 
1.9.1


