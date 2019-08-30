Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F69A6C3E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 02:30:42 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b24so3550810pfp.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rHaC1hX1GsQ2P2QEPvVuQqc76bmttqplf4/zU4gWqgA=;
	b=uZSx08MqYGnStSUSpL72pFt604G7pv/15PemkkfbehLekE0EZGOFGbfG7nMNooudr1
	eKXxEIAX1UBuFwRjZ5jaLVCfxhLk1hPYAX3/Iq/orV+UzEC52V5fo6ME1jei+aDbMINl
	7MsjhjAB8W2M7WiUaXkna2Fb+i/LZ1ldA7GyuB801W+4K0QTDkWbAHnKPPMERgkJSN3w
	TO2HNO/sC65SO48j82fd2XVkCBdpQMOfwvtMnugo1HZueMZA06uHllEmCXjgCWt4rIp7
	y3SiG09McnvycsxLVX0e60Yp2kdc8VJ7JqIYkVbWE9DmMfZS4Nt36n3IRZZn/kAX0C4Z
	VAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rHaC1hX1GsQ2P2QEPvVuQqc76bmttqplf4/zU4gWqgA=;
	b=IOcau38m44JWgU+CR7vVk48DzlomWEXo4WxmvowVDIR6Hwy/3qc1LyNM0NjTmSs8ol
	64qmBzjvQxb/vmxYHIvCjqSrRWi9DAbs3JhZ+gU4F3Lw+VfucAeEvkvAR3E5snmHoLlN
	QdzGIHeg9nU9sYUv9iQnJCTiRzpMCpusdkye/e/QIEH6kzpg3YfoT5C1GMEhfCfWLrFF
	Gn79ZkMABLpmL15R5j7BQNLdV07VktEGVfACBWHZzfIAMYiV0C7j0mvDSGa7Ha9GejAA
	r5mWGXDQRzGh2dL5/DD9DtQ7tRi3pxkIYPh+q8WhhrBV0n//chPVanIjPBeWpSxGPInZ
	YAhw==
X-Gm-Message-State: APjAAAUtIjrA5LqznnffzFZra2z2ln4PqTSU03HsC5iXnFgmBZjyIoyG
	q2aBVHgxFCg6w7VmXnVM4AvH/NR2
X-Google-Smtp-Source: APXvYqz8Corv9nzPf8dWfHqxwvoUHEzkOWThwllN9e53kpHrQgb4+XoQIsi4yZSuOf0iGXmOtpAgBg==
X-Received: by 2002:a17:90a:e281:: with SMTP id d1mr828475pjz.72.1567132243077;
	Thu, 29 Aug 2019 19:30:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:90d2:579e:19f:13b1])
	by smtp.gmail.com with ESMTPSA id
	d14sm3731425pjx.17.2019.08.29.19.30.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Aug 2019 19:30:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 19:30:36 -0700
Message-Id: <1567132240-27573-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [[meta-webserver][thud] 1/5] apache2: set CVE_PRODUCT
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
X-List-Received-Date: Fri, 30 Aug 2019 02:30:43 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
index a87e384..80c8b20 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.34.bb
@@ -31,6 +31,8 @@ S = "${WORKDIR}/httpd-${PV}"
 
 inherit autotools update-rc.d pkgconfig systemd update-alternatives
 
+CVE_PRODUCT = "http_server"
+
 ALTERNATIVE_${PN}-doc = "htpasswd.1"
 ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
 
-- 
2.7.4


