Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8506F600EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 17:32:39 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b15so17112675qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 10:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=RDk4GflL+nvV1VFNxIwaodNSN6Qaal2KQ1dfBJU9hOI=;
	b=dEEJm6z0PXbKH80jADG5KzfKxxjf/2BWe5zcJpGXqrq4V+3l2F989K2Doz1y4WmOPN
	P6lMhX9ImzG7VvLL9UvsQFcM2Rn2bG3JOecLYtlUq4gcXxoV6rPaUpp9a/k1PDOLioB1
	cKi/OWUmWIZhjFQOckO1glnfpkAZwCyvmujurGiVMBQKCueifO5YjpyRi0B8HNKBTMSE
	iZIsSBCnau6Lq6ls1yOGMFYuchOlbaYrVZcwZE43p2DdME6BrW2d9N71u87Cu3eBwONM
	PHcZJQBn7wQ6uEWV5lVfdiq7OaALZeYkumPev9wW+ofgM/c9HsooDfTwdpKut0bS9mOE
	9e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=RDk4GflL+nvV1VFNxIwaodNSN6Qaal2KQ1dfBJU9hOI=;
	b=ZQ0IFqmpQvjJEwv+jWAM2XPgz0OvhII78rRh7iWtSxbbKCFunOa/uJEOC5FQCFXw2t
	3FllPjDjFHE0RGhVADDSoHSj3rP2oxRIXrjzCsI7dIzOcOWFhp6IVCMG3U3RPBiUjo5t
	WZ4M2lg6n+pOlDjrc9JLG9rM25lQSDubsvzcH6uGVHTEeFk+o6Kkr2/wn7pg7VjZHGjH
	xuPCKCZLgZY7vl049czBzcB92ZyhSkJrABBXTITQTGkTYIH5f+8LAXK+AcCWSA20/kzw
	yhGlE+jfGYB3bBKO/haQRJJi6iQHNFpz8FE4PVv+r7zQXGcPnL2s4KRzDf8AmA40OMw3
	ezWQ==
X-Gm-Message-State: AMCzsaWJ8YPYlr6nKNF0V02h32MjhTs8fQQp1WecAcFgHxoAbrztzz8X
	xXcJhKhKVm9IHXChBRy8KHbrF1Yz
X-Google-Smtp-Source: ABhQp+RUWL6euYcrLDKNlzYfVa6OSXhPeKwUWkUnrOkDM/dYmbzriYkprIjJOXxah8wt0MBi2I9x1A==
X-Received: by 10.55.37.67 with SMTP id x64mr13717508qkg.259.1509384760148;
	Mon, 30 Oct 2017 10:32:40 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n131sm9704986qke.48.2017.10.30.10.32.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Oct 2017 10:32:39 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 15:32:13 -0200
Message-Id: <20171030173213.16752-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH] arptables: Fix do_install task
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 17:32:39 -0000

We need to set DESTDIR variable and run eo_runmake install to install all
arptables files. Without this the only file installed in package is
systemd unit.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-networking/recipes-support/arptables/arptables_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index 274a55d91..55903e450 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -21,9 +21,10 @@ SYSTEMD_SERVICE_${PN} = "arptables.service"
 
 inherit systemd
 
-EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
+EXTRA_OEMAKE += "'DESTDIR=${D}' 'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
 
-do_install_append() {
+do_install() {
+    oe_runmake install
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
-- 
2.14.2


