Return-Path: <sjl@vctlabs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042FAC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 21:59:01 +0000 (UTC)
Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web10.381.1665093532822518283
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 14:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vctlabs.com header.s=mail header.b=b2AHAt7n;
 spf=pass (domain: vctlabs.com, ip: 207.154.65.135, mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id 42A56280249; Thu,  6 Oct 2022 14:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vctlabs.com; s=mail;
	t=1665093519; bh=JmtG1j4+VvycvBgsVbabURZ21zU0RklvUL2EMVzvmVI=;
	h=Date:From:To:Subject:From;
	b=b2AHAt7nL+HMDnMgxn4Utl34U6yqBWzw/oEFeK39wePZlB2wJEc5asMniNfm49uPb
	 0POYan2aG4Om5ivai3Mce22jqjYv3w0kbwvBzQcPyL2rbOLZ1mVeFDeRBIpkjWpHIy
	 oloZfukTeFyWgIckjyYjZkK6pWuJ9BU0z+1ABOtAASStKVXhkxrwT0q3C0aB29SqX6
	 4Q3r31DZI86l3dHUZnw0vW5eJdxjs9SZvq5GIyavFURDgP2WJXoJ+Mk+8pbQvNl6Wi
	 3guOF70vWSodz/Hro6TGGRMWHobvdCAr3dw6R8zLg/SO0nDChC1Kw48a0oaTDA/NCM
	 F+0VHvVcp6UJg==
Received: from dirtenator2 (c-71-202-197-248.hsd1.ca.comcast.net
 [71.202.197.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id DEDE22801C7
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  6 Oct 2022 14:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vctlabs.com; s=mail;
	t=1665093519; bh=JmtG1j4+VvycvBgsVbabURZ21zU0RklvUL2EMVzvmVI=;
	h=Date:From:To:Subject:From;
	b=b2AHAt7nL+HMDnMgxn4Utl34U6yqBWzw/oEFeK39wePZlB2wJEc5asMniNfm49uPb
	 0POYan2aG4Om5ivai3Mce22jqjYv3w0kbwvBzQcPyL2rbOLZ1mVeFDeRBIpkjWpHIy
	 oloZfukTeFyWgIckjyYjZkK6pWuJ9BU0z+1ABOtAASStKVXhkxrwT0q3C0aB29SqX6
	 4Q3r31DZI86l3dHUZnw0vW5eJdxjs9SZvq5GIyavFURDgP2WJXoJ+Mk+8pbQvNl6Wi
	 3guOF70vWSodz/Hro6TGGRMWHobvdCAr3dw6R8zLg/SO0nDChC1Kw48a0oaTDA/NCM
	 F+0VHvVcp6UJg==
Date: Thu, 6 Oct 2022 14:58:50 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] x265: support aarch64
Message-ID: <20221006215850.GM26485@dirtenator2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 21:59:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99083

If PIC is turned on, x265 works on aarch64.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
index c36619b81..d786afe81 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
@@ -18,7 +18,8 @@ SRC_URI[sha256sum] = "fb9badcf92364fd3567f8b5aa0e5e952aeea7a39a2b864387cec31e3b5
 inherit lib_package pkgconfig cmake
 
 EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
+EXTRA_OECMAKE:append:aarch64 = " -DENABLE_PIC=ON"
 
 AS[unexport] = "1"
 
-COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|aarch64).*-linux'
-- 
2.34.1


