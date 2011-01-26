Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA7V-0006U5-8u
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:29:29 +0100
Received: by eya28 with SMTP id 28so614345eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=x/rzEsjzDYkR0Sv4+pwpTbubVLeipHi3AZfPzin3a44=;
	b=dxUZoTHrLFfjRZQGhHWfa8UkzAjefDQ5/C6jGmhUI7Wc6c5cdleT8UChmZcx4WQu8E
	rscbU9d4pQ8/kwTucWPwqBnOUD0ghW7qKYJ5NqV+gqfxOCitPYDfBSXO+4WRj910GVkT
	M0NJ3mh4ysX58JkYfG1ofxuOugburQQLIMGgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=urNI81op1MWihLNfkot03f47AyTt8+lCbS96YziEtqjWAu9KC41t59q6FptsM2YDo2
	U59FwxM1rbK4TbrN4qJVrsgN9+EAZvGGhO9UOf2yDf2gprRiOeqLgrYEuDJdgWTLykGC
	lRgHYupuy/TjguplNa5J9j5caXPPaMH4zp76w=
Received: by 10.204.121.193 with SMTP id i1mr648260bkr.212.1296065617742;
	Wed, 26 Jan 2011 10:13:37 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id z18sm5428822bkf.20.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:36 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002WI-SH; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:31 +0100
Message-Id: <1296065612-9637-9-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
References: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 8/9] image.bbclass: only insert feed uris if ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Wed, 26 Jan 2011 18:29:29 -0000

Previously if ONLINE_PACKAGE_MANAGEMENT="none" but one had
FEED_DEPLOYDIR_BASE_URI set, it tried to create files in a non-existing
dir in the image (there is no /etc/opkg/ if no online package management
is requested).

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/image.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index db13dd0..9765442 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -172,7 +172,8 @@ fakeroot do_rootfs () {
 
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
-	insert_feed_uris
+	[ "${ONLINE_PACKAGE_MANAGEMENT}" != "none" ] && \
+		insert_feed_uris
 
 	${IMAGE_PREPROCESS_COMMAND}
 
-- 
1.7.2.3



