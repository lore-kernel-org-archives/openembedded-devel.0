Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id A71F27FC14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:46 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r11so5753635pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=51BhosKB/6s4XmPDdX1SYyj0c5kkaYMHOqF97AP5w4A=;
	b=EdJ4S44sTnzvz8XmObP7s9Q8jcJuICVaBk0x4v4fHCqoE2Iuwr/T7THvBTy3KW3ZcX
	RgA+mTLEQQLqGg4k1mlT5gzbFkxC1oGcKcAa74umru460VsTzphcUvBe0ajyuLx3tXPd
	1xccJxlFde/p1VVxkyGUhQsQUOXvSkrjJalwpXxQOT+kiDHler6blP3E1dTbRzMNso3f
	nfG/qzlhNk8zsWiHVtSK0GsApnIpfCffTFtFYHLxUmVMjcAaoipD+TlqmtJd7ZZANnOe
	pP//m8pUZL48wfTZtFOEbBVamhmfmEzV1l1zdlo0WrKcT0kv96jaj7nuqMr7d3FwSOSk
	XdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=51BhosKB/6s4XmPDdX1SYyj0c5kkaYMHOqF97AP5w4A=;
	b=i/mdGoarieRF7CvWKUCVDt4IFhlApDMm1dKSJuDCjxoaa9GdyfF6WLExreA0V7DVjy
	zs3Ei1O0HKO7Xt1hAwTvORsC5WmTQce6PO1loorgUgww7EqIRPLgUq8jeqqHr1npPnc+
	glhVT4dvRzX4497upcGcAntlLg7YdOqc7gArTjEulekvnUV0ys3+yBfhDNfWBubq+2Aj
	hTDOJsPTS/qtLim1J0QfIjvXB/X/sYsiwi0l/uFuPbRWRbA6r/LetYtQlQGK/bOr8JsO
	o/FOCjUev1RwqAZFHLEIqraj+TcHLPRwUPAn4boUzX0OseTl6FPAc7NBmYVot3iWyW/D
	jZeg==
X-Gm-Message-State: APjAAAWGTBA4iqwznPIR/7mi5U8XLLsSzkQdr2/P1RHe0B7Kvf3zFBrB
	MdP5s+i/BgTTxHWU+3/8wvicNCvWUV4=
X-Google-Smtp-Source: APXvYqwNs6WQizL7TtnDv7zEyDM0Bu6rrgq8YlLHWZGYpsCuPFr1B1drAhCLE/iHO9cwQznWWH5A3Q==
X-Received: by 2002:a63:6b82:: with SMTP id g124mr1602903pgc.418.1576886807211;
	Fri, 20 Dec 2019 16:06:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:14 -0800
Message-Id: <20191221000635.1573390-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/23] nvme-cli: Use nonarch libdir for dracut config files
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:46 -0000
Content-Transfer-Encoding: 8bit

Fixes packaging errors where libdir != nonarch_libdir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
index 92c902b750..ea8bc1738e 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
@@ -27,7 +27,7 @@ pkg_postinst_ontarget_${PN}() {
 PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion"
 
 FILES_${PN} += "${systemd_system_unitdir}"
-FILES_${PN}-dracut = "${libdir}/dracut/dracut.conf.d"
+FILES_${PN}-dracut = "${nonarch_libdir}/dracut/dracut.conf.d"
 FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 RDEPENDS_${PN} = "util-linux-uuidgen"
-- 
2.24.1


