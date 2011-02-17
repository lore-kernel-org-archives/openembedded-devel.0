Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PpxgM-0003nz-Lr
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 07:49:42 +0100
Received: by pxi17 with SMTP id 17so306322pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 22:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=63tdd9AdYOav1xRrfrOt/6gXkZCig8MOxjbKJWl5BJk=;
	b=WdYGyn4nkecFq4JGWCpkih44ivOhLxgfsRcZ1gGjs17GggtLfRxfsypRy4rOQHbrgb
	W5N7/aaG8o4RXkZOYwUkj443m1nFYx+YIJeMblifc0EGWiLZ6xsm+ydjoHldqBYsQMPT
	Vw9V7Ki8cWaYe2zhXZD/0rL3NTTTbeEemk56g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=h4GXvDO89o+YkeP7obNxQdueTeQfyc0leVJmCFnt8Rsczk2J/6vd+vf0Wnomd4czpM
	k1FEGhDZQ+4DnJf3Q8a2aJc7nVl0dLah+eK9Nwn+SyfbNCU32dQ8R8hbs+UdHhFtkraY
	/475nG4poO5JIZXdWcUaoirrRQvCBvp+AaYA0=
Received: by 10.142.170.13 with SMTP id s13mr1238841wfe.109.1297925309674;
	Wed, 16 Feb 2011 22:48:29 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f5sm819521wfo.4.2011.02.16.22.48.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 22:48:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 22:48:24 -0800
Message-Id: <1297925304-12171-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] contrib/testing/testscript.sh: Dont define BBMASK
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
X-List-Received-Date: Thu, 17 Feb 2011 06:49:42 -0000

* BBMASK is set in bitbake.conf by default and it
  skips nonworking and obsolete recipes which is
  what we want emptying it here could cause redundant
  parse of the graveyards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/testing/testscript.sh |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/contrib/testing/testscript.sh b/contrib/testing/testscript.sh
index 992b02e..3c3927f 100755
--- a/contrib/testing/testscript.sh
+++ b/contrib/testing/testscript.sh
@@ -49,9 +49,6 @@ TMPDIR = "${TOPDIR}/tmp"
 BBFILES = "${TOPDIR}/openembedded/recipes/*/*.bb"
 ENABLE_BINARY_LOCALE_GENERATION = "0"
 
-# Which files do we want to parse:
-BBMASK = ""
-
 # ccache always overfill $HOME....
 CCACHE=""
 
-- 
1.7.2.3



