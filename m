Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97617C25B50
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63857.1699041164726183513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B9/wNJff;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KbeCe/mb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96becb51-92c3d8b2-9e4e-488e-bb95-22ac43944d09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E2y0Loy95uf+qd8MrBmOnEq43DoWcYZYZRIejgsd2AY=;
	b=B9/wNJffDvDR/Yh9nK91zaIrpS8+ODJBzqldXOrfUF8De2EyZ+1+E+uv+lZFdZmD
	Edb7fSrEEeJ2DSNq1ZKwQMdDtOcifKipF8eskMYskHqpJYh7vg+lWwwb6rhYgdcUXyg
	kLPqIc5I8HGUpc2qyn2VhQq4+aguW6Vly2OXm46E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E2y0Loy95uf+qd8MrBmOnEq43DoWcYZYZRIejgsd2AY=;
	b=KbeCe/mblzDrF8PMvxS6oJHJe/s1xBXDIhW2CPC6j95G9neUyfANj3j24SZJ2l4s
	6DbE/cld2tjFIize+wQOYWx8qxgCVTlfHRkJXNku3MdLDr6DvX16rMh+LbEspFysDvN
	dZd2udcaxaTuQCE9e15EZjcTvyVfaQQxw0E6yLzE=
Content-Type: multipart/mixed; boundary="===============2318909069817427318=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] lapack: upgrading to 3.12 FAILED
Message-ID: <0101018b96becb51-92c3d8b2-9e4e-488e-bb95-22ac43944d09-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105955

--===============2318909069817427318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lapack* to *3.12* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake lapack' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4960 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'libgfortran' (but /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb DEPENDS on or otherwise requires it)
libgfortran was skipped: libgfortran needs fortran support to be enabled in the compiler
ERROR: Required build target 'lapack' has no buildable providers.
Missing or unbuildable dependency chain was: ['lapack', 'libgfortran']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2318909069817427318==--

