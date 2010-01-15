Received: from gateway-2929.mvista.com ([206.112.117.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1NVqZ2-00013a-Re
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 19:06:42 +0100
Received: from localhost.localdomain (foul.az.mvista.com [10.50.1.75])
	by hermes.mvista.com (Postfix) with ESMTP id D944E1DBA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2010 09:45:24 -0800 (PST)
From: Chris Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2010 10:36:58 -0700
Message-Id: <1263577018-9627-1-git-send-email-clarson@mvista.com>
X-Mailer: git-send-email 1.6.4.339.g527d
X-SA-Exim-Connect-IP: 206.112.117.47
X-SA-Exim-Mail-From: clarson@mvista.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] base.bbclass: in base_contains, check for var existance before using it
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
X-List-Received-Date: Fri, 15 Jan 2010 18:06:42 -0000

From: Brian Pomerantz <bapper@mvista.com>

When using base_contains() to check for a string in a variable for a,
if the variable is not defined an exception occurs.  By checking the
existance of the variable and returning false if it isn't there,
a value can be checked for a variable regardless of whether or not it
is defined.

Signed-off-by: Brian Pomerantz <bapper@mvista.com>
Signed-off-by: Chris Larson <clarson@mvista.com>
---
 classes/base.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 384a67d..f67773a 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -226,14 +226,17 @@ def base_version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def base_contains(variable, checkvalues, truevalue, falsevalue, d):
+	val = bb.data.getVar(variable,d,1)
+	if not val:
+		return falsevalue
 	matches = 0
 	if type(checkvalues).__name__ == "str":
 		checkvalues = [checkvalues]
 	for value in checkvalues:
-		if bb.data.getVar(variable,d,1).find(value) != -1:	
+		if val.find(value) != -1:
 			matches = matches + 1
 	if matches == len(checkvalues):
-		return truevalue		
+		return truevalue
 	return falsevalue
 
 def base_both_contain(variable1, variable2, checkvalue, d):
-- 
1.6.4.339.g527d



