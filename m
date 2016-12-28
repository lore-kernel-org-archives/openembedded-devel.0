Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wj0-f177.google.com (mail-wj0-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id A90B0719E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:22:59 +0000 (UTC)
Received: by mail-wj0-f177.google.com with SMTP id tq7so100171918wjb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 05:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XDIWi2FLc8o+HIwXLQDbdyQUFdzVipHsaZiGZMZlbHw=;
	b=vWrZhDqFzJNHPzxVU2oIKaGDt+a1jYGEmGcZnvvKgpgbtL/ayb3ZemCm6joA3wGGwY
	BNONwCzGPysdSVxn7rzjRv1l3bX2hfxHo8escfb0vF41eRzRK+2ovbgWCmhNEG40Hufd
	/oFRqLrZeonoD4pShAIhyyhFzeyp+quD15Kuf8jDrzf7nZA9RX3C7kWkwJr7uIw/ZbH+
	xN0/cJL0v+6rRD4Y9cI3ve3eCfHjnunxhg8H065VNDc+BdiL4ekW4KrOBbZRoBgc1SGk
	2hBe11KW+IwvonudafhdM1vCE9VuBIVytDbYm9oL2KaeXRoDocVzYECFKjJZPcjx1f1L
	4U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XDIWi2FLc8o+HIwXLQDbdyQUFdzVipHsaZiGZMZlbHw=;
	b=TJDyi+BHM6vw05F10w8VoF7RRlywMHrkkWT3XXUCRnTO2F8rRWMDlwFGo6DHe0JZBD
	GicEU+gIRnUw58Rc8wPOiyDisJrk4K24iv2lkdqBHekpUhxbwAKC8M25vwVLINVnHSQt
	7a69z/ens1ML8c5FigaEYmBO+kztcwg407OU2m6rPMPXF+3j20FJS+aCAjmzdKaktTp9
	SppKfGvt9NMAfEf7JZm5mpKR5thhBLqTaqBZtobZLGQx8AhQuNXEHR/cac6z3tkOjlo3
	fAWWKWNOPRHyTl+aYOyR2eiuJVAmFlRQq8MbhkrWCKQvQA7zSJRZgnule6yv/2ilXt2z
	3wIA==
X-Gm-Message-State: AIkVDXKIkGwG0bQyI9zq71OUIxOgLRRTvFuHKxWIT2fL3j5FUk4RdD5mKkXQq7dkuR5ZiReT
X-Received: by 10.194.109.168 with SMTP id ht8mr32610446wjb.36.1482931380100; 
	Wed, 28 Dec 2016 05:23:00 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	jd9sm48335843wjb.9.2016.12.28.05.22.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Dec 2016 05:22:59 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 14:21:43 +0100
Message-Id: <1482931303-22186-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] nano: update SRC_URI with new source
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
X-List-Received-Date: Wed, 28 Dec 2016 13:22:59 -0000

FTP server is not accesible anymore. Use HTTPS mirror instead.
---
 meta-oe/recipes-support/nano/nano.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 3fad029..0f31c6c 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -12,7 +12,7 @@ INC_PR = "r3"
 
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "ftp://nano-editor.org/pub/nano/v${PV_MAJOR}/nano-${PV}.tar.gz"
+SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
 
 inherit autotools gettext
 
-- 
2.7.4


