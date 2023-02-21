Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA45C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 05:54:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35976.1676958880359124490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 21:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OGd7JfC/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1416eb0443=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31L5r00o013123
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 21:54:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=x7mq8of/5cROoA1q2+mqtS+IpbakL1rWoa6R5xbUbrA=;
 b=OGd7JfC/+QZr0XdH2kQw/SNyiTkYeH0bjgh91zCGwcqw/HS7s+EKh+vVpzzqegoyYVwp
 y1WY3ZwZpBaL8OWwREL+k9fybr54EtnkUN/WZf0rDkeBKqTl1oleMQNTJ+4ekjS0j1p3
 viZ3yub2Nc2aFC9nGBJU16Y59Q0lLO+itQkUafUoD642kbJp057UejQjV+fhoLjPpTkA
 ryViyclGpAbtscjx6nebO7WmPTdXT048iyO3120P/dM2pC12N3gwqXXTiOdRHy4hBWVA
 YR7Hv884/5nQ6KZBUbGp1RXjdYMtl7owFwDImmp9Eove3TYKbJyzON17RpMXrHANW5s7 vw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6t9cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 21:54:39 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 20 Feb 2023 21:54:37 -0800
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe][meta-oe][langdale][PATCH 1/1] multipath-tools: fix CVE-2022-41974
Date: Tue, 21 Feb 2023 05:54:18 +0000
Message-ID: <20230221055418.2734630-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: SxeIR6v2pJljFhAvYWrg-l8fmeiJUNG0
X-Proofpoint-GUID: SxeIR6v2pJljFhAvYWrg-l8fmeiJUNG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_02,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302210052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Feb 2023 05:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101184

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-41974

NOTE: The actual fixes for this CVE are upstream commits [1] and [2]. However,
they are part of a larger patchset which has a lot of dependencies and cannot
be backported easily to older multipath-tools versions. Upstream discussion [3]
indicates that there is a custom patch available for old versions ([4]).
Ubuntu, Debian and Suse applied this patch to their 0.7.xx and
0.8.xx releases ([4], [5]), so we add it as well.

[1] https://github.com/opensvc/multipath-tools/commit/f812466f68b8e020818c6454d7b7a7e278bc99f6
[2] https://github.com/opensvc/multipath-tools/commit/d139bcf0842bc0a16beab86e1349ed65b150bf0c
[3] https://github.com/opensvc/multipath-tools/issues/59
[4] https://github.com/openSUSE/multipath-tools/commit/fbbf280a0e26026c19879d938ebb2a8200b6357c
[5] http://launchpadlibrarian.net/634132876/multipath-tools_0.7.4-2ubuntu3.1_0.7.4-2ubuntu3.2.diff.gzwq

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../files/CVE-2022-41974.patch                | 164 ++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch b/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
new file mode 100644
index 000000000..7cdb5f9bd
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
@@ -0,0 +1,164 @@
+From 0168696f95b5c610c3861ced8ef98accd1a83b91 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Tue, 27 Sep 2022 12:36:37 +0200
+Subject: [PATCH] multipathd: ignore duplicated multipathd command keys
+
+multipath adds rather than or-s the values of command keys. Fix this.
+Also, return an invalid fingerprint if a key is used more than once.
+
+CVE: CVE-2022-41974
+
+References:
+https://nvd.nist.gov/vuln/detail/CVE-2022-41974
+https://github.com/opensvc/multipath-tools/issues/59
+
+Upstream-Status: Backport
+[https://github.com/openSUSE/multipath-tools/commit/fbbf280a0e26026c19879d938ebb2a8200b6357c]
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ multipathd/cli.c  |   8 ++--
+ multipathd/main.c | 104 +++++++++++++++++++++++-----------------------
+ 2 files changed, 57 insertions(+), 55 deletions(-)
+
+diff --git a/multipathd/cli.c b/multipathd/cli.c
+index 800c0fbe..0a266761 100644
+--- a/multipathd/cli.c
++++ b/multipathd/cli.c
+@@ -336,9 +336,11 @@ fingerprint(vector vec)
+	if (!vec)
+		return 0;
+
+-	vector_foreach_slot(vec, kw, i)
+-		fp += kw->code;
+-
++	vector_foreach_slot(vec, kw, i) {
++		if (fp & kw->code)
++			return (uint64_t)-1;
++		fp |= kw->code;
++	}
+	return fp;
+ }
+
+diff --git a/multipathd/main.c b/multipathd/main.c
+index 8baf9abe..975287d2 100644
+--- a/multipathd/main.c
++++ b/multipathd/main.c
+@@ -1522,61 +1522,61 @@ uxlsnrloop (void * ap)
+	/* Tell main thread that thread has started */
+	post_config_state(DAEMON_CONFIGURE);
+
+-	set_handler_callback(LIST+PATHS, cli_list_paths);
+-	set_handler_callback(LIST+PATHS+FMT, cli_list_paths_fmt);
+-	set_handler_callback(LIST+PATHS+RAW+FMT, cli_list_paths_raw);
+-	set_handler_callback(LIST+PATH, cli_list_path);
+-	set_handler_callback(LIST+MAPS, cli_list_maps);
+-	set_handler_callback(LIST+STATUS, cli_list_status);
+-	set_unlocked_handler_callback(LIST+DAEMON, cli_list_daemon);
+-	set_handler_callback(LIST+MAPS+STATUS, cli_list_maps_status);
+-	set_handler_callback(LIST+MAPS+STATS, cli_list_maps_stats);
+-	set_handler_callback(LIST+MAPS+FMT, cli_list_maps_fmt);
+-	set_handler_callback(LIST+MAPS+RAW+FMT, cli_list_maps_raw);
+-	set_handler_callback(LIST+MAPS+TOPOLOGY, cli_list_maps_topology);
+-	set_handler_callback(LIST+TOPOLOGY, cli_list_maps_topology);
+-	set_handler_callback(LIST+MAPS+JSON, cli_list_maps_json);
+-	set_handler_callback(LIST+MAP+TOPOLOGY, cli_list_map_topology);
+-	set_handler_callback(LIST+MAP+FMT, cli_list_map_fmt);
+-	set_handler_callback(LIST+MAP+RAW+FMT, cli_list_map_fmt);
+-	set_handler_callback(LIST+MAP+JSON, cli_list_map_json);
+-	set_handler_callback(LIST+CONFIG+LOCAL, cli_list_config_local);
+-	set_handler_callback(LIST+CONFIG, cli_list_config);
+-	set_handler_callback(LIST+BLACKLIST, cli_list_blacklist);
+-	set_handler_callback(LIST+DEVICES, cli_list_devices);
+-	set_handler_callback(LIST+WILDCARDS, cli_list_wildcards);
+-	set_handler_callback(RESET+MAPS+STATS, cli_reset_maps_stats);
+-	set_handler_callback(RESET+MAP+STATS, cli_reset_map_stats);
+-	set_handler_callback(ADD+PATH, cli_add_path);
+-	set_handler_callback(DEL+PATH, cli_del_path);
+-	set_handler_callback(ADD+MAP, cli_add_map);
+-	set_handler_callback(DEL+MAP, cli_del_map);
+-	set_handler_callback(SWITCH+MAP+GROUP, cli_switch_group);
++	set_handler_callback(LIST|PATHS, cli_list_paths);
++	set_handler_callback(LIST|PATHS|FMT, cli_list_paths_fmt);
++	set_handler_callback(LIST|PATHS|RAW|FMT, cli_list_paths_raw);
++	set_handler_callback(LIST|PATH, cli_list_path);
++	set_handler_callback(LIST|MAPS, cli_list_maps);
++	set_handler_callback(LIST|STATUS, cli_list_status);
++	set_unlocked_handler_callback(LIST|DAEMON, cli_list_daemon);
++	set_handler_callback(LIST|MAPS|STATUS, cli_list_maps_status);
++	set_handler_callback(LIST|MAPS|STATS, cli_list_maps_stats);
++	set_handler_callback(LIST|MAPS|FMT, cli_list_maps_fmt);
++	set_handler_callback(LIST|MAPS|RAW|FMT, cli_list_maps_raw);
++	set_handler_callback(LIST|MAPS|TOPOLOGY, cli_list_maps_topology);
++	set_handler_callback(LIST|TOPOLOGY, cli_list_maps_topology);
++	set_handler_callback(LIST|MAPS|JSON, cli_list_maps_json);
++	set_handler_callback(LIST|MAP|TOPOLOGY, cli_list_map_topology);
++	set_handler_callback(LIST|MAP|FMT, cli_list_map_fmt);
++	set_handler_callback(LIST|MAP|RAW|FMT, cli_list_map_fmt);
++	set_handler_callback(LIST|MAP|JSON, cli_list_map_json);
++	set_handler_callback(LIST|CONFIG|LOCAL, cli_list_config_local);
++	set_handler_callback(LIST|CONFIG, cli_list_config);
++	set_handler_callback(LIST|BLACKLIST, cli_list_blacklist);
++	set_handler_callback(LIST|DEVICES, cli_list_devices);
++	set_handler_callback(LIST|WILDCARDS, cli_list_wildcards);
++	set_handler_callback(RESET|MAPS|STATS, cli_reset_maps_stats);
++	set_handler_callback(RESET|MAP|STATS, cli_reset_map_stats);
++	set_handler_callback(ADD|PATH, cli_add_path);
++	set_handler_callback(DEL|PATH, cli_del_path);
++	set_handler_callback(ADD|MAP, cli_add_map);
++	set_handler_callback(DEL|MAP, cli_del_map);
++	set_handler_callback(SWITCH|MAP|GROUP, cli_switch_group);
+	set_unlocked_handler_callback(RECONFIGURE, cli_reconfigure);
+-	set_handler_callback(SUSPEND+MAP, cli_suspend);
+-	set_handler_callback(RESUME+MAP, cli_resume);
+-	set_handler_callback(RESIZE+MAP, cli_resize);
+-	set_handler_callback(RELOAD+MAP, cli_reload);
+-	set_handler_callback(RESET+MAP, cli_reassign);
+-	set_handler_callback(REINSTATE+PATH, cli_reinstate);
+-	set_handler_callback(FAIL+PATH, cli_fail);
+-	set_handler_callback(DISABLEQ+MAP, cli_disable_queueing);
+-	set_handler_callback(RESTOREQ+MAP, cli_restore_queueing);
+-	set_handler_callback(DISABLEQ+MAPS, cli_disable_all_queueing);
+-	set_handler_callback(RESTOREQ+MAPS, cli_restore_all_queueing);
++	set_handler_callback(SUSPEND|MAP, cli_suspend);
++	set_handler_callback(RESUME|MAP, cli_resume);
++	set_handler_callback(RESIZE|MAP, cli_resize);
++	set_handler_callback(RELOAD|MAP, cli_reload);
++	set_handler_callback(RESET|MAP, cli_reassign);
++	set_handler_callback(REINSTATE|PATH, cli_reinstate);
++	set_handler_callback(FAIL|PATH, cli_fail);
++	set_handler_callback(DISABLEQ|MAP, cli_disable_queueing);
++	set_handler_callback(RESTOREQ|MAP, cli_restore_queueing);
++	set_handler_callback(DISABLEQ|MAPS, cli_disable_all_queueing);
++	set_handler_callback(RESTOREQ|MAPS, cli_restore_all_queueing);
+	set_unlocked_handler_callback(QUIT, cli_quit);
+	set_unlocked_handler_callback(SHUTDOWN, cli_shutdown);
+-	set_handler_callback(GETPRSTATUS+MAP, cli_getprstatus);
+-	set_handler_callback(SETPRSTATUS+MAP, cli_setprstatus);
+-	set_handler_callback(UNSETPRSTATUS+MAP, cli_unsetprstatus);
+-	set_handler_callback(FORCEQ+DAEMON, cli_force_no_daemon_q);
+-	set_handler_callback(RESTOREQ+DAEMON, cli_restore_no_daemon_q);
+-	set_handler_callback(GETPRKEY+MAP, cli_getprkey);
+-	set_handler_callback(SETPRKEY+MAP+KEY, cli_setprkey);
+-	set_handler_callback(UNSETPRKEY+MAP, cli_unsetprkey);
+-	set_handler_callback(SETMARGINAL+PATH, cli_set_marginal);
+-	set_handler_callback(UNSETMARGINAL+PATH, cli_unset_marginal);
+-	set_handler_callback(UNSETMARGINAL+MAP, cli_unset_all_marginal);
++	set_handler_callback(GETPRSTATUS|MAP, cli_getprstatus);
++	set_handler_callback(SETPRSTATUS|MAP, cli_setprstatus);
++	set_handler_callback(UNSETPRSTATUS|MAP, cli_unsetprstatus);
++	set_handler_callback(FORCEQ|DAEMON, cli_force_no_daemon_q);
++	set_handler_callback(RESTOREQ|DAEMON, cli_restore_no_daemon_q);
++	set_handler_callback(GETPRKEY|MAP, cli_getprkey);
++	set_handler_callback(SETPRKEY|MAP|KEY, cli_setprkey);
++	set_handler_callback(UNSETPRKEY|MAP, cli_unsetprkey);
++	set_handler_callback(SETMARGINAL|PATH, cli_set_marginal);
++	set_handler_callback(UNSETMARGINAL|PATH, cli_unset_marginal);
++	set_handler_callback(UNSETMARGINAL|MAP, cli_unset_all_marginal);
+
+	umask(077);
+	uxsock_listen(&uxsock_trigger, ux_sock, ap);
+--
+2.31.1
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 5a8db0877..feb8a069d 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=mas
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
            file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch \
+           file://CVE-2022-41974.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.34.1


