Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id CE2316BDF1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:27 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so348197eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=j7zzOJ/AvXnI6n+fIzOyMS6dMn2xr7zkHp24z6hxLfQ=;
	b=RgdD3ItR84CttnDk8hQzIX9BAPHJrdVaIHQKQ/L4JfWlxjFKY834tlTwFjfSG3qdx0
	hwqRdEqM9TgcSn7tMoqhk96apqF7QuJCtku47QB6/XgZ/ivDho4jx8VUiKrMXMh+Ray5
	GRSEiLCk3VYi6G9AP5gfs4BmhCmSG2HMuxX9NLI9xpEjia5jfpdwcrSYj7PZSugT5HdA
	XoP5h4crznNUWARGepCoRbk9QNPlwa9FK+1KaloqIi2A9G8UOTFhpNmmEB+McV+ZS4Gf
	oo0CSSk+/6SIxQpqDmjUn2yJ1pc5/p8vUHdfbT2Qpps3CAxLaExdavSe85427kz8GlNK
	RnMQ==
X-Received: by 10.14.246.11 with SMTP id p11mr5455797eer.9.1377791488280;
	Thu, 29 Aug 2013 08:51:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47238092eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:22 +0200
Message-Id: <e6155dc5d795914eb35c32666b62eae99dacdcb2.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 29/66] e-wm: Add PACKAGECONFIG for pam
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 723bd33..659ad6a 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -7,6 +7,9 @@ SRCNAME = "e"
 inherit e update-alternatives gettext
 S = "${WORKDIR}/${SRCNAME}"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+
 EXTRA_OECONF = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
     --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-- 
1.8.3.2


