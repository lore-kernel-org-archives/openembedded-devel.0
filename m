Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id ACE09719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:16 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c4so444559pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ru/EkTiYR0+4vqxyVi7HEgUfOD/bXMOybnRwfFjkq1Q=;
	b=G4L8HvuaGg6TcuPAcZU5xXz1JeRsXt5tflEuqRupTUBkliUZjmT6DOBcoWTXm9S64A
	8QiWn24tvEKz6hk4Jq3dfTSW+PW3L8Z5+/OUBWrIeP0+XSobNqcCZj86e3TX6cMDlxy0
	HVdJ9ndbNwC31509FBjnk9f+4Lw8d3ZiL6RK5SyT+EYBITQZT85j0j7JBrsc/jiEzWde
	utm3ZdpsbW8jGFkD19JIwKdjutKxx3IV9bPfNkfFMjUcwhogGtmLk+0C+UNWEJpc/N4R
	jtszSa0owuyM/GqZ27X1dKlmAW/CzYXrUcTHW4aszaSA/prWBx03et+dvMuG8qoApOgk
	nvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ru/EkTiYR0+4vqxyVi7HEgUfOD/bXMOybnRwfFjkq1Q=;
	b=SN9hP214zPf+r4CvtQHOSL6ZQkYC8Hajl1cCvO/idkk2SuPAdEQk/Nm+2/UA7I4TUI
	Wvo7bTjXZi43N/fI7zGEet+bormbPOJOvYakur3+SYaNw8Pxa6Rkbz4ZHheAKgWU7blk
	Mro/C5N1SAVPy2bTls/lukluHmMaAcgnm9b5fSYescxSyt0x1fd9GOkwSMHx23xCcMgR
	h7y+FX0RZbM6qIkxxAladkEcVnjq4f2vEjgIaWZYErY5BxqvO6/2W/479fZQWwTLRZj1
	3gHDeM/9zGTSWvBc27cHoMd6DQXCTaLv2g/Rkv0HgwziYZO9pKwIhe7re11CrUmrlkTR
	mEeQ==
X-Gm-Message-State: AKaTC02sXGgTwYotEjHP3qcIvjx4no4A9lovoqAER6WYgBkcgR3yjx76LVR6RwHm5Fi1LQ==
X-Received: by 10.98.139.72 with SMTP id j69mr1954620pfe.158.1479892938063;
	Wed, 23 Nov 2016 01:22:18 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:22 -0800
Message-Id: <20161123092209.23699-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/49] meta_oe_security_flags: Disable PIE for s3c64xx-gpio/s3c24xx-gpio/cpufrequtils
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index b0d30a3..93f35e2 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -6,3 +6,6 @@ SECURITY_CFLAGS_pn-rrdtool = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-llvm3.3 = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mozjs = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-openldap = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-s3c64xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-s3c24xx-gpio = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-cpufrequtils = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.10.2


