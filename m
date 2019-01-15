Return-Path: <3VHM-XAMKAB0P3D9HH9E7.5HF@flex--wak.bounces.google.com>
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com
	[209.85.160.202])
	by mail.openembedded.org (Postfix) with ESMTP id A72286B90D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 23:57:07 +0000 (UTC)
Received: by mail-qt1-f202.google.com with SMTP id u20so4061803qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 15:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:date:in-reply-to:message-id:references:subject:from:to
	:cc; bh=nvsep4so5B9BgF85s0DLJA1OPjR1NHG8P0EKsSgOdDY=;
	b=V4nHu1tE/nTfLc8WY9nEdr8IulQ/DvL8g17OdkHSnuMa24DIAsFrwVgsT4ysT2hIeL
	A6I8+zrGz9iAupbBJyipjpR4OQ1Aj/M4V868zV8SofJZzmA89k4cHDIZVFVW3I8s/pZk
	er+B1FqpVHLzkeKUW5TMWUt/8IOrgN6DFBrbLDYmFdtRy5DugwRHbSnzBZF2Xeksxmxx
	CsG77SM7n4zM1vrVpngzWY5pNK5M3Bokc1qgjzBhYcS1Kjub4UHkj2uVvjRGZlS8REiA
	gDezTiMKqG/xyS8cD5GR81FLggcK0totcMN3d8OZX6blV6/rhES3nJbgUCCbvZgfU8Fr
	iJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id
	:references:subject:from:to:cc;
	bh=nvsep4so5B9BgF85s0DLJA1OPjR1NHG8P0EKsSgOdDY=;
	b=TIuAF7FZdoxEOgd0Z50W4SusWDAulGgN3q8dPgSOmrvjgPFgd4GWwiYb3pyM0Yn2/W
	fPWmpiM96Bo9oMW7SrxpO6zY08doV2xI45B9k0dIpjmLAbIcj0qSyk2oDBBzE0Xe+UqU
	2MfFfichhhEwdpcywAe04MiiKDQpDFOrKQFwpWZQCsUwc/D218ndgt5O9yyEywVxpk7/
	sO3w0yESVgzRMuKFJitBVDtBrgHzjFOnbCuT0EIC17/RloBekLX6vCSAV0JsHbh1MVF+
	3QfcDhRvU61pEPf06n2dQcN7EGFNeQ6gx5r1CCZ6M9g02+lgKagSmC5eGuYxl5b8AQok
	3DJw==
X-Gm-Message-State: AJcUukfqBfVD+c/tKkLK9HsDqAisZcW1yCa9u1CXiKmaUeN5FHTB+Qkt
	STMTJDnwhE5zItvhIGnBYSIXtcNmi0KE6ZQOgkHK3HFL6jurzaovEEbBrsO5FCLuaU1spGC+PK4
	PcP1929QDkfggyaoYZqArSxlwblAlE6Xi/J/jsmxnoDQnsS3oHUBwL/SFTO8F+/tkxuN7e3VYSx
	2zWW0=
X-Google-Smtp-Source: ALg8bN7r8w0HiPnyPsxNY8RIJj88l3IO5b9dG4OH5ag9t1EgbDxaZB8kNaQpXqvPsdbgq3OcXG7O12E=
MIME-Version: 1.0
X-Received: by 2002:aed:35a4:: with SMTP id c33mr3555974qte.40.1547596628585; 
	Tue, 15 Jan 2019 15:57:08 -0800 (PST)
Date: Tue, 15 Jan 2019 15:56:27 -0800
In-Reply-To: <20181003055751.174763-1-wak@google.com>
Message-Id: <20190115235626.10181-1-wak@google.com>
References: <20181003055751.174763-1-wak@google.com>
X-Mailer: git-send-email 2.18.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] cli11: Add recipe
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
X-List-Received-Date: Tue, 15 Jan 2019 23:57:07 -0000
Content-Type: text/plain; charset="UTF-8"

cli11 is a c++ command line parser library that provides a simple
user interface with modern c++ semantics.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/cli11/cli11_1.6.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/cli11/cli11_1.6.2.bb

diff --git a/meta-oe/recipes-support/cli11/cli11_1.6.2.bb b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
new file mode 100644
index 000000000..507824def
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11_1.6.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C++11 command line parser"
+DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c271fee3ae28e11b24b97284d9f82887"
+SRCREV = "bd4dc911847d0cde7a6b41dfa626a85aab213baf"
+PV = "1.6.2"
+
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
+
+DEPENDS += "boost"
-- 
2.18.0


