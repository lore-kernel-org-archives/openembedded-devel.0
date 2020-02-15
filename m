Return-Path: <jpuhlman@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D20E61183
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 00:50:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w21so5761563pgl.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Hgi+jYxwl9oAg4gzZtWOB4du62q8i6eLYp9O5Ial/20=;
	b=rcP8CNoL95PNFValhNkv/xA1df5W+b5x30RZi6vaMci+64UhuflbInSx22yKCyJy4J
	pdVPa7wccLPYCXT3K5D5DsKcNGrazJtrDhKFDd1RcAHIDOdhcf+YWyRETK02/9Yl3qzp
	t+LB6Q60KxIK7FoBv87imPNYwU6SbIm7Ul0Udr//B3IyaQzAcGak9yNt7LgqJOPcGux+
	GSt4urg1AbE75yi3CJkYSRJgF8K+7N1ggBsK4lac//oAud67hgvwMcoWO18nJwSTl0JE
	rzV4uuj9FnR87m/RH+739udMoBzGsEt9Vsv5qqw+Q0KsM5vfvJtOFTxSDEiYpeez4D5a
	JL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Hgi+jYxwl9oAg4gzZtWOB4du62q8i6eLYp9O5Ial/20=;
	b=rOzYbyq47jbXbixkNoUhDc88DHdjKntZ/tRMiPpgIjXHnBI5PHArbsbyuJvHmxceI/
	gpqz64+Ja6zI0V5zUyVyBhv2yfMWHXdJ7BmgsDgqTaQIESK74zFbqG6te0rSIzYAPxwe
	S2mzwA+GWL8nxb81SpyjoGnUl13IXu8cqPFvuu1VCAEZ7zFIREj0oSx5RzsIUN1IeYOl
	smIOAHNnyw05B/PUhd1oGkIXYdA7Mfhm7NK2llPe4n+sJs0XAVoLjeVLZ/qdv12wArCs
	cS+ZIBJcFanOJu9VXyEkBMyExEP298pfNBZUTpDG6CcYdLxDEbkMFnBGz9V7rRrGOYDo
	ZnNg==
X-Gm-Message-State: APjAAAW7IknurbOAZnrVqEgoqA9Hx2Ram2mJiAkOtc+EzM1NbvQKX7CW
	wcNiF7Uk+GKQKs44q1RkOuYmeFu4RTg=
X-Google-Smtp-Source: APXvYqyK5hGv7GAyNJ389dgQG47mgWCnrT4GncoUsoFR5LPu3jFwFNYwZuZXUuvtx173Y9+zW2x74Q==
X-Received: by 2002:aa7:9aeb:: with SMTP id y11mr6246600pfp.63.1581727824117; 
	Fri, 14 Feb 2020 16:50:24 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	t186sm8689309pgd.26.2020.02.14.16.50.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 16:50:23 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 481022A04B2; Fri, 14 Feb 2020 16:50:22 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Feb 2020 16:50:20 -0800
Message-Id: <20200215005020.31970-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-python][PATCH] python-pytest: Fix typo in SUMMARY
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
X-List-Received-Date: Sat, 15 Feb 2020 00:50:23 -0000

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 752d67e36..00f2d6021 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Simple powerful teting with python"
+SUMMARY = "Simple powerful testing with python"
 HOMEPAGE = "http://pytest.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=640061b8cee64b308a4d2f9f556c12f2"
-- 
2.13.3


