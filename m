Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB1F7130F
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIdLY026593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:40 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:30 -0700
Message-ID: <c9e1bb4031a18bad388af6336a4af09959e7c1fc.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/13] phpmyadmin: add bash to RDEPENDS_phpmyadmin
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:38 -0000
Content-Type: text/plain

Bashism:
possible bashism in plugins/transformations/generator_plugin.sh line 16 (echo -e):
  echo -e "Usage: ./generator_plugin.sh MIMEType MIMESubtype TransformationName [Description]\n"
possible bashism in plugins/transformations/generator_plugin.sh line 28 (${parm,[,][pat]} or ${parm^[^][pat]}):
MT="${MT^}"
possible bashism in plugins/transformations/generator_plugin.sh line 29 (${parm,[,][pat]} or ${parm^[^][pat]}):
MS="${MS^}"
possible bashism in plugins/transformations/generator_plugin.sh line 30 (${parm,[,][pat]} or ${parm^[^][pat]}):
TN="${TN^}"
possible bashism in plugins/transformations/generator_plugin.sh line 51 (should be 'b = a'):
    if [ "$4" == "--generate_only_main_class" ]; then

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
index 8054c35..0de3f6d 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
@@ -29,3 +29,4 @@ do_install() {
 FILES_${PN} = "${datadir}/${BPN} \
                ${sysconfdir}/apache2/conf.d"
 
+RDEPENDS_${PN} += "bash"
-- 
1.7.9.5


