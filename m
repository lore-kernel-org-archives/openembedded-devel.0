Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jefflance01@gmail.com>) id 1PQ3OC-00018J-GO
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 20:39:53 +0100
Received: by ywi6 with SMTP id 6so225484ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QuB5o/wBe0ZdVHKmc6vEFNqqhTV+LgXZmTJwEjqpOgw=;
	b=WC4YWxGuOdIxgAz7MFHjVEtekD3ZtfSi2zR9PUmHayDW6y8dvIPbqsVQ2v69oztVAb
	tIJ1m1WXIGbfGUA7PR4PYQRzrh43Co79SVY+KFqPAuDyxi3O9kQ2ZV0LNPoi090S/t5w
	gptlkqema+ewf/drfEsKD7U2Ly3Y66XsiYoLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SmzPnG6nfYFPpKm6Gd2iT2KNTak2YJXqInEyzMEgvLIXGgkdWQQLw3bcNzs+V4Pk97
	Ix4twm9JTwH/RiH3uxP+eP3WmaN5Cl319ZiXFLAnV9Fwnc7WHhTdVUMQeOWLfUE87XPP
	syii150FJkltn2Jmd4dSJ0ENaLn/TO+xvwY0E=
Received: by 10.151.113.4 with SMTP id q4mr2433872ybm.156.1291750703357;
	Tue, 07 Dec 2010 11:38:23 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r41sm227713yba.16.2010.12.07.11.38.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 11:38:23 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 13:13:51 -0600
Message-Id: <1291749231-15483-2-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1291749231-15483-1-git-send-email-j-lance1@ti.com>
References: <1291749231-15483-1-git-send-email-j-lance1@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: jefflance01@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 2/2] matrix-gui: add additional platform support
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
X-List-Received-Date: Tue, 07 Dec 2010 19:39:53 -0000

  * adding platform support for am180x
  * adding platform support for am181x
  * adding platform support for am3517

Signed-off-by: Jeff Lance <j-lance1@ti.com>
Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    3 +++
 recipes/ti/matrix-gui-e.inc      |    3 +++
 recipes/ti/matrix-gui.inc        |    3 +++
 3 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index 2d2cea3..4185b34 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -15,6 +15,9 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_am3517-evm = "am3517"
 
 #Checkout the project repository to get access to the scripts and data
 #files.
diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index c3a9341..ba8012c 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -15,6 +15,9 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_am3517-evm = "am3517"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
 
diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index b7678b2..82ec6ab 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -15,6 +15,9 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_am3517-evm = "am3517"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
 
-- 
1.6.3.3



