Received: from [209.85.211.193] (helo=mail-yw0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhW1q-0002Hq-2u
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 00:04:10 +0200
Received: by ywh31 with SMTP id 31so4129949ywh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=lytGoRo19GiNhTBcnE2SPGAqc+uWc8gIO6JjUR9pVNg=;
	b=v6UocVOuV0hqodD4MzYo0k4gui7sninOb5fZLm88+x+r0Lvg4o0je72mCj7NPwKBPP
	u6G8wDt6Wkv3940bAB8jFaiMD7dYaM/mr0O4RoNcALaIKLF437UhXjisP4UHzPVkc6JU
	Gnr3pgp4UYPrgiz3JlVRmXEL2XQhS93ejjw/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ttd3RTIpkpcSV+xlHlOtIqZ/LPCdjjCL30bqj2wk2JTFfp/6RTUqXuKmIVIfPorVAu
	1HbxGVrRfZtnx4YSHvYhS85VkrDueOwPT3U19tHk/Rv32QLi3vAm9KYMo54ig/lYGB8k
	f8crp1Gabf0e4iwhbIUfTU6m+IKlXrnKwK/l4=
Received: by 10.151.21.19 with SMTP id y19mr5150793ybi.202.1251582348709;
	Sat, 29 Aug 2009 14:45:48 -0700 (PDT)
Received: from localhost (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 23sm637924pzk.4.2009.08.29.14.45.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 14:45:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Aug 2009 14:45:36 -0700
Message-Id: <1251582336-3324-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] base.bbclass: Pass in PATH to popen.
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
X-List-Received-Date: Sat, 29 Aug 2009 22:04:10 -0000

On Mac OSX its not able to find md5sum if
path is not passed to os.popen shell.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 97ccf5d..d29ba4b 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -84,7 +84,7 @@ def base_chk_file(parser, pn, pv, src_uri, localpath, data):
 
     # call md5(sum) and shasum
     try:
-        md5pipe = os.popen('md5sum ' + localpath)
+	md5pipe = os.popen('PATH=%s md5sum %s' % (bb.data.getVar('PATH', data, True), localpath))
         md5data = (md5pipe.readline().split() or [ "" ])[0]
         md5pipe.close()
     except OSError:
-- 
1.6.3.3



