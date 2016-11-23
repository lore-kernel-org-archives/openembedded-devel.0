Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 935B871A8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so668186pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MWbreEEQC5fjj+ffZZ5uYjMIAzPpcsMrhJPYmHMjDLY=;
	b=Vs+ajKmDiIoau2SFIT2/csZrjl6TjhXn0VvaIZsZQG32s2Fzab+MzdAtnWYNSEguPQ
	39k8oxitBlpoOyGDbVbuDpBKhhUkG9A11DNVDRCBVf1BDhTtP2+2IGAd6KAjEyRa85fC
	lPT2jKD7wj+W0b8IUMbuWD3B4kAi8jjBBL5Ts1R9q9AIlUrH4mZlEnDZ6Wxo6grs+rgH
	UnrbKByjLmJBi+x2IGxvgK+js/U6VK+VymGGXuG9VK0Jp4907SKts8MGBhTRRHGqxdLJ
	m8o0TJYORtEGg3IlozywBpuncSDH7MNobXsZ+Vi1ontZk0J7gRore36p41MgQQvTotK/
	eW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MWbreEEQC5fjj+ffZZ5uYjMIAzPpcsMrhJPYmHMjDLY=;
	b=l3TWdY8//Y3IKgmtpBqrnT+RGVdfOSyGeGcXyg7yBuaDN0DSzJ5XjxRS1h6E+2FkIO
	7vvnjgCeFGRuW8PXAurwTRkeT6dW1whQwSwOYAngtGMrVDtPbbL3RwefZUkLUTEbvES+
	5kyFw0t+pP/Z14fIUWMslE+X4+Rlj2d30oWVxO1drrmSHYByy0rVOcgC8RQ85lrWeQLg
	WYrMdEbLdy7xxP9EbQ84VX5EpibrRPcS7+jGy1KQgDD4ZzDqVPfhWSwRM71VX/T8WXzL
	C2pLzg0EcYuuM9gUarhxqEqsaRTrytgzMQl3/bNTHb8RmX8ajV4QznIEovhFQ5y7VKL0
	EqoQ==
X-Gm-Message-State: AKaTC01E8qLxX6xP3LdBKjFWYDyb6b53AINQ3VITk/JnEOvaN4p7+Dfl0XnKuyNxDi4BIw==
X-Received: by 10.84.192.131 with SMTP id c3mr4616349pld.149.1479892946377;
	Wed, 23 Nov 2016 01:22:26 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:32 -0800
Message-Id: <20161123092209.23699-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/49] Disable PIE for libvdpau
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:24 -0000

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


