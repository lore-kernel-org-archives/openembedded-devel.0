Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B55ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 04:35:30 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.4179.1663907718707156910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 21:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RSpK3bg1;
 spf=pass (domain: mvista.com, ip: 209.85.215.171,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id c7so11148755pgt.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 21:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SLwbBokpDfeALSTjx49Q7ltwnHqN+ueayj7F+vCiqM4=;
        b=RSpK3bg1E+kwZ5WB22rs+1E/pYaqLQojkIJq64kTRrJJMTBvZi3eYaVWFozhitkStj
         +J0/yoCNv7rOzf1/Dzs9jpsXPOVy8yebprsLgVyb70baC7Qhma+8rNBVhfbIt4IBJAjy
         yhOjUawkLqzmHfNOm45uSqebgjBVku78l6D04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SLwbBokpDfeALSTjx49Q7ltwnHqN+ueayj7F+vCiqM4=;
        b=Ss4haaJD/5LAlUu8hXJWcbIXDyRrzbFVyXa5dqLTkCZ67+NufGOKarG0ZIsPnitQhG
         n9yhkM8nmzOqHfr1fATEcgj/WQqkja3PbIcutNO+iu36Y5Pa61Q0deonIuqR2WSk1BT3
         XznXGoF2Hy3WfY3g/jXRsCFykM5/eB8InTa0U7Nhcx9bLDZdBFHqj7V+7r/LIuiA863K
         mmvKC1cTA/Ebw6MIenYXgoAFrv80P7pZGc0awPEgzHSGomsLw+Gmxfhf0HMwNFFWGRu0
         Pc8Ij58u8xP6Ty3orvVOeqWcUnNroANiNLSYXtyxwSqorPWO+RhSyv4GTohlWd9bE8ta
         nBsw==
X-Gm-Message-State: ACrzQf15axA3yvNUJn4HlsDiDrJOBTMHHNYRRPokT4aX8ExQXTTZiFun
	dD3GEwiYTLo6NyYhYam6fjOWnRLZoApIoQ==
X-Google-Smtp-Source: 
 AMsMyM6VPazU3K9NJNOdWUe2IX8/kqstriX4UplIzsHp25Mj+YmtCIxv4JWMp+axsxpYiQ8FAXt2CA==
X-Received: by 2002:a05:6a00:88f:b0:530:dec:81fd with SMTP id
 q15-20020a056a00088f00b005300dec81fdmr7106185pfj.64.1663907717523;
        Thu, 22 Sep 2022 21:35:17 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.100])
        by smtp.gmail.com with ESMTPSA id
 b6-20020a62a106000000b00542e190f6bcsm5303180pff.102.2022.09.22.21.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 21:35:17 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 23 Sep 2022 10:05:11 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][dunfell][PATCH] dnsmasq: CVE-2022-0934 Heap use
 after free in dhcp6_no_relay
Date: Fri, 23 Sep 2022 10:05:10 +0530
Message-Id: <20220923043510.5244-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Sep 2022 04:35:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98939

Source: https://thekelleys.org.uk/gitweb/?p=dnsmasq.git
MR: 121726
Type: Security Fix
Disposition: Backport from https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=03345ecefeb0d82e3c3a4c28f27c3554f0611b39
ChangeID: be554ef6ebedd7148404ea3cc280f2e42e17dc8c
Description:
	 CVE-2022-0934 dnsmasq: Heap use after free in dhcp6_no_relay.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../dnsmasq/dnsmasq/CVE-2022-0934.patch       | 188 ++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
new file mode 100644
index 0000000000..b2ef22c06f
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
@@ -0,0 +1,188 @@
+From 70df9f9104c8f0661966298b58caf794b99e26e1 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 22 Sep 2022 17:39:21 +0530
+Subject: [PATCH] CVE-2022-0934
+
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=03345ecefeb0d82e3c3a4c28f27c3554f0611b39]
+CVE: CVE-2022-0934
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ CHANGELOG     |  2 ++
+ src/rfc3315.c | 48 +++++++++++++++++++++++++++---------------------
+ 2 files changed, 29 insertions(+), 21 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 60b08d0..d1d7e41 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -88,6 +88,8 @@ version 2.81
+ 
+ 	Add --script-on-renewal option.
+ 
++	Fix write-after-free error in DHCPv6 server code.
++	CVE-2022-0934 refers.
+ 	
+ version 2.80
+ 	Add support for RFC 4039 DHCP rapid commit. Thanks to Ashram Method
+diff --git a/src/rfc3315.c b/src/rfc3315.c
+index b3f0a0a..eef1360 100644
+--- a/src/rfc3315.c
++++ b/src/rfc3315.c
+@@ -33,9 +33,9 @@ struct state {
+   unsigned int mac_len, mac_type;
+ };
+ 
+-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz, 
++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz,
+ 			     struct in6_addr *client_addr, int is_unicast, time_t now);
+-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now);
++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now);
+ static void log6_opts(int nest, unsigned int xid, void *start_opts, void *end_opts);
+ static void log6_packet(struct state *state, char *type, struct in6_addr *addr, char *string);
+ static void log6_quiet(struct state *state, char *type, struct in6_addr *addr, char *string);
+@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_context *context, int interface, char *if
+ }
+ 
+ /* This cost me blood to write, it will probably cost you blood to understand - srk. */
+-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz, 
++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz,
+ 			     struct in6_addr *client_addr, int is_unicast, time_t now)
+ {
+   void *end = inbuff + sz;
+   void *opts = inbuff + 34;
+-  int msg_type = *((unsigned char *)inbuff);
++  int msg_type = *inbuff;
+   unsigned char *outmsgtypep;
+   void *opt;
+   struct dhcp_vendor *vendor;
+@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
+   return 1;
+ }
+ 
+-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now)
++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now)
+ {
+   void *opt;
+-  int i, o, o1, start_opts;
++  int i, o, o1, start_opts, start_msg;
+   struct dhcp_opt *opt_cfg;
+   struct dhcp_netid *tagif;
+   struct dhcp_config *config = NULL;
+   struct dhcp_netid known_id, iface_id, v6_id;
+-  unsigned char *outmsgtypep;
++  unsigned char outmsgtype;
+   struct dhcp_vendor *vendor;
+   struct dhcp_context *context_tmp;
+   struct dhcp_mac *mac_opt;
+@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+   v6_id.next = state->tags;
+   state->tags = &v6_id;
+ 
+-  /* copy over transaction-id, and save pointer to message type */
+-  if (!(outmsgtypep = put_opt6(inbuff, 4)))
++  start_msg = save_counter(-1);
++  /* copy over transaction-id */
++  if (!put_opt6(inbuff, 4))
+     return 0;
+   start_opts = save_counter(-1);
+-  state->xid = outmsgtypep[3] | outmsgtypep[2] << 8 | outmsgtypep[1] << 16;
+-   
++  state->xid = inbuff[3] | inbuff[2] << 8 | inbuff[1] << 16;
++
+   /* We're going to be linking tags from all context we use. 
+      mark them as unused so we don't link one twice and break the list */
+   for (context_tmp = state->context; context_tmp; context_tmp = context_tmp->current)
+@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+       (msg_type == DHCP6REQUEST || msg_type == DHCP6RENEW || msg_type == DHCP6RELEASE || msg_type == DHCP6DECLINE))
+     
+     {  
+-      *outmsgtypep = DHCP6REPLY;
++      outmsgtype = DHCP6REPLY;
+       o1 = new_opt6(OPTION6_STATUS_CODE);
+       put_opt6_short(DHCP6USEMULTI);
+       put_opt6_string("Use multicast");
+@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	struct dhcp_netid *solicit_tags;
+ 	struct dhcp_context *c;
+ 	
+-	*outmsgtypep = DHCP6ADVERTISE;
++	outmsgtype = DHCP6ADVERTISE;
+ 	
+ 	if (opt6_find(state->packet_options, state->end, OPTION6_RAPID_COMMIT, 0))
+ 	  {
+-	    *outmsgtypep = DHCP6REPLY;
++	    outmsgtype = DHCP6REPLY;
+ 	    state->lease_allocate = 1;
+ 	    o = new_opt6(OPTION6_RAPID_COMMIT);
+ 	    end_opt6(o);
+@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	int start = save_counter(-1);
+ 
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	state->lease_allocate = 1;
+ 
+ 	log6_quiet(state, "DHCPREQUEST", NULL, ignore ? _("ignored") : NULL);
+@@ -921,7 +922,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+     case DHCP6RENEW:
+       {
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	
+ 	log6_quiet(state, "DHCPRENEW", NULL, NULL);
+ 
+@@ -1033,7 +1034,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	int good_addr = 0;
+ 
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	
+ 	log6_quiet(state, "DHCPCONFIRM", NULL, NULL);
+ 	
+@@ -1097,7 +1098,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+ 	log6_quiet(state, "DHCPINFORMATION-REQUEST", NULL, ignore ? _("ignored") : state->hostname);
+ 	if (ignore)
+ 	  return 0;
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	tagif = add_options(state, 1);
+ 	break;
+       }
+@@ -1106,7 +1107,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+     case DHCP6RELEASE:
+       {
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 
+ 	log6_quiet(state, "DHCPRELEASE", NULL, NULL);
+ 
+@@ -1171,7 +1172,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+     case DHCP6DECLINE:
+       {
+ 	/* set reply message type */
+-	*outmsgtypep = DHCP6REPLY;
++	outmsgtype = DHCP6REPLY;
+ 	
+ 	log6_quiet(state, "DHCPDECLINE", NULL, NULL);
+ 
+@@ -1251,7 +1252,12 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
+       }
+ 
+     }
+-  
++
++  /* Fill in the message type. Note that we store the offset,
++     not a direct pointer, since the packet memory may have been
++     reallocated. */
++  ((unsigned char *)(daemon->outpacket.iov_base))[start_msg] = outmsgtype;
++
+   log_tags(tagif, state->xid);
+   log6_opts(0, state->xid, daemon->outpacket.iov_base + start_opts, daemon->outpacket.iov_base + save_counter(-1));
+   
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
index 2fb389915b..8db57edb79 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
@@ -11,4 +11,5 @@ SRC_URI += "\
     file://CVE-2020-25686-1.patch \
     file://CVE-2020-25686-2.patch \
     file://CVE-2021-3448.patch \
+    file://CVE-2022-0934.patch \
 "
-- 
2.25.1


