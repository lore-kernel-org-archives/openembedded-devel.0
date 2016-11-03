Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 72DF8719E1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 17:33:48 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so5427563pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MWbreEEQC5fjj+ffZZ5uYjMIAzPpcsMrhJPYmHMjDLY=;
	b=c23dmEw9M9ePeomn4B0wR7KELZmZDE58Dhe0L4mBE/X+d7KvIDZ3wWrJ0+hCX+C9Hk
	Np8sMnI0/slfdToBD5M3iHdu9txBfLwUcX3h73Kp2meSkmuh056uNSmOSmuTtu6f3Rp3
	jGy+zDc3c8iDGRhpZVsx/ahj0Pg7EVq/1hTbYvcqJVzNhv8lvfKI621/of+uInX32PvT
	xfPEgW0XpIFvWtAuencT6Z4LJ6W1n9viHp/l1nOCPsbgRYJlTKjslZFYDrBRT7BAP8F6
	FKvB1hWCihm4QL7X3CoowbA2cV4pEtOzHK6JBCyWDwgk6r+mMhc1saBiCadKWtlv1qX+
	lm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MWbreEEQC5fjj+ffZZ5uYjMIAzPpcsMrhJPYmHMjDLY=;
	b=fW03Q8I135ftJRZfMdlgCw42VYmX5KqMW0lVKmqCnlA/zgvsxpFTWSql5ROUDQwAVq
	KCk1mjxFQ8IcOPtQci8sV7pJy83eLN5jzcKbdP4AABKzDNJYgOnKLw6aTF9aVLhKInua
	d9tkAHT8YUmKNuzf6Mm+xuia3G3JXc+c3AymmiPrG27YtulkCTCVGMHwWObG5NE21sw1
	9LpBb6zatPgBfmELZMFZyMiGvV/fAnDlXXwbzbiV0XWWYllwXqOVfnJX0Etv2FfNx6nl
	XoFV95FqQ3HlDuBqXQaDVk2HiBN7pEmWV/AUpe7WcJ/y4KeiVPscGYq3USfum1C4mPtg
	1Xgg==
X-Gm-Message-State: ABUngvcM+sEYyvI8D4+vARNHPqdPj7lUExCxqVuxoDGw0jwuA7FyI4fC5M7C8z39LVb0Uw==
X-Received: by 10.99.63.135 with SMTP id m129mr15577136pga.16.1478194430037;
	Thu, 03 Nov 2016 10:33:50 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	uh10sm14241214pab.5.2016.11.03.10.33.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 10:33:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 10:33:42 -0700
Message-Id: <20161103173342.13661-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103173342.13661-1-raj.khem@gmail.com>
References: <20161103173342.13661-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] Disable PIE for libvdpau
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
X-List-Received-Date: Thu, 03 Nov 2016 17:33:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 2559948..e57cc5b 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -12,3 +12,8 @@ SECURITY_CFLAGS_pn-cpufrequtils = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcec = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libmodplug = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcdio = "${SECURITY_NO_PIE_CFLAGS}"
+
+#| /mnt/b/build/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf-init.oS): In function `__libc_csu_init':
+#| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:86: undefined reference to `__init_array_start'
+
+SECURITY_CFLAGS_pn-libvdpau = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.2


