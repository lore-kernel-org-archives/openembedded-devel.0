Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3631160BEE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 23:22:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so9894430wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 15:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NJh2uJc2hRuAZsHV2GZSyQFtkl3++iFWGChaYm4dt30=;
	b=nmj8Irbaj0kzad8UOH0EwiyuQ79kSjFcCoreATsmG0iOlk46F9YlbGZiKl7gy1KeXT
	cyfVEABy7KGEz9YX9lObw9SB3jR2lgEZr4n7g0yuyMfdKmREPC+4RDBVHL0zEb433sRS
	kLHkW2d+xKlfO6LLlUcTpNwrdSyV8m9oYpMZyZ7psZkCY00BHRW5S6pGRiWDWe82gefR
	VJxxIA8e85sYyDAlq9KHUWLq+ytNchLpjvDpNwXKSfvZe+p6UTivIPXaawzqklInDgdQ
	RmLkMj5uu91px3UU5+7AcziuDfkYI9GSjdo6ZLBMY7NRSGpf/7ZgRcvKQ4l1cFzn5+7D
	nbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NJh2uJc2hRuAZsHV2GZSyQFtkl3++iFWGChaYm4dt30=;
	b=hS2CHTg31h83dhCZ9GEXGGQLEi5nKcJ4UlFWZF8x/q9HXnSqQdbSqVcmKIO/EQd43p
	07I82HxkiashYi/fa8nvaMnt7mermvCE09DwbbIDEMSZ4BmttDWjG9GZKqf2Fl5h66g7
	J5OxujYIfZexhq12rzPq+TINBLsYmEC36JwfUWzorjzP4OWkb79NGJeH+pzdqHfLGpzs
	4amjXSMlvGPaPyt96Q/menTfJ8j3wwtHsIqKgGmTLn9nMKAKBR8eTosBvpLI8F3O+NGL
	pAJ1fsxURjAv91dUqiBvEXOJPs4uYNLAVBqVreiwYLwsBZm49p9ieu175rPo2r460Zso
	p/iw==
X-Gm-Message-State: APjAAAU9a0gpkOCjpAdq3QKy6D24CuEQkNl7BP7vGEty41soYlrYSsLu
	Brkn8+pa0k48G+Gmz8ekji4xnN6P
X-Google-Smtp-Source: APXvYqyklkdOWfVX6EmHV6pXWxLWyEUlk8xl7sYIrfWER1SAAx8Z4De/3DyX5e1oL2osDwe2naZgFg==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr4309444wrt.70.1581376948434;
	Mon, 10 Feb 2020 15:22:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16430604FCC0E8FD11AD.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1643:604:fcc0:e8fd:11ad])
	by smtp.gmail.com with ESMTPSA id u8sm1155059wmm.15.2020.02.10.15.22.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 15:22:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2020 00:22:15 +0100
Message-Id: <20200210232215.8815-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] mozjs: Fix python3 build with gold
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
X-List-Received-Date: Mon, 10 Feb 2020 23:22:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [1]

[1] http://errors.yoctoproject.org/Errors/Details/390559/

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mozjs/mozjs/0001-Port-build-to-python3.patch      | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
index 695dd97f6..e525047df 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-Port-build-to-python3.patch
@@ -35,7 +35,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  build/moz.configure/init.configure            |  31 +-
  build/moz.configure/keyfiles.configure        |   4 +-
  build/moz.configure/old.configure             |  32 +-
- build/moz.configure/toolchain.configure       |  16 +-
+ build/moz.configure/toolchain.configure       |  18 +-
  build/moz.configure/util.configure            |   9 +-
  build/moz.configure/windows.configure         |  10 +-
  build/templates.mozbuild                      |   2 +-
@@ -451,6 +451,15 @@ index fc640c75e..c5508dfb7 100755
  def pgo_flags(compiler):
      if compiler.type in ('gcc', 'clang'):
          return namespace(
+@@ -1517,6 +1517,8 @@ def enable_gnu_linker(enable_gold_option, c_compiler, developer_options, build_e
+         gold = check_cmd_output(*detection_cmd).strip()
+         if not gold:
+             return
++        if isinstance(gold, bytes):
++            gold = gold.decode('utf-8')
+ 
+         goldFullPath = find_program(gold)
+         if goldFullPath is None:
 diff --git a/build/moz.configure/util.configure b/build/moz.configure/util.configure
 index 3284fd8b5..218813e2d 100644
 --- a/build/moz.configure/util.configure
-- 
2.21.0


