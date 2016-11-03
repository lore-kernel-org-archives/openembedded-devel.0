Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB31C71AC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:20:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so4145928pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K1gEc/jtD4NJ85uOxfWuR1WlXOHFobDtEKQsmLHSQPY=;
	b=lTX0fTGueBduG39FLgDArIBSZz/ikL+6baE7rKouk+fvwToagJHkiEoUTg+tgACkBa
	8BqB4t+vdA1wqngIkhODxNgagK2B9xRH2PequO9YtMlzDzoDrqmpmwsR6udJSRLCSmD5
	zFsS+inenFHb81F//dhgw97HB3TQWzgz4h5uzNoV8e5sKrStAfP+k+/qwrXIf0rj3DeE
	9K0iQeTo53QFiUizN6OCuvKet+j2CFxxjTEj/Iv91qIiM/I4GO2gncFgsvPhzQx5ds9+
	oFJUAi1FsUEXvC4CfV8ci0uZDP6zKUMSA8fJP8RDY1E7cDZ3rVTicKPlN0w3xcytWBSZ
	mB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K1gEc/jtD4NJ85uOxfWuR1WlXOHFobDtEKQsmLHSQPY=;
	b=FrDn7kfgOB4N/qIzb1jvX3YpI1EMR33v3Sf1EVg7LTeqRUKA7F7gYAEYDbl1LPvnLp
	x+qpIibpxqI1NbcUG7aP7F5BwEIa59SdU511l+EXezR2clQav47LEzM7wcRbwY6055s9
	0vr7ooLcoAkdk7ijvl93yh7qpPJk+W7HRa6fi4RfAzi5yy/8JE0KqD5bcQL3CF5n2Yb8
	uBD9uaBFk24h3GJZd9jfqN4nfY74iTHA9tLaQlqKNvjzjzcAS/rY3aBdHzFWFDuOpm9u
	je7BwAe5vTODmlt0MZd1R3JVvCLRUqDcwEfRevLs4oqsw6dLmXu3U7fBizJlhNSDkVWl
	4Gjg==
X-Gm-Message-State: ABUngvdvbaZrQ0kFiP+8I67wK/20ijRkTNGVOWZDTNlc1FTZ7AO5uo3oMP1IJfdWyhEqEA==
X-Received: by 10.98.98.68 with SMTP id w65mr14571610pfb.121.1478161247863;
	Thu, 03 Nov 2016 01:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y2sm10386225pfk.54.2016.11.03.01.20.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:20:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 01:20:35 -0700
Message-Id: <20161103082038.6331-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103082038.6331-1-raj.khem@gmail.com>
References: <20161103082038.6331-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] meta_oe_security_flags.inc: Add libcec, libmodplug, libcdio
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
X-List-Received-Date: Thu, 03 Nov 2016 08:20:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index 93f35e2..2559948 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -9,3 +9,6 @@ SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-s3c64xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-s3c24xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-cpufrequtils = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libcec = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libmodplug = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libcdio = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.2


