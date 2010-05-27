Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHkVZ-0006nr-Mz
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 23:20:56 +0200
Received: by vws20 with SMTP id 20so453503vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=R37g21xXxjNsbZpFn5BW3sTnKumM2YbnMvx6ZYE/FzQ=;
	b=WORMd0cKZZTUFqSsZayjCX7RFXm+9WxzL4Tl09x/E5VZ8DZuqyTvSPPM87TvHWGdqS
	GYNzo7DxoHMdKr3PaCa875RllDXB3i8mlSqFkIegGDIuNkHGEkBDlCLbIgxrqnzLMNZO
	OAXXtw1CudgLaae4HZ+FAlmKnZqfMVhAqmnao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=nFUSIpLFonFVd5BMi09FXFKzXvbLs3W0ZUE5f7UkiiG9jWi551jBEQY5TSu179jw0B
	PlrHuNoAFJKX1FjZI51WlUp8ixVGqy+xCUSpc0gBqLHZAV7tF5HJgtt0grF5MGP49iDx
	GnSZNyyLYXGP6oroWn4t7IhnV7iZd/jSF8/+0=
Received: by 10.220.127.75 with SMTP id f11mr7934277vcs.238.1274995003219;
	Thu, 27 May 2010 14:16:43 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id z22sm6593023vco.10.2010.05.27.14.16.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 May 2010 14:16:42 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:16:26 -0700
Message-Id: <1274994988-5750-2-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
References: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/4] bitbake.conf: don't filter out nonexisting paths from FILESPATH
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
X-List-Received-Date: Thu, 27 May 2010 21:20:57 -0000

From: Chris Larson <chris_larson@mentor.com>

It's unnecessary, and can cause problems with amend.bbclass.

Signed-off-by: Chris Larson <chris_larson@mentor.com>

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index ee93cd4..5dc6772 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -272,7 +272,7 @@ export MANIFEST = "${FILESDIR}/manifest"
 FILE_DIRNAME = "${@os.path.dirname(bb.data.getVar('FILE', d))}"
 FILESPATHBASE = "${FILE_DIRNAME}"
 FILESPATHPKG = "${PF}:${P}:${PN}:${BP}:${BPN}:files:."
-FILESPATH = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}"
+FILESPATH = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':')])}"
 FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 ##################################################################
-- 
1.7.0.4



