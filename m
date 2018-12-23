Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D493B71BEE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id z23so4879117plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MkEfeEMHQfRdJERY/gbVzm7bDruBXfqFVvcaNgNQm4Q=;
	b=HkughPEEaLiSNdq7QQjFmnCbAkyxx3qH5ZrLX6dZezEYR49jGUdhes720vBDvocn2+
	7WrrCehczW7Oncjbp1UoGf0zu+ZSTmAJloFGKXoGBxFOV51sJqFzJk+LeZVQBy05tz6N
	9kdsOUNj4PSIZHTA0q7DLMw18gKmusAF5URCKmRJOEhahCxyUKGek8kp+UJDTnlZv4Au
	AdNOO/8E4HivlM2yhRLm7/O+Olh85vPppaIwHf07xLSAfuyyfUTvsxk7FsqnV8FZekGL
	3DZBAUtJA/HkvGQYXAtQZ87hQDzVcaoZJxxfYh5ZTxPd/4oT9Guae1KpXz4e2qZyJGSq
	11zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MkEfeEMHQfRdJERY/gbVzm7bDruBXfqFVvcaNgNQm4Q=;
	b=dPcCAnUazVowaE6220TSk71o5lP+v/4IFAe1B8O+GXPxvnK05YZkN8m18DM0ze84Jc
	faGjDP2mzy8GHpZ5S3bMZ6GoQBwJ8Vsoo2WVzUgGczlq1WyCollwBjCextfKZzDJXF3/
	v704D+GAmat/qsNyqqUNhQxItqZ4XOQ+RGbB3QyP0RbRiGoRMUhd3uY2/9v5Y2aX6Kh7
	dQzBViO7qQW4rRSQEVIZHmUPUxPDRbqbh+9hXno1Sslep8+j9rPuiKOfzZEYb2/jZeY7
	ciJhdv67O7yATPx6e5jf7iLVb2dJXH9Ui7JyYqeGNCOVEsBUtu7+FUVyTYvnoBfmtY5O
	p1hA==
X-Gm-Message-State: AJcUukd6X5DqUI3AhJf3KZYYtQl5hcy7xXw4HjIpO+ZmXXiD3FBHseyD
	4ol4FXqkPt9afY2JElKtGfs9EKdWxmQ=
X-Google-Smtp-Source: ALg8bN6yVJWCBzScWqVTNjytNp0llpuQwkB242wdKbWw0Ek/vk9oAmMp8cIeoksPhKyIURkeNeNIcw==
X-Received: by 2002:a17:902:b40d:: with SMTP id
	x13mr11034611plr.237.1545600986565; 
	Sun, 23 Dec 2018 13:36:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:57 -0800
Message-Id: <20181223213557.7834-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 18/18] android-tools: Disable for powerpc/powerpc64
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:26 -0000
Content-Transfer-Encoding: 8bit

* There is no support for linux-ppc in this version
* Point mips64 to right linux port

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../android-tools/android-tools_5.1.1.r37.bb                | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 2604f65e1f..d49e53714d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -57,6 +57,9 @@ B = "${WORKDIR}/${BPN}"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"

+COMPATIBLE_HOST_powerpc = "(null)"
+COMPATIBLE_HOST_powerpc64 = "(null)"
+
 inherit systemd

 SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
@@ -91,6 +94,9 @@ do_compile() {
       mips|mipsel)
         export android_arch=linux-mips
       ;;
+      mips64|mips64el)
+        export android_arch=linux-mips64
+      ;;
       powerpc|powerpc64)
         export android_arch=linux-ppc
       ;;
--
2.20.1

