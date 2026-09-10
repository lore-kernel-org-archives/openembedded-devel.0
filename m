Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A618C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27769.1789081807045520619
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eiAI/ITk;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so273065a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081806; x=1789686606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMg1QvjicNk6sI4BgB2PpkhYAuG7UZe4JrKGOptw888=;
        b=eiAI/ITk6wVmCVWUEX5q80nSdckz9C6kdQwvCCDLsRfHl79u+zoldwrZ6QyRUbAg/m
         jGJqToN30GNCb5mUxf2PIpSzFEapXZ0x+WMU4bPX4HmR2GE+hTT+7yU2dX/rt+eqDppP
         q+qqL32b6TZOPhJNUrr32HND2gjDJzIkNCgFVh+jRdZ0wjQAacch2ez45Kri+efpn8Vk
         hLMf2bil3j1UuJqktlPmCY8Wa1y+WG+rpofGoNUQzHG7FMcvOHeHBG7UqWgvZZIQO7SO
         WYudlKcOYNR6JhptPBSO4Qiew55lFdSyZ2+R8hQczUZw0MHdPFJxWX1gg8az6/702Ao3
         m3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081806; x=1789686606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMg1QvjicNk6sI4BgB2PpkhYAuG7UZe4JrKGOptw888=;
        b=W6Bozas3B4vLoMKN5lGqRX7DrZ1Bu2HkEwpBtJ82gMAmDNUIRlprbQzkP2QHkCngBc
         fAgxGuHeQJDzpIibR1VbccVpjtMd9+3ep9+UIC4Y6kM5wcMVGilqhk0qvNM1a/AVqO9R
         gI+EQZUPSLyvpV0DrYHJWi6co7miOvvy4B7AbhWBQLEFPW0U/CZWdi6piM8nvFiP9vvl
         KvvgpnA95IhS7ohgAbOFoS2h9iy3Ww3EE5DVik92JZM5zNCorPbP3s5F8M10xk6ffA4G
         uJ3LSn65Cxbbo7UachwUZnHD+QG4I9iUQqgkd6GAJTjyRKMd2/9zX/qCx7tzrDoZgwQF
         HEwA==
X-Gm-Message-State: AFuF++kgrOr5zYx36B5iXELjJ7hD2VL6OiR25QWdO22MSlGF8O1gMHx4
	yTUkd0PbMmCnjYzPA+AWGFYujgxWka+GacU78CPxkFChHst2gvN76NhyLgRfJA==
X-Gm-Gg: AYBFou3sZeqIDsVQJreGCXX+Wz9GfhP1kuX6zbzrrK+0HiN0xO5XfsTWh4jI3mCccQS
	oYgRsMxSwwdvni/VNZmuBvhNsKJFh7+SaYttLSorV86GTZoUicURByUJZ/Cl93d8fqzNXIuif53
	Ci4QeLv6S7zn2bug6ZNq9coOVp/Q4gWvb+arOvWHwXGN+6fpCsDvfKoWIr3pQQc/82oClA9f419
	uQkRWDZNJalnEUkHTAxbp9jS+gjrtVViWBxH6jncsSFsRzDjyeOu5BPfoxnewvUcjr/a79EeQZw
	H0wqOF6cC7vINL41Zd4QZsk4jlbsTVUUpQb6pQfPYhADR4G8O10qF0Kw+JJiERi1Sbor3HuLEqv
	mlf7/EpiMaVCEaj/eW85bvOoD1ba2eg0F6+mw1k50FARr+KOfL7G4GKoZqxPL26gt7HT7djziEw
	RKN/XgfbDJqjcpIH9eiNJcI0c9gosdFkzv71dUfS9mK3W1BbD/FuDJHyzUmiLdlxdS+ABndtH7m
	k82ZaEh4NooiJ6PwfLpxpo=
X-Received: by 2002:a17:90b:5887:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39d9c1b60damr1594668a91.13.1789081806381;
        Thu, 10 Sep 2026 16:10:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 8/32] unbound: patch CVE-2026-42534
Date: Fri, 11 Sep 2026 11:09:07 +1200
Message-ID: <20260910230932.173913-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129926

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-42534

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-42534.patch      | 70 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-42534.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-42534.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42534.patch
new file mode 100644
index 0000000000..aed793ec5c
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-42534.patch
@@ -0,0 +1,70 @@
+From 0d649a36fd3c47f1b75ca90ce10e52cb4ae3d253 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 20 May 2026 10:19:08 +0200
+Subject: [PATCH] - Fix CVE-2026-42534, Jostle logic bypass degrades resolution
+   performance. Thanks to Qifan Zhang, Palo Alto Networks, for the   report.
+
+(cherry picked from commit a794c87578c963606a6fb00a54c46fcf935f519a)
+
+CVE: CVE-2026-42534
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/a794c87578c963606a6fb00a54c46fcf935f519a]
+
+Dropped changes to the Changelog file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ services/mesh.c | 14 ++++++++++----
+ services/mesh.h |  6 ++++++
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/services/mesh.c b/services/mesh.c
+index 3212a6abf..23499dcef 100644
+--- a/services/mesh.c
++++ b/services/mesh.c
+@@ -296,12 +296,14 @@ int mesh_make_new_space(struct mesh_area* mesh, sldns_buffer* qbuf)
+ 	if(mesh->num_reply_states < mesh->max_reply_states)
+ 		return 1;
+ 	/* try to kick out a jostle-list item */
+-	if(m && m->reply_list && m->list_select == mesh_jostle_list) {
++	if(m && m->list_select == mesh_jostle_list) {
+ 		/* how old is it? */
+ 		struct timeval age;
+-		timeval_subtract(&age, mesh->env->now_tv,
+-			&m->reply_list->start_time);
+-		if(timeval_smaller(&mesh->jostle_max, &age)) {
++		if(m->has_first_reply_time)
++			timeval_subtract(&age, mesh->env->now_tv,
++				&m->first_reply_time);
++		if(!m->has_first_reply_time ||
++			timeval_smaller(&mesh->jostle_max, &age)) {
+ 			/* its a goner */
+ 			log_nametypeclass(VERB_ALGO, "query jostled out to "
+ 				"make space for a new one",
+@@ -1960,6 +1962,10 @@ int mesh_state_add_reply(struct mesh_state* s, struct edns_data* edns,
+ 	r->qid = qid;
+ 	r->qflags = qflags;
+ 	r->start_time = *s->s.env->now_tv;
++	if(s->reply_list == NULL && !s->has_first_reply_time) {
++		s->first_reply_time = r->start_time;
++		s->has_first_reply_time = 1;
++	}
+ 	r->next = s->reply_list;
+ 	r->qname = regional_alloc_init(s->s.region, qinfo->qname,
+ 		s->s.qinfo.qname_len);
+diff --git a/services/mesh.h b/services/mesh.h
+index f19f423a8..a61f90993 100644
+--- a/services/mesh.h
++++ b/services/mesh.h
+@@ -189,6 +189,12 @@ struct mesh_state {
+ 	struct module_qstate s;
+ 	/** the list of replies to clients for the results */
+ 	struct mesh_reply* reply_list;
++	/** if it has a first reply time */
++	int has_first_reply_time;
++	/** wall-clock time the first client reply was attached;
++	 *  used by mesh_make_new_space() so duplicate retransmits
++	 *  cannot reset jostle aging. */
++	struct timeval first_reply_time;
+ 	/** the list of callbacks for the results */
+ 	struct mesh_cb* cb_list;
+ 	/** set of superstates (that want this state's result) 
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index 0688b8a78b..a70ae4c9a3 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-32792.patch \
            file://CVE-2026-40622.patch \
            file://CVE-2026-41292.patch \
+           file://CVE-2026-42534.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

