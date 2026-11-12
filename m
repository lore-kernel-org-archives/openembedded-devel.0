Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7032.1794520737121313911
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uHTxqt9v;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so84211f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794520735; x=1795125535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDmDwAO0czH89Mag+VNlPVKhTRi3ANaFpxPhJuKhW8s=;
        b=uHTxqt9vYeXzFQrSvesOR/MsfXssq1XeM5L3umfvMdiIbuEEZVV7yrgvbaYQ3W7Q/2
         4NqnXzf842tJTi/GQvjid3pZafSB/IJBxBl4SfsDrWV2cIoy9fllgEu+xazO4gJdYlVP
         S6OFL96eTsrrrea3gU5hyUGASVCI0PG/Cu8O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520735; x=1795125535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDmDwAO0czH89Mag+VNlPVKhTRi3ANaFpxPhJuKhW8s=;
        b=0bXUzCtQbSQgiocr2jUqjrKRFlPjtzs4iC4YiHP/4NcgZgLGkpGZr/CZAt3xsy80uH
         j1ARiF6Aise0NjVcZ0xyhVKn/DZINA65yL8YQbltAnw3n+6CKFUzukIp4bQOpijQJ88K
         pw/LQItpfxgvFF3chw3qE1Bsl5B+D5Zhqa8a0UlnQdE40ia1kGgu3R06QVUWZVxSLHxU
         f9un10jMSeqshv2qafg8BOko+fvttYhOvA/o0PpTtAXwbdlXAHPClJHsZFQPk+Ja9Hz9
         1uGZUwKh1NwqI1MjmxJVKtIAJ0nUuWiTaZLpyW00YhDqf7Olp4KpAU8KINls6ubSOfLR
         u9Eg==
X-Gm-Message-State: APuU4Z+ZdDbORDIyPJUQIHLY3bx/CQTD2oOelvqhV3ut8ghudMI7tGeY
	bOxM9DoS+vbNaAdW2v1bVgalLdV0aBUpXX715f5GZER854aT4G2+iycNh7znJ08uorMFLe/+Rqb
	B0Lfd
X-Gm-Gg: AYBFou1U4HCjFGiuJumuuN1+yaH3c9vXDeptJPG4xxaeJQNg0qHkXzVUsP74CrLS9nd
	C9bn7b7ZovjelGX8NLnQlcH4TbqIF0Rnw2GlbRnzSx/nYMYOjTBKWmzPrTCOE6IAm2Rzu4OzC4o
	MlDc8W6sOoBRHJ5mtx0vpcDd5drpGtEduBfQrDNYNgs4Sr8io3wozYely/gk39PxvJxoW9eu3s5
	Ie4fcFj6PhkmVNAS322vPTfrpBwHfKMfc09IrS4VEnAnPdwU/HtXEjEKBhpCC/9n3JiiSu1H6HM
	zh4cxHs3RGcNaCvwJVZHWfY/K4qkDE3DcrbuinP7NPvZueBwm9cgN/fkZ3EIcGXkAIp1uLwwmN+
	c6dwMlYzUWtQw0oViHzt6UeA6Xkt/JA5XHYEh6c0ZJt/IAr4VX2JNOe20kQXtn8SFN1Mmcrv5Qq
	YQY5y/8+DAdkyVzgZGH8mFqeGD+Qba5H75zbu5FxXqTnj9xUcSUCE5ulp8iPyqv7HCFf5CN/wRG
	Dxc52FbU5++IV1uhw+F+81v3Smz8ihSqnCte62tYWOWfBFq1TTdHIptD0WmKrtoymISZvjG4r4h
	cR7OuiPfoBfYjMxlBGIyI8psvcZTMWrKq4ARcR6LRHSXWyCmhYzau+Rynvqndf2jQ8kzW2fX+8l
	DwrfU4bpIzadqoIh4ChzoU0CUeK1sdAiW12mOuvhGjehaZR22MbNlcl+0j9UWTrEiufJjzYwP72
	g=
X-Received: by 2002:adf:e011:0:10b0:492:5ef7:5d98 with SMTP id ffacd0b85a97d-49c726da84fmr1030874f8f.38.1794520735214;
        Thu, 12 Nov 2026 13:58:55 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm1043896f8f.18.2026.11.12.13.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:58:54 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-annotated-doc: Upgrade 0.0.5 -> 0.0.6
Date: Thu, 12 Nov 2026 23:58:48 +0200
Message-ID: <20261112215852.3336380-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132217
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.0.6:

Breaking Changes:

- Drop support for Python 3.9.

Upgrades:

- Add support for Python 3.15 and 3.15t.

Docs:

- Enable Ruff formatting for Python in Markdown.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-annotated-doc_0.0.5.bb => python3-annotated-doc_0.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-annotated-doc_0.0.5.bb => python3-annotated-doc_0.0.6.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.6.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
rename to meta-python/recipes-devtools/python/python3-annotated-doc_0.0.6.bb
index da5fe0944a..5042ff15c3 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-doc_0.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fastapi/annotated-doc"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e36e91f278975b8bb76a769f32582892"
 
-SRC_URI[sha256sum] = "c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb"
+SRC_URI[sha256sum] = "7969bb69912085b2285849c0dcac0b4b374fd180c13cf10a87f284ffcf347bbf"
 
 inherit pypi python_pdm
 
-- 
2.47.3

