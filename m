Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1TjaO6-0000WA-98
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 19:53:34 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so6232506ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 10:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FuALWx17bwWoXi9CLABq2avkXjJLSSf9HWZikv94Xcc=;
	b=QeFBeqQ34jJg7jOcPF939bk08kvdzc+GB3jGLKWDQ2FcylTW3EfSJMS+PnaB7LPlJ8
	uF1GnkfLp3WdEJZcVdH+K1SkW7HrgeF2d3hUS1pIf5YiVFtZHtWmEobhxbsSQa8F5phy
	lKpf7DbAdtRzmvsPIdHqx2SMzTT21UtV4bnQvGtOtsnJHfR+G7aeUPb8z3qiRkpq84X9
	HZ4XCT9LgMzhevMU8kexv3yvj0F0gAASKu/57abilTd3LEJ5ZMvVsgXCgc2pyeEbDg6+
	f7M/2GlATDf+KF/l7YKXhctDarsky5IP+GO6pvDFExhfCeI4RVcAm//oZZMeD3mvSyZZ
	8+jQ==
Received: by 10.50.242.5 with SMTP id wm5mr2526999igc.68.1355510337351;
	Fri, 14 Dec 2012 10:38:57 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id uj11sm7283290igb.15.2012.12.14.10.38.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 10:38:56 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Dec 2012 13:38:34 -0500
Message-Id: <1355510314-17259-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.0.2
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] update oe-stylize to be Python3 comaptible
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
X-List-Received-Date: Fri, 14 Dec 2012 18:53:34 -0000

From: Cliff Brake <cbrake@bec-systems.com>

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
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



