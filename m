Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3D174C63
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:48:57 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j20-v6so15196779pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5jcDSijhkYLg+S8+6Hof9mtodV7bILjrhz5X0qSlOZ0=;
	b=GIMTVddAFkvXa13oZU5bn+xcmHF2AA5UuJhRyO8ZV8/sJ4tjU8mL/zy5Biiut0XU2X
	VJgXBdJ5El439I6OV3KuBFDfY/86QJIOF23ZGNFIeUl8OMmyynMU/7Smtb+i5pF1dbA1
	JOrWvGuB1Tt5Aw3JGjPflqFlR4fHDOhYhX9KpIuaQOIjZur8yU7+xBU5IaP5E2r/8guI
	Co47yWHWgjwXJ4bI8OaDELpOeHx7OzVrLpGCVB8cGQB+2MgDGlAitgdnXiLI7M3N8gNw
	2mIcydqIR8Yig1pmvhD7/4cazYfrjtshbP5PW/C2QHn8W3IUP0N6IM0r47blslzz8IZg
	MRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5jcDSijhkYLg+S8+6Hof9mtodV7bILjrhz5X0qSlOZ0=;
	b=EvauS0tCQr9e15oZIru81468i8sseBf73r9mQpWS3q6iHK+Qpe6X3r16Wq7SXu4Ows
	SjKQ96vwyMfaBIewsOUyA5GFr3Q4rQzMLumtEZwevnzmMA8XkDfT49KugeGSTZnh0T7L
	mlHz5IsQArWfKDRmXbGo81DVYfrD6t0NYq8xK3cXQ8LFx+zZnRXd4EduYiBdbC1kX+zC
	M9aRcbKFl8+ueZogkHuOdqQabgy6eyuw8UNDfm3VOGsTvO5zluD4MEnktUu1iMll3wp0
	P7Asm0QH2M/YOJg+s0qzC3tyGLXGa5UPYx5wfOkZHKgEUqdfA4zDuL9MTUvxEvFxFnss
	affQ==
X-Gm-Message-State: APt69E0PLBZi3n0u5crUtG6xVUXI3SoFdBWyejPTJcvsdY5yK5rg4yOL
	QBsctlkkRBaZYVMoepo6fR4=
X-Google-Smtp-Source: ADUXVKJVgYyDuS9pxSkpZOqrVyp4InuU7AR1NaEUDTYYhoY3Pwswy5lP61Q4Rr+MXySgjmfKGGCcLQ==
X-Received: by 2002:a62:138c:: with SMTP id 12-v6mr2040777pft.34.1528080538660;
	Sun, 03 Jun 2018 19:48:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:48:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:36 -0700
Message-Id: <68a75186f8b08d66d6defd246093bb42cdfdfce8.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 02/15] lftp: change SRC_URI source
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
X-List-Received-Date: Mon, 04 Jun 2018 02:48:57 -0000

From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

Changed SRC_URI source to official web-site, which keeps tarballs with
old releases.

Cherry-picked from master, but without the upgrade to 4.7.5.

  commit a2e075ba656a89da58ca4f849c2f08ec6d50a96f
  Author: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
  Date:   Mon Jan 9 15:34:07 2017 +0100

    lftp: update to 4.7.5 and change SRC_URI source

    Updated lftp to version 4.7.5 and changed SRC_URI source to official
    web-site, which keeps tarballs with old releases.

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
index 2878211..d624537 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.gz \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "8eb1fe5f113126b60f172643c7f6c2e6"
-- 
2.7.4


