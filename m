Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D342571144
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 17:04:44 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so5561666wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 09:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=W7TC/odftbJFIXcOyS0t/YqXlK4M1sY8lfQmHlAiBqo=;
	b=DLVblebXCgXKdo5NV1T2bLIFKulA23K7xlxkuThIaGpR7033y7ZbAIagpHKpZuIG8v
	qhSg95ofjGTrzZArCDOrH74QPlAnI/5HmIUlAroZZGvkPe0adpNx+FBoeTIVqOvDmJVu
	WH9ONriOd92Wex8NwOOT6Umtp45qlJm1JncOg5/BB/+cuYvFX3DPaP6LxB8C2HTYPjDZ
	DDh8qLaSZCFL/M9DDaKGgYtLawElInHiI+Vn41I0EBuJ4oYYhZY5e5iZWifRW7GLfzOQ
	CALoIU1ymgUEMsw1tzEnM8S/woP6HIP72NifqbqtCvS62a7bhQFiSDLxqtxRBO76XkrD
	LYXw==
X-Received: by 10.180.104.232 with SMTP id gh8mr7234642wib.78.1415811883554;
	Wed, 12 Nov 2014 09:04:43 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	bc1sm22334129wib.16.2014.11.12.09.04.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 09:04:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Nov 2014 18:04:32 +0100
Message-Id: <1415811872-4797-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415811872-4797-1-git-send-email-schnitzeltony@googlemail.com>
References: <1415811872-4797-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glibmm: add perl to RDEPENDS_{PN}-dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Nov 2014 17:04:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

QA Issue: glibmm-dev requires /usr/bin/perl, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
index e68eb50..71daf9d 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.36.2.bb
@@ -27,3 +27,5 @@ do_install_append() {
 
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
+
+RDEPENDS_${PN}-dev = "perl"
-- 
1.8.3.1


