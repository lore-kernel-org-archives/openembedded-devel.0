Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E8FE173182
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 May 2016 15:59:09 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id iv1so75692077pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2016 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MRRWolO7cwJVF3R1AhRpRAg62b2NhoLeV9Urb6qz+aw=;
	b=Ecu6ZUtbYZMic0xrjzOyNln3Bc7m2/+jTuc3GDBj+E8rV1vr+HJtEhL2MyuAwmQ9JA
	LKEBklHCcgH2acxdxc5x3dtgnsoufuNOmFgyP0moN3pce75YfSn+2ZtHluuxMRhSa/sY
	MUkfmhGC9ikZA2jP9bSMDP47k79l/jgHbIalL8qOjzB8bI00I0VkDOKoi4uE41Te980t
	BS33Q35/EjuyIc/74X5+NzWnKKmHES+nBsjqvaAalWRS7IygKrWbnaWjyTZkpC+N2wvT
	W5jbNa8q0edakZ7NUKoBWDVv7GGT4l73bPzRJ/t3wLKv/ZcY0+SIY1Wfvcz1cjvVbaUF
	gr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MRRWolO7cwJVF3R1AhRpRAg62b2NhoLeV9Urb6qz+aw=;
	b=QDnizGpEjgcEDjMq7EkGuC4oyTZPzMyBR8l1UzhUlHpsjmcFF8kRoISvvWhnCn5Dnl
	MTjFFgTiRQE6hweiK+bsxbWsJkwp+QuRy25227N7F8XwxHlVm/v9Qz2nuRUz4nyEXGlJ
	0EXg2A7G07pEL94jk1TF/SV0YNjhWEmakFciergAkGozDyvz2HWjYvLWJFpvc16bYnmh
	ejXO4NhCxAYq22Fs56YDGIEnsPHt1/lgb0FPEBlGRDkvgTI8gzTIbFWawBc0YyIiRALg
	UhRDtXv0jMWJTwEgEN0LBeTZKVd9IoIwJNz/JrY0tzYXH2ZO+Vpr9U7Lovp+NgQMstPF
	fg+g==
X-Gm-Message-State: AOPr4FVU9SlotQovFBvSktjr7wBpL/YJhVv0/oKWqYe8KaYGqo+vD0B91JIdl70zliYadg==
X-Received: by 10.66.171.164 with SMTP id av4mr52665457pac.135.1462204750358; 
	Mon, 02 May 2016 08:59:10 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	l81sm46435003pfj.21.2016.05.02.08.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 08:59:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon,  2 May 2016 08:59:08 -0700
Message-Id: <1462204748-3435-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][master][krogoth][jethro][fido][PATCH] ntp: Security fixes via update to 4.2.8p7
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
X-List-Received-Date: Mon, 02 May 2016 15:59:10 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-1551
CVE-2016-2516
CVE-2016-2517
CVE-2016-2518
CVE-2016-2519
CVE-2016-1547
CVE-2015-7704
CVE-2015-8138
CVE-2016-1550

for more info see:
http://support.ntp.org/bin/view/Main/SecurityNotice#April_2016_NTP_4_2_8p7_Security

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p6.bb => ntp_4.2.8p7.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
index a7b998a..ff4ba64 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p6.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p7.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "60049f51e9c8305afe30eb22b711c5c6"
-SRC_URI[sha256sum] = "583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048"
+SRC_URI[md5sum] = "46dfba933c3e4bc924d8e55068797578"
+SRC_URI[sha256sum] = "81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.3.5


