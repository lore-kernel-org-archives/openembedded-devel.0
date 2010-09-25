Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvT-0006vZ-Cb
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:06 +0200
Received: by pvg6 with SMTP id 6so977075pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=bQTuGCQ6/j8dnofKopdaShaiPHJm5EhKUA8JPVNbhNg=;
	b=YCT/WYNqnSTHDwpxSKxnr+sG0he7icCeWiwnlUP/v4hgrftKpQH+q+a9js+b9qWb90
	4OvdhHoAHGW7L/4xri2ViNsw+DoGsqBNdG9rxzn0PN3dFqD+NbsLf6H6nNPruWgWfYYr
	JqAvaDQMMpskkVV2ifPydMpLKlK5zu14x+F4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uh2luPqCrdrCiSlyr54BD0mo27go4obw7Tw0EXACnTZgYzUOxUwFmq8MOvF8m6Eitj
	jhOS2QJPrJcyHe2dxcqwrF4Q30vFhtU7vqLDgF678caq3L7mkDa2ke9v7jV7ZTYH/KpA
	ITjm9Lu2l1JNERcDsKclhtLOH1darJbOZmUN4=
Received: by 10.114.94.18 with SMTP id r18mr5901276wab.188.1285456369743;
	Sat, 25 Sep 2010 16:12:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:23 -0700
Message-Id: <1285456353-27457-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/12] insane.bbclass: Recognise mips64 and mips64el
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/insane.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 4696c25..5afa63c 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -48,6 +48,8 @@ def package_qa_get_machine_dict():
                         "m68k":       (    4,     0,    0,          False,         True),
                         "mips":       (    8,     0,    0,          False,         True),
                         "mipsel":     (    8,     0,    0,          True,          True),
+                        "mips64":     (    8,     0,    0,          False,         False),
+                        "mips64el":   (    8,     0,    0,          True,          False),
                         "nios2":      (  113,     0,    0,          True,          True),
                         "powerpc":    (   20,     0,    0,          False,         True),
                         "s390":       (   22,     0,    0,          False,         True),
@@ -65,6 +67,8 @@ def package_qa_get_machine_dict():
                         "x86_64":     (   62,     0,    0,          True,          False),
                         "mips":       (    8,     0,    0,          False,         True),
                         "mipsel":     (    8,     0,    0,          True,          True),
+                        "mips64":     (    8,     0,    0,          False,         False),
+                        "mips64el":   (    8,     0,    0,          True,          False),
                         "nios2":      (  113,     0,    0,          True,          True),
                         "powerpc":    (   20,     0,    0,          False,         True),
                         "sh4":        (   42,     0,    0,          True,          True),
-- 
1.7.0.4



