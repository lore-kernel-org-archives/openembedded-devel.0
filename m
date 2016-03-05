Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 65E906FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Mar 2016 00:37:54 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id w104so57242430qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 16:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1F7icPucFsDRagh22m6FH+xrs0kS0u/RJFjnnuz8c2I=;
	b=SVXLAkGvPkRyAH1he/PRb7/3xapUCManUk0xEtIjGTl3ZcBIiQ1zymrkaGvri8Qv7K
	G4vZHZKuJ5xXRpl0RjjCAIFRlUfXnJIwlm+GRLIRKqGQPutfpn9q18GIvZVef9M64tpv
	1wtFMJ6ktO742je8J5Xcr8Ztg9Vu4egpHJS2NTj5c8NE537wpd0Dwi1t5IEtpHIZJHSf
	H4I2UY94XANmBa+dDrd+8rn2IgGSdhhRTFFUlI6/ReawLvp+HdnhC8v+PIHlrO5wFFPC
	a65eFQ+C36hDGLY/u2iHqLZ/NqwAg7sWmeg+d9pSzfu76NSQ0zXEz0Cor38+Kr31DrTV
	I0QQ==
X-Gm-Message-State: AD7BkJJ9V+VdVFzkq/vimv46ZpN1loLsaX52F3xhsqb2BiYPLkOuPM0vQ2BGqWvOizuErA==
X-Received: by 10.140.104.242 with SMTP id a105mr14049300qgf.1.1457138274985; 
	Fri, 04 Mar 2016 16:37:54 -0800 (PST)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	n77sm2782078qkl.40.2016.03.04.16.37.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Mar 2016 16:37:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2016 19:37:49 -0500
Message-Id: <1457138269-32121-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-webserver][PATCH] nginx: update to 1.9.12
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
X-List-Received-Date: Sat, 05 Mar 2016 00:37:55 -0000

---
 .../recipes-httpd/nginx/{nginx_1.9.11.bb => nginx_1.9.12.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.9.11.bb => nginx_1.9.12.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
index 8b60e53..d18f82b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.9.11.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.9.12.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
 	file://nginx-volatile.conf \
 	file://nginx.service \
 "
-SRC_URI[md5sum] = "76eb5853a1190e0cfc691aa21c545de3"
-SRC_URI[sha256sum] = "6a5c72f4afaf57a6db064bba0965d72335f127481c5d4e64ee8714e7b368a51f"
+SRC_URI[md5sum] = "0afe4a7e589a0de43b7b54aa055a4351"
+SRC_URI[sha256sum] = "1af2eb956910ed4b11aaf525a81bc37e135907e7127948f9179f5410337da042"
 
 inherit update-rc.d useradd
 
-- 
1.9.1


