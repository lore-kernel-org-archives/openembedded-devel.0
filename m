Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 05F79746A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 23:54:49 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l27so20674pfk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EQyOq/3p+aJYdbZhb+Xx6IABQWFFO3QHfqHrKHGEWSM=;
	b=CwvrDh36jQrYnXJlcHZvRa3dOGRFFSZOIWtB6g0Vyjon7mJtIjCJcJNk4eiwfkf2Ue
	1ko2yBZRMa6heoho1i1mA8RIKTjkJvsXYAkQhtdKDTBEnwuPEUtXW5ZvKq5MnlgElNRY
	VsunlnGJ124juHQsp9GU6tk3uQ2IcfwsmtqBoI8rvFU7D1rdrQaMrJuG9ZbYuzpNLlr2
	HvdawYW/deenNkn/7NE1UmgHU37UOJcjhh9Ixaa5voxrou30W605ZRm1NZ2rOUZCkpR5
	hT/yTaoeDThCCwGDQNluvx+p+I51PvaAyPG4ai5XCUumAmXzJjynlOQR+GabKtAfNg8S
	LfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EQyOq/3p+aJYdbZhb+Xx6IABQWFFO3QHfqHrKHGEWSM=;
	b=a+n546/2sltsfIOB0+XFvuhgXqZU745/zt/LGnJDYEW5BVMNG5/HHXKmRd4XLCZgw0
	eI66oo7yd7PTO0mIiBd8rS6zC1nm/dZkmVv+qLXdOvnm6Ikce4EEwDwRqt05tHpcFSZw
	4wFzJWvy4XLCzaOwnAcDjx6WOA109PSIjoBPRBarQ99l+fQYN7gUp17p28wMPzEc2d9S
	RZMie2hiyECfNbS/CbZ47pe80tJRixmFfrXa+mSFlsw0dF/sIOA11QjVjEhws0BCJNHh
	L0g1c4xSeZPXNcg7+G316/lVTBjHTLBVoyhBUmiznBxGFyIdn5Ay9NFg4uUdna/Qncsd
	XKbQ==
X-Gm-Message-State: ALQs6tDHjX0+YH3bKcSeic+qH0XQ3kjqYuhxipDUZyXw2n6vYP+ZPXUr
	3uFkqSlYLr6KFLxFDKDzn+o=
X-Google-Smtp-Source: AIpwx4+BAPMzs9yi7LbcPLPuai8ctvnM3BLaHztZ0RheJG/0edisayg7cpNZWFVdKGgp25n8s3XcSQ==
X-Received: by 10.99.96.147 with SMTP id u141mr1722934pgb.227.1523404491009;
	Tue, 10 Apr 2018 16:54:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s ([2601:202:4000:1184:c5e:530c:2676:1226])
	by smtp.gmail.com with ESMTPSA id
	t65sm7479492pfe.174.2018.04.10.16.54.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Apr 2018 16:54:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Tue, 10 Apr 2018 16:54:48 -0700
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 16:54:46 -0700
Message-Id: <1523404486-21187-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] ntp: update to 4.2.8.p11
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
X-List-Received-Date: Tue, 10 Apr 2018 23:54:50 -0000

This release addresses five security issues in ntpd:

  LOW/MEDIUM: Sec 3012 / CVE-2016-1549 / VU#961909: Sybil vulnerability: ephemeral association attack
  INFO/MEDIUM: Sec 3412 / CVE-2018-7182 / VU#961909: ctl_getitem(): buffer read overrun leads to undefined behavior and information leak
  LOW: Sec 3415 / CVE-2018-7170 / VU#961909: Multiple authenticated ephemeral associations
  LOW: Sec 3453 / CVE-2018-7184 / VU#961909: Interleaved symmetric mode cannot recover from bad state
  LOW/MEDIUM: Sec 3454 / CVE-2018-7185 / VU#961909: Unauthenticated packet can reset authenticated interleaved association

one security issue in ntpq:
  MEDIUM: Sec 3414 / CVE-2018-7183 / VU#961909: ntpq:decodearr() can write beyond its buffer limit

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-support/ntp/{ntp_4.2.8p10.bb => ntp_4.2.8p11.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p10.bb => ntp_4.2.8p11.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p11.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p11.bb
index 6db165a..c698fa0 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p10.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p11.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "745384ed0dedb3f66b33fe84d66466f9"
-SRC_URI[sha256sum] = "ddd2366e64219b9efa0f7438e06800d0db394ac5c88e13c17b70d0dcdf99b99f"
+SRC_URI[md5sum] = "00950ca2855579541896513e78295361"
+SRC_URI[sha256sum] = "f14a39f753688252d683ff907035ffff106ba8d3db21309b742e09b5c3cd278e"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
2.7.4


