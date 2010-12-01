Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNcV3-0004Xe-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 03:32:55 +0100
Received: by pxi17 with SMTP id 17so1033925pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 18:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=/dlVKT2Y43B9M9uHyt4+FAt+klPw1cnKd+xwUNoLJzk=;
	b=sz1Yc8PyUsa28rRBjt11YVjh/qtmaIMIUvLOvd7J6kTQMGpMqXrf1Vw4X6DKgL3SzA
	TwUkKRB5VtpQZT0ANqlo8soiO7YJcuIX68gcQcLx6IeGVVOaL7mj9XxF+7f4e5/rzdSt
	BlYvyyjNyUtq2KgPa50ryDC44mnXlSHBoOVXQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=bxMvdur4kUD/S8v08+gaG/woVkNjNdiWvWbY61Eahlz18xY7zKrXESOQjPFvot54KG
	N83kzjZgzyCP8BsNYoUIcfBJ0ltjJDuzwLTLy+w1pl8kUH8WhPG5UW7bLbvF/XwYjIrf
	bgHLRyweiNpN/JjQLMt7L4L/guJN5k0xf8YmY=
Received: by 10.142.217.16 with SMTP id p16mr8134176wfg.279.1291170690007;
	Tue, 30 Nov 2010 18:31:30 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm9786088wff.4.2010.11.30.18.31.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 18:31:29 -0800 (PST)
Message-ID: <4CF5B37B.9010508@gmail.com>
Date: Wed, 01 Dec 2010 13:01:23 +1030
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
Subject: [PATCH] gzip_1.4.bb: Fix do_install for DISTRO=micro.
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
X-List-Received-Date: Wed, 01 Dec 2010 02:32:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

mv: `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/gzip-1.4-r3/image/bin/gunzip' and `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/gzip-1.4-r3/image/bin/gunzip' are the same file

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gzip/gzip_1.4.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/gzip/gzip_1.4.bb b/recipes/gzip/gzip_1.4.bb
index eb89f79..020e31a 100644
--- a/recipes/gzip/gzip_1.4.bb
+++ b/recipes/gzip/gzip_1.4.bb
@@ -19,10 +19,12 @@ alternatives = "gunzip gzip zcat"
 do_install () {
     autotools_do_install
     # Move files into /bin (FHS)
-    install -d ${D}${base_bindir}
-    for file in ${D}${bindir}/*; do
-        mv $file ${D}${base_bindir}/
-    done
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        install -d ${D}${base_bindir}
+        for file in ${D}${bindir}/*; do
+            mv $file ${D}${base_bindir}/
+        done
+    fi
 }
 
 do_install_append_pn-gzip () {
-- 
1.7.1



