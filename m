Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3929.1615866157645138203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3gB3I012335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:42:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:11 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:10 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 0/7] Update recipes in meta-xfce
Date: Tue, 16 Mar 2021 11:41:55 +0800
Message-ID: <20210316034202.21134-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Kai Kang (7):
  xfce4-cpufreq-plugin: 1.2.2 -> 1.2.5
  exo: 4.16.0 -> 4.16.1
  xfce4-netload-plugin: 1.3.2 -> 1.4.0
  xfce4-genmon-plugin: 4.1.0 -> 4.1.1
  xfce4-weather-plugin: 0.10.2 -> 0.11.0
  xfce4-systemload-plugin: 1.2.4 -> 1.3.0
  xfce4-taskmanager: 1.4.2 -> 1.5.2

 ...er_1.4.2.bb => xfce4-taskmanager_1.5.2.bb} |   4 +-
 ...ry-leak-and-reduce-cpu-load-slightly.patch | 121 ------------------
 ...e4-cpufreq-plugin-1.2.1-gcc10-common.patch |  41 ------
 ...1.2.2.bb => xfce4-cpufreq-plugin_1.2.5.bb} |   6 +-
 ..._4.1.0.bb => xfce4-genmon-plugin_4.1.1.bb} |   2 +-
 ...1.3.2.bb => xfce4-netload-plugin_1.4.0.bb} |   3 +-
 ....4.bb => xfce4-systemload-plugin_1.3.0.bb} |   2 +-
 ...10.2.bb => xfce4-weather-plugin_0.11.0.bb} |   2 +-
 .../exo/{exo_4.16.0.bb => exo_4.16.1.bb}      |   2 +-
 9 files changed, 8 insertions(+), 175 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.4.2.bb => xfce4-taskmanager_1.5.2.bb} (47%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/0001-Fix-memory-leak-and-reduce-cpu-load-slightly.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin/xfce4-cpufreq-plugin-1.2.1-gcc10-common.patch
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.2.bb => xfce4-cpufreq-plugin_1.2.5.bb} (51%)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.1.0.bb => xfce4-genmon-plugin_4.1.1.bb} (80%)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.3.2.bb => xfce4-netload-plugin_1.4.0.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.4.bb => xfce4-systemload-plugin_1.3.0.bb} (79%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.10.2.bb => xfce4-weather-plugin_0.11.0.bb} (80%)
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.0.bb => exo_4.16.1.bb} (88%)

-- 
2.17.1

