Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHkVX-0006nm-Mc
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 23:20:52 +0200
Received: by vws20 with SMTP id 20so453482vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=hkPuPg2+DYeUD5D/LLzxkQ2sYLWcMr7M+96Ee13IVT0=;
	b=ZpLwiWy7VIYuN8xP2Bc5rog5PgzqkXt+QVYamfs51u8vuocs+u0RJu6HXVI7fan0if
	fnPr5zhyg6qDVg2QmLye3XsJ0JlUpxjwnnhnJy7jcYAFS/vGd5SCfQGHgupTQr4bRui0
	+KOvvoKbVTEH0m1hyzJPJfwgvxObkzNmMDzys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=TGGNlifFGwJU8+ZNFycAM0dGG2dztBgSTTpH3bKrPU2x/3K4ag4CrQcuZlqS4yhpiT
	HgJOkk+9MIWA2WwTbyNfv1mW9nQ/Yr7DtjwVRnVDeeiKAT6veZcKhrJ11b0AMmlMu6s8
	o2NTcmVTd1YE9vkVRH24MD71ifuISB7KSCM6U=
Received: by 10.220.107.162 with SMTP id b34mr7956348vcp.235.1274995001806;
	Thu, 27 May 2010 14:16:41 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id z22sm6593023vco.10.2010.05.27.14.16.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 May 2010 14:16:41 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:16:25 -0700
Message-Id: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] bitbake.conf: use := for BUILD_OS and BUILD_ARCH
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
X-List-Received-Date: Thu, 27 May 2010 21:20:52 -0000

From: Chris Larson <chris_larson@mentor.com>

These don't change, so their initial values should be just fine.  Apparently,
in a typical build, those os.uname() snippets are called around 46k times,
which seems a tad excessive :)

Signed-off-by: Chris Larson <chris_larson@mentor.com>

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 12a5522..ee93cd4 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -90,8 +90,8 @@ target_datadir := "${datadir}"
 # Architecture-dependent build variables.
 ##################################################################
 
-BUILD_ARCH = "${@os.uname()[4]}"
-BUILD_OS = "${@os.uname()[0].lower()}"
+BUILD_ARCH := "${@os.uname()[4]}"
+BUILD_OS := "${@os.uname()[0].lower()}"
 BUILD_VENDOR = ""
 BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
 BUILD_PREFIX = ""
-- 
1.7.0.4



