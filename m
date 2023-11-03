Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632A8C27C47
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62968.1699041164665655841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b7oyGU9j;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kwPMSoot;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bee2b5-b9eebeeb-1b85-4eed-add8-7be090b30d57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041174;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0OV2yutumFC99fN+HWo9Wl9eiXZ7zYcQuZEs4/Tw1so=;
	b=b7oyGU9jrIC7ZlatojgcBi+g6wDKMRyD4J6TTT4xeIKx/ssa3J/ptVqv2YD30EFL
	MVi74aI+/0lBfJwuJkUe63FFO9DjD1oam0D8u3P++BXBwx/JXsRUHROcbp7U22esalL
	f1MAe5+pCJIO3ZZGYdbVzdWB044kiggewpeYm1Uw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041174;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0OV2yutumFC99fN+HWo9Wl9eiXZ7zYcQuZEs4/Tw1so=;
	b=kwPMSoot9KsOlu7FGV3zJYnGOQv9Yn5tr9JeBDEVVexmNWOSS6IfBzh4HMzK1iqq
	fWpw37X4VArHFb497YYvKL0bSMIB11TCsWNF9C+xcPg45NbkObcV910tebh/Yd4aQ5j
	M4I0YfQ727TnqOh4qjzEETWfFec4jlYaSJmoSEJA=
Content-Type: multipart/mixed; boundary="===============1196902778089548003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] suitesparse: upgrading to 7.3.0 FAILED
Message-ID: <0101018b96bee2b5-b9eebeeb-1b85-4eed-add8-7be090b30d57-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106017

--===============1196902778089548003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *suitesparse* to *7.3.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake suitesparse' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5047 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'libgfortran' (but /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb DEPENDS on or otherwise requires it)
libgfortran was skipped: libgfortran needs fortran support to be enabled in the compiler
ERROR: Required build target 'suitesparse' has no buildable providers.
Missing or unbuildable dependency chain was: ['suitesparse', 'lapack', 'libgfortran']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1196902778089548003==--

