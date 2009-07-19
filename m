Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MSfCW-00038m-0a
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Jul 2009 00:49:48 +0200
Received: by qw-out-1920.google.com with SMTP id 4so585068qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/v4Eg1/+U/l8OTZbaMWI58ZU4wTEGPtHnBRrL/iDj1U=;
	b=KkTCzAu5cRxyP2CM15mPCk+Q1JCGAjbzurpFpb4VawOIkzcwdxAPpN7EMcmy5sAKTm
	2NQzYnvJn2a1DvJjYR80t1lbGPjcWD7J7QUWlpYhalgHU1Lmgc/AXhZDI0hlcWl9/mEP
	KP0svFgm7JEWN/w7Ih/UeHotpM3QtJvzZ9saM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=MveHkiV7A9TvbZQuiyn/2uw9AAMlmCW4++yg9I6u0EdtNHdJtEJnrz4yJ4fQmF0EkZ
	SPi90ZyZhIjEG9YWwAnd1jX73qPtAPpaAUYb71fi8a80ACeRtRcdzCnQIXEKcdgVC0QN
	2NZFU93APmIi77yCo4nYk8fHGtwPgoI9P0Nnk=
Received: by 10.224.89.75 with SMTP id d11mr1058279qam.45.1248042956235;
	Sun, 19 Jul 2009 15:35:56 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm3511526qwf.58.2009.07.19.15.35.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Jul 2009 15:35:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 77F6A6100E0; Sun, 19 Jul 2009 19:34:04 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jul 2009 19:33:58 -0300
Message-Id: <1248042838-7496-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.3.385.g60647
In-Reply-To: <1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] Avoids overwriting Python's built-in `str' in get_devtable_list
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
X-List-Received-Date: Sun, 19 Jul 2009 22:49:49 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/image.bbclass |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 864230b..3b6d429 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -72,13 +72,11 @@ def get_devtable_list(d):
     devtable = bb.data.getVar('IMAGE_DEVICE_TABLE', d, 1)
     if devtable != None:
         return devtable
-    str = ""
     devtables = bb.data.getVar('IMAGE_DEVICE_TABLES', d, 1)
     if devtables == None:
         devtables = 'files/device_table-minimal.txt'
-    for devtable in devtables.split():
-        str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
-    return str
+    return " ".join([ bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
+                      for devtable in devtables.split() ])
 
 def get_imagecmds(d):
     import bb
-- 
1.6.3.3.385.g60647



