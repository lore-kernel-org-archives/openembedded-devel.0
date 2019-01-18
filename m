Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id BFB6A7C26A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 15:03:25 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id x2so5318945ywc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 07:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1FuelzbxEWG2AAiFNg216coYkwfK6JUY17XtmzqFvT4=;
	b=KBkim0kT6UEL9KNVk7zEWco2kIgdoQjWnHUfywBg1xP7vG3A315pkw+Nx4pUfbf0EG
	S7SbDxsbjgcF/HOr2lzwNTMEtGOtM1nK8iEJpKqt4np9P6p0bvff+Te2Re9/mXaMUcRW
	lPxQsyw1lIWsC9fJMifFp1acKUtG1zn0jWRE1ogOlNar7OSwPqVl8kV2jfFDV9hua/Ii
	ls/FFau2/IIbRfJr6+PPQrKaq9Uxvfq84IqUBP+TCbpb8yOuaGOpPOCuNYFJsNAxYQjT
	9Y166C3UyAOFkQrleip/THVKdWjdT9y8F0KFTsGdrWwr2r2v7ifEz1oYgLAIG5ysEO6p
	88HA==
X-Gm-Message-State: AJcUukdRH0hFOX3CU4WwyGGQV54+VMcDEo3/dEVkO0lB3Ep0R2aMvwhS
	H+2w8AZXVrup2qbHr/Ryjc1H65vV
X-Google-Smtp-Source: ALg8bN4bWJGCbL6vh1kRkwpjsBguEkB02uolQHJL8Huu5ODr1HxSlXZmaQGcQUGcgf8f3Q5RSofV/g==
X-Received: by 2002:a81:3707:: with SMTP id e7mr18032602ywa.377.1547823806292; 
	Fri, 18 Jan 2019 07:03:26 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id w2sm2761511ywl.10.2019.01.18.07.03.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 07:03:25 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2019 15:03:23 +0000
Message-Id: <20190118150323.17306-1-git@andred.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] nginx: add default proxy_params
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
X-List-Received-Date: Fri, 18 Jan 2019 15:03:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

As per Debian packaging - to use it, see
    https://wiki.debian.org/Nginx/DirectoryStructure#Extra_Parameters

    This file is most commonly included when Nginx is acting
    as a reverse proxy:
        include /etc/nginx/proxy_params;
        proxy_pass http://localhost:8000;

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-webserver/recipes-httpd/nginx/files/proxy_params | 4 ++++
 meta-webserver/recipes-httpd/nginx/nginx.inc          | 3 +++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/proxy_params

diff --git a/meta-webserver/recipes-httpd/nginx/files/proxy_params b/meta-webserver/recipes-httpd/nginx/files/proxy_params
new file mode 100644
index 000000000..df75bc5d7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/proxy_params
@@ -0,0 +1,4 @@
+proxy_set_header Host $http_host;
+proxy_set_header X-Real-IP $remote_addr;
+proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
+proxy_set_header X-Forwarded-Proto $scheme;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 522942504..29e7efc14 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch \
     file://nginx.conf \
     file://default_server.site \
+    file://proxy_params \
     file://nginx.init \
     file://nginx-volatile.conf \
     file://nginx.service \
@@ -111,6 +112,8 @@ do_install () {
     install -d ${D}${sysconfdir}/nginx/sites-enabled
     ln -s ../sites-available/default_server ${D}${sysconfdir}/nginx/sites-enabled/
 
+    install -m 0644 ${WORKDIR}/proxy_params ${D}${sysconfdir}/nginx/proxy_params
+
     install -d ${D}${sysconfdir}/default/volatiles
     install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
-- 
2.20.1


