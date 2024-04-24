Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210D3C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 16:03:03 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.433.1713974581088136428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 09:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id 9E4DE10B1A;
	Wed, 24 Apr 2024 18:02:58 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.39.163]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzf5C-1nL9lo0; Wed, 24 Apr 2024 18:02:54 +0200
Date: Wed, 24 Apr 2024 18:03:18 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 1/3] gupnp: dont package source
To: Ross Burton <Ross.Burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>, Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <I9FGCS.QKHLFNRVJJGW2@t-online.de>
In-Reply-To: <CD0238CE-938F-4B4D-B0A0-E795F6B0A587@arm.com>
References: <20240424132329.2706-1-f_l_k@t-online.de>
	<CAMKF1so6r93QEzxrMV_j5EieO_vvbLkC0PgfBSmrh2K2SqqoQA@mail.gmail.com>
	<GZCGCS.7L0JATLUHBTN3@t-online.de>
	<CD0238CE-938F-4B4D-B0A0-E795F6B0A587@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gJrh9rc0fngu2iJzBqE+"
X-TOI-EXPURGATEID: 150726::1713974574-027FA350-4A033BCF/0/0 CLEAN NORMAL
X-TOI-MSGID: 077d979b-c58c-4117-a123-bc0e5f4d0997
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 16:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110134

--=-gJrh9rc0fngu2iJzBqE+
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Apr 24 2024 at 03:42:47 PM +00:00:00, Ross Burton 
<Ross.Burton@arm.com> wrote:
> The usual culprit is build paths in generated files (like 
> glib-generated headers), which is often a trivial fix to use basename 
> instead.
> 
> Ross

Thats right, But it looks like basename wouldn't help here. 
glib-mkenums adds  headers from ${S}:

/* enumerations from 
"/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-error.h" 
*/
#include 
"/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-error.h"

/* enumerations from 
"/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-service-introspection.h" 
*/
#include 
"/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-service-introspection.h"

I guess build will break, if the headers are not found. So we need to 
compile, before the buildpaths can be removed?




--=-gJrh9rc0fngu2iJzBqE+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Apr 24 2024 at 03:42:47 PM +00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">The usual culprit is build paths in generated files (like glib-generated headers), which is often a trivial fix to use basename instead.

Ross</div></blockquote><div><br></div><div>Thats right, But it looks like basename wouldn't help here. glib-mkenums adds &nbsp;headers from ${S}:</div><div><div><br></div><div>/* enumerations from "/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-error.h" */</div><div>#include "/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-error.h"</div></div><div><br></div><div><div>/* enumerations from "/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-service-introspection.h" */</div><div>#include "/home/flk/poky/build/tmp/work/corei7-64-poky-linux/gupnp/1.6.6/build/../gupnp-1.6.6/libgupnp/gupnp-service-introspection.h"</div></div><div><br></div><div>I guess build will break, if the headers are not found. So we need to compile, before the buildpaths can be removed?</div><div><br></div><div><br></div></div>
--=-gJrh9rc0fngu2iJzBqE+--


