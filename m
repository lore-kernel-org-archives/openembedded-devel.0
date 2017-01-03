Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB546FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 17:02:06 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id kp2so72558620wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jan 2017 09:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gOpvhNjA2BdNQhCwMky/MtkY1UwAWpPcxvtkJVwfkdk=;
	b=SvmM1XFMmOldrgixcUDqb1FKQKynS6WtWgEi7Zw0F85Zd5JJaWvjuyHUK0yP5zcHs0
	/SQt8rvaS1JkDxKVh8/NhQH4RI5sSaHWgrB8wNFE3XSSdN6pGopZodKNFjPgzKhu1+U8
	RPB+1nR3+KsTgXSH38jZ3X3YVGQ5P6UctIQr6qK4yXdYGgJrHJp5jPTbk6KXVvhpEjpr
	dk1xhk36OBemqcfFuIMpPWGlJ1ixnWZTPsW/tUvfkypkSJunX/EqMrIpm0JyExQN1CsU
	ttA1XiRyQT0m24tVk0wEkBLxQYH7CX7Mj8C8anJYFj7iEldKKXLPTQ4y8o6Q5G3lwMU8
	r8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gOpvhNjA2BdNQhCwMky/MtkY1UwAWpPcxvtkJVwfkdk=;
	b=MADcnwTPq9L1TdWIMmQ7FF8hGxw5jvKhnjQCg15zRDn5dn80kGlk7PXNVk+YdBwxHZ
	YFdVZjFjx4XKrsgqjEgp75Lf8aU7hzhM4Eg+DeKx6U4Q5Z/muzk26l00c1qyRkC8Fpeu
	mTKrayuDr0AwUsyi071JqYmKCbDOsa4oK8XLAFQ7CiJkr09+E/toB73y2j8QFbvbbwIy
	+XbhDh858xmKJyklEkb/Nh5juQ79LUO7CU3nvxCRg8cedMD+QJFyKioxpbpqQP64Omia
	41kjPlx3ecfQpcX3XLwXdBhle0yaBI6KcvslZMtNvPDwPMPxu8sZRg0bCVbx1ligR5W0
	NIuA==
X-Gm-Message-State: AIkVDXI9kd9oN9m/JrykG9dDnBbVFbobdn0LPUMYqoq6iZDpXN8VGSahn3s5t0p4A7kUrw==
X-Received: by 10.194.174.39 with SMTP id bp7mr52576938wjc.5.1483462926468;
	Tue, 03 Jan 2017 09:02:06 -0800 (PST)
Received: from localhost.localdomain (p579CE4CA.dip0.t-ipconnect.de.
	[87.156.228.202]) by smtp.googlemail.com with ESMTPSA id
	kq6sm60398452wjc.7.2017.01.03.09.02.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 09:02:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jan 2017 18:01:49 +0100
Message-Id: <1483462910-24912-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] xfce4-terminal: update to 0.8.2
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
X-List-Received-Date: Tue, 03 Jan 2017 17:02:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-terminal_0.8.1.bb => xfce4-terminal_0.8.2.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.1.bb => xfce4-terminal_0.8.2.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
index 9313efb..8df7b5f 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.2.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "46d347c0ecbb74a7878d48833042371d"
-SRC_URI[sha256sum] = "ddfe53a89d315a4a9170ca6d2cee2d33145bd63630062b2e867fb3a5fcde5fdf"
+SRC_URI[md5sum] = "53d46d7dbcb74d238dc5e0c8dbc447cd"
+SRC_URI[sha256sum] = "92aad3e14f3ef8d4c6c1409463e989bd8f5eefb686234f3cdbfe574729401681"
-- 
2.5.5


