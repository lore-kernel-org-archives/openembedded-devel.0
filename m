Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFW-0007uA-PR
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:55 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2157422fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3Jm5liA1pdNTfHb6TRRKmDYjYyPCs/zBp1ps4Q1Oifs=;
	b=Ia5THeFJ6UCbNeqWsZGphrS6wRdnZrQurPWMI9edPTpqdTR4LSEOhgAWohScer28dR
	ynlig5hx6oRmeq2TN0X2de4I5BLXxxEOglFSgVeynzLjMEIYs3B9A4R5PelGj+5Rm+EZ
	L9o4gCG4UiTPmfE/e0AcPHObmQpoM6W7tEv0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RP3aT45FIBjhEhTYMKk8RbXXKOu6Dn9lKeVH+h2V5CZ9oexB6RON1SO/PU5mJ5hPUM
	UOtgbeZIQ0777GNCTRmPG/ky+2v/2a4/WyIpu/kppH7zXO8DsSavF1j8Jq3sbBbYucAg
	qIj24zCziifPfXmoFaIrQjiCRD7z6Qz38X2y8=
Received: by 10.223.121.193 with SMTP id i1mr7558957far.77.1280852513464;
	Tue, 03 Aug 2010 09:21:53 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.50
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:52 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:24 -0500
Message-Id: <1280852605-3524-10-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/11][v2] xserver-kdrive-common: Xsever module_id for virtex5 platform
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:55 -0000

* Return a valid module_id for xilinx virtex platform
* On Xilinx platforms there is no line `Hardware`. Instead it is
  stored in the line starting with `platform`.
* v2 split changes, nicer module_id function for handling xilinx 
  virtex platforms

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-kdrive-common/Xserver                  |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index 347b005..b6c27df 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -34,7 +34,11 @@ module_id() {
     # grep "Module ID" /proc/hal/assets | sed "s/.*://"
     ## used to read from /proc/hal/model, but that is removed in 2.6
     # echo ' iPAQ' `cat /proc/hal/model`
-    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+    id=`awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo`
+    if [ -n "$id" ]; then
+        id=`awk 'BEGIN { FS=": " } /platform/ { print $2 } ' </proc/cpuinfo`
+    fi
+    echo -n "$id"
 }
 
 export USER=root
-- 
1.7.2



