Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7D46B7C1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:04 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so180220eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=PpL88Jp8uQvR3bJgJoH08KJx9vv3TufXU4Dn14PWrvk=;
	b=iBqvCEPuzIfrlXUGZuEe6CN1EfmCcdkMRFVBqd+ULu9PzWVialv5MjsoTBMOBZ7m8k
	h11wCJbWeRbuvq4gZw2Y4X695KB2SnFUOhTPbMu1GcMKA9yhqLz73a1HxmtzRHkw1Rnk
	51hpAk4Fs2fKv5xmQtMwzFFJbwt8ediaHmQx1w6Fh+aK8tTjCC4AbejRNHUl/WOwvEfV
	C5fOtYGvRL0L2rkdj8Ne9nLZtPJNHXaJVoydaJQTdsp29VvQH6kPj00GINnfDsZ44KrO
	YJNg3wkfiFINh9Zf3kkKKj4/Xkm6Pp1TIO7XjohtzvhFMHvkQBo/yR5yf4mVkAP4iPVZ
	aV8Q==
X-Received: by 10.15.99.133 with SMTP id bl5mr103503eeb.92.1376551144673;
	Thu, 15 Aug 2013 00:19:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm81928824eex.2.2013.08.15.00.19.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:49 +0200
Message-Id: <109934feb69157fb142a94fa3c42ec5f2c1a26fa.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 09/60] rsyslog: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:04 -0000

* without pkgconfig it's failing to expand PKG_CHECK_MODULES macro:
  | rsyslog-5.8.0/configure: line 16111: syntax error near unexpected token `GNUTLS,'
  | rsyslog-5.8.0/configure: line 16111: `    PKG_CHECK_MODULES(GNUTLS, gnutls >= 1.4.0)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index 5cfd236..4b2935f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -10,7 +10,7 @@ INC_PR = "r8"
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
            
-inherit autotools systemd
+inherit autotools pkgconfig systemd
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-- 
1.8.3.2


