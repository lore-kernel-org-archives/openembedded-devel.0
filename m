Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 16B4B60167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 17:00:50 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id s7so10399653qap.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=WSOtLKeuXfH04gxhvqtUClq+EDmN3eFoBhkiOgI4alM=;
	b=VqpW6WQEb+DsTXcD5K5phTcyu3X81qjFeb+Z54Yb+UO8Ji2Pbc0sbya/bc5s7mQowr
	CT+YvmrVehmW9DFrrQrtmrOsT1sQuBSj6xPw+7bvA9VzjyNcbBmX4tvc6pXKqCkhZhvD
	3/Qne+CAToT6jyU1defAxyAQE47wNU6iCQmc0CT+50JBmW6/jwPAym4B8uyzgQxFLw0U
	6bRiCPF6xV1AkUFM8wHozlUTS4rSgTRjAxvG4YS3Oi4tw+tYlBCKmZH0Z7ss75yhQSB5
	owwB54kf71enOk5DsDmsCotz8qf90MqAZtgZqAc+eX/FHJMWPgOn9w3yxMmQfoMuW0rQ
	aY7Q==
X-Received: by 10.140.39.167 with SMTP id v36mr27340829qgv.77.1419958850824;
	Tue, 30 Dec 2014 09:00:50 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id n1sm36421123qag.21.2014.12.30.09.00.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 09:00:49 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 60EDF1C9F2487; Tue, 30 Dec 2014 15:00:46 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Dec 2014 15:00:42 -0200
Message-Id: <1419958842-9394-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH] mailcap: Fix license format QA error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Dec 2014 17:00:53 -0000

Fix following QA error:

,----
| WARNING: Recipe mailcap, LICENSE (PD MIT) has invalid format, LICENSES
|     must have operator "([&|() ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
index bcc6496..95d7d11 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.43.bb
@@ -15,7 +15,7 @@ SECTION = "System Environment/Base"
 SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/r2-1-43.tar.gz"
 SRC_URI[md5sum] = "8fd185ffae710301de3bc297877a404b"
 SRC_URI[sha256sum] = "a630892b5fe59eb9e3bef30c597de1c2b7f35243dea4b0c995fd482aa20c2d6b"
-LICENSE = "PD MIT"
+LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
 S = "${WORKDIR}/r2-1-43"
 do_install() {
-- 
2.1.4


