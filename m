Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pswba-0002Op-CR
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 13:17:06 +0100
Received: by ywg8 with SMTP id 8so421708ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 04:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=Z+63EvYfm9Hqkc4SVmWJFeZGNHb8oz9fL/prbnrXLe4=;
	b=efryw04EIg9pAoUc4Ns+ADQRWhNrU4S0HGSI1p7SAlb3WosnwnrEGhaoblaZHSyEcd
	ME3bUftIC51m0NZ2WbAdzzw7jUzp+owgyGS4QfZv/qmYlgAqpwfyZnTRvc0sJgjFUrp2
	CeYbePDiIF68qNeCtKzMRpxCnrwRgsBF7+428=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=HMDY5L8f567O6awYjhlszqa7clV1nI30FFXKpaLu+aVkUKVh/6WOm6dd794WXykyYB
	gR6W4o0uK6JG0xEjc6LmaFGkT8h9VeG/iaWIZVO2lGaSzgodghkXFZn0+baWyjnXvrbk
	haUF1l26qpohMj8v8p2Sln14cq0MGfLIQpZts=
Received: by 10.151.158.1 with SMTP id k1mr3405164ybo.431.1298636090249;
	Fri, 25 Feb 2011 04:14:50 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id u45sm358919yhn.9.2011.02.25.04.14.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Feb 2011 04:14:49 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Feb 2011 12:14:35 +0000
Message-Id: <1298636075-26972-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298636075-26972-1-git-send-email-otavio@ossystems.com.br>
References: <1298636075-26972-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] src_distribute.bbclass: distribute only SRC_DISTRIBUTE_LICENSES
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
X-List-Received-Date: Fri, 25 Feb 2011 12:17:06 -0000

A distro can require conf/licenses.conf or set SRC_DISTRIBUTE_LICENSES
selecting which licenses are wanted to be distributed. In case it is
empty or undefined we default to distribute all licenses to not break
backward compatibility.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/src_distribute.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/src_distribute.bbclass b/classes/src_distribute.bbclass
index 242d70c..f3d3cba 100644
--- a/classes/src_distribute.bbclass
+++ b/classes/src_distribute.bbclass
@@ -16,6 +16,7 @@ python do_distribute_sources () {
 	dldir = os.path.realpath(d.getVar("DL_DIR", 1) or "")
 
 	licenses = (bb.data.getVar('LICENSE', d, 1) or "unknown").split()
+	distribute_licenses = (bb.data.getVar('SRC_DISTRIBUTE_LICENSES', d, 1) or "All").split()
 	urldatadict = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
 	src_uri = oe.data.typed_value("SRC_URI", d)
 	if not src_uri:
@@ -33,8 +34,9 @@ python do_distribute_sources () {
 		bb.data.setVar('SRC', os.path.abspath(local), d)
 		for license in licenses:
 			for entry in license.split("|"):
-				bb.data.setVar('LIC', entry, d)
-				bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
+				if entry in distribute_licenses or "All" in distribute_licenses:
+					bb.data.setVar('LIC', entry, d)
+					bb.build.exec_func('SRC_DISTRIBUTECOMMAND', d)
 }
 
 addtask distribute_sources_all after do_distribute_sources
-- 
1.7.2.3



