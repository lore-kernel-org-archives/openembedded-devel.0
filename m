Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OYttq-0005P4-7c
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 06:48:51 +0200
Received: by pvg13 with SMTP id 13so3018226pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 21:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=vNAR4C2Qh/ZxJPAorZ2sPrd7skgOuuMyOwD+0ZwaIO0=;
	b=xjyz3pauRz9YEp/V6cxwvBI3B7LkznIpRrxCYe0qwwSoemR0A4W/88XECUcecY718s
	neijLbAtN8znlUW5/6+OyyidlFPgsB+oTWPH/RhzV6EzV6xBpOF8odfahPHAhRi7iJ9v
	5bz9k83Oum0U2/x5eRkD00KVp6UTjtjvvPjNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=eFN5KZsrJDwQ0tgY/Vzrrk+YCBguNebKJc5v8f1zId3KqunzSEzkiqsJKIrzv6XvwG
	1C8ZI4J0TlfNUxPR/slBPagExGbe8yDKpR++bm5gC4VjEEeplmFoNbSUo4zmXpnwPZ5A
	i2etLYCQzxnbB/F9d2f7Y+lDfMvqqM6FY3dXg=
Received: by 10.142.185.13 with SMTP id i13mr5698498wff.234.1279082926010;
	Tue, 13 Jul 2010 21:48:46 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 23sm7007625wfa.10.2010.07.13.21.48.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Jul 2010 21:48:44 -0700 (PDT)
Message-ID: <4C3D41A7.3080808@gmail.com>
Date: Wed, 14 Jul 2010 14:18:39 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] usermanual/chapters/recipes.xml: Executables should be executable.
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
X-List-Received-Date: Wed, 14 Jul 2010 04:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 docs/usermanual/chapters/recipes.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/chapters/recipes.xml b/docs/usermanual/chapters/recipes.xml
index fdee72c..5b0ff14 100644
--- a/docs/usermanual/chapters/recipes.xml
+++ b/docs/usermanual/chapters/recipes.xml
@@ -1138,7 +1138,7 @@ PR = "r0"</screen></para>
       is done via the install task, so we need to define a do_install function
       in the recipe to describe how to install the package:<screen>do_install() {
         install -m 0755 -d ${D}${bindir} ${D}${docdir}/myhelloworld
-        install -m 0644 ${S}/myhelloworld ${D}${bindir}
+        install -m 0755 ${S}/myhelloworld ${D}${bindir}
         install -m 0644 ${WORKDIR}/README.txt ${D}${docdir}/myhelloworld
 }</screen></para>
 
-- 
1.7.1



