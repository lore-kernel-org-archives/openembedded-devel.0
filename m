Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2787DC4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:53:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.5552.1699084423517353030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E2l141Dt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JZd6wl3Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b9952ce65-c1f8568c-d454-4eee-8898-158a56c6cb99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084422;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=P9Ms4UiKQnCblFGQlQtSPeXhcvgpTUeBoIZwL2Vc87U=;
	b=E2l141DtVnSFPXwANwLcMYpZqFbTvpWCNPt/hmhp9KEdEqPjNMHUnQTiFU0uJDvt
	zpIAT21ME6xBvvcOGpy6rqPc0ltxdgPIl6LW8grFtvarOgVs81zsUVzJCLgUEePxzYW
	78rhPqj7kOP+1vkn0shpa6NIugXh6NI8Q8GL0r1E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084422;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=P9Ms4UiKQnCblFGQlQtSPeXhcvgpTUeBoIZwL2Vc87U=;
	b=JZd6wl3YnPToRzaAFLNGdQLOaSFvbgQB3cCa3yN28OehxDGtRDfnOzdSZ6SCW4rB
	cIdd8dhHv9QkVQJsA1pvcuwWIn4iDF4NC+vU+xvSc5fO5OTKyjJgmo/LZKzdnB/gbOA
	ID1z28pEaIQ3raYevl4IC03Bs0SJ+VhgmDthNS98=
Content-Type: multipart/mixed; boundary="===============1313453723137940762=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] Upgrade status meta-initramfs: 2023-11-04
Message-ID: <0101018b9952ce65-c1f8568c-d454-4eee-8898-158a56c6cb99-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:53:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106363

--===============1313453723137940762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

AUH finished upgrade batch the result patches/logs can be found at:
https://autobuilder.yocto.io/pub/auh/20231104074304, next are the statistics:

Recipe upgrade statistics:

    * Failed (devtool error): 2
        kexec-tools-klibc, 20080324, Forced maintainer for AUH
        ubi-utils-klibc, 2.1.6, Forced maintainer for AUH

    TOTAL: attempted=2 succeeded=0(0.00%) failed=2(100.00%)

Recipe upgrade statistics per Maintainer:

    Forced maintainer for AUH: attempted=2 succeeded=0(0.00%) failed=2(100.00%)

--===============1313453723137940762==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="20231104074304.tar.gz"

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

--===============1313453723137940762==--

