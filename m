Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1M3ZKA-00009g-E1
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 19:29:58 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2195358rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=RIvfdzIpjDn7Cr/JJMzFwDyTXTWqkklld8pmywslSio=;
	b=GLpoQ0JP5narzQVz6qzMnehS5S4FlBv4E1/zPWTgpFfVjmQeazsQ9+YWFcmoLUNxqe
	Y+XZGIOrHJUDwA7F+tPQb9PF4o+e3OfEi+wGStNDVP79CaoMkTkUJS6P8W8lryYAT8iw
	VfnR7lECpKnmQAGlhO3z8LC/j4DJwMlDIVRY4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=dV2HCUmxJHvlQgvE8QKbox07jBPPBux8sKAD8mMvA+vZ7duj5xVlgj/IYQj1PymCZv
	OWKzJ39GzUWO1/fllUiN+GbYNR+QHpYspjWQvRjdyp7rR0cV2ffqeIlwNyZ5G+cna4ex
	miGJk3ohW66YtTfpJjB+lzqBPa/SzZAm1U6+A=
Received: by 10.142.43.7 with SMTP id q7mr2846875wfq.346.1242062605450;
	Mon, 11 May 2009 10:23:25 -0700 (PDT)
Received: from dorkboy (174-145-116-104.pools.spcsdns.net [174.145.116.104])
	by mx.google.com with ESMTPS id 32sm14926965wfa.13.2009.05.11.10.23.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 May 2009 10:23:24 -0700 (PDT)
Date: Mon, 11 May 2009 10:23:18 -0700 (PDT)
From: "Theodore A. Roth" <taroth@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.1.00.0905111020490.11037@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Mon, 11 May 2009 17:29:58 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Theodore A. Roth <taroth@gmail.com>
---
 recipes/evtest/evtest_1.23.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/evtest/evtest_1.23.bb b/recipes/evtest/evtest_1.23.bb
index 4c5d195..6cf87be 100644
--- a/recipes/evtest/evtest_1.23.bb
+++ b/recipes/evtest/evtest_1.23.bb
@@ -11,6 +11,8 @@ PR = "r0"
 SRC_URI = "http://beagleboard.googlecode.com/files/evtest.c"
 S = "${WORKDIR}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile() {
     ${CC} evtest.c -o evtest -I${STAGING_INCDIR} -L${STAGING_LIBDIR}
 }
-- 
1.5.4.3



