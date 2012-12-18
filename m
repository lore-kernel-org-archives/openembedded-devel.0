Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g9-00072P-0l
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:09 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so381528eaa.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=AEDetoAZ8t6icYk0RzalRMFNCRD/buV3n2Ta4PRzcVk=;
	b=MWZRD7Z2vEkcE6kvtf2dIpYAKXfRnfOnQ1DGx7XddPlj9z4/eJxmJNuw1/kDxwE5gF
	Byus9iWZhm1jDtDYImbX/hqntUOQRuRYJ1toXIoY8Kdv6cXa2b15lxoOZuFSJcv6h2nz
	6eE09KLVSRITtjc9dkjXAuLOuUnp2mN/aCUy25vL1rWl8Pvh+pN7wsS6ULYRRJ0rBQxT
	q9ZaGjv7Ccx+WXUil6qTOQhVQhCRsj39bCAYW/itQvgAmAOeMU8/frVbVN4uTjKW47O7
	RRxYLi8hDLgsh0SeeEyJej7DxkLSCHDPh6ULNgC7pohddOxEZFPUFmz7h0YfdwiuNbGG
	s24Q==
X-Received: by 10.14.194.195 with SMTP id m43mr6976026een.44.1355849723313;
	Tue, 18 Dec 2012 08:55:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b2sm4223651eep.9.2012.12.18.08.55.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:08 +0100
Message-Id: <20ce63275033b54c33c25fa1c60de7c1a0dc816c.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/10] update oe-stylize to be Python3 comaptible
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 contrib/oe-stylize.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 07ed4f6..712557d 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -306,10 +306,10 @@ def follow_rule(i, line):
         # if the line still does not respect the rule
         if not rules[i][0](line):
             # this is a rule disgression
-            print "## Disgression: ", rules[i][2], " in:", oldline
+            print ("## Disgression: ", rules[i][2], " in:", oldline)
         else:
             # just remind user about his/her errors
-            print "## Reminder: ", rules[i][2], " in :", oldline
+            print ("## Reminder: ", rules[i][2], " in :", oldline)
     return line
 
 
@@ -363,7 +363,7 @@ if __name__ == "__main__":
             commentBloc.append(line)
             continue
 
-        if seen_vars.has_key(var):
+        if var in seen_vars:
             for c in commentBloc: seen_vars[var].append(c)
             commentBloc = []
             seen_vars[var].append(line)
@@ -381,7 +381,7 @@ if __name__ == "__main__":
                 line = follow_rule(5, line)
             if var == "":
                 if not in_routine:
-                    print "## Warning: unknown variable/routine \"%s\"" % originalLine.rstrip('\n')
+                    print ("## Warning: unknown variable/routine \"%s\"" % originalLine.rstrip('\n'))
                 var = 'others'
             for c in commentBloc: seen_vars[var].append(c)
             commentBloc = []
@@ -402,5 +402,5 @@ if __name__ == "__main__":
             for l in seen_vars[k]: 
                 olines.append(l)
             previourVarPrefix = k.split('_')[0]=='' and "unknown" or k.split('_')[0]
-    for line in olines: print line
+    for line in olines: print(line)
 
-- 
1.8.0.2



