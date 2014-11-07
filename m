Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D893865C87
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:08:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA788EDC023594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:08:14 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 00:08:14 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 16:08:06 +0800
Message-ID: <47eeb76160e122e9545f8ce4831d91653a6f238e.1415347548.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415347548.git.hongxu.jia@windriver.com>
References: <cover.1415347548.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] curlpp: use libcurlpp as curlpp's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 08:08:16 -0000
Content-Type: text/plain

The package curlpp does not exist, so we use libcurlpp as the provider.
It avoids the do_rootfs failure while IMAGE_INSTALL += "curlpp"

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
index 48f5178..3134335 100644
--- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
+++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
@@ -74,6 +74,7 @@ pkg_postinst_${PN}() {
 }
 
 PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
+RPROVIDES_lib${BPN} = "${PN}"
 
 FILES_lib${BPN} = "${libdir}/lib*.so.* \
 		"
-- 
1.9.1


