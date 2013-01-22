Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Txd5k-0002z5-C3
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:37:00 +0100
Received: by mail-we0-f181.google.com with SMTP id u7so1815397wey.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=GgiYKo0fpClfEk6AGkhgZfI6cylfTiNHS9cbnhWtV5E=;
	b=P4TWgeoPbNBYgm7M5CrIfm8jvLpE55uMbfZKM/fpk4SDCQAca4gDEKKS5PqcbBjDgW
	6+rwrFKj7p44y+72mp/4rfFPbk6fp6NHHbtWnUExwcU2RRvsJqsl4o5IdLM5ZZLKXBr7
	9yCwnJfoahO6SOtM3vQls9d2pvuRPqI64WbWOqzAMz/BfN86zF4lO4UrxjC/eyM/yrEE
	Oe/UVsVGfECy6+Sfh4Hx6x5VFU1RPJs2M65ir8HYD0qnCTocCYFIsG4D58HVqRgy50Do
	lKZn9YSq9rHTl/0ddJpd1f8n8WXla22zN7TZSKNMy9Qsn3cUhtylF+l10BqBVp9OwRJi
	9F4Q==
X-Received: by 10.180.99.129 with SMTP id eq1mr20821774wib.30.1358857258377;
	Tue, 22 Jan 2013 04:20:58 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g2sm23570071wiy.0.2013.01.22.04.20.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:20:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 13:20:56 +0100
Message-Id: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH][meta-oe][meta-networking][meta-xfce 1/4] openldap: fix QA warnings
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
X-List-Received-Date: Tue, 22 Jan 2013 12:37:36 -0000

* openldap-2.4.23: openldap: Files/directories were installed but not shipped
    /var/volatile
    /var/volatile/run

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index b9441ef..319c50d 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -219,10 +219,10 @@ PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
 
 # Package contents - shift most standard contents to -bin
 FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
-FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run \
+FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
     ${sysconfdir}/openldap/DB_CONFIG.example"
-FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run"
+FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run ${localstatedir}/volatile/run"
 FILES_${PN}-bin = "${bindir}"
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
 FILES_${PN}-dbg += "${libexecdir}/openldap/.debug"
-- 
1.8.1.1



