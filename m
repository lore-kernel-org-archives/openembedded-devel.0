Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD465EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 20:25:28 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.6659.1689107117732541723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 13:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=hHTCySfk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-664519-202307112025137b186f06e124728137-hmveyi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202307112025137b186f06e124728137
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 11 Jul 2023 22:25:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=I/yPxq1sx/dJvb8KJBlPEaqY5b3qr6xBC+cT2oQfn+E=;
 b=hHTCySfk38Tz4v/nJcjEuDtlq6yvKlBAMvn82b1jZ766MrEiEPX0UocoH7UExXQ4QwtzMm
 pBbmGztZ13X7vf+a470YjE4GZbWL4T6bzJJYMl3+3oX7K5ou3Yq3ccW4mD3A5pai5v5u5TTK
 cZ92DaC7CX0jZn9qCIfkSmMqeXREg=;
From: "M. Haener" <michael.haener@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [meta-oe][PATCH 0/1] bring nginx to stable version
Date: Tue, 11 Jul 2023 22:24:33 +0200
Message-ID: <20230711202447.68336-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 20:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103732

From: Michael Haener <michael.haener@siemens.com>

This patch brings nginx to the current stable version.

Regarding the LTS branch Kirkstone:
According to http://nginx.org/en/CHANGES nginx supports the openssl 3.x
component only from version 1.21.2. In Kirstone openssl 3.x is included but
all provided versions of nginx are older, so there is currently an
incompatibility. I recommend to include the current stable version 1.24.0 as
the third version in Kirkstone to make it compatible with openssl 3.x. 

Michael Haener (1):
  nginx: upgrade to 1.24.0 release

 .../recipes-httpd/nginx/{nginx_1.23.4.bb => nginx_1.24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.23.4.bb => nginx_1.24.0.bb} (51%)

-- 
2.41.0


