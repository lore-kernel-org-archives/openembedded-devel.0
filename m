Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PPxHB-0006rX-3D
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 14:08:20 +0100
Received: by fxm17 with SMTP id 17so9869780fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 05:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=75zEb198ih11J0xBHTgEhtk9xTCvuT7JEDI/+h+dNq0=;
	b=FVnSfVMdX2iP6YUBUWNCLDcQNgP1dZ9pkXscyh7g5UP+m3TNCN/K2XDbx8hAeaQxqC
	pQswXCMkbZd1vjgtyAZ4j/Xx+vfoyeTI+Ilf7dfZGRHywwZ3MzwLpZJVG4Z7m3iRxwRc
	zpzZ7qJ9Nb+FkWPY1hV26ZnYvbPcIEvzHXbuI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Kn1M2rJkMpUWu+SjGy9uwsa2Nz3RZvkTsbFKDseE917GGGjbyP+M7q5A9K0RcprVYj
	eGeEJgeDUMKv/NKwuzgaKIxDm0cvBNauiRJ2EOnPQZxixd2AQZuvs4lLnY6V67uDs+m1
	IjL8YBkMyZpeG/3KayON9QrcfIZfeD6jzzrwo=
Received: by 10.223.86.130 with SMTP id s2mr7066516fal.66.1291727204727;
	Tue, 07 Dec 2010 05:06:44 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y3sm1900452fai.38.2010.12.07.05.06.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 05:06:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 14:06:36 +0100
Message-Id: <1291727196-11177-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
In-Reply-To: <1291681239-21167-1-git-send-email-raj.khem@gmail.com>
References: <1291681239-21167-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc_2.12: remove upstream applied eglibc-make-382 patch
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
X-List-Received-Date: Tue, 07 Dec 2010 13:08:27 -0000

---
 recipes/eglibc/eglibc_2.12.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index 8c019a1..1285568 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -16,7 +16,6 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://sh4_local-fpscr_values.patch \
            file://eglibc-dont-cache-slibdir.patch \
            file://armv4-eabi-compile-fix.patch \
-           file://eglibc-make-382.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
-- 
1.7.3.2



