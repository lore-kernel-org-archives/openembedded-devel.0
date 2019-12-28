Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D62B76004D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 08:07:48 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x184so15828925pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 00:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+RGBaWMGDM8vqP+Twk9VIT+CiLV8vMVB031Rho+zXDw=;
	b=Evg06Wv6o1B6uWG5cZy2r6Mcj+Dka5TUD1358+AumStSAZVXh8lYtry0Io2BxlVA8u
	5Q5MYeNekmmOLg3X5hGJwnG6RVqKqARiX7UtKjGJLYc1m8golMdiPjuDwMQvxmysKl7y
	OlTlcte7wXuujQBTdDO/4Qh826wWx8vMK80C1+l/4wa24EqyVSYZ/pG6eCAF+5NGWETF
	O0HnhQeXuQxYb0mNta4nmkC7CM/xTN0wBO/5JFC2mb6DHCkUfzSO9Cz8ZlfWw9h6dIhm
	1K0daVhJdyr44LcuMAsBvJ0RjtOR/cwXNlRqca0+KyKygtMDGkS6k2353sa5kf+57tsM
	VPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+RGBaWMGDM8vqP+Twk9VIT+CiLV8vMVB031Rho+zXDw=;
	b=IiCvVmJsQWwT9I4KZwdmYxaP1NZf9N0oC8d6cw6+0OrnAQR7qrt4bhq/eSgyhkrsGX
	oU7ChCBybiMw7gbMJKi3LA5cTTuqB3ZhYSLtr6Fi3uOOxQ+o/eekH184k46mLYUAN6Pg
	0gafHXLr8/ib4K+kFJOmpAGKjqdAvYCcpkDVe31QuMX6DZS7D5NHQA/BblTviAc+8K1t
	18wPKdZws8J5JCVQDJcYj5FAOQcISlksmZGPsbvIdyKk5St6Wgcd1rmbymmGq0A4mULP
	PZk2F1f+lAGpyU2AZED3/7owJ8GzQlJfz6+/TZvmpNaKqQnGC49yFipKOU1M7FKk7SGi
	aTaQ==
X-Gm-Message-State: APjAAAVrar/2tRIr9ZGpOPO8ZCKS+2ZZnHr1J0l7NVPSsv3lm2wMgNXw
	vmBhONvz4iICkCPxqppFR3zpAIKVdrY=
X-Google-Smtp-Source: APXvYqzIxKu0zgjtNhrM7OWtI6+UCQegEKOtq2BSkYsfO1EuiBpXNP7fes4BAJtpb9tLkXVQYpBDBQ==
X-Received: by 2002:a62:a209:: with SMTP id m9mr49547969pff.16.1577520469413; 
	Sat, 28 Dec 2019 00:07:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r66sm44135124pfc.74.2019.12.28.00.07.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 00:07:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Dec 2019 00:07:37 -0800
Message-Id: <20191228080740.63169-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191228080740.63169-1-raj.khem@gmail.com>
References: <20191228080740.63169-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: [meta-networking][PATCH V2 2/5] ippool: Fix strncpy -Wformat-truncation warning
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
X-List-Received-Date: Sat, 28 Dec 2019 08:07:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>
---
 .../ippool/ippool/strncpy-truncation.patch    | 39 +++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch b/meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch
new file mode 100644
index 0000000000..01e1da8703
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch
@@ -0,0 +1,39 @@
+Replace strncpy with memcpy 
+
+since the length of data to 
+be copied has already been determined with strlen(). Replace strncpy()
+with memcpy() to address the warning and optimize the code a little.
+
+| ippool_config.c:112:2: note: 'snprintf' output between 8 and 55 bytes into a destination of size 48
+|   112 |  snprintf(prompt, sizeof(prompt), "ippool-%s", server_name);
+|       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/cli/cli_readline.c
++++ b/cli/cli_readline.c
+@@ -257,10 +257,15 @@ static void cli_rl_display_wrapped_text(
+ 	int pos;
+ 	int in_ws;
+ 	int i;
++	int bufsize = sizeof(text_buf)/sizeof(text_buf[0]);
+ 
+ 	if (left_margin == 0) {
+ 		left_margin = 3;
+ 	}
++	if (left_margin > bufsize) {
++		left_margin = bufsize;
++	}
++
+ 	if (right_margin == 0) {
+ 		right_margin = 78;;
+ 	}
+@@ -271,7 +276,7 @@ static void cli_rl_display_wrapped_text(
+ 	/* First copy the text heading to the buffer and add a "-", accounting for
+ 	 * the specified left margin.
+ 	 */
+-	strncpy(&text_buf[0], text1, left_margin - 3);
++	memcpy(&text_buf[0], text1, left_margin - 3);
+ 	for (pos = strlen(text1); pos < left_margin - 3; pos++) {
+ 		text_buf[pos] = ' ';
+ 	}
diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 6fa46904b3..3554e688ab 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-$
            file://0003-cli-Mark-return-of-strtol-as-long-int.patch \
            file://0002-link-with-libtirpc.patch \
            file://0003-musl-fixes.patch \
+           file://strncpy-truncation.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
-- 
2.24.1


