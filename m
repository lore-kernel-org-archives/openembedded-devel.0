Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6CDE7AD63
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 14:02:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138269.1766671346832898908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 06:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=goUv28d0;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so40268645e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766671345; x=1767276145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivw/tKBCYGdAJMLY8mW6jbPNhUmH2LHqXWYy2tXOubY=;
        b=goUv28d0mhZH6147QbU/eVhlkxJmGrJ4K6g2rP2jSNkl3djvgG/KZp0r6/WmBhaTy8
         QL3ICRF/sUh6ZDasFxNbsPsBy54BIBH0xphMluleZIkGtu3fk35xre0KhIbWkvY4KiaN
         Ixaq3SDqWlVhKD5RWGbAwzax3/SBjA0uKw0eiT0BYNVyfmbCzgM17fj1HbL8B2RcqjDx
         Yd/TDi5/zYmJbbKlRydEDkxvaoyHJFRjI/gWvfsH42wb/5S5P+K26iYNiar5ZsK3uqW8
         EOlz1oyLGoUy6LCB2Lj5nnFoS4Pb3qab02k1yGhPsVfoutskBAPfQFfbfDrZk8X7sFp1
         XMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766671345; x=1767276145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ivw/tKBCYGdAJMLY8mW6jbPNhUmH2LHqXWYy2tXOubY=;
        b=H7v92WYU71COnVpun3z4aGYl3kVfQKp8vNeG+xf1dkkuODJ3foiJcMObKyZJpTADq1
         fFgO2DYeTm3ebcZ+tGzuiz6iSn32DnTLEXwdjqw7B7rMymNPPGto+UabU4adIZYsEZyf
         bWPx9tZp/ZJMLE6HnjrV2/VqmLoPKy8szB0oEnFyNFuAHvOOJi9naJgrYbSXt1/fx7gB
         e5A1cqTRA7anVFSZQKZsDTPeDM9avmX8Z9MEgMO7697p4aX3ywgdQAOsaVYFXE9eEpMg
         PkRQjNCO7mSn69yTN2l9ceXiBCutp9DV1yK1fcxiY4TpZJ6H72l+UaVdfCNusHMv8bXY
         7SiA==
X-Gm-Message-State: AOJu0YxXFUh2kiFKGMQWVrm5GyrrcU8lStsTaqUvoIB+QdJ+h/bsJvq9
	q9qfC+BWkAuMbzCAifzYyIwohsM2QpD0Zj07cfC51SDq46YT8AZyZhQKvnjbdw==
X-Gm-Gg: AY/fxX561gduwNxHPDSzvudH4yCO14U4y1/g7I8N6P0jfF+JjNi7UWAZrPG8iOmud6p
	Ov2l07FAdXxK0IYRQ37t8M47vgUL6PjZwKzY8zG9S1fu87kG4YVBflq9qs/yCQN8LhnpE/zNa1j
	+J+2vl0Hf7VErhVgj8FJvFlhYMR2SLZEfZq7Hr1IrUVI8Rz3D4ZIYJEc+2OaqaKO30hGbtoafUv
	hMOIToFWB+RMvtr8fiRgCw2vCN6Wn5Rfo2gd50l6s2zvuOB+PamFcUy6+ggBODV5R8A79QwMxtb
	U5S/Ugyeme0uhohZmUOc5Fd+ENecGNq2onq9mpZiRDLcdt1ahtMkQvNmcdo4N5WeXQvoRplLt+0
	+1a3JbK03JkpzVCkrNqkNWD8GS0/yPABZk/4QtI2Gddgn4nFOu9fLuwglocS61b/B5hzl9KfveA
	Sn2w3VYb/C
X-Google-Smtp-Source: AGHT+IHOQ9XJ+rZD3dQggREyQ+jD13sux/LnawgxQEIfwW1Lji6WdgkHhvMziw8w9uYJOjJzdIDZqg==
X-Received: by 2002:a05:600c:4f15:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-47d19538dfbmr246193085e9.1.1766671345074;
        Thu, 25 Dec 2025 06:02:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm388573965e9.15.2025.12.25.06.02.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:02:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] smarty: patch CVE-2018-25047
Date: Thu, 25 Dec 2025 15:02:19 +0100
Message-ID: <20251225140223.3015168-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225140223.3015168-1-skandigraun@gmail.com>
References: <20251225140223.3015168-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 14:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122923

Details: https://nvd.nist.gov/vuln/detail/CVE-2018-25047

Pick the patch that resolved the issue referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../smarty/smarty/CVE-2018-25047.patch        | 140 ++++++++++++++++++
 .../recipes-support/smarty/smarty_4.1.1.bb    |   4 +-
 2 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/smarty/smarty/CVE-2018-25047.patch

diff --git a/meta-oe/recipes-support/smarty/smarty/CVE-2018-25047.patch b/meta-oe/recipes-support/smarty/smarty/CVE-2018-25047.patch
new file mode 100644
index 0000000000..caa48f8a4a
--- /dev/null
+++ b/meta-oe/recipes-support/smarty/smarty/CVE-2018-25047.patch
@@ -0,0 +1,140 @@
+From 5f26e728152007aa57e415a5e3dd77542739aa13 Mon Sep 17 00:00:00 2001
+From: Simon Wisselink <s.wisselink@iwink.nl>
+Date: Wed, 14 Sep 2022 11:38:18 +0200
+Subject: [PATCH] Applied appropriate javascript and html escaping in mailto
+ plugin to counter injection attacks Fixes #454
+
+CVE: CVE-2018-25047
+Upstream-Status: Backport [https://github.com/smarty-php/smarty/commit/55ea25d1f50f0406fb1ccedd212c527977793fc9]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libs/plugins/function.mailto.php              | 28 ++++++++++++-------
+ .../PluginFunctionMailtoTest.php              | 21 ++++++++++++--
+ 2 files changed, 37 insertions(+), 12 deletions(-)
+
+diff --git a/libs/plugins/function.mailto.php b/libs/plugins/function.mailto.php
+index 834d0535..671ac069 100644
+--- a/libs/plugins/function.mailto.php
++++ b/libs/plugins/function.mailto.php
+@@ -48,8 +48,13 @@
+  */
+ function smarty_function_mailto($params)
+ {
+-    static $_allowed_encoding =
+-        array('javascript' => true, 'javascript_charcode' => true, 'hex' => true, 'none' => true);
++    static $_allowed_encoding = [
++        'javascript' => true,
++        'javascript_charcode' => true,
++        'hex' => true,
++        'none' => true
++    ];
++
+     $extra = '';
+     if (empty($params[ 'address' ])) {
+         trigger_error("mailto: missing 'address' parameter", E_USER_WARNING);
+@@ -57,19 +62,19 @@ function smarty_function_mailto($params)
+     } else {
+         $address = $params[ 'address' ];
+     }
++
+     $text = $address;
++
+     // netscape and mozilla do not decode %40 (@) in BCC field (bug?)
+     // so, don't encode it.
+-    $search = array('%40', '%2C');
+-    $replace = array('@', ',');
+-    $mail_parms = array();
++    $mail_parms = [];
+     foreach ($params as $var => $value) {
+         switch ($var) {
+             case 'cc':
+             case 'bcc':
+             case 'followupto':
+                 if (!empty($value)) {
+-                    $mail_parms[] = $var . '=' . str_replace($search, $replace, rawurlencode($value));
++                    $mail_parms[] = $var . '=' . str_replace(['%40', '%2C'], ['@', ','], rawurlencode($value));
+                 }
+                 break;
+             case 'subject':
+@@ -83,6 +88,7 @@ function smarty_function_mailto($params)
+             default:
+         }
+     }
++
+     if ($mail_parms) {
+         $address .= '?' . join('&', $mail_parms);
+     }
+@@ -94,19 +100,21 @@ function smarty_function_mailto($params)
+         );
+         return;
+     }
++
++    $string = '<a href="mailto:' . htmlspecialchars($address, ENT_QUOTES | ENT_SUBSTITUTE | ENT_HTML401, Smarty::$_CHARSET) .
++        '" ' . $extra . '>' . htmlspecialchars($text, ENT_QUOTES | ENT_SUBSTITUTE | ENT_HTML401, Smarty::$_CHARSET) . '</a>';
++
+     if ($encode === 'javascript') {
+-	    $string = '<a href="mailto:' . $address . '" ' . $extra . '>' . $text . '</a>';
+         $js_encode = '';
+         for ($x = 0, $_length = strlen($string); $x < $_length; $x++) {
+             $js_encode .= '%' . bin2hex($string[ $x ]);
+         }
+         return '<script type="text/javascript">document.write(unescape(\'' . $js_encode . '\'))</script>';
+     } elseif ($encode === 'javascript_charcode') {
+-        $string = '<a href="mailto:' . $address . '" ' . $extra . '>' . $text . '</a>';
+         for ($x = 0, $_length = strlen($string); $x < $_length; $x++) {
+             $ord[] = ord($string[ $x ]);
+         }
+-	    return '<script type="text/javascript">document.write(String.fromCharCode(' . implode(',', $ord) . '))</script>';
++        return '<script type="text/javascript">document.write(String.fromCharCode(' . implode(',', $ord) . '))</script>';
+     } elseif ($encode === 'hex') {
+         preg_match('!^(.*)(\?.*)$!', $address, $match);
+         if (!empty($match[ 2 ])) {
+@@ -129,6 +137,6 @@ function smarty_function_mailto($params)
+         return '<a href="' . $mailto . $address_encode . '" ' . $extra . '>' . $text_encode . '</a>';
+     } else {
+         // no encoding
+-        return '<a href="mailto:' . $address . '" ' . $extra . '>' . $text . '</a>';
++        return $string;
+     }
+ }
+diff --git a/tests/UnitTests/TemplateSource/TagTests/PluginFunction/PluginFunctionMailtoTest.php b/tests/UnitTests/TemplateSource/TagTests/PluginFunction/PluginFunctionMailtoTest.php
+index bc5152a2..52b18ecc 100644
+--- a/tests/UnitTests/TemplateSource/TagTests/PluginFunction/PluginFunctionMailtoTest.php
++++ b/tests/UnitTests/TemplateSource/TagTests/PluginFunction/PluginFunctionMailtoTest.php
+@@ -150,7 +150,7 @@ class PluginFunctionMailtoTest extends PHPUnit_Smarty
+ 
+     public function testUmlauts()
+     {
+-        $result = '<a href="mailto:me+smtpext@example.com?cc=you@example.com,they@example.com&subject=h%C3%A4llo%20w%C3%B6rld" >me+smtpext@example.com</a>';
++        $result = '<a href="mailto:me+smtpext@example.com?cc=you@example.com,they@example.com&amp;subject=h%C3%A4llo%20w%C3%B6rld" >me+smtpext@example.com</a>';
+         $tpl = $this->smarty->createTemplate('eval:{mailto address="me+smtpext@example.com" cc="you@example.com,they@example.com" subject="hällo wörld"}');
+         $this->assertEquals(str_replace("\r", '', $result), $this->smarty->fetch($tpl));
+     }
+@@ -158,9 +158,26 @@ class PluginFunctionMailtoTest extends PHPUnit_Smarty
+     public function testUmlautsWithoutMbstring()
+     {
+         Smarty::$_MBSTRING = false;
+-        $result = '<a href="mailto:me+smtpext@example.com?cc=you@example.com,they@example.com&subject=h%C3%A4llo%20w%C3%B6rld" >me+smtpext@example.com</a>';
++        $result = '<a href="mailto:me+smtpext@example.com?cc=you@example.com,they@example.com&amp;subject=h%C3%A4llo%20w%C3%B6rld" >me+smtpext@example.com</a>';
+         $tpl = $this->smarty->createTemplate('eval:{mailto address="me+smtpext@example.com" cc="you@example.com,they@example.com" subject="hällo wörld"}');
+         $this->assertEquals(str_replace("\r", '', $result), $this->smarty->fetch($tpl));
+         Smarty::$_MBSTRING = true;
+     }
++
++	public function testJavascriptChars()
++	{
++		$result = '<script type="text/javascript">document.write(unescape(\'%3c%61%20%68%72%65%66%3d%22%6d%61%69%6c%74%6f%3a%6d%65%40%65%78%61%6d%70%6c%65%2e%63%6f%6d%26%71%75%6f%74%3b%26%67%74%3b%6d%65%40%65%78%61%6d%70%6c%65%2e%63%6f%6d%26%23%30%33%39%3b%29%3b%20%61%6c%65%72%74%28%26%71%75%6f%74%3b%69%6e%6a%65%63%74%69%6f%6e%26%71%75%6f%74%3b%29%3b%20%2f%2f%22%20%3e%6d%65%40%65%78%61%6d%70%6c%65%2e%63%6f%6d%26%71%75%6f%74%3b%26%67%74%3b%6d%65%40%65%78%61%6d%70%6c%65%2e%63%6f%6d%26%23%30%33%39%3b%29%3b%20%61%6c%65%72%74%28%26%71%75%6f%74%3b%69%6e%6a%65%63%74%69%6f%6e%26%71%75%6f%74%3b%29%3b%20%2f%2f%3c%2f%61%3e\'))</script>';
++		$this->smarty->assign('address', 'me@example.com">me@example.com\'); alert("injection"); //');
++		$tpl = $this->smarty->createTemplate('eval:{mailto address=$address encode=javascript}');
++		$this->assertEquals(str_replace("\r", '', $result), $this->smarty->fetch($tpl));
++	}
++
++	public function testHtmlChars()
++	{
++		$result = '<a href="mailto:me@example.com&quot;&gt;&lt;h1&gt;" class="email">me@example.com&quot;&gt;&lt;h1&gt;</a>';
++		$this->smarty->assign('address', 'me@example.com"><h1>');
++		$tpl = $this->smarty->createTemplate('eval:{mailto address=$address extra=\'class="email"\'}');
++		$this->assertEquals(str_replace("\r", '', $result), $this->smarty->fetch($tpl));
++	}
++
+ }
diff --git a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
index df441e8db2..382f0f415c 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 DEPENDS += "php"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master \
+           file://CVE-2018-25047.patch \
+           "
 
 SRCREV = "71036be8be02bf93735c47b0b745f722efbc729f"
 

