Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 711096BD7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:00 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so342989eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mJ9017kknjihsQY8uvVeCVGS7fjYtd1Awt8YMO8At94=;
	b=jASre23vm4aG3HbP7QgTP8BEb4vUPRtD/T5BA8cAOdvaQM1Ysfd0hWSoR9L+9aahno
	C4zXsOJFjbA8druNkXAAZVQbzujCz6Rt00G6ks9OG2YWDc8p2iMlPDo6q1vFsMk7mbYR
	4SY5JsSQexxEPSeMdoqmHBbm5nnAtjnRtV+oYYs1BxobmrjzF/B7IaIwstCEwd/phMZo
	SUmAYeSME57KQZDetg59Bl2GT1XMcevspJ2Njrk9Bre2mbm2FX/FAvHXp/3vy4mFdVy8
	3KqHNZ52sFF4H5mzbXMH+QAm72sMytl6X659j9QXKEtu3U5muXYbYC9DN8ZMHyRbO5+v
	JVuw==
X-Received: by 10.14.2.199 with SMTP id 47mr5372544eef.57.1377791460792;
	Thu, 29 Aug 2013 08:51:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47152078eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:02 +0200
Message-Id: <e459584c3203417814f88ca94ca06cd402c2023f.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 09/66] claws-mail: Add PACKAGECONFIG for enchant, dbus, ldap and startup-notification
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:01 -0000

* enable dbus and startup-notification by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 122e130..15824bb 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -17,6 +17,12 @@ do_configure_append() {
     cd po ; for PO in *.po ; do MO=`echo $PO | sed s/\\.po//`.gmo ; if ! test -f $MO ; then msgfmt $PO -o $MO ; fi ; done
 }
 
+PACKAGECONFIG ??= "startup-notification dbus"
+PACKAGECONFIG[enchant] = "--enable-enchant,--disable-enchant,enchant"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap"
+
 # FIXME: maemo builds may want --enable-maemo
 # FIXME: some platforms may want --enable-generic-umpc
 EXTRA_OECONF = " \
-- 
1.8.3.2


