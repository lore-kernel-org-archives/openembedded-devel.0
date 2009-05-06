Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1M1hvn-0007E9-GH
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 May 2009 16:17:07 +0200
Received: by ey-out-1920.google.com with SMTP id 26so59791eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2009 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=SCH+wbJ9+Duru/CY2JpJyzj7arIEIDAsUFThDrs+gbA=;
	b=ann91jMrDmZgQWQfWwUXv3DQapiHwzm/a8GBsZVezH6I3nOIJdQVtpMGOqdY4AvcfQ
	+9FgqwwxAFl5qYoMmiWqyuNi641g2Ujxf3KnAXof9IRC20O7/S3Z96CzWjkTiGnSeI6S
	rtd8gtMz4ZYg/cuEg9tqNJKwtlNzX4fui7Y2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PsOhWl/pB6poxjQQIBwFDS+vr1B7MMVZ270HRop4qYN9kdnFBVyFovP3sc7d2SnVST
	mRt7upvs6hRyVbiPcJBuRgQT118WijGU86Jw5UdjXWU3po1p6kwY/o2ax9KkCwwDiZJz
	sRUJMGlLX3AWPrIxqxt6qUkx17ECs3wpFxxo4=
Received: by 10.210.65.2 with SMTP id n2mr6043038eba.94.1241619067484;
	Wed, 06 May 2009 07:11:07 -0700 (PDT)
Received: from localhost.localdomain (iap-pxy-mow1.siemens.ru [212.248.25.26])
	by mx.google.com with ESMTPS id 7sm2300679eyg.57.2009.05.06.07.11.05
	(version=SSLv3 cipher=RC4-MD5); Wed, 06 May 2009 07:11:06 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 May 2009 18:11:00 +0400
Message-Id: <1241619060-6672-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] kernel.bbclass: also stage include/trace if it's available
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
X-List-Received-Date: Wed, 06 May 2009 14:17:09 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 954c407..1323228 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -118,7 +118,7 @@ kernel_do_stage() {
 	mkdir -p ${STAGING_KERNEL_DIR}/include/pcmcia
 	cp -fR include/pcmcia/* ${STAGING_KERNEL_DIR}/include/pcmcia/
 
-	for entry in drivers/crypto drivers/media include/media include/acpi include/sound include/video include/scsi; do
+	for entry in drivers/crypto drivers/media include/media include/acpi include/sound include/video include/scsi include/trace; do
 		if [ -d $entry ]; then
 			mkdir -p ${STAGING_KERNEL_DIR}/$entry
 			cp -fR $entry/* ${STAGING_KERNEL_DIR}/$entry/
-- 
1.5.6.5



