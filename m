Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1OxlOQ-0007CQ-9I
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 20:47:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 141D38A4F4D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 14:47:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08525-01 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 20 Sep 2010 14:47:09 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id C5E1D8A4F3B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 14:47:07 -0400 (EDT)
Message-ID: <4C97AC2B.1040205@cbnco.com>
Date: Mon, 20 Sep 2010 14:47:07 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Mon, 20 Sep 2010 18:47:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In case the build system is running some ancient make, we can just as 
easily build our own make (3.82) to get predictable behaviour. Does 
something like this make sense?

diff --git a/classes/base.bbclass b/classes/base.bbclass
index b19eb32..5c6d41d 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -71,7 +71,7 @@ def base_deps(d):
         if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
                 if (bb.data.getVar('HOST_SYS', d, 1) !=
                     bb.data.getVar('BUILD_SYS', d, 1)):
-                       deps += " virtual/${TARGET_PREFIX}gcc virtual/libc "
+                       deps += " make-native 
virtual/${TARGET_PREFIX}gcc virtual/libc "
                 elif bb.data.inherits_class('native', d) and \
                                 bb.data.getVar('PN', d, True) not in \
                                 ("linux-libc-headers-native", 
"quilt-native",


