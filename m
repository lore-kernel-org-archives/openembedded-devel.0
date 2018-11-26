Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD1B26C62C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r10so17695040wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sNqzNYPLFWRxW6EP1jygByoxjBYPOLih/6/RAnvqYcY=;
	b=SrnqACgGBidrHg/BQk1lpMJcXlfVQ9ct/bHqaB8YHVsd2pmgkWulMyRFVMF0/TeLKC
	3KKFFC+Wf/xLUgYUa/eE5c1c0MlrwA+RVZIz9ZWmeWdqw8Bsl5nj95tld4UxtJ9vbEae
	cJAQzwE8JeBA48mBJOG04cLpYkTv8KPRdGaxs/QqSOaDfoWTHr3hkb5j8NNuRRXdpuOV
	/1Z+dHSk5OpchwHY/KLdla4X4dQmkPxHYvttnENRPq1p366q+lvd8NRRrOpTMWOF700O
	m8W0LDrMOa0A5vGidN72n82gLYb6MKIBEScuSc92pUFUJLXfkueZvHEBvmcSsNIcDKCh
	TdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sNqzNYPLFWRxW6EP1jygByoxjBYPOLih/6/RAnvqYcY=;
	b=l2sUhICoZANntKG8Gf8C94dfb1TxJYN5lN/yLC89qjKOctMDsEKDWupYl5gm070kJL
	U3Y0rfz0hFZMD7B3mz/wJEIqXDSis8vwvcxEwt96Xb3bfzJycJjMA/nM/ZlCtu9GgUDd
	H3IU/ejkTdXhX+NmCn+m8A97lKBrf+75XEjaxqqX8Ubr0tEduYBC4SN+3Oa9lkonS0l1
	+KSO9v3g2b3ZoL4WCyi8o4XQswJnw1fFC2Y441puXXXBJXZhNOjhNTaFMYWqInfg7EHi
	NeGPPWvlwwAuYiMIyJnL4A0imayE6Gr1gm4cDoHDobRYBvrB+2IgLZSSOP4tTbtZvIin
	8CBw==
X-Gm-Message-State: AA+aEWapjLZ5YZJhEXT4xBKnxtZYvhRRH/yVMF/PgjSiCBcRxs2/bqrh
	L9O1HYHM8OogNURiZM5E2tHSFZ1NYrA=
X-Google-Smtp-Source: AFSGD/WUDwMgQ4OOrPJ+oTmTGSCzE9jVbANZT6QhrGAonv9vXtBmpaVs6lOPjPEkak7DBkBjhA3RrQ==
X-Received: by 2002:adf:c612:: with SMTP id n18mr3969828wrg.174.1543217729994; 
	Sun, 25 Nov 2018 23:35:29 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:19 +0100
Message-Id: <20181126073520.18859-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126073520.18859-1-brgl@bgdev.pl>
References: <20181126073520.18859-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 5/6] libsigrokdecode: new package
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../sigrok/libsigrokdecode_0.5.2.bb                | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
new file mode 100644
index 000000000..b8e1e4705
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode_0.5.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "libsigrokdecode is a shared library written in C, which provides (streaming) protocol decoding functionality."
+HOMEPAGE = "http://sigrok.org/wiki/Main_Page"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "glib-2.0 python3"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "b9033bc7e68bc17fffffd4fdd793f5a1"
+SRC_URI[sha256sum] = "e08d9e797c54eccf3144da631b6e5f1498ac531e51520428df537a1da82583f0"
-- 
2.19.1


