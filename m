Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1Q5M2z-0007mF-HA
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 19:52:41 +0200
Received: by wwb17 with SMTP id 17so2727885wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=VkaFPKuoUWqY1KU3TlV5V4W/RyqZUseeEcSIYdozZmg=;
	b=AFivqc9VHQQWI/WnZ/N7p4tjQMlgJ7+4FmiGjccJHx3JIx2PuH6ZSGLn3nlP58foIY
	S0SdzVrY6hvEtw6DHnpAxdQry/r682Lzih5DSRQP6gS3J7M45GlYoYr/mNJHmlRQ0m8c
	f4RKBbnuSw0HutwO9TY+buI8GG+S+P4D59dec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=N0SoA9O11NLFdjHI5xQ6IGnTnkoJAXLQpqjgc2vaER95gHFrwjayNGyHQa9VRJJ/aU
	tJHdEnhSnlbwTSD/5RP1PbAlKHg9MOoTaFuxtXQXj4wTI8GV30WNQjXfrhxHwtKme6nY
	5oRtal0OPknnWxixxM8Kpo5goxZCCYcxETPqc=
Received: by 10.227.139.19 with SMTP id c19mr3086445wbu.13.1301593838256;
	Thu, 31 Mar 2011 10:50:38 -0700 (PDT)
Received: from localhost.localdomain (29.pool85-50-66.dynamic.orange.es
	[85.50.66.29])
	by mx.google.com with ESMTPS id g7sm794016wby.65.2011.03.31.10.50.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 10:50:37 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 19:53:01 +0200
Message-Id: <1301593981-3502-1-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] tune-atom.inc: add i686 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 31 Mar 2011 17:52:41 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 conf/machine/include/tune-atom.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/tune-atom.inc b/conf/machine/include/tune-atom.inc
index 44058c1..01c41d3 100644
--- a/conf/machine/include/tune-atom.inc
+++ b/conf/machine/include/tune-atom.inc
@@ -6,4 +6,4 @@ TARGET_CC_ARCH = "-march=core2"
 #TARGET_CC_ARCH = "-march=i686 -mtune=atom"
 BASE_PACKAGE_ARCH = "i686"
 FEED_ARCH = "i686"
-PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586"
\ No newline at end of file
+PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586 i686"
-- 
1.7.4.1



