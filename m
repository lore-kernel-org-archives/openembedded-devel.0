Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNd6V-0005P4-7A
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 04:11:37 +0100
Received: by pxi17 with SMTP id 17so1038140pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 19:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=TAc7HQyOh+apgTvW0O7S1t8PkxVtThIyzTIkxJPYw8c=;
	b=BI2cZbeclG51Qrse2Pe6vLnzsChI2jaEY97mkpaBr0OSN6jhPvtvUgcAFnO9R16GK5
	3f3jaU9/p5hCcmKKiaaP6Xy8qF7hM2mnk462S7qd87EPCg/Wf1KHluOBhAUyy3yfMk6Y
	zNukkLXlKpWs4tppl4ewiF2axtm8mGnzx64sk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=TwV70cKgLNw8TglfOpwQ6hyRAI2LJ53KRw6oFEjcSaONtnMTm364PQXcqO+ZCGDWO2
	F71mEH2wmxJfKqspRcqcqS/v9Ge1sJ/HNmyx8VXNWGxqgXDKjG66cLwSZKlHpJ0w3iIi
	bKPkYPvVkcMfxbXrz9/KgAvF2giLZfmI7g218=
Received: by 10.142.165.18 with SMTP id n18mr8146879wfe.175.1291173013452;
	Tue, 30 Nov 2010 19:10:13 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	b11sm9820857wff.21.2010.11.30.19.10.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 19:10:12 -0800 (PST)
Message-ID: <4CF5BC8F.7060704@gmail.com>
Date: Wed, 01 Dec 2010 13:40:07 +1030
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
Subject: [PATCH] debianutils.inc: Fix do_install for DISTRO=micro.
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
X-List-Received-Date: Wed, 01 Dec 2010 03:11:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mv: `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/debianutils-2.30-r2/image/bin/run-parts.debianutils' and `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/debianutils-2.30-r2/image/bin/run-parts.debianutils' are the same file

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/debianutils/debianutils.inc |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes/debianutils/debianutils.inc b/recipes/debianutils/debianutils.inc
index 9d32606..1ad766d 100644
--- a/recipes/debianutils/debianutils.inc
+++ b/recipes/debianutils/debianutils.inc
@@ -11,11 +11,13 @@ do_install_append() {
     for app in ${D}${sbindir}/* ${D}${bindir}/*; do
         mv $app $app.${PN}
     done
-    # Debian places some utils into ${base_bindir} as does busybox
-    install -d ${D}${base_bindir}
-    for app in run-parts.${PN} tempfile.${PN}; do
-        mv ${D}${bindir}/$app ${D}${base_bindir}/$app
-    done
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        # Debian places some utils into ${base_bindir} as does busybox
+        install -d ${D}${base_bindir}
+        for app in run-parts.${PN} tempfile.${PN}; do
+            mv ${D}${bindir}/$app ${D}${base_bindir}/$app
+        done
+    fi
 }
 
 pkg_prerm_${PN} () {
-- 
1.7.1



