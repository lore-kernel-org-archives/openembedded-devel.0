Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC4E73204
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:04:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so7170180wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=L2ih3b69cR/7mr1kcKQCbcU5bYfRpWM5aIhR9WH3joo=;
	b=pucP4DP9/Qj76pKMrJrmZHBzBidGyIJhEmgfUIdQ+3X2ZLwoF8M5B5zPHYXVfJb/sm
	QjJyHY57eL927ybp2Cf14TznH7fnQnMh9RuwFJ6kmcjBs3bN8uHCMQlX+REwDuQV1AGY
	fAHi71aLz6ivowW7pPPxz1isirhh3iX+BEyDgEW8SEarqElfc6qlrPozhZaoK/kw5Wp9
	ZFiFfGcTLV54D3GBW8Rs8YnKz4c3ArVH3OE4ofeSx1p3nl/Vddgs5PVJNJp+hkjwwsiW
	nq66CJrDdNIyA4gApNdfp48FOaKpZVxDcGOz94ncPUJoxzwei8OuXBXDAEohOHA3hwTI
	1oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=L2ih3b69cR/7mr1kcKQCbcU5bYfRpWM5aIhR9WH3joo=;
	b=iXSZK5ZTqHNL4WO24XRwFJbG2igNpBQI5W7rv8tlxX06QJdos5hU7NoUWujPcM0mlN
	nfB3k91mculpIdZtMykwlR2UHjrXhrwACBqMWcrA5yqeKVG0AAiyGtaDth2QSFlPSOU5
	zSF2BQFTNZEUsVDzwXeMG+1JgEf6krlMaN7j8cQ8apQrjGN2hfH65nTEwwuvP5T9TD1t
	pXwYLjWcDEy2H6woGHK/RbExjABBHsPoFpczfKNm6Y7kx15dVfFDepghge2o8mxz1C3z
	MOi/BwZRu0Fnv50+hbBqIpUj+LvOcmAVyryDGjXbNHJsIm9BAyea0ev7QzoM7gW6SWrP
	Yc9g==
X-Gm-Message-State: AE9vXwP2Fr8j1g3VzMuTDfdK0o0fMka2WwPxKW6eNdUWg9/XP3V+WsGjktlEVFAHrwEKPQ==
X-Received: by 10.28.153.11 with SMTP id b11mr1402017wme.94.1474106698024;
	Sat, 17 Sep 2016 03:04:58 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.04.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:04:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:38 +0200
Message-Id: <1474106682-20512-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] upower: don't start on boot by default - dbus does that on demand
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
X-List-Received-Date: Sat, 17 Sep 2016 10:04:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/upower/upower_0.99.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/upower/upower_0.99.4.bb b/meta-oe/recipes-support/upower/upower_0.99.4.bb
index 2573f12..44a04de 100644
--- a/meta-oe/recipes-support/upower/upower_0.99.4.bb
+++ b/meta-oe/recipes-support/upower/upower_0.99.4.bb
@@ -18,6 +18,8 @@ PACKAGECONFIG[systemd] = "--with-systemdutildir=${systemd_unitdir} --with-system
 EXTRA_OECONF = " --with-backend=linux"
 
 SYSTEMD_SERVICE_${PN} = "upower.service"
+# don't start on boot by default - dbus does that on demand
+SYSTEMD_AUTO_ENABLE = "disable"
 
 do_configure_prepend() {
     sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
-- 
2.5.5


