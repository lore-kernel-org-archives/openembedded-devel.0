Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E521EC18E0C
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2280.1699061894195226316
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WzUwhbE9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kqx/8GbS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b97fb09e8-c41ec1a6-2c4a-49fb-8b8b-b7f93b1c2e72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Nh3JifPY+gA6nXmj3ESB+m/emXbYxj8kusH86Vp5nJ4=;
	b=WzUwhbE94Ug2sMSw9M4E89Y6x/HGMrEXh8aUdMh8xSsuuG2sytt69VWRKmBNQ/QN
	rLZ071qVZclVf21lhlAfJT4Bl/AddUkBRGG/QERJSmc8mB/T28Mpxv3sO2iLJAYcv6f
	6q5hSkXxNPmT9YybNVx3pTgXEuXWDd9OcU29ZQr8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Nh3JifPY+gA6nXmj3ESB+m/emXbYxj8kusH86Vp5nJ4=;
	b=kqx/8GbS6OmsvwTN2I71USPapvwEZSl5tPkAkugdKAMKtTeLL1PIRotnj+t0U8Xl
	5nCAZIZEP63WWdtCxpQsl6ctz2gi3ubRlYXyLLE1QDIz68MARnrWYdO5RuYRlFl7OPk
	vhClXd8v618xkhfXgni3tNVk6X774PgUmaiiZWiQ=
Content-Type: multipart/mixed; boundary="===============4732378013144101991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cvxopt: upgrading to 1.3.2 FAILED
Message-ID: <0101018b97fb09e8-c41ec1a6-2c4a-49fb-8b8b-b7f93b1c2e72-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106102

--===============4732378013144101991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cvxopt* to *1.3.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cvxopt' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4933 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'libgfortran' (but /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb DEPENDS on or otherwise requires it)
libgfortran was skipped: libgfortran needs fortran support to be enabled in the compiler
ERROR: Required build target 'python3-cvxopt' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-cvxopt', 'lapack', 'libgfortran']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4732378013144101991==--

