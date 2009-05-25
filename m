Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8YKE-00065Y-Rr
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 13:26:40 +0200
Received: by bwz19 with SMTP id 19so3031221bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=20OnF1n2LPEmBYAy1npTnxig/ea5ZLvnP4r+Ti5cYiQ=;
	b=hpLDebEcjJdeW+5k06FTZxgQGrFryT5xeSelzcMxL5dyR3xBUE0Cyq4O4cvIy9F9zy
	o/slpO3vSdd8ZCIzOYKszhmzOlyJ1SW0VJqq3cwd2mno8aR+wwBHJQnR93ayIyElerfP
	UFyEr7Y03OrFMaLu5UpnmEDA6T0XVHtqE40uM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=k/xQpD8500bNvWwikjZ1nENE23TaN4asJwV8QMvs5rbaJdWf41OxT6/IgzZwGIlJJ5
	F2RLlK6TAL9rzWbLPaByVY4cSsLXMkTHK2w2X94nqumU6G6rE7x3dS8TNiCHN3ghBMeK
	49CEuXsIAnlulcVzEZW2joViGZCP2RvEpJ7vM=
Received: by 10.103.222.1 with SMTP id z1mr3636818muq.44.1243250317292;
	Mon, 25 May 2009 04:18:37 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id j9sm5027201mue.21.2009.05.25.04.18.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 May 2009 04:18:36 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2009 14:18:33 +0300
Message-Id: <1243250313-10392-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
References: <1243246822.4869.19.camel@lenovo.internal.reciva.com>
Subject: [PATCH] gnome.bbclass: remove unneeded scrollkeeper stuff from gnome packages.
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
X-List-Received-Date: Mon, 25 May 2009 11:26:43 -0000

Scrollkeeper generates its XML database for every package when
installing it. The problem is that while building it sees only specific
package scrollkeeper stuff so we get wrong scrollkeeper xml file
generated for every gnome.bbclass package. Including the file into every
gnome package results in package contents conflicts.

This patch removes a quick hack made by Koen with previous commit.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 classes/gnome.bbclass |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/classes/gnome.bbclass b/classes/gnome.bbclass
index d2ca739..da88884 100644
--- a/classes/gnome.bbclass
+++ b/classes/gnome.bbclass
@@ -17,9 +17,11 @@ inherit autotools gtk-icon-cache pkgconfig gconf mime
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-PACKAGES =+ "${PN}-scrollkeeper-leftovers"
-FILES_${PN}-scrollkeeper-leftovers = "${localstatedir}/lib/scrollkeeper"
-
 gnome_stage_includes() {
 	autotools_stage_includes
 }
+
+do_install_append() {
+	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
+}
+
-- 
1.6.3.1



