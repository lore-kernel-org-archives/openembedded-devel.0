Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8464F7CE27
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 03:56:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k197so13822620pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Dec 2019 19:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O1RucZ4wIoQ0yH+H3Z0YoveiZXao/sSqMh0E0Utuat0=;
	b=gZtbgrBCEL3l92UWyIpce7tT9OnFAP6E+TGc2uRavKUsmFi7qpiQ2X9E7twbqqHpij
	GHA6f+a+Roqe7bYB+Kyrm/no0RPGYT8lOZNGxsJRtuIAUDfyv2d4feY9stjKsTgTaEWr
	SZ7tK6BaqsWDFNXjmZupBmp3e2NT4h8Kiwpnibs1ojMh1Fkbs02HJhJjLEspNF0H6MQP
	yx/tjE38m0A9HCTA181vC4oBRCagb3rLu4yLsfo+IWjOwCKyztvtykWhKRudOU5/Ay+y
	SQc9waYE0+emars6ZBsLJs/HJmOo+qhyQKiCS9KvemsLwqFFgCZXAHNK0TK4YHqpWw+z
	cxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O1RucZ4wIoQ0yH+H3Z0YoveiZXao/sSqMh0E0Utuat0=;
	b=lbmQn0YfBK0vBVAZOwui4s4GQDdiDKBeQEi7alEXsuGvuufP9BHp1RVq81PFa9Go4N
	UjUvulV0YezTL4jYFh/6BCohG3ohpHqmoIAzJ6MlO3IbMYsOF/xiihqb8C7iaP3n8UQu
	AIHM9OjERPUOwHBLhXWfdCckBUzOtSN8s+2KBDKtz/Vhb0wP9Xm/x4yKrKMXo/czoPg4
	H4Ym1MCIAVNWqPO6K3F9RNnHPesdYEgnO7khfea2ej6H4HQ/RQMFyUtjfts9ErRwNeCM
	xtPUGBnQV7InPvMp8/ds78pEd4+cRkw5HzWK2C3WfNapc4Pe7s2ejBrNudoiSTc5lv7i
	4ewg==
X-Gm-Message-State: APjAAAWwvuDgatlAOwUnVJJ8kduz3ZxkT+SzNZNc78ksia6J5Pi6Rfw3
	c6yy1UoznsXUG22DQT9qJdoRcNlQ4Q4=
X-Google-Smtp-Source: APXvYqwQ7AWT3mGrhtVSH+DQkxD38/vgw+93T72jQkKgtOLfCZ8H8UDCgk/XwoVI0VjqT7zxCypQsQ==
X-Received: by 2002:aa7:961b:: with SMTP id q27mr52749030pfg.23.1577419010359; 
	Thu, 26 Dec 2019 19:56:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r30sm36673613pfl.162.2019.12.26.19.56.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Dec 2019 19:56:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Dec 2019 19:56:39 -0800
Message-Id: <20191227035639.303716-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227035639.303716-1-raj.khem@gmail.com>
References: <20191227035639.303716-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/5] ippool: Fix strncpy -Wformat-truncation warning
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
X-List-Received-Date: Fri, 27 Dec 2019 03:56:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ippool/ippool/strncpy-truncation.patch    | 35 +++++++++++++++++++
 .../recipes-daemons/ippool/ippool_1.3.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch

diff --git a/meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch b/meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch
new file mode 100644
index 0000000000..28cad001db
--- /dev/null
+++ b/meta-networking/recipes-daemons/ippool/ippool/strncpy-truncation.patch
@@ -0,0 +1,35 @@
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
+@@ -261,6 +261,11 @@ static void cli_rl_display_wrapped_text(
+ 	if (left_margin == 0) {
+ 		left_margin = 3;
+ 	}
++
++	if (left_margin >= strlen(text_buf)) {
++		left_margin = strlen(text_buf);
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


