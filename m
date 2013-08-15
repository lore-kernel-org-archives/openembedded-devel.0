Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 42CDF6B7AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:28 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so180605eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=pUk97MNTHqw0wC7KNDXr0vQFS5UwHKopZxjDHejKOAc=;
	b=O+pfmYe46x3LWF98cN9ewv5MJoWg/4+1l3nOtEVjbDZzsNgoeaQKF4Cwk6nd9XPh0d
	R9OIS4/JUMI/MwKD2bsiDdPJBmOrBGdRIGAU3wew8WFXmXbgGZGlldV26i/h2zIBXhzi
	PuDWD1RR/iOt/DYgcDUzQtU2I2OIYIp21uuCrkQOBHHviAG9mU3RD5/Z5GLuU6eCcPkE
	5urI3CZPF4o18XVWLKQJktL1xa/ZYfwAg4zo+2icIwjqMt1cgk2CksAY20rXJkgRn204
	qp/QI65Ve+Fs111f1raKIszJ0dpcDzC72qYnmulvfUrlG3wFFeRLXJHwks9a1QiusISx
	z68g==
X-Received: by 10.15.26.66 with SMTP id m42mr241204eeu.73.1376551168719;
	Thu, 15 Aug 2013 00:19:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm81955057eeg.13.2013.08.15.00.19.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:07 +0200
Message-Id: <9caf6fc109ad76588421f17f3acb0b5d01847c3a.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 27/60] lvm2: add PACKAGECONFIG for readline
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:28 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 157e11b..63c612e 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -11,6 +11,9 @@ S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf"
 
+PACKAGECONFIG ??= "readline"
+PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
+
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
                 --with-group= \
-- 
1.8.3.2


