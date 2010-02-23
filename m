Received: from mail-qy0-f192.google.com ([209.85.221.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NjjHU-0007LX-M4
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 02:09:47 +0100
Received: by qyk30 with SMTP id 30so3827694qyk.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2010 17:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=M/c4yA6jXpm1qvPfNGzkkHc9ADIQhTRToLTi6DvcgIM=;
	b=b1CPkygB7rlVyHLy795Fmj28rGRsvze1gNTY5eMj4LzhJINplZHHc25Vcvb26mOUqL
	Dgpoj47Y4shGbmdRqSpkRf7Ak6YE5dE2e+LL6WMX33ogedBfnPZT8dhpYv4TKlsFjWwO
	bbSgJ5lfbqeEjbkH/mew/H8eJzQsgcXs6n6VI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=Pc4KqRvrGMfKe4C6Ctj4clcj0lpfyeDD17M3s0+0fst881F+jshbsn7iqYnNb30umi
	XbcL0bg6KM8FxUP9t2KdCOmybk8LPLUMFadQox12L7WI4qL+R50LNw2GtfajNJLGfmX1
	0wyWzBjIenTpUSvfRwmKQuzFiTRPa6B1Hq8XU=
Received: by 10.224.5.72 with SMTP id 8mr315106qau.96.1266887219704;
	Mon, 22 Feb 2010 17:06:59 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id 20sm3120418qyk.1.2010.02.22.17.06.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Feb 2010 17:06:58 -0800 (PST)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2010 18:06:51 -0700
Message-Id: <1266887211-31228-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.221.192
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] insane: check for .debug as a path component, not part of the path string
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
X-List-Received-Date: Tue, 23 Feb 2010 01:09:47 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/insane.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 804caf0..c2e8d9c 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -279,7 +279,7 @@ def package_qa_check_dbg(path, name,d, elf):
     sane = True
 
     if not "-dbg" in name:
-        if '.debug' in path:
+        if '.debug' in path.split(os.path.sep):
             error_msg = "non debug package contains .debug directory: %s path %s" % \
                      (name, package_qa_clean_path(path,d))
             sane = package_qa_handle_error(3, error_msg, name, path, d)
-- 
1.6.3.3



