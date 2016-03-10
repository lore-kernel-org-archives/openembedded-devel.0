Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8586FF23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 23:26:18 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so7624899wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 15:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=iF6HYc2tKRNVFN13xRrCyTXvztgPpdGxB8OIuY62PhI=;
	b=y2B3ry5j0/dGdK0RYSfUk/pX3z98YdZw+gRYQJY4Kg7E/ti9w9QqERY8oIzouVs6fh
	X5MSbr4iU6Aa7Y0hhm74WM/rmDGoXt3RfvpENs4CnUABBZgnvmA8BKp9/iLaXhRzKDKe
	DQtw1jQ70QAMVFq/MJ7BxfUhimTqvrrhYyM6S53XZat1SYElBpLfWlEmVNxNg/mYVjYl
	xYygCo4GiK/mbKV2w4HxmPXpKx7OzNxII06tnhFPtnQ89+vkvTKOL1Qj7q+4oNi05PAl
	UMupRQe1UoknfD8cvbyImAWxLkYzxwAh6BOHZntfbUT9x+9rrwVciV6nLcqYgbuNvuNT
	T30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iF6HYc2tKRNVFN13xRrCyTXvztgPpdGxB8OIuY62PhI=;
	b=WkMBXEH7isIpN9e+yjsgp9X1EE/Z2Q6+wS+2Cf16ZDivc4WbV/Mk66TW0AlaKbQvdN
	tb80rydHrrxd/r7kdgp7nw0EnDO1rc4t8WDL5mi3PokjwWwOSpjGysPDjUR7kkxVRQSn
	wxF0bGUmjDStKFfoLE2OmV65y5h2CdK+Yt5tHiBypfIp5VxuPV1L5dkAER0We9LA4P3/
	HsI6PTgHI02/7iBRXhI5UjrwhivQujL0r2xNTwz4WEjukgC4pAp6lcjNNbxhJ+mawJiv
	KR1fi9GMEPEOxHW3XrImjBU703+PyuYLjsXUOr6TuMMmbEAUXb/9CItH6apiIlFPSr/X
	Eh6w==
X-Gm-Message-State: AD7BkJJ2ppPJ4i/rRNq/uS4mwfKRNJM5g5kesZeHON6UbTSWYIMOPz0cQRg3v68pUcAP6w==
X-Received: by 10.194.60.20 with SMTP id d20mr7159075wjr.109.1457652378958;
	Thu, 10 Mar 2016 15:26:18 -0800 (PST)
Received: from localhost.localdomain (p4FDF0B8D.dip0.t-ipconnect.de.
	[79.223.11.141]) by smtp.googlemail.com with ESMTPSA id
	e19sm390869wmd.1.2016.03.10.15.26.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 15:26:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2016 00:26:01 +0100
Message-Id: <1457652361-912-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1457652361-912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] packagegroup-xfce-extended: add xfce4-verve-plugin
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
X-List-Received-Date: Thu, 10 Mar 2016 23:26:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index d8b67f2..c07188f 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -51,6 +51,7 @@ RRECOMMENDS_${PN} = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'xfce4-pulseaudio-plugin', '', d)} \
     xfce4-sensors-plugin \
     xfce4-calculator-plugin \
+    xfce4-verve-plugin \
     \
     xfce-polkit \
     \
-- 
2.5.0


