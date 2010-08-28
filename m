Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxz-0001sI-Oo
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:32 +0200
Received: by pwj8 with SMTP id 8so1730195pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=sW8PztEd0LsX+4t54OY18MbUbGnav14L0B91Xl7jQ94=;
	b=Gkss6x/Sp3pPlZ+cRUVwFtLxUm9ISwt8pso+uCyLaPFjVWLt3zIQIhjba/yiaQqMKM
	e+5AJU+CsZgkj95GfqSgl9MFmD2ubQ5CfE59SGfMHupYWBL+4UB+pZ9lolJIxWztC4Xw
	nlLOfT8NMOC/9tlmknz9d09J7Bw69Loh/Qn7g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KETxD8fBghzvqh4+vcvjoGy0rCZZJbg3D/7dKELO0o5556yscVVtW13XLMUi4z+L/H
	a8YzVnDcypifyRoLicRop5JRTQ8XFRr2y/M33RgKOdk6Ja3J2IA0g7aCSW8EkyIzTrYm
	bBk0maKJMWVrXzye3gPM91KvJ4obI1FmcFHfA=
Received: by 10.142.136.1 with SMTP id j1mr2627740wfd.343.1283027100516;
	Sat, 28 Aug 2010 13:25:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:25 -0700
Message-Id: <1283027073-12308-16-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 15/23] libmsgenabler2_svn.bb: Replace gsmd-lips with gsmd in DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Aug 2010 20:25:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gpephone/libmsgenabler2_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gpephone/libmsgenabler2_svn.bb b/recipes/gpephone/libmsgenabler2_svn.bb
index 6b5c326..cbd068a 100644
--- a/recipes/gpephone/libmsgenabler2_svn.bb
+++ b/recipes/gpephone/libmsgenabler2_svn.bb
@@ -2,7 +2,7 @@ LICENSE     = "LiPS"
 DESCRIPTION = "LiPS message backend library."
 SECTION = "gpe/libs"
 PRIORITY    = "optional"
-DEPENDS     = "glib-2.0 dbus-glib librecord2 liblipsevent2 telepathy-mission-control libgsmd-lips"
+DEPENDS     = "glib-2.0 dbus-glib librecord2 liblipsevent2 telepathy-mission-control libgsmd"
 PV = "0.0+svnr-${SRCREV}"
 PR          = "r2"
 
-- 
1.7.1



