Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygs-0001z9-9V
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:54 +0100
Received: by mail-da0-f46.google.com with SMTP id p5so7255811dak.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Uf5+JZkBl1s0yG3wd7WTmEh7OViqfmcmNbYZzPc4SFM=;
	b=nWIisRR8zgUCImlOtnkypESyB+b8TVjdJcQ2InrF50TCWhZ/YwITY6xDSmtEueQf6g
	uu6jvIxzqv7gPKvRIakzfcC6bG957WMIbk3KCzYETQLqXRSC1+Zl8oUkQPryqYK5xSuA
	HYV+SO0Fi2fTKDkjdQYpAqPUQQIrUmfGSwF5IcYTEkc4Rf4HTjDgeRTQ3QGRlcd+CCDd
	B0MhgiCb2MVmDCE0W/3EPMvQMYPeXoFQj/vMvWdSdopnxD1WrusY3rzPdnujLis8GFat
	DkzyG8IusqnEzeEzCR0LuFh5DaGAlDgmfSXkRhXBw8QZNA42iOPtDFe3nYUvNbcT65LJ
	L/FQ==
X-Received: by 10.68.197.68 with SMTP id is4mr157610813pbc.30.1357272021988;
	Thu, 03 Jan 2013 20:00:21 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:31 -0800
Message-Id: <1357271974-3317-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 10/13] systemd.bbclass: Fixes for living along with multilib
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
X-List-Received-Date: Fri, 04 Jan 2013 04:16:32 -0000

This essentially fixes two problems
1. We were ignoring systemd for multilibs now we dont
2. We were replacing '-systemd' string in PN which is
a problem whenre -systemd appears more than once
e.g. lib32-systemd-units-system it was removing both
essentially we should only chop the end of PN if it
ends with '-systemd'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 9582492..16ac1fb 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -53,7 +53,9 @@ def systemd_after_parse(d):
                         "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
                         (bb_filename, pkg_systemd)
             else:
-                pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+                pkg_systemd_base = pkg_systemd
+                if pkg_systemd_base.endswith('-systemd'):
+                    pkg_systemd_base = pkg_systemd[:-8]
                 if pkg_systemd_base not in packages:
                     raise bb.build.FuncFailed, \
                         "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
@@ -68,9 +70,10 @@ def systemd_after_parse(d):
 
 
     bpn = d.getVar('BPN', 1)
+    ml = d.getVar('MLPREFIX', 1) or ""
     if bpn + "-native" != d.getVar('PN', 1) and \
             bpn + "-cross" != d.getVar('PN', 1) and \
-            not d.getVar('MLPREFIX', 1) and \
+            ml + bpn == d.getVar('PN', 1) and \
             "nativesdk-" + bpn != d.getVar('PN', 1):
         systemd_check_vars()
         for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-- 
1.7.9.5



