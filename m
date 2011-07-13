Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <howard.gray@matrix-vision.de>) id 1Qh3CX-0003eL-GN
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jul 2011 19:26:21 +0200
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id F1D6440601
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:22:22 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id C3E383F61B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:22:22 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id 4B4C36F8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:22:22 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id 3EB156F9C; Wed, 13 Jul 2011 19:22:22 +0200 (CEST)
Received: from [192.168.65.9] (desmond.intern.matrix-vision.de [192.168.65.9])
	by erinome (Postfix) with ESMTPA id 2C1086F8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 19:22:22 +0200 (CEST)
Message-ID: <4E1DD44D.8020307@matrix-vision.de>
Date: Wed, 13 Jul 2011 19:22:21 +0200
From: "Howard D. Gray" <howard.gray@matrix-vision.de>
Organization: MATRIX VISION GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.1
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
Subject: angstrom: glibc: Using config files in /etc/ld.so.conf.d/
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
X-List-Received-Date: Wed, 13 Jul 2011 17:26:21 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

IMHO it would be useful if packages could install their own *.conf files
in  /etc/ld.so.conf.d/ so that non-standard directories could also be
used for libraries. Many other distributions allow this by using an
"include" line in /etc/ld.so.conf.

Is there any reason for not doing it like this, for example, and then
letting other packages add *.conf files to the directory as they require ?

---
diff --git a/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
b/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
index 46e06d3..c2ae026 100644
--- a/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
+++ b/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
@@ -1,2 +1,3 @@
 /usr/local/lib
+include /etc/ld.so.conf.d/*.conf






-- 
Howard


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Erhard Meier


