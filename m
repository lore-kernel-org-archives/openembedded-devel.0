Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
	[209.85.219.176])
	by mail.openembedded.org (Postfix) with ESMTP id BF44C7BDA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:26:13 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 2so4404029ybw.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 06:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Qqw+v55c8DZPcBXT87BiEI3/9QC+d71sjXa1Issr7DM=;
	b=eKsMCPswQdEqN/L7JtSzvBxFYISl/qtdtBieUOS6rwJGlCih7qitS3nCtzGRvbBj2D
	RTu+4thvoquYygJvJ+Kzb3VHubYNEwGB0IoPqEVi8FNZdn5LL7BYaoH3YUEeD9W0ec9w
	UHTAc3HVPDx9DfpbQ/mNrIL72Qf1nOvxckYTpyL/EXf3T+OvOHjh5MvtWOThwIXy6v6z
	QiT7QBMAoGxnNLQ1vCrB8efg4W4l1sOkELfsUOzTCXUwFL/DW3Lx3RECffSClQ3LVX0z
	5p3YD9jrNeTdqfXM+VCcMWCr65SiaWMIYxgAN9aNnoynAHaA+u6TUVd8lWlAdUTvgsCb
	nOqA==
X-Gm-Message-State: AJcUukdbKuWpOMK+5Fl/FxqrIdzvtaFNa+IcC0ydE2QWjoYjsQyzmopQ
	mjGqUCxP6lhFWTi+qj7AbvEyTmmX
X-Google-Smtp-Source: ALg8bN4mwLqfXUIpSknzIeSVIHtWhTgEB2HZXZCLRdzE66feHaDZAungB2K2aSVdow/uU98dCdhc9A==
X-Received: by 2002:a25:d81:: with SMTP id 123mr6370822ybn.155.1547821574344; 
	Fri, 18 Jan 2019 06:26:14 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b144sm2618229ywa.33.2019.01.18.06.26.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 06:26:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2019 14:26:10 +0000
Message-Id: <20190118142611.21544-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/2] nginx: update systemd unit using nginx recommendation
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
X-List-Received-Date: Fri, 18 Jan 2019 14:26:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Our systemd unit doesn't follow the official
recommendation, see
    https://www.nginx.com/resources/wiki/start/topics/examples/systemd/

Most importantly:
* it should start after some additional specific
  targets/units
* using PrivateTmp is a useful security feature, in
  particular to avoid cross domain scripting via the
  temp folder
* using systemd's $MAINPID, we can distinguish between
  multiple running nginx instances correctly

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-webserver/recipes-httpd/nginx/files/nginx.service | 10 +++++++---
 meta-webserver/recipes-httpd/nginx/nginx.inc           |  1 +
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
index ce9906171..c6fc0495f 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
@@ -1,11 +1,15 @@
 [Unit]
-Description=Nginx Server
-After=network.target
+Description=The NGINX HTTP and reverse proxy server
+After=syslog.target network.target remote-fs.target nss-lookup.target
+
 [Service]
 Type=forking
 PIDFile=/run/nginx/nginx.pid
+ExecStartPre=@SBINDIR@/nginx -t
 ExecStart=@SBINDIR@/nginx
-ExecStop=@SBINDIR@/nginx -s stop
 ExecReload=@SBINDIR@/nginx -s reload
+ExecStop=@BINDIR@/kill -s QUIT $MAINPID
+PrivateTmp=true
+
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 24c2cedf5..ea1c1f782 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -117,6 +117,7 @@ do_install () {
         sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
             -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
             -e 's,@SBINDIR@,${sbindir},g' \
+            -e 's,@BINDIR@,${bindir},g' \
             ${D}${systemd_unitdir}/system/nginx.service
     fi
 }
-- 
2.20.1


