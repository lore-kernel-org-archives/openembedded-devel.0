Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OLsqC-0004ce-OS
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 09:03:17 +0200
Received: by fxm9 with SMTP id 9so2745367fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=6B06Eg9oZ/agyXppf5XjvshmyE5yXp/0VL0H3sDuchE=;
	b=hxfZfasXpKPdgula1OlSW+Xe1+wceOLy3LDr7zbD1mPo76SGF8jZ+N05pbN9at1JQS
	PTStsSQbXh5FcVT0Jm5X6sGda/wnWCjzjXownK91CjOviuZD3Ia5a7VJj1CNesUCMa4p
	6dvzIPXQPQADfuONaIEPvR/f9botXKfUPGy7s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sJsyc1e1w3XvV+2LdnCAuL+Mp+LC1nGsLVXNZZ2tqZRtQN0Pn4wgYFtdqVUpUlzRHg
	36tODHEgyGZaUBm9YatU31iU9jj3yZ/pTO3NnXiT9asWLB5t+Y90hCRx6OjzIw8NfuXk
	VQPFcxjaKsxtDWLIm5CpRR1db2ZA8RJP09cYM=
Received: by 10.86.119.25 with SMTP id r25mr924849fgc.48.1275980336189;
	Mon, 07 Jun 2010 23:58:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm24039125fah.9.2010.06.07.23.58.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 23:58:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jun 2010 08:58:45 +0200
Message-Id: <1275980325-23187-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] debian.bbclass: call objdump from binutils-cross
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
X-List-Received-Date: Tue, 08 Jun 2010 07:03:17 -0000

* host objdump can support multiple targets and instead of output it shows list of targets to choose from
  see http://thread.gmane.org/gmane.comp.handhelds.openembedded/33294/focus=33357
* for some reason cross/bin doesn't seem to be in PATH, that's why there
  is full path

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/debian.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/debian.bbclass b/classes/debian.bbclass
index 8f6e7d8..d41c922 100644
--- a/classes/debian.bbclass
+++ b/classes/debian.bbclass
@@ -54,7 +54,7 @@ python debian_package_name_hook () {
 				for f in files:
 					if so_re.match(f):
 						fp = os.path.join(root, f)
-						cmd = (bb.data.getVar('BUILD_PREFIX', d, 1) or "") + "objdump -p " + fp + " 2>/dev/null"
+						cmd = bb.data.getVar('CROSS_DIR', d, 1) + "/" + bb.data.getVar('bindir_cross', d, 1) + "/" + bb.data.getVar('TARGET_PREFIX', d, 1) + "objdump -p " + fp + " 2>/dev/null"
 						fd = os.popen(cmd)
 						lines = fd.readlines()
 						fd.close()
-- 
1.7.1



