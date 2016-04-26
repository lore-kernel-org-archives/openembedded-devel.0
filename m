Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E45066072C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:03:07 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n3so26607449wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 02:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=6gW1Ry9Dv50xMW96fBd8FTmFblwawtH4ZX2ayIvok40=;
	b=OR0eEIseIh6t5/MqEnl4kj4v0BAn8enYzMO8lLPvizX8DYY1+r9WFfUUZN8ePue/gU
	qCYJYUAbCKIYe2fqzGRrMrNaUUF9dIqR14o4e++OkZXoq6/fUnkrS/R0896NVG8O/DkG
	tiUe/ChhgdVx9lxIyD1R9gnrlEABqs6YRce+I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=6gW1Ry9Dv50xMW96fBd8FTmFblwawtH4ZX2ayIvok40=;
	b=SC8rBzP1rOw14UHTt/bGb5SkhcMXQfk5PXSZoJf3FrsnWEtnuCGsmowS8cwnFZfHHM
	0vsAfO1GdfoH09gzuB6YCkpCur+ksCzGcc5hWzJmG0Vpk05JAHX7bQhj8XmafR4bZ3aM
	6wDsu/ajoRrjZLyU11eZlGcmDNr4mDEQJxHLadlpaDuBZYInTalkWkMIr4fyxUDMVrxN
	AXKW7BhfDDBeYFh0jMMYKAwlPdgmNGUn8peEO9AVd/HSQ43zmqyOf9ix3M5YfNHyHorx
	AAtwqi9mM43X/TmQV+2zTJpi+4E5zkKjfCPdMaXdB04G6XW2PN/RuQACfb4y1ivZGHNp
	8F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=6gW1Ry9Dv50xMW96fBd8FTmFblwawtH4ZX2ayIvok40=;
	b=S8FmAvkknrGDJKvpoP3T7Bp2VEQTNVrcrdBNRRdx3yOVMXkKOHnPaugBpkqknC0sNX
	msqg24bFGo3xZr91AUEs6CzE8L4dbxBdQtSJqqFgxTp4VkxQi++xE9cZbseeSy5SMJJe
	Bi61V9y77zsokSt17LnJCMZvNj5vr0tl1lZx4xyw/LAxQyNIwxetQKyExsf0NgOxHXWW
	Kqxvmfp8F79NmDKVCoJ05Qmyc+9kz8klx3mBw1pi2XXRQvLtU5+aCrZkLeZgWhUj/VXC
	v20L0wIPj1RVvIM7atglzVMKxfZVJsDaDdM7sqJpSE5NkHwS/Ge3RlP0N20kM34fNUkC
	VT2g==
X-Gm-Message-State: AOPr4FXjQr3HuBjKah+HFuCyf5AI5ZodkPt7kDF3NFmIdnGA0FloBMA2zk1MhwIfDN9G3A==
X-Received: by 10.28.27.142 with SMTP id b136mr17375297wmb.7.1461661387230;
	Tue, 26 Apr 2016 02:03:07 -0700 (PDT)
Received: from centos7.localdomain ([46.18.96.42])
	by smtp.gmail.com with ESMTPSA id u4sm1647136wjz.4.2016.04.26.02.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 02:03:06 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2016 11:02:23 +0200
Message-Id: <1461661343-14820-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Cc: Manuel Bachmann <mbc@iot.bzh>
Subject: [meta-oe][PATCH] wayland-fits: update, get out of PNBLACKLIST
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
X-List-Received-Date: Tue, 26 Apr 2016 09:03:10 -0000

From: Manuel Bachmann <mbc@iot.bzh>

Update to latest version, which has fixes for building with
Weston >= 1.8.91, and thus builds with branches >= Jethro.

Signed-off-by: Manuel Bachmann <mbc@iot.bzh>
---
 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
index 374a850..6852fd3 100755
--- a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5 \
                     file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
 
 SRC_URI = "git://github.com/01org/wayland-fits.git"
-SRCREV = "f30dfa9fceb438d3687c5215093fffc21a7852fc"
+SRCREV = "f108335e374772ae2818a30ae37fe6fcda81980f"
 
 S = "${WORKDIR}/git"
 
@@ -31,6 +31,3 @@ do_install_append() {
 
 FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
 FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
-
-# http://errors.yoctoproject.org/Errors/Details/35141/
-PNBLACKLIST[wayland-fits] ?= "BROKEN: fails since wayland upgrade: weston-wfits.cpp:86:39: error: expected primary-expression before 'struct'"
-- 
1.8.3.1


