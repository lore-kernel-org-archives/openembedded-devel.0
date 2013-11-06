Return-Path: <joe@deserted.net>
Received: from mail-qe0-f54.google.com (mail-qe0-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD496CA17
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 15:42:36 +0000 (UTC)
Received: by mail-qe0-f54.google.com with SMTP id 1so6265103qec.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Nov 2013 07:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5SbklxiALwSUp3wE4rTM36/5FuaeCRsyQN/KUmvPBH4=;
	b=ioyzpIjOUiwJteUgeAaJNlDU9ZvTRAza78y5JFyhMmX1yaA4BWmH5NSgGKKbmPf4C8
	gWniSbXWB0gJOyZkXFbk+ZGDLRZ6gyW0sEAItaBlQOuB64W6PYLWLol/Pwa1CQ9x9Ojs
	+ZynVXnjJonKbk9u1vojTPSBBgNx92xRCtfRdf5PBepmXeBi4bMKROTyH+DgtY6RXmpq
	8EsfJp363CXj8kzjvlZ3FkG9tcAgzrO0ocIL+Z8OuYD5h/JUDlhCznXyx5XWOcl/dkTP
	t1YHJfoR4O3R7FSCGypm0amvfSc0eW2X/KgpY9qFx3htfLT3VDqkbNDNA4GpKBW/AwOk
	shlw==
X-Gm-Message-State: ALoCoQllwRfKDEMBHne+aUrKlSK3wM5Hgc+sd41epLm9Di30voHnSO5g4UnTWxw8A/WceEZwcp3w
X-Received: by 10.224.103.66 with SMTP id j2mr6809366qao.66.1383752557482;
	Wed, 06 Nov 2013 07:42:37 -0800 (PST)
Received: from burninator.corp.ad.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id h2sm59795858qaf.10.2013.11.06.07.42.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Nov 2013 07:42:36 -0800 (PST)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Nov 2013 10:42:35 -0500
Message-Id: <1383752555-25620-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] crda: correct QA issues with sbindir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Nov 2013 15:42:37 -0000

regdbdump and crda are installed in /sbin/ and still link against stuff in
/usr/lib, causing QA warnings / errors:

   WARNING: QA Issue: crda: /sbin/regdbdump, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libgcrypt.so.11 => /usr/lib64/libgcrypt.so.11 (0x00000000dead1000)
   WARNING: QA Issue: crda: /sbin/regdbdump, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libgpg-error.so.0 => /usr/lib64/libgpg-error.so.0 (0x00000000dead3000)
   WARNING: QA Issue: crda: /sbin/crda, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libgcrypt.so.11 => /usr/lib64/libgcrypt.so.11 (0x00000000dead1000)
   WARNING: QA Issue: crda: /sbin/crda, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libnl-genl-3.so.200 => /usr/lib64/libnl-genl-3.so.200 (0x00000000dead2000)
   WARNING: QA Issue: crda: /sbin/crda, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libnl-3.so.200 => /usr/lib64/libnl-3.so.200 (0x00000000dead3000)
   WARNING: QA Issue: crda: /sbin/crda, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libnl-nf-3.so.200 => /usr/lib64/libnl-nf-3.so.200 (0x00000000dead4000)
   WARNING: QA Issue: crda: /sbin/crda, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libnl-route-3.so.200 => /usr/lib64/libnl-route-3.so.200 (0x00000000dead5000)
   WARNING: QA Issue: crda: /sbin/crda, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libgpg-error.so.0 => /usr/lib64/libgpg-error.so.0 (0x00000000dead7000)

relocate them to /usr/sbin to squelch the warning.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---

The other obvious solution would be to mve these libraries into ${base_libdir}
but that really doesn't seem appropriate in this case.

 meta-networking/recipes-connectivity/crda/crda_1.1.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
index 3ef9210..8339893 100644
--- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
@@ -24,7 +24,7 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake install
+    oe_runmake SBINDIR=${sbindir} install
 
     install -d ${D}${libdir}/crda/
 
-- 
1.7.10.4


