Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id A96CE6BE04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:34 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so342796eei.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=LnEIEwhHg8XPEFX042TmHaia4Cxn/tJjV+izTthxLF4=;
	b=mnRObJDu72cVtgUBNsmAs6sh9fxxAWnZqQLc35D9VdiRcJf0LWnf6Mx7izJ9i5o/4S
	dqzWpH9MbGNP6PinI5JMpKfEw6UmHztxH4oKd16qBzBQ36L/eszNeR6HFvltD4FvcdEH
	8SrdKR1U+9m/CMrjRQlNM9FjYDskdeyD0haTqRCPfKIS+DD8nungqJqQvaaihyDlpr52
	Wr+/nmUsQXHmrr57lYF+KgpH9/34IVBsFSSuTES2QVVnjUsLdX04sX7X/nCB/AUqdKqP
	5flXwr4DPs1mJ7ER1OPRKNU5xmv4yTAiFleppHlNhFzLg3GDgAhEEFOvZUqSGv5Wzs3a
	Z6Kw==
X-Received: by 10.14.225.199 with SMTP id z47mr5435049eep.24.1377791495033;
	Thu, 29 Aug 2013 08:51:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm47171418eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:27 +0200
Message-Id: <41b5f4dcbbfc5aa78131102ec800a75987838f80.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 34/66] imlib2: Add PACKAGECONFIG for gif, tiff, id3 and bzip2
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index a83216d..f263e2a 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -11,6 +11,12 @@ inherit efl binconfig
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
+PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
+PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
+PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
+
 EXTRA_OECONF = "--with-x \
                 --x-includes=${STAGING_INCDIR} \
                 --x-libraries=${STAGING_LIBDIR} "
-- 
1.8.3.2


