Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B80CC433F5
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 12:51:45 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.18410.1635079903341320741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Oct 2021 05:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38900 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mecyS-0007ha-Tu
	for openembedded-devel@lists.openembedded.org;
 Sun, 24 Oct 2021 08:51:41 -0400
Date: Sun, 24 Oct 2021 08:51:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Subject: should "ntp-dev" package have header files in it, or not?
Message-ID: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Oct 2021 12:51:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93553


  colleague recently asked me how to get access to one or more header
files associated with "ntp", so he could:

  #include <ntp.h>

from some other code. casually, i suggested the standard way was to
add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
in my own aarch64 project, then took a look under packages-split to
see what got packaged in ntp-dev, and was puzzled to see it was
absolutely empty.

  is this deliberate? are other recipes not entitled to ntp's header
files? am i overlooking something?

rday

