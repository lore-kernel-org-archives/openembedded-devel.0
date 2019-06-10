Return-Path: <crg7475@mailbox.org>
X-Greylist: delayed 538 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 10 Jun 2019 20:15:56 UTC
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 6B92A7D71A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 20:15:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id B3306A1776
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 22:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	message-id:date:date:subject:subject:from:from:received; s=
	mail20150812; t=1560197214; bh=mV3bpq/8nP/3JNkW+AUYocJcjMHUa3LtQ
	QHTuRerbBU=; b=tbXifV862W/dUsWoffwSJZWtEZuxngLef0kNzmYhvfp/3Euth
	ddR1DNQ8BoEOlwXdpaQkCQs8D1Z8ECg45SCsykcewXpc8dn+oXWEopL3hKtf8sxp
	JnTWeusraDbxBfEd7GtgNHxDhFAj0DKbRQ83UeCnjzn0Je/DM+cPUDbvy0i9xy/j
	z6rrAnnA91UwiUYS7C6LQrveZzWDQAMrFcA3n+xNpsjrfgubAbL3n2A4gH0O91Go
	nMwfNViDwCaySN8V6Gh3dwwAdtE0uMI0gbi5Iw+1KCJoHyf1TmEzKAG4jUms6E/I
	PwwZwRtS/jPqkq0dkYrUsW8BBd72VMHEU+xqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1560197218; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:references;
	bh=8whQgiurBIlfqHWF4b6QBRPi8BuQC45Ity33HwVikYI=;
	b=LtkJUXhx2Kcxn8M/q/Ftmi4UV4Tsb0LNSYQVyWp7gUJfxxFffUaqitJeFn5yHF5iAXi3/T
	pCknAYvHCu0L5GP9NJ5tRWwhotS/4NN0LuPJ37YDkQeuuENdohwbwOd+2s7VtReICEyFph
	4bzL9S3y+dnNylP09XOuXJ1xMUldXWYCep3/iGl6Fs6ZozFL5yfKz7WRspmqV2Vjpy7M9b
	1KakIV4C4ka6MyDE2/0yU/YT59lESJ4YHRvvTHaFfnjuazQp4jrK/Ro5tIBXJQN/lnqwuS
	TuQqn0JRTHyS4OFakMXffqVZNncmZFIZhH/4vSeiIvshXSFAw589PV+czUa3ZA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
	[80.241.56.116]) (amavisd-new, port 10030) with ESMTP id 9zkpK9r2SgOD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2019 22:06:54 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jun 2019 22:06:45 +0200
Message-Id: <20190610200645.22179-1-crg7475@mailbox.org>
Subject: [meta-multimedia][PATCH] openh264: Fix armv7ve build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2019 20:15:56 -0000

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index 44c46f81e..e2f028ac5 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -23,6 +23,7 @@ COMPATIBLE_MACHINE_mips = "(.*)"
 COMPATIBLE_MACHINE_mips64 = "(.*)"
 
 EXTRA_OEMAKE_armv7a = "ARCH=arm"
+EXTRA_OEMAKE_armv7ve = "ARCH=arm"
 EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
 EXTRA_OEMAKE_x86 = "ARCH=i386"
 EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
-- 
2.17.1


