Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O5II1-0002rn-GO
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Apr 2010 14:47:25 +0200
Received: by wwb18 with SMTP id 18so5382039wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Apr 2010 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=RKX7pNnR2N9arQMOJ/wYoR8xw1JBTzs/7oo1gAT2GWY=;
	b=eB2NEcZQ86Avk5TgK8c6iZh2BM+NzraWF3JUj+/KP8pZv0sJgKARZ/yev+3KcSB2Z8
	KLWQyhWX4DneKZjV23h7gFTmLUppK0JirmPpnKDaHR6g9gc/VZD0Oj2udnqjWV4a5VqP
	8EnzyswEAx99ZHuIpDY9KdqdpyA0VH/mJc+38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=OVhG8v4ccXRF3UIIINUSg7tSHojqE7KkJZ+tW4La5g6c5VTxjm6D1PQ91JK2df/cwc
	hgpdQLPt6gbOT0uvbPZTpPnAtn13NFjbuwcXU8O+MrGJuQyiSGAo4z8awyTyEZ17nGNy
	KJkQfH5GGZt4il0YaC/tkrvcueu6slRZ9/9gc=
Received: by 10.216.88.20 with SMTP id z20mr1922740wee.222.1272026627446;
	Fri, 23 Apr 2010 05:43:47 -0700 (PDT)
Received: from localhost.localdomain (delta360.server4you.de [85.25.136.130])
	by mx.google.com with ESMTPS id l46sm450084wed.10.2010.04.23.05.43.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 23 Apr 2010 05:43:46 -0700 (PDT)
Sender: Mickael Chazaux <mickael.chazaux@gmail.com>
From: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Apr 2010 14:42:38 +0200
Message-Id: <1272026558-6493-1-git-send-email-mchazaux@adeneo-embedded.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Micka=C3=ABl=20Chazaux?= <mchazaux@adeneo-embedded.com>
Subject: [PATCH] Add error handling to stage-manager
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
X-List-Received-Date: Fri, 23 Apr 2010 12:47:26 -0000

	Add an error message telling the cause of the crash to the user.
---
 recipes/stage-manager/files/stage-manager |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/recipes/stage-manager/files/stage-manager b/recipes/stage-manager/files/stage-manager
index 536d1af..a2ecebe 100755
--- a/recipes/stage-manager/files/stage-manager
+++ b/recipes/stage-manager/files/stage-manager
@@ -29,11 +29,15 @@ def read_cache(cachefile):
     lines = f.readlines()
     f.close()
     for l in lines:
-        data = l.split('|')
-        cache[data[0]] = {}
-        cache[data[0]]['ts'] = int(data[1])
-        cache[data[0]]['size'] = int(data[2])
-        cache[data[0]]['seen'] = False
+	try:
+            data = l.split('|')
+            cache[data[0]] = {}
+            cache[data[0]]['ts'] = int(data[1])
+            cache[data[0]]['size'] = int(data[2])
+            cache[data[0]]['seen'] = False
+	except IndexError, e:
+            print("Corrupted line in cachefile " + cachefile + " : " + l)
+	    raise e
     return cache
 
 def mkdirhier(dir):
-- 
1.6.3.3



