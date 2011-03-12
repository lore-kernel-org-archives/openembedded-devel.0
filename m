Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUVJ-0004if-CP
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:29:33 +0100
Received: by mail-gw0-f47.google.com with SMTP id 11so1380552gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=7pz2WnwUhVU0AeN0UKxkc0ays61e87kvpMXtNvnIBM8=;
	b=dppF2aiB5wK8b0s7ZBCzbDXrWLKS3TWL/dM2UjpVDozLCBeM9/MdER3dIz661TuYkZ
	WkUFQIPAV4NdPl1repcN6PhZtFEbFMKNJF76uLznJeKMiPJlPF943GcJfKWBViQoWOb7
	hLKH+ScpFa+wx+8ufCXOF8U/UKj25+cxUOjhU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ssGlUlfPoW0sGX9et9MpFtsaig2933rj6NKP+zzkOtg2Nti75g3r5FoHnuf3bxCn5A
	eNrIIcoHRHX8ypykKFLndVwYt8HBdxDczwW9HGoe0Hxzvq08rrCTexRmrzhNOSV8cxkC
	/7bnOMzOw3LB0UAq2ml0ES4VavtnkEfYblpIU=
Received: by 10.101.5.13 with SMTP id h13mr2204888ani.42.1299958075163;
	Sat, 12 Mar 2011 11:27:55 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:17 +0000
Message-Id: <1299958038-25216-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 10/11] cmake: depends on libarchive
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
X-List-Received-Date: Sat, 12 Mar 2011 19:29:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/cmake/cmake_2.8.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/cmake/cmake_2.8.3.bb b/recipes/cmake/cmake_2.8.3.bb
index cb5f7f7..0c8cb6d 100644
--- a/recipes/cmake/cmake_2.8.3.bb
+++ b/recipes/cmake/cmake_2.8.3.bb
@@ -1,10 +1,10 @@
 require cmake.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit cmake
 
-DEPENDS += "curl expat zlib"
+DEPENDS += "curl expat zlib libarchive"
 
 SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
 SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
-- 
1.7.2.3



