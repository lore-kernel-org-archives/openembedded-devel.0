Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UUpQB-0002Mj-Sm
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Apr 2013 04:27:01 +0200
Received: by mail-da0-f42.google.com with SMTP id n15so628339dad.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2013 19:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=nc89n2S5WnHId1Y2PABRfSo8huGGJpOFDEUqbOL+v6o=;
	b=e4ArQ/FRXRIdbJTDXEOGz4+vWlqCi8+2RYRgdh3+UzvcNDXceCQGsPyOpM17VpNvf9
	Iy3yO+FbkJwNNSoxIJHwusJXtS8YqEAL++s+px6uA4SKqATvm/0NSrvUUrHRfbNRVqHq
	UlDtmXClJ8wopcov2LzKMzFewFuqe+jxX+Kz+heD1Cjsw53h1S/Z/kbs9/BRmTP6ZMUx
	TdmeRYogNTV4CRe+jeV14bO76PCa2bOKQaSioeprxVLFlK8Dg7jiMqBd1i3afqOBZax8
	EvMZKcMFAeytPmK7lDNl16NpmPCtT6nafSHyxSydyMIsndJwuHFHnGmpPqh4XIgWOi0S
	4Zsg==
X-Received: by 10.68.99.226 with SMTP id et2mr44190387pbb.91.1366769357771;
	Tue, 23 Apr 2013 19:09:17 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id br2sm822645pbc.46.2013.04.23.19.09.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 23 Apr 2013 19:09:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Apr 2013 19:08:06 -0700
Message-Id: <1366769286-26639-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] ntp: Move sntp before ntp-utils in packaging order
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
X-List-Received-Date: Wed, 24 Apr 2013 02:27:02 -0000

${PN}-utils has greedy expression of capturing all in ${bindir}
and sntp gets swept in too. This move in PACKAGES fixes the problem
and now sntp binary is packaged in sntp package itself.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 004dc9b..79e7401 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -65,7 +65,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
 }
 
-PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils sntp"
+PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
 # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
-- 
1.7.9.5



