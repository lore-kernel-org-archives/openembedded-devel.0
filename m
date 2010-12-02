Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNxUi-0007oU-G7
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 01:57:58 +0100
Received: by pxi17 with SMTP id 17so1219714pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 16:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=1VzzZSwOGmf8+VpgbHVtd+uWewpSW/bCB5uQJtnBLZw=;
	b=xWUsfllYhOsPOhWvQY3TeTxA9Rt/eFKquuyDrtNq5ueAqBW8xNHmUhpEeKDnk4Y2Gm
	GLe3iooh70aQsO5eDqhxlLHVf7pqAaMa4vmXkKXlAB75j99tYlw16y1u6BeHufPq6IX7
	Ho00AUbq+84Q5ZMlDWXd6YaJmGpDY+x+fxm60=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=dvlXh93Nc8FQhFl2UUFBZCmr1ABagkQeGNgQqHVAy5DEcV4xF13/G1NINeGC6gZbQl
	n7253/eCY4Nkt9Z1uyDMsBi0m0UqgCqcUEXKOxFR2IfKNpKEZo7mSna1dBUUYeTxtlu+
	hjAe2cpXWdxbQhrJ2M4evN7C71JbWhYejFDn8=
Received: by 10.142.253.21 with SMTP id a21mr9697770wfi.219.1291251393689;
	Wed, 01 Dec 2010 16:56:33 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id x35sm704318wfd.1.2010.12.01.16.56.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 16:56:32 -0800 (PST)
Message-ID: <4CF6EEBA.50907@gmail.com>
Date: Thu, 02 Dec 2010 11:26:26 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fbset_2.1.bb: Use ${sbindir} and ${datadir} instead of hardcoding.
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
X-List-Received-Date: Thu, 02 Dec 2010 00:57:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This ensures that the fbset package is non-empty for DISTRO=micro.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/fbset/fbset_2.1.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/fbset/fbset_2.1.bb b/recipes/fbset/fbset_2.1.bb
index 04ea35f..ad02fa9 100644
--- a/recipes/fbset/fbset_2.1.bb
+++ b/recipes/fbset/fbset_2.1.bb
@@ -20,10 +20,10 @@ inherit autotools update-alternatives
 PARALLEL_MAKE = ""
 
 do_install() {
-        install -d ${D}/usr/sbin ${D}/usr/share/man/man8 ${D}/usr/share/man/man5
-        install -m 0755 ${WORKDIR}/${P}/fbset ${D}/usr/sbin/fbset.real
-        install -m 0644 ${WORKDIR}/${P}/*.5 ${D}/usr/share/man/man5
-        install -m 0644 ${WORKDIR}/${P}/*.8 ${D}/usr/share/man/man8
+        install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man/man5
+        install -m 0755 ${WORKDIR}/${P}/fbset ${D}${sbindir}/fbset.real
+        install -m 0644 ${WORKDIR}/${P}/*.5 ${D}${datadir}/man/man5
+        install -m 0644 ${WORKDIR}/${P}/*.8 ${D}${datadir}/man/man8
 }
 
 ALTERNATIVE_NAME = "fbset"
-- 
1.7.1



