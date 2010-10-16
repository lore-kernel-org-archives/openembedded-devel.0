Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7CUo-0006K1-Mb
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:32:47 +0200
Received: by bwz9 with SMTP id 9so2064341bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=6YIHYs/aCij4YTWUWOwSfdswuS4mdX7NuS780z88Xpg=;
	b=A1anXwrgCTLSICPGDD5QYxnskuea5+dexkVzeXlU5pqeWwuotKQooGWIk20gfK7q+H
	GPg5JvaqXP8FoGuTUVRA8Lx68nvugvvwJl/wBfE6dblrAsAOegwS1BG3FkqhsnYC9g/6
	ivWabhwslui1CbwMtaAevQiiICa/+UYNhsvWo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mw63WK54+yeJROaRltOdKBIgxC5BRDbiEXW9c0NevX7QacPu1R9b3RqRUIX0Wc8j19
	Athlk+v4r5z8vxtVeJ+AKkUz0tJ6iPe43vA+ziBG2tucahuTwB07duRZZERa4O+Sm7AX
	v2eUUlTECjbsp0/lyooE+WWwDjMNmbu70H7og=
Received: by 10.204.49.208 with SMTP id w16mr2410557bkf.35.1287257536278;
	Sat, 16 Oct 2010 12:32:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y19sm14840020bkw.18.2010.10.16.12.32.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 16 Oct 2010 12:32:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 21:32:10 +0200
Message-Id: <1287257530-25987-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf: reverse OVERRIDES order in FILESPATH definition
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
X-List-Received-Date: Sat, 16 Oct 2010 19:32:47 -0000

* directories in FILESPATH are search for first fit and we would expect
  ie ${PN}/local/a.patch to be used before ${PN}/ramses/a.patch
* moving last ':' before OVERRIDES makes FILESPATHBASE/FILESPATHPKG/ as
  last option instead of first

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index edb9530..1a08673 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -271,7 +271,7 @@ FILES_${PN}-locale = "${datadir}/locale"
 FILE_DIRNAME = "${@os.path.dirname(bb.data.getVar('FILE', d))}"
 FILESPATHBASE = "${FILE_DIRNAME}"
 FILESPATHPKG = "${PF}:${P}:${PN}:${BP}:${BPN}:files:."
-FILESPATH = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':')])}"
+FILESPATH = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (':' + d.getVar('OVERRIDES', 1)).split(':')[::-1]])}"
 FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 ##################################################################
-- 
1.7.3.1



