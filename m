Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 288BF6AD22
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2013 06:46:33 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so4033306wev.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2013 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LUFRgObwnHobtvFUuoI17Tr3CNjZjYFR24qeyfOp5rw=;
	b=XULb40EV4TUzMPtluusuSCZVVp4/k3wP0GgAcw1eVz+xMoBeIGjdwm2MIhg8+DOmsj
	CsUYcc6WDgBmOjjrJiaIKqd/xtw8NOlRbosil460bslNRNFihETVtDfXv2vOv0YlUdiG
	KjJ+zYrBaJbdq6/QpbmMzjzVs8H49sj2im1OZQPpgvxgvjgsgtdIl2qJl+qZhfQFe9z0
	HFQZ6kxT29p+TCKcS1qXiKyc8+MYenoP7Q/taHzsoWnXn20Y0pIi2qwlDFmUmyx4VFGS
	hhe8+RwYw5XUq+oUnHWvvqXirb3LLfNYeFMyA5173ShP9SjxXQlpPotmmik6IWso4tAQ
	yKkg==
X-Received: by 10.180.9.212 with SMTP id c20mr14242579wib.65.1372747593549;
	Mon, 01 Jul 2013 23:46:33 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id o10sm18527218wiz.5.2013.07.01.23.46.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 23:46:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2013 08:46:37 +0200
Message-Id: <1372747597-26346-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1372747597-26346-1-git-send-email-schnitzeltony@googlemail.com>
References: <1372747597-26346-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 2/2] asio: fix runtime dependencies for images with dev-pkgs in IMAGE_FEATURES
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
X-List-Received-Date: Tue, 02 Jul 2013 06:46:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

asio-dev created REDEPENS on asio which was not existent. This caused do_rootfs
for other packages fail with something like:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies for abiword-dev:
|  * 	asio (= 1.4.1-r0.0) *
|  * opkg_install_cmd: Cannot install package abiword-dev.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/asio/asio.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/asio/asio.inc b/meta-oe/recipes-support/asio/asio.inc
index 190ec0f..49c236f 100644
--- a/meta-oe/recipes-support/asio/asio.inc
+++ b/meta-oe/recipes-support/asio/asio.inc
@@ -11,3 +11,4 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${PN}-${PV}.tar.bz2"
 
 inherit autotools
 
+ALLOW_EMPTY_${PN} = "1"
-- 
1.7.6.5


