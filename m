Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5257F6A9D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:23 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so5907655eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wVT73HM3tzBqDXaYbMNAm8zfNv3DiFRt6y4oZ4rhcmA=;
	b=WZcqs1/9plmLP2FQrwCVn+FbMoXf79yu2lDzAMMYsQKctg0BbVUCaeB1EkZDwqrfkw
	pVjDCRAYeQBRKtid13PQnb64zi83KBSXHO5uo2BOFKHviEsNB+tMFtevRQnq/sOUAYgE
	mDON+eHg9OjLBgPsJSyh5j787QvRqh72ioB93ePHAzN+Ws0MNdnFSI7KH5x9/iWI4P7J
	qN/E3IxzI0FxhBQnRCqYQUHA0QyBRsWRzRCNkgOdz3E+NuTXvQUopQ2TkkhcMr32WjOi
	fzESGodlBqar+TG2f6RAUlYgHwndTh1AyvPc44/Dc2kDlHOb/rF7+tgt++J6yHAs2P5I
	6aMA==
X-Received: by 10.15.23.194 with SMTP id h42mr14285059eeu.123.1370929044062;
	Mon, 10 Jun 2013 22:37:24 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:27 +0200
Message-Id: <1370928876-14423-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 06/15] atkmm: add glibmm to DEPENDS
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error was:
| configure:15671: error: Package requirements (atk >= 1.12 glibmm-2.4 >= 2.36) were not met:
|
| No package 'glibmm-2.4' found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
index 35ba589..12522f2 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.22.7.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "atk"
+DEPENDS = "atk glibmm"
 
 inherit gnome autotools pkgconfig
 
-- 
1.7.6.5


