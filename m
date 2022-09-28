Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABC1C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 16:43:00 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.25.1664383370590518715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Sep 2022 09:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MboZv/3V;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id r20so8262981qtn.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Sep 2022 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ep6Mfn329lV/DGMGLJ/UCZBxb7WaGpMLhoBeOtjxoxQ=;
        b=MboZv/3VRSOIIqqlDgzoOhhql/sr6DWZ/cAY1f4+5JR+tPViJbNksw+aQA1KY8Ebh/
         3A+WzYiLiJxnM6zYYyrieNLeVT0EeIov2dTyUC2z6L4mlJQaE0pxLRaG3NzkMd/4jTb9
         l2Ye7iblrvNdZ49KdubNtVXGLBb0T7l12MQlQ1jZjRDXXWLWWfkmpfUE8H3UBQIM+D0C
         vHlz7Crh4O1gmrMjBkuWF97N02oQ03tz0fyfDiE/Y2quXv+P6+IAL2v6pvV8dodsQhAD
         95PWkb9fWYl4/vdG0GP5RPeiQoaWqaoY+H6ThlvZNEJofP+PF9rQEmTy+Yb+SHwRiG/u
         JTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ep6Mfn329lV/DGMGLJ/UCZBxb7WaGpMLhoBeOtjxoxQ=;
        b=FIXtkbGxrJfgGb7GJS9V6SblysJ+XB/rOzrDfllIZWLwsVudF/rfJ/IFetrJo/rF7/
         JN9sD/DPYIB41aODhZw0UoRWecY8/jaDz7CANPCRRy+eEEn+uqmeNSPk1dpifFaZMo32
         8vaAiF6NnfAu9NX+i/6oLQ1eW+w+686MYIusdr5lKmmdOwLfCgbLOhj1e9vLsqkrtFHJ
         KFyzueE8QMuHiA9NCNt+KxYc6J2/za0IVQYpz7Cn/irlP0coRQQLTwitGuFlBs3wmWQo
         YrcW69JdJCnexySiQwMTGB6tS9NoVI3DV5fp1QL4M5AypchH06fJbM4NYMn37wHSETem
         FkiQ==
X-Gm-Message-State: ACrzQf2oNR8hDLkHLgzRMsLVGgUY7ZFCcIfZOCw2CsEbzHOFhCe1dKsm
	Muy8hqTFt/zixtrg3blRHx0go8SHTVQ=
X-Google-Smtp-Source: 
 AMsMyM5g+iux+U0ktRWK3Ra9dFuH6iu0RDf2FiIwTu27Rn9G72ZXs2s+pLOFgHtJ5COANkOIhAGszw==
X-Received: by 2002:ac8:5ad2:0:b0:35c:dd5e:e8b7 with SMTP id
 d18-20020ac85ad2000000b0035cdd5ee8b7mr28051362qtd.625.1664383369487;
        Wed, 28 Sep 2022 09:42:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:b006:5cbf:35e3:f429?
 ([2600:1700:9190:ba10:b006:5cbf:35e3:f429])
        by smtp.gmail.com with ESMTPSA id
 v17-20020a05620a441100b006cbdc9f178esm3801327qkp.25.2022.09.28.09.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:42:48 -0700 (PDT)
Message-ID: <2262c85a-ac5a-2e88-31d8-ed3b50019bb4@gmail.com>
Date: Wed, 28 Sep 2022 12:42:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][dunfell][PATCH] dnsmasq: CVE-2022-0934
 Heap use after free in dhcp6_no_relay
Content-Language: en-US
To: Hitendra Prajapati <hprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20220923043510.5244-1-hprajapati@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20220923043510.5244-1-hprajapati@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Sep 2022 16:43:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98999

this was already submitted to the list

-armin

On 9/23/22 00:35, Hitendra Prajapati wrote:
> Source: https://thekelleys.org.uk/gitweb/?p=dnsmasq.git
> MR: 121726
> Type: Security Fix
> Disposition: Backport from https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=03345ecefeb0d82e3c3a4c28f27c3554f0611b39
> ChangeID: be554ef6ebedd7148404ea3cc280f2e42e17dc8c
> Description:
> 	 CVE-2022-0934 dnsmasq: Heap use after free in dhcp6_no_relay.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>   .../dnsmasq/dnsmasq/CVE-2022-0934.patch       | 188 ++++++++++++++++++
>   .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   1 +
>   2 files changed, 189 insertions(+)
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
> new file mode 100644
> index 0000000000..b2ef22c06f
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2022-0934.patch
> @@ -0,0 +1,188 @@
> +From 70df9f9104c8f0661966298b58caf794b99e26e1 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Thu, 22 Sep 2022 17:39:21 +0530
> +Subject: [PATCH] CVE-2022-0934
> +
> +Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=03345ecefeb0d82e3c3a4c28f27c3554f0611b39]
> +CVE: CVE-2022-0934
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + CHANGELOG     |  2 ++
> + src/rfc3315.c | 48 +++++++++++++++++++++++++++---------------------
> + 2 files changed, 29 insertions(+), 21 deletions(-)
> +
> +diff --git a/CHANGELOG b/CHANGELOG
> +index 60b08d0..d1d7e41 100644
> +--- a/CHANGELOG
> ++++ b/CHANGELOG
> +@@ -88,6 +88,8 @@ version 2.81
> +
> + 	Add --script-on-renewal option.
> +
> ++	Fix write-after-free error in DHCPv6 server code.
> ++	CVE-2022-0934 refers.
> + 	
> + version 2.80
> + 	Add support for RFC 4039 DHCP rapid commit. Thanks to Ashram Method
> +diff --git a/src/rfc3315.c b/src/rfc3315.c
> +index b3f0a0a..eef1360 100644
> +--- a/src/rfc3315.c
> ++++ b/src/rfc3315.c
> +@@ -33,9 +33,9 @@ struct state {
> +   unsigned int mac_len, mac_type;
> + };
> +
> +-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
> ++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz,
> + 			     struct in6_addr *client_addr, int is_unicast, time_t now);
> +-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now);
> ++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now);
> + static void log6_opts(int nest, unsigned int xid, void *start_opts, void *end_opts);
> + static void log6_packet(struct state *state, char *type, struct in6_addr *addr, char *string);
> + static void log6_quiet(struct state *state, char *type, struct in6_addr *addr, char *string);
> +@@ -104,12 +104,12 @@ unsigned short dhcp6_reply(struct dhcp_context *context, int interface, char *if
> + }
> +
> + /* This cost me blood to write, it will probably cost you blood to understand - srk. */
> +-static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
> ++static int dhcp6_maybe_relay(struct state *state, unsigned char *inbuff, size_t sz,
> + 			     struct in6_addr *client_addr, int is_unicast, time_t now)
> + {
> +   void *end = inbuff + sz;
> +   void *opts = inbuff + 34;
> +-  int msg_type = *((unsigned char *)inbuff);
> ++  int msg_type = *inbuff;
> +   unsigned char *outmsgtypep;
> +   void *opt;
> +   struct dhcp_vendor *vendor;
> +@@ -259,15 +259,15 @@ static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
> +   return 1;
> + }
> +
> +-static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_t sz, int is_unicast, time_t now)
> ++static int dhcp6_no_relay(struct state *state, int msg_type, unsigned char *inbuff, size_t sz, int is_unicast, time_t now)
> + {
> +   void *opt;
> +-  int i, o, o1, start_opts;
> ++  int i, o, o1, start_opts, start_msg;
> +   struct dhcp_opt *opt_cfg;
> +   struct dhcp_netid *tagif;
> +   struct dhcp_config *config = NULL;
> +   struct dhcp_netid known_id, iface_id, v6_id;
> +-  unsigned char *outmsgtypep;
> ++  unsigned char outmsgtype;
> +   struct dhcp_vendor *vendor;
> +   struct dhcp_context *context_tmp;
> +   struct dhcp_mac *mac_opt;
> +@@ -296,12 +296,13 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> +   v6_id.next = state->tags;
> +   state->tags = &v6_id;
> +
> +-  /* copy over transaction-id, and save pointer to message type */
> +-  if (!(outmsgtypep = put_opt6(inbuff, 4)))
> ++  start_msg = save_counter(-1);
> ++  /* copy over transaction-id */
> ++  if (!put_opt6(inbuff, 4))
> +     return 0;
> +   start_opts = save_counter(-1);
> +-  state->xid = outmsgtypep[3] | outmsgtypep[2] << 8 | outmsgtypep[1] << 16;
> +-
> ++  state->xid = inbuff[3] | inbuff[2] << 8 | inbuff[1] << 16;
> ++
> +   /* We're going to be linking tags from all context we use.
> +      mark them as unused so we don't link one twice and break the list */
> +   for (context_tmp = state->context; context_tmp; context_tmp = context_tmp->current)
> +@@ -347,7 +348,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> +       (msg_type == DHCP6REQUEST || msg_type == DHCP6RENEW || msg_type == DHCP6RELEASE || msg_type == DHCP6DECLINE))
> +
> +     {
> +-      *outmsgtypep = DHCP6REPLY;
> ++      outmsgtype = DHCP6REPLY;
> +       o1 = new_opt6(OPTION6_STATUS_CODE);
> +       put_opt6_short(DHCP6USEMULTI);
> +       put_opt6_string("Use multicast");
> +@@ -619,11 +620,11 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> + 	struct dhcp_netid *solicit_tags;
> + 	struct dhcp_context *c;
> + 	
> +-	*outmsgtypep = DHCP6ADVERTISE;
> ++	outmsgtype = DHCP6ADVERTISE;
> + 	
> + 	if (opt6_find(state->packet_options, state->end, OPTION6_RAPID_COMMIT, 0))
> + 	  {
> +-	    *outmsgtypep = DHCP6REPLY;
> ++	    outmsgtype = DHCP6REPLY;
> + 	    state->lease_allocate = 1;
> + 	    o = new_opt6(OPTION6_RAPID_COMMIT);
> + 	    end_opt6(o);
> +@@ -809,7 +810,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> + 	int start = save_counter(-1);
> +
> + 	/* set reply message type */
> +-	*outmsgtypep = DHCP6REPLY;
> ++	outmsgtype = DHCP6REPLY;
> + 	state->lease_allocate = 1;
> +
> + 	log6_quiet(state, "DHCPREQUEST", NULL, ignore ? _("ignored") : NULL);
> +@@ -921,7 +922,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> +     case DHCP6RENEW:
> +       {
> + 	/* set reply message type */
> +-	*outmsgtypep = DHCP6REPLY;
> ++	outmsgtype = DHCP6REPLY;
> + 	
> + 	log6_quiet(state, "DHCPRENEW", NULL, NULL);
> +
> +@@ -1033,7 +1034,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> + 	int good_addr = 0;
> +
> + 	/* set reply message type */
> +-	*outmsgtypep = DHCP6REPLY;
> ++	outmsgtype = DHCP6REPLY;
> + 	
> + 	log6_quiet(state, "DHCPCONFIRM", NULL, NULL);
> + 	
> +@@ -1097,7 +1098,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> + 	log6_quiet(state, "DHCPINFORMATION-REQUEST", NULL, ignore ? _("ignored") : state->hostname);
> + 	if (ignore)
> + 	  return 0;
> +-	*outmsgtypep = DHCP6REPLY;
> ++	outmsgtype = DHCP6REPLY;
> + 	tagif = add_options(state, 1);
> + 	break;
> +       }
> +@@ -1106,7 +1107,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> +     case DHCP6RELEASE:
> +       {
> + 	/* set reply message type */
> +-	*outmsgtypep = DHCP6REPLY;
> ++	outmsgtype = DHCP6REPLY;
> +
> + 	log6_quiet(state, "DHCPRELEASE", NULL, NULL);
> +
> +@@ -1171,7 +1172,7 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> +     case DHCP6DECLINE:
> +       {
> + 	/* set reply message type */
> +-	*outmsgtypep = DHCP6REPLY;
> ++	outmsgtype = DHCP6REPLY;
> + 	
> + 	log6_quiet(state, "DHCPDECLINE", NULL, NULL);
> +
> +@@ -1251,7 +1252,12 @@ static int dhcp6_no_relay(struct state *state, int msg_type, void *inbuff, size_
> +       }
> +
> +     }
> +-
> ++
> ++  /* Fill in the message type. Note that we store the offset,
> ++     not a direct pointer, since the packet memory may have been
> ++     reallocated. */
> ++  ((unsigned char *)(daemon->outpacket.iov_base))[start_msg] = outmsgtype;
> ++
> +   log_tags(tagif, state->xid);
> +   log6_opts(0, state->xid, daemon->outpacket.iov_base + start_opts, daemon->outpacket.iov_base + save_counter(-1));
> +
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
> index 2fb389915b..8db57edb79 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
> @@ -11,4 +11,5 @@ SRC_URI += "\
>       file://CVE-2020-25686-1.patch \
>       file://CVE-2020-25686-2.patch \
>       file://CVE-2021-3448.patch \
> +    file://CVE-2022-0934.patch \
>   "
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98939): https://lists.openembedded.org/g/openembedded-devel/message/98939
> Mute This Topic: https://lists.openembedded.org/mt/93864402/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


