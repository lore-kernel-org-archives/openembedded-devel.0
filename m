Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B06997458B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:51:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 96so19591490wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 04:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=03JqRJrcNHSkkcOftEqTonFnjRH5Xt4hUguD7TJvi2Y=;
	b=AHdccC1h22euz1hibydZ1ST+ofV/j25AjmCoFWr9FhnbIt82SGEQNbCCzvAJ6eGiO9
	nOxoNpW3EGCWc09WfBCtoFT1J9hFnNu3swkSrBSZED9Tv5sbm5eaNQazREqjEkk79nIB
	KsSGVpyxU5Kl7Y5mZPQBIHV2fi/graxQBXIYEf4qTQCDvfZr9gwvq73doxTsyNXlIqsH
	iP4hnUrT9PZZmARUusmiElQBfG8El7XJEbPM7kE2Xm8pqy68jZ4c/x22hDqNyRns/wC7
	TJk0UTbh6/V/APAfBKprMP6+6ck/qVLZCHrBK1v26iiyOsHf98ZiPFTVclruIArTjafq
	H9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=03JqRJrcNHSkkcOftEqTonFnjRH5Xt4hUguD7TJvi2Y=;
	b=sXyDPjpQVz4Maymd/zeM/ZA4ct4KvswqeFvfNNHfdcvUSfZQBWUpA7hzCl/GQZ56eu
	JqMC9CZTOV/7R5g4RIV0zgNORSKDpGa6fYosbWVOPZjCi6NkYclOtrB9DU/xhnKLwbiS
	2be1oU83EFUhm2HOWPe9wsn++6klk+OAhrNZaqvNb3nvWU4y58o2veVgZfuxRTHvDbhk
	WM/bwq8Y8w1joJhwFLQxdcoV+wx5OJKSnhoEC2X67h15qYU9gfSyRUZVqXL9YlCv6O87
	v0CAdV2OpexczxKKU+IlQF9riSyCRmEcmiia4mur0tP5ieS8JetytbpXurTBaSmTbQYi
	xUUg==
X-Gm-Message-State: AA+aEWYVnAyZ6PmCOpulCZDt3iCeQYJ/1BoYeLRqLR9c6viBcSdQ/Duy
	pm5J7RbjH24Gbp6nJzV0jhH6HuHJDd4=
X-Google-Smtp-Source: AFSGD/XEjAIQ6v+RWSYsZwRMHd9DepJ7lCyzK9f1KLOXOUIZcv1hry0sclKgd6IKxXWoQ8bwoLHFiw==
X-Received: by 2002:adf:d112:: with SMTP id a18mr22810577wri.17.1544014266097; 
	Wed, 05 Dec 2018 04:51:06 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v16sm17771582wrs.75.2018.12.05.04.51.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 04:51:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 12:50:59 +0000
Message-Id: <20181205125100.32765-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] iwd: add more PACKAGECONFIG options
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
X-List-Received-Date: Wed, 05 Dec 2018 12:51:06 -0000

Disabled by default (as per upstream defaults), but expose ofono and wired
options (wired installs the EAD service).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
index a4261547e4..3caad20a40 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
@@ -10,9 +10,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
 SRCREV = "d7609915db4b57229f7dd4c04b4eabcce637872a"
 S = "${WORKDIR}/git"
 
-SYSTEMD_SERVICE_${PN} = "iwd.service"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
+PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
 PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
 
 EXTRA_OECONF += "--enable-external-ell"
@@ -22,3 +22,5 @@ do_configure_prepend () {
 }
 
 FILES_${PN} += "${datadir}/dbus-1"
+
+SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
-- 
2.11.0


