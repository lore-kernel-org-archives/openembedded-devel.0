Received: from mail-pz0-f178.google.com ([209.85.222.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHBHV-0004Dl-Q3
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 09:44:02 +0200
Received: by pzk8 with SMTP id 8so3855pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=qUrFn4DMJgfhT7evtB7Fu0Wd6w4GQmYE4OnOC5eu4kg=;
	b=PeO5tF7tIpGHuXf9jWX15kX2SXQ3OtiofiP1eI9NMvTUrgdUB4a59ILjToS12Cv3Cu
	eL8xIacGAM+Q5d6JjRp9ynCePZSQ0tXovhwXqGYkxf1SDkQbdUMwUj+rTtk1ewxRI6F9
	icBF0RfpZrKX9KATlXpoO1d2V3nOxdy61rpNw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=etT5VO1RHfIlWBZ7kZMlKtqljM0vEIWxoFKhIbR1A2OtkxuSbcZfPslHmlnMFLvXVX
	UCzmwsZtCNBRCJC7ueMeOKtlntftQe7GnpO5ly1dZiHrZIsx2/PgI83hxg2MO3bHo58/
	oXUo7fir2/sCWToErRnjj1/gMUKLvpQG4hqWA=
Received: by 10.142.208.14 with SMTP id f14mr5709243wfg.298.1274859593224;
	Wed, 26 May 2010 00:39:53 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 22sm5089827pzk.9.2010.05.26.00.39.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 00:39:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 00:39:44 -0700
Message-Id: <1274859584-8442-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.222.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sanity.bbclass: Barf if TMPDIR has trailing forward slash
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
X-List-Received-Date: Wed, 26 May 2010 07:44:03 -0000

* Unknowingly many developers run into this issue and
  painful part it that the problems start happening almost
  when build it complete and the errors are unrelated to cause
  see http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/msg02922.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/sanity.bbclass |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/classes/sanity.bbclass b/classes/sanity.bbclass
index dfb3010..88672ba 100644
--- a/classes/sanity.bbclass
+++ b/classes/sanity.bbclass
@@ -112,11 +112,18 @@ def check_sanity(e):
 	oes_bb_conf = data.getVar( 'OES_BITBAKE_CONF', e.data, True )
 	if not oes_bb_conf:
 		messages = messages + 'You do not include OpenEmbeddeds version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
-
 	#
-	# Check that TMPDIR hasn't changed location since the last time we were run
+	# get TMPDIR and use it in following two checks
 	#
 	tmpdir = data.getVar('TMPDIR', e.data, True)
+	#
+	# check if tmpdir has traling '/'
+	#
+	if tmpdir[-1] == "/":
+		messages = messages + "Your TMPDIR has trailing '/' (forward slash), this can cause autotools lamangler fail regexp matches when munging .la files. Please remove it.\n\t"
+	#
+	# Check that TMPDIR hasn't changed location since the last time we were run
+	#
 	checkfile = os.path.join(tmpdir, "saved_tmpdir")
 	if os.path.exists(checkfile):
 		f = file(checkfile, "r")
-- 
1.7.0.4



