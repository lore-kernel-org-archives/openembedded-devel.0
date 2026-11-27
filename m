Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10356.1795753056298366644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XCAIqwNP;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6589052c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753056; x=1796357856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZe8hNVfY0At8KtbF9IIKM5FNT9xe7WQajpSQLTd5zY=;
        b=XCAIqwNPflsDg+/lrsW7b81/Q6VcjAXgDGQ/vLgN6xGw38m/687FfW9wMw9XDrAR6K
         GMbEvZBoYutJJiJdsiquzJ/afaVmWbrUykzE2ZBtu7fTgEvDGiiygQbo4gxzeTwVKBJ3
         tY67hgsNCQf51FWt7q2Y4We6ymcTIIZX0nclyjQ6jP2HKCjKyB1Pcyr1zhcQhyE6+xCT
         GCMrA5fXhUKM+nUiEAnecY/UYy6crnP2scoS1DeG1tcIKnqLFncP57gqPWL6MCOdGLUJ
         CN4a67MpXdvBolSMovSNPQeLOvbBp22o9DsiShTosJ6UMlKs9Oe0DFmhVuCSgE9zLf40
         VX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753056; x=1796357856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UZe8hNVfY0At8KtbF9IIKM5FNT9xe7WQajpSQLTd5zY=;
        b=gDE5MordHyDMSxUy6sCV5DpFqnhL7ayvBsZzxvZaM5YXMkBMnjlFGDP5CSn3vwI2QP
         HO1WssKQ/PDvsehW6wL2B6TiO/383s7lf1Gr/8vyG5DV9NBkFM/pb0qoZUMZyjA0nbEX
         SgHNTuEINMveVdqfpD4GCM/qfUM7oXV1aeJPv47Oz5TaKTQVXVNTJkHjavIjgxjpvdan
         6W48SKya3jqxxf0oc1C0iiajrlo6JkxXrbw7Y+U2mKivynLW73zgxI/ovuavDxZS67WM
         7JaVTPPPkH2gH98buL0uYjzVfR0x6pjpOuOly+X0EqBi2QgRFciQLlcHgVM8pj8sKpU3
         3Ehg==
X-Gm-Message-State: APuU4Z/y/3xqnPkDYn1qONIGkB8Wb8BtdyJoHKHy2ZRfyvTpm4cCIW1R
	fonmTzw527sH+rzjbfB33lIBs/59PYHTDXqhBXHZ8v9krQoi5SlBJDCpkBzPSOT9
X-Gm-Gg: AZFdTZcArDtbNHwoBDVGTzBchkceJWFqJDXvWJlCCk4h/m78iv9L+r0y4jHb6fo3JTL
	ZC1rZR2un/XIycgpQ5O6QHghe7N0oIh5nHGCzjRwbvgIzzs5mlAJM7lKn3M8+h1nxQM8P9z255a
	EvcyRaddG1reuFedKU5v674pN7OUaPdDYxyjevgc5Fe93vWmR+q5ogclql7+aViB2fy1ELYKGMg
	i/0sss91AQ6CLty1968sN3PZWSikPXhEJ/+baiiDP6VfmKd4jtY1IieVPQ+CxGY+3cmAkr5DfHt
	gR6dwy9EptcluoAEIl9H1gT6Z1MNO+7d0qSOroS8NR7vq0f0oo9ozlCu2jHN58bkdb+VZSNI0oV
	IiDWKyHCoWUtMrQUPo4lg15mddLG3ofipFLZ7lXUln5xByOC1e/QOg2IVltN1WXCzhCGhWqFylR
	vmA/902hjUkV8Ii8xh/8Pq//WDcqSG1PyrQjc4lvBzTMXR1Ye1v4H581yOafcgzMT5ywnTIzQml
	dvmy2ZtN6y5gjVglxe6nGd9+K0qhA0iLKxV1Bq446G2DiqlZncPWGodSm29qhRdWtmjyB9dynlH
	FV/89WIgrivHO5lPBXQY3ODFkzqFwNfxqjo9VixBrOj9RMJjmE5Q8Qg2kY+IIKr1aWIcl+2LTi4
	LYGJDI41MPUVieFmJGuWXLw72yA2zHnQ06c8JF+uRmrooeNU30O/3i0sDZA7VxRrpa9mgkkRnmM
	pOPUP6FppeoRLplAAC/4LxbrXfIhIy/GUx+3fw4l3B13Q6rR4NtZji0awz83Q0nhGLaANvlRwHe
	Lh5W2Cq0D3Cy9WDbd0I8ghvp+rKMrRzGVI7mughOvFQZQX3+eu/A2bitgt+1UcZGPZkAl+HCp/E
	JuijoZh2QPoIbctaNT54bGPYuA==
X-Received: by 2002:a05:701a:ccce:20b0:1b5:9075:2334 with SMTP id a92af1059eb24-1b590752388mr4244107c88.12.1795753055610;
        Thu, 26 Nov 2026 20:17:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 16/35] dante: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:56 -0800
Message-ID: <20261127041715.1776485-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133268
Content-Type: text/plain; charset="utf-8"

https://www.inet.no fails the TLS handshake and the files directory is
not listable, so nothing was found. Check the download page over http.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
index e15f7c4d41..cfcde86106 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.4.bb
@@ -16,6 +16,9 @@ SRC_URI = "https://www.inet.no/dante/files/dante-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec"
 
+UPSTREAM_CHECK_URI = "http://www.inet.no/dante/download.html"
+UPSTREAM_CHECK_REGEX = "dante-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 # without --without-gssapi, config.log will contain reference to /usr/lib
 # as a consequence of GSSAPI path being set to /usr by default.
 # --with-gssapi-path=PATH specify gssapi path
