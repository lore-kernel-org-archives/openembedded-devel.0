Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD14E7AD5E
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 14:02:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138270.1766671349871024407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 06:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kqIUuehq;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso58859285e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766671348; x=1767276148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gA275No6o0B8hIcXEt4u396bf51yiAMcHmcId6yHco=;
        b=kqIUuehqSdhqOrPl5rrI74xcAKlqe5KGcRakP/tGwItiFpcLuerOHRbAvHwLivYK2d
         D0t8R/g1vrloNyqFgwrRtkVrY7D+qnu6ecy2Gp2ZeWuhRbyem5MZHV0cGOjFLaBPNMoV
         A9Pgo92DfnyvEAKhNDVl/4dryQOSYLHtfHPcgangJ3F3pCS82aQsAMOMBk7KuKmGEizC
         QSyYm2ouOV3AmtWYc7lH5xAi1R4J8XEZXzLblT10qQX2CpacgZMjkt2UpUZOvX6l0WQI
         YIikkLcjguYC25xq1+wlRryGkSBctYNczv0TESskj+fexJm+cQ/eCsDL1icEfXTwBZhH
         4KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766671348; x=1767276148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gA275No6o0B8hIcXEt4u396bf51yiAMcHmcId6yHco=;
        b=uIDTTZFvmrpW5XMN3cP+u2HO6K45CUJ5uP7ifMKWWRzf8iFkB1Am4FfDek0Ntbmzg0
         AzErDd+p5PxsIj2fYidL5kCCEIXnWoIudMq/xLp2z0uhPw0j403XcVAN98myDe1VAkQR
         ba0JFOvXOtCg6ZZWrps3omYLxJKN2Vkplji7szerYf6xfqvvCDvZNfC6nmz6LNhzLj5T
         ifHVlHiNAub4aYzoCNl2QMx3gOcDFbb98vvRPAMG4EZTIi/yeSOShMVuOhxzLpwqXVIR
         L68bMmONHSqCnE8k90aKgKW0BNcS4ueTyPXg7CoWx75+sdCenmrXygUFCLu6bGb1y7ko
         gk4g==
X-Gm-Message-State: AOJu0YysJU4V0bLAGvFsVzQz77Y8P2HbwqOQ1vgmBvZpzi2FLQipX5Bv
	4adgC7AALLn/OyBjnh7sIDPfzLzNdus/zEuZaO+Ht5nF0pZ8Q6q0h68bEM4Dqw==
X-Gm-Gg: AY/fxX4/W2B+40YMip4mmcvlREujneEXrxEvKyBUYc/dhmw5rppJ/hbCJYGu5leRpRk
	MIEdUb/CsHOJRMS+bt3umlMjALIEToFizJTH53TYSACraqAlApeUGv8MSrNtRsLuhji3IHdUeHK
	Rjun//LOI8bqMHXNcE/iaoCX12Ke7hGgiX7p3Vxa2eI1z50PZNWUysiC9spx22ouyMv3c+aBVpv
	dskGBeo+G1h93Adh+oSat6TEZdp5trL6puE4parv7dd2fuUAYJgBpZZQkP5nz2o1eoBjqPjd0U6
	oGUi3HAkR22d7ncmxdRquuCoptFNIHRp9Bap/iDR4P5Z7li5Oms65OVrNjFZBZ7/ltdhy1bx2Le
	LD/nxIGEfnYl3MjU2r6awEBrgo4B9x/G5knE5LJVRO6ptB4/AUfmEeVKJBoBusFfk7yyMQkTu6R
	LwxGuHjFls
X-Google-Smtp-Source: AGHT+IHub/3FtXv+9FJH693VNJxcXqf2MRrM8zM/voINsPtI9m2uh1HOShsQT3Mfjbg5nPKnkWb/7A==
X-Received: by 2002:a05:600c:8b8c:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d195aaf01mr196498725e9.35.1766671346300;
        Thu, 25 Dec 2025 06:02:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm388573965e9.15.2025.12.25.06.02.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:02:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] smarty: patch CVE-2023-28447
Date: Thu, 25 Dec 2025 15:02:21 +0100
Message-ID: <20251225140223.3015168-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225140223.3015168-1-skandigraun@gmail.com>
References: <20251225140223.3015168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 14:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122925

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-28447

Pick the patch that is referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../smarty/smarty/CVE-2023-28447.patch        | 74 +++++++++++++++++++
 .../recipes-support/smarty/smarty_4.1.1.bb    |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-support/smarty/smarty/CVE-2023-28447.patch

diff --git a/meta-oe/recipes-support/smarty/smarty/CVE-2023-28447.patch b/meta-oe/recipes-support/smarty/smarty/CVE-2023-28447.patch
new file mode 100644
index 0000000000..837019d88a
--- /dev/null
+++ b/meta-oe/recipes-support/smarty/smarty/CVE-2023-28447.patch
@@ -0,0 +1,74 @@
+From 456aad251e7dd399fef136f652a1684c05fefa5a Mon Sep 17 00:00:00 2001
+From: Simon Wisselink <s.wisselink@iwink.nl>
+Date: Fri, 24 Mar 2023 12:19:34 +0100
+Subject: [PATCH] Implement fix and tests
+
+CVE: CVE-2023-28447
+Upstream-Status: Backport [https://github.com/smarty-php/smarty/commit/685662466f653597428966d75a661073104d713d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libs/plugins/modifier.escape.php              |  4 +++-
+ libs/plugins/modifiercompiler.escape.php      |  4 +++-
+ .../PluginModifierEscapeTest.php              | 21 +++++++++++++++++++
+ 3 files changed, 27 insertions(+), 2 deletions(-)
+
+diff --git a/libs/plugins/modifier.escape.php b/libs/plugins/modifier.escape.php
+index 3ce48382..70d2db92 100644
+--- a/libs/plugins/modifier.escape.php
++++ b/libs/plugins/modifier.escape.php
+@@ -188,7 +188,9 @@ function smarty_modifier_escape($string, $esc_type = 'html', $char_set = null, $
+                     // see https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements
+                     '<!--' => '<\!--',
+                     '<s'   => '<\s',
+-                    '<S'   => '<\S'
++                    '<S'   => '<\S',
++	                "`" => "\\\\`",
++	                "\${" => "\\\\\\$\\{"
+                 )
+             );
+         case 'mail':
+diff --git a/libs/plugins/modifiercompiler.escape.php b/libs/plugins/modifiercompiler.escape.php
+index 1fc5e781..0e13c829 100644
+--- a/libs/plugins/modifiercompiler.escape.php
++++ b/libs/plugins/modifiercompiler.escape.php
+@@ -89,7 +89,9 @@ function smarty_modifiercompiler_escape($params, Smarty_Internal_TemplateCompile
+                 // see https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements
+                 return 'strtr((string)' .
+                        $params[ 0 ] .
+-                       ', array("\\\\" => "\\\\\\\\", "\'" => "\\\\\'", "\"" => "\\\\\"", "\\r" => "\\\\r", "\\n" => "\\\n", "</" => "<\/", "<!--" => "<\!--", "<s" => "<\s", "<S" => "<\S" ))';
++                       ', array("\\\\" => "\\\\\\\\", "\'" => "\\\\\'", "\"" => "\\\\\"", "\\r" => "\\\\r", 
++                       "\\n" => "\\\n", "</" => "<\/", "<!--" => "<\!--", "<s" => "<\s", "<S" => "<\S",
++                       "`" => "\\\\`", "\${" => "\\\\\\$\\{"))';
+         }
+     } catch (SmartyException $e) {
+         // pass through to regular plugin fallback
+diff --git a/tests/UnitTests/TemplateSource/TagTests/PluginModifier/PluginModifierEscapeTest.php b/tests/UnitTests/TemplateSource/TagTests/PluginModifier/PluginModifierEscapeTest.php
+index 46a8297f..752e1bfe 100644
+--- a/tests/UnitTests/TemplateSource/TagTests/PluginModifier/PluginModifierEscapeTest.php
++++ b/tests/UnitTests/TemplateSource/TagTests/PluginModifier/PluginModifierEscapeTest.php
+@@ -207,4 +207,25 @@ class PluginModifierEscapeTest extends PHPUnit_Smarty
+         $this->assertEquals("sma'rty@&#187;example&#171;.com", $this->smarty->fetch($tpl));
+         Smarty::$_MBSTRING = true;
+     }
++
++	public function testTemplateLiteralBackticks()
++	{
++		$tpl = $this->smarty->createTemplate('string:{"`Hello, World!`"|escape:"javascript"}');
++		$this->assertEquals("\\`Hello, World!\\`", $this->smarty->fetch($tpl));
++	}
++
++	public function testTemplateLiteralInterpolation()
++	{
++		$tpl = $this->smarty->createTemplate('string:{$vector|escape:"javascript"}');
++		$this->smarty->assign('vector', "`Hello, \${name}!`");
++		$this->assertEquals("\\`Hello, \\\$\\{name}!\\`", $this->smarty->fetch($tpl));
++	}
++
++	public function testTemplateLiteralBackticksAndInterpolation()
++	{
++		$this->smarty->assign('vector', '`${alert(`Hello, ${name}!`)}${`\n`}`');
++		$tpl = $this->smarty->createTemplate('string:{$vector|escape:"javascript"}');
++		$this->assertEquals("\\`\\\$\\{alert(\\`Hello, \\\$\\{name}!\\`)}\\\$\\{\\`\\\\n\\`}\\`", $this->smarty->fetch($tpl));
++	}
++
+ }
diff --git a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
index 1d044e18ce..014a449b30 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
@@ -9,6 +9,7 @@ DEPENDS += "php"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master \
            file://CVE-2018-25047.patch \
+           file://CVE-2023-28447.patch \
            "
 
 SRCREV = "71036be8be02bf93735c47b0b745f722efbc729f"

