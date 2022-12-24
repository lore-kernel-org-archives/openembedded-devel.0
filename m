Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785D3C4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.106400.1671917637889132888
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UqrE4Fh6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLXuPD031454;
	Sat, 24 Dec 2022 21:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=GBQTXY8FB8u+8sv8pZ/fk+Q06Dewa94KSD37nGHT+Lg=;
 b=UqrE4Fh6ZQ7TPMC/9lRFXEErkbrW4Uqq7fWnWB6ynKjsFdfq1JjPUh56+jFwbiKIspox
 oDornhdhs0KBXTNzJ4B731zkdKeGStPWcjOWbx8aeZpb3JUVSlsiJWviQMq+TbNA5wFr
 NQiKFIN7YE7rVIXCg/zWaeNmUASnq6MiJhReljEYUCEOGpoyXSKhFOyh+5XpvaJQviFw
 S0wWeCH3vGNQNNO3IU4rvXmYZktnvC8rO5WBsm8ZuRGP75MY1gy4CqgdvhfYFHOBrFR0
 vUKTsMlJ5Zo8PGWlYpJPMUJHZaWhSuQBspUmcPlUQ9R8tIn+KyMtQdUD4A7Yr0uwlpXB hg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn30fcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 21:33:56 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:33:54 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:33:53 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 00/16] Update core xfce components to 4.18.0
Date: Sun, 25 Dec 2022 05:33:31 +0800
Message-ID: <20221224213347.39959-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rIp80A1C1LEFfI77lj5-PtQ84YdYJQqp
X-Proofpoint-GUID: rIp80A1C1LEFfI77lj5-PtQ84YdYJQqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=643 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100209

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (16):
  xfce4-dev-tools: 4.16.0 -> 4.18.0
  libxfce4util: 4.16.0 -> 4.18.0
  libxfce4ui: 4.16.1 -> 4.18.0
  exo: 4.16.4 -> 4.18.0
  garcon: 4.16.1 -> 4.18.0
  xfce4-panel: 4.16.3 -> 4.18.0
  thunar: 4.16.9 -> 4.18.0
  thunar-volman: 4.16.0 -> 4.18.0
  tumbler: 4.16.0 -> 4.18.0
  xfconf: 4.16.0 -> 4.18.0
  xfce4-appfinder: 4.16.1 -> 4.18.0
  xfce4-power-manager: 4.16.0 -> 4.18.0
  xfce4-session: 4.16.0 -> 4.18.0
  xfce4-settings: 4.16.5 -> 4.18.0
  xfdesktop: 4.16.0 -> 4.18.0
  xfwm4: 4.16.1 -> 4.18.0

 .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
 .../exo/exo/exo-no-tests-0.8.patch            |  9 +-
 .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
 .../exo/{exo_4.16.4.bb => exo_4.18.0.bb}      |  5 +-
 .../{garcon_4.16.1.bb => garcon_4.18.0.bb}    |  2 +-
 ...xfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} |  6 +-
 .../libxfce4util/libxfce4util_4.16.0.bb       |  9 --
 .../libxfce4util/libxfce4util_4.18.0.bb       |  9 ++
 ...lman_4.16.0.bb => thunar-volman_4.18.0.bb} |  6 +-
 .../{thunar_4.16.9.bb => thunar_4.18.0.bb}    |  8 +-
 .../{tumbler_4.16.0.bb => tumbler_4.18.0.bb}  |  9 +-
 ...er_4.16.1.bb => xfce4-appfinder_4.18.0.bb} |  6 +-
 ...ls_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} | 14 +--
 ...t-display-desktop-icon-when-no-windo.patch | 15 ++--
 ...-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} |  4 +-
 ....16.0.bb => xfce4-power-manager_4.18.0.bb} |  2 +-
 ...sion_4.16.0.bb => xfce4-session_4.18.0.bb} | 10 +--
 ...ngs_4.16.5.bb => xfce4-settings_4.18.0.bb} |  6 +-
 .../{xfconf_4.16.0.bb => xfconf_4.18.0.bb}    |  4 +-
 ...fdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} |  4 +-
 .../{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb}      |  4 +-
 21 files changed, 69 insertions(+), 210 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb => exo_4.18.0.bb} (84%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb => garcon_4.18.0.bb} (89%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb => libxfce4ui_4.18.0.bb} (84%)
 delete mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
 create mode 100644 meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.18.0.bb
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb => thunar-volman_4.18.0.bb} (63%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb => thunar_4.18.0.bb} (77%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb => tumbler_4.18.0.bb} (80%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb => xfce4-appfinder_4.18.0.bb} (54%)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb => xfce4-dev-tools_4.18.0.bb} (78%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb => xfce4-panel_4.18.0.bb} (93%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.16.0.bb => xfce4-power-manager_4.18.0.bb} (93%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb => xfce4-session_4.18.0.bb} (82%)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb => xfce4-settings_4.18.0.bb} (85%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb => xfconf_4.18.0.bb} (85%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} (77%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb => xfwm4_4.18.0.bb} (90%)

-- 
2.17.1


