Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A11FEB64DA
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 05:47:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.33501.1688968030422780453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jul 2023 22:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VJcL9XCW;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-666eec46206so3566695b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jul 2023 22:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688968030; x=1691560030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17JpIfmN3aebkR+50iAMwsjG4+WlzlxMU3I/qhKrBtU=;
        b=VJcL9XCWSkfWQ2dLiEeM/TRfDaqFLGwLMDK6xvjhe/s4MDODGZ/sXTW5j/nsrPLSER
         5hHab22ZJtp1TDn+rtJjjXHP14CIMKIamuYqb+jr3FCCCKAJCTCstRREbb/RAGTrOKwt
         RqoAImmFMotV0NmcTuoRby/wuSEp5C2CE4i4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688968030; x=1691560030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17JpIfmN3aebkR+50iAMwsjG4+WlzlxMU3I/qhKrBtU=;
        b=N/j7fM8m4WL+jM8Lqu3reuKJwHWIJOEoRWIvIUy+Zq5rEqRhPmVuzlrvCvdEyarVlS
         Q0p8ZlnotnmHzUdFm4ngsm7qBDVnmoobwDBaAgXsw5s0UPDjxPh0rTR8XDXPDrC/hkh3
         p0VKHDbCNXkw4nTpY1f94wnHuK53RBMJm4oT/ub1Qqn4wiCjgDh8/Rau+LYseUlBlt4j
         2z8xFDRy6Xc0iQpRxu3QhYGJLQzWzdKZOYYUvN/xmLw8h8IcZcg037p3yWfDT9GdDL8k
         vxgNmjcuCc03Y7rkJS8tReRyRO4h0gqNNnUL+QYq1EZzrpzoaeV+9pvTdVWfSXybNZnI
         C7/g==
X-Gm-Message-State: ABy/qLYV6k0P1z5psv0n/lgbq1HzQcj9fjQo0edQw3d9A5nTFatdrApk
	+QPIhgHNsLwqtqpi2iywPE1IaBE5RRVlOr3iabxnOQ==
X-Google-Smtp-Source: APBJJlHux/vxokmtpokWK0AvNrfW4iVzORu6h1sHg9rjETKlRTQjQr0OWG+GxMEQv58X6SOxyNMQwA==
X-Received: by 2002:a05:6a00:2e96:b0:67a:b045:e290 with SMTP id fd22-20020a056a002e9600b0067ab045e290mr16153292pfb.4.1688968029663;
        Sun, 09 Jul 2023 22:47:09 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.194])
        by smtp.gmail.com with ESMTPSA id b16-20020aa78710000000b0064398fe3451sm6231853pfo.217.2023.07.09.22.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 22:47:09 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 10 Jul 2023 11:17:04 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] multipath-tools: fix CVE-2022-41974
Date: Mon, 10 Jul 2023 11:17:03 +0530
Message-Id: <20230710054703.41876-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jul 2023 05:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103719

Upstream-Status: Backport from https://github.com/openSUSE/multipath-tools/commit/fbbf280a0e26026c19879d938ebb2a8200b6357c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../files/CVE-2022-41974.patch                | 162 ++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch b/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
new file mode 100644
index 0000000000..dcc2cd49ef
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/CVE-2022-41974.patch
@@ -0,0 +1,162 @@
+From 0168696f95b5c610c3861ced8ef98accd1a83b91 Mon Sep 17 00:00:00 2001
+From: Benjamin Marzinski <bmarzins@redhat.com>
+Date: Tue, 27 Sep 2022 12:36:37 +0200
+Subject: [PATCH] multipathd: ignore duplicated multipathd command keys
+
+multipath adds rather than or-s the values of command keys. Fix this.
+Also, return an invalid fingerprint if a key is used more than once.
+
+References:
+https://nvd.nist.gov/vuln/detail/CVE-2022-41974
+https://github.com/opensvc/multipath-tools/issues/59
+
+Upstream-Status: Backport [https://github.com/openSUSE/multipath-tools/commit/fbbf280a0e26026c19879d938ebb2a8200b6357c]
+CVE: CVE-2022-41974
+
+Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
+ 	if (!vec)
+ 		return 0;
+ 
+-	vector_foreach_slot(vec, kw, i)
+-		fp += kw->code;
+-
++	vector_foreach_slot(vec, kw, i) {
++		if (fp & kw->code)
++			return (uint64_t)-1;
++		fp |= kw->code;
++	}
+ 	return fp;
+ }
+ 
+diff --git a/multipathd/main.c b/multipathd/main.c
+index 8baf9abe..975287d2 100644
+--- a/multipathd/main.c
++++ b/multipathd/main.c
+@@ -1522,61 +1522,61 @@ uxlsnrloop (void * ap)
+ 	/* Tell main thread that thread has started */
+ 	post_config_state(DAEMON_CONFIGURE);
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
+ 	set_unlocked_handler_callback(RECONFIGURE, cli_reconfigure);
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
+ 	set_unlocked_handler_callback(QUIT, cli_quit);
+ 	set_unlocked_handler_callback(SHUTDOWN, cli_shutdown);
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
+ 	umask(077);
+ 	uxsock_listen(&uxsock_trigger, ux_sock, ap);
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 23273f5d5b..e14e494366 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=http;branch=mas
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://CVE-2022-41973.patch \
+           file://CVE-2022-41974.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.25.1


