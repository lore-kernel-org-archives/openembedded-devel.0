Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PbfEa-0003Ae-T6
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Jan 2011 21:17:59 +0100
Received: by ywi6 with SMTP id 6so7500808ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 12:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=seNNWvt8tFaSXHGzY7YxR/UplzuXA1dLSblLKK9j7Ic=;
	b=NMNXzOMZUbnGOFDRMsPjZvV80LTOF0D67uFUZVw4MoOj7B03rQyBypX4WKxuXOlzUO
	RCJnNKlCoT6jMaGyG6Ycft/L9vb44LOSunWDHS08c29DPL5vy2q5xzzvfUtsHBk9PvD/
	L9qZwopBEhVhkhIaozVQkPHVQM9LmX6941oYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=SEGRLbRFPzVXuGxQPDwEaHnNbSyaS00xr55wXhFUAOkwZAzoXh1pug7LXvjfRMgyfc
	Mny41jwrtgPkafqC4HQREhNRwrS1D2wtIOK9OlqT68Gy/o0yPqGpH9RTzgGQqg272MEb
	aRU7pLax4vT9MCUtNdQdLEj1XV0ErC2YcQVfE=
Received: by 10.150.190.4 with SMTP id n4mr17429802ybf.343.1294517842948;
	Sat, 08 Jan 2011 12:17:22 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n67sm16140982yha.26.2011.01.08.12.17.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 08 Jan 2011 12:17:22 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jan 2011 14:16:48 -0600
Message-Id: <1294517808-25922-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-tui: update SRCREV
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
X-List-Received-Date: Sat, 08 Jan 2011 20:17:59 -0000

  * pull in the latest source
    * Update CCSv5 support files to build arm9ej-s.
    * This is due to a limitation with CCSv5 where you can not pass in CFLAGS externally

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/matrix-tui_1.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/matrix-tui_1.1.bb b/recipes/ti/matrix-tui_1.1.bb
index 8f2ccbe..519d183 100644
--- a/recipes/ti/matrix-tui_1.1.bb
+++ b/recipes/ti/matrix-tui_1.1.bb
@@ -1,4 +1,4 @@
 require matrix-tui.inc
 
-SRCREV = "34"
-PR = "${INC_PR}.2"
+SRCREV = "35"
+PR = "${INC_PR}.3"
-- 
1.6.3.3



