Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JSzfq-00056P-IU
	for openembedded-devel@openembedded.org; Sat, 23 Feb 2008 20:04:58 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1NJ4KnR029854
	for <openembedded-devel@openembedded.org>; Sat, 23 Feb 2008 19:04:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29597-06 for <openembedded-devel@openembedded.org>;
	Sat, 23 Feb 2008 19:04:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1NJ4Gnk029846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 23 Feb 2008 19:04:16 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Sat, 23 Feb 2008 19:04:17 +0000
Message-Id: <1203793457.8255.5.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Uppercase overrides and parsing speed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Feb 2008 19:05:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

At OEDEM I mentioned that we might have some speed gain if bitbake could
more easily tell what constituted an override. All current overrides are
lower case and we don't have any in upper case. I tried having bitbake
ignore uppercase overrides (things like URI in SRC_URI) and saw a 2.5%
increase in parsing speed. A patch for bitbake is appended in case
anyone wishes to experiment.

Note it doesn't 100% disambiguate the situation since we have lowercase
variables.

Cheers,

Richard


Index: lib/bb/data_smart.py
===================================================================
--- lib/bb/data_smart.py	(revision 1010)
+++ lib/bb/data_smart.py	(working copy)
@@ -156,9 +156,10 @@
         # more cookies for the cookie monster
         if '_' in var:
             override = var[var.rfind('_')+1:]
-            if not self._seen_overrides.has_key(override):
-                self._seen_overrides[override] = Set()
-            self._seen_overrides[override].add( var )
+            if not override.isupper():
+                if not self._seen_overrides.has_key(override):
+                    self._seen_overrides[override] = Set()
+                self._seen_overrides[override].add( var )
 
         # setting var
         self.dict[var]["content"] = value



