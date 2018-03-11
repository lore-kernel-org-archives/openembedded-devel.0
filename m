Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C7AC278891
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:34:35 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j4so9422329qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S7xQUrlQlvOX9qUmJ7F35KSo1MdRvUeuby+EScW16YQ=;
	b=Me+B8qAxOpcPoXBR2R68Yja1E9Ig8QFESntV04aQWGE1/hv09rTH2B1uc1Lviuk+XZ
	LGoy8b4QQcNg7YehrL10iOAD6fcQeshgrRz3Is1IFABc4iv8RQqm/wBw4dOaK2GEvwLs
	KV0cdxk6XvqaJZlR2N+QSwWHROHNDtmv6rIayDyvIwFfyRkhZssQiuM1JP+TIU88SCha
	l8fOmuQevkR6/QkdfQ1rG3Eedd5kgtK61Fr8gV+kcPjEGlQ2MZqDh4gu4BqolU+hI+sY
	osFuWyBk6MLTYjQy8rl6FISWggb1cc/JSYSvTOXxoycM88kIxi864KEuwfSeF2jadEg2
	rrrw==
X-Gm-Message-State: AElRT7Fka0OEM+tN+PjvMyntfKb6JrVJG1f5g9Xdv8RgJDB8B5L/5Xch
	P6+/1R+2A7GhVORsCEx3+YJ7QImW
X-Google-Smtp-Source: AG47ELsYV1Qz42ha+IgB16/vkwHu9qXypNqitkK9QQ5ygcBbQ2zwU66CAcdJaLYv5V4VEd42SNGuqA==
X-Received: by 10.55.98.70 with SMTP id w67mr8339484qkb.278.1520804076317;
	Sun, 11 Mar 2018 14:34:36 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	d36sm4302587qtk.47.2018.03.11.14.34.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 14:34:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 17:34:30 -0400
Message-Id: <1520804070-24631-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] hthttpd: add a valid upstream check uri and regex
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
X-List-Received-Date: Sun, 11 Mar 2018 21:34:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index c9fe55b..37bd753 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -14,6 +14,9 @@ SRC_URI = "https://github.com/blueness/${BPN}/archive/v${PV}.tar.gz;downloadfile
 SRC_URI[md5sum] = "3cda1b6c8c8542b1510eadb8e540d8b6"
 SRC_URI[sha256sum] = "a1ee2806432eaf5b5dd267a0523701f9f1fa00fefd499d5bec42165a41e05846"
 
+UPSTREAM_CHECK_URI = "https://github.com/blueness/sthttpd/releases/"
+UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
+
 S = "${WORKDIR}/sthttpd-${PV}"
 
 inherit autotools update-rc.d systemd
-- 
2.7.4


