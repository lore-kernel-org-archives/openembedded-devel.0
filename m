Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 33C0C750D9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Jun 2018 02:12:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x6-v6so2616026wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2018 19:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ESlt9DcF5tEB/rQRgydmSINj93wRYFr8eflqXexqC/E=;
	b=OK+2nC+r2mgMm+2Xf5tNHoI8NJKpU5N10tPM315p2d3qkYWt//iZZ4KyT5rfIiu98X
	1zNtJ0D6sqmAPHs7I5KJfM7AHUKKfCNrjQSdq7sxMWnSr5559IX26192ozfmD/psIQqp
	wHmLR/pAzswZpqc9lslNNfNtUfBSbTagUcJn/cPvqr60herytWWLa8JaudCz1uvJRk30
	p+vV8YFq3pvdvDTvLcZ3CPUYXd3s9kp7rgRneFcgt8CNc/+IvSLha+/t01Yvq/+a+sw2
	vNbw0iq8lXaOBiiwFggx5L92J6W9t7N0W62HXCN2ost7qSuXWWzBJwiUt9oOPY9xqQK8
	I0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ESlt9DcF5tEB/rQRgydmSINj93wRYFr8eflqXexqC/E=;
	b=C9+XuF0agNV5IbsvHWvw/OToMaIddbjDpUj8q5xdrNouyVCqwNTe0e8tE2yPb8zUbC
	5FN8Kq7SCCC+j/zOlXMqlWmphgF8ZA25snKvUbBR4uOHWzek5sXvSLgtBClt4of9FwAC
	s9ZftPJSenzi5EUPm1/1y/4UnIMZsqhDBR6rT7MbqYITNpj+nWF7AAvkfPEMVRWeLxXo
	t3bDOboOVVFTwSmOg+OI1qzwMqBCIbYjR2HMHgFCEm26rgdw60T7KOpY9L4WooCa3xdO
	csoRWZ2vj6+p1u3S9iZA9DvF+mrQp98ZDpjL3B35L/KDPSbWdQO0XluHcd48k0P6MYOX
	Zcxg==
X-Gm-Message-State: ALKqPwed4BY57kbhHT9omy0PlFbLrud7Vd4ThlmPZntU8cNxZenZX8Mk
	eJf8THdArNz512vtl8dU/V66dkZH
X-Google-Smtp-Source: ADUXVKIUnjZHifxLIoUkFUcZ3KOPXuZLxhyTZ49GXzoyFZ3NDYnWmvpbkFAvu+eeEUIDQ6/U9jbL9Q==
X-Received: by 2002:a50:d41b:: with SMTP id
	t27-v6mr13372619edh.75.1527991969592; 
	Sat, 02 Jun 2018 19:12:49 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:489:7961:466d:7cf7])
	by smtp.gmail.com with ESMTPSA id
	c46-v6sm12132449edc.34.2018.06.02.19.12.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 19:12:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 04:12:43 +0200
Message-Id: <20180603021243.28733-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.0
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-perl][PATCH] adduser: fix HOMEPAGE
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
X-List-Received-Date: Sun, 03 Jun 2018 02:12:49 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta-perl/recipes-perl/adduser/adduser_3.116.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.116.bb b/meta-perl/recipes-perl/adduser/adduser_3.116.bb
index 112a5f022..363f5b117 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.116.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.116.bb
@@ -1,6 +1,6 @@
 SUMMARY = "a utility to add users/groups to the system"
 DESCRIPTION = "adduser, addgroup - add a user or group to the system"
-HOMEPAGE = "http://alioth.debian.org/projects/adduser/"
+HOMEPAGE = "https://salsa.debian.org/debian/adduser"
 SECTION = "base/utils"
 
 LICENSE = "GPLv2"
-- 
2.17.0


