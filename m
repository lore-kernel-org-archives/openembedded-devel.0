Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0pdM-0005CD-KN
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 06:50:47 +0200
Received: by ey-out-1920.google.com with SMTP id 3so1951373eyh.4
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Oct 2009 21:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=6Xjxw6xrro6lbeTE5vP+abhptsbWJ0AZGbYf+ewCOMM=;
	b=c3+L5kM2uW9TVP5BF+zImRwSoF2ulrR7csjWIM3f1yIAL6EdVGCp2cwSl1Q6obxC3i
	2+KqDCAFdBj7PpusvjBadX8CuEHNe+6ueLHzg6DqaQHHDNXug2yreJ3R0klByrc9F31n
	XLvbjdR+y+excOA0EcrW4SSvKvwdmpRihfLTU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=x5n1qa0ED83eJvgiQRkA+iBm6JACp6BXDpXBjUOywcZc8m3QxyFS+moo1lHvQRHph+
	W2LjVzJtyDHxBcQJZ7e+R/yivoNQ5D4QY+IZSW5pe6V5f7q7wihL9fQa7fttd2CQ8nEc
	V5M0LJ51ApdeLBYfUo3vGQsp6RgHlpeeKmtqY=
Received: by 10.216.89.10 with SMTP id b10mr3030237wef.182.1256186985084;
	Wed, 21 Oct 2009 21:49:45 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p37sm1455269gvf.9.2009.10.21.21.49.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Oct 2009 21:49:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@openembedded.org,
	bitbake-dev@lists.berlios.de
Date: Wed, 21 Oct 2009 21:49:23 -0700
Message-Id: <1256186963-8356-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] build.py: Check for valid file before removing zero sized file.
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
X-List-Received-Date: Thu, 22 Oct 2009 04:50:47 -0000

* getsize returns an error if the file does not exist
  we check first if the file exist and then we check if
  it is zero sized. So we can avoid the error when doing
  bitbake -c clean -b <recipe>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/bb/build.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/bb/build.py b/lib/bb/build.py
index 05b7d94..b7e93be 100644
--- a/lib/bb/build.py
+++ b/lib/bb/build.py
@@ -184,7 +184,7 @@ def exec_func(func, d, dirs = None):
         so.close()
         se.close()
 
-        if os.path.getsize(logfile) == 0:
+        if os.path.isfile(logfile) is True and os.path.getsize(logfile) == 0:
             bb.msg.debug(2, bb.msg.domain.Build, "Zero size logfile %s, removing" % logfile)
             os.remove(logfile)
 
-- 
1.6.3.3



