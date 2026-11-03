Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7976.1793701469778364383
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rNT1W8De;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2002777f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701468; x=1794306268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ICSmvQYHkZREfgbe6GySFzeXHhQ21WI8uvTSsZajFA=;
        b=rNT1W8DesaO/+SINCD2aI8o2g5aWp2PTGCnY/A+d+PnNnN4B23fAGsFREEGnpWolfl
         Ov2zkMz1OATpVC2j3T6Unx2BqUGQBNVLKOlrxBsXA4oN1r2AELQmkkIAaDpy+PjZv/OG
         z2WBz6H8ZZsmbr5jkCO/MZHbqHss9qEUdoXg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701468; x=1794306268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ICSmvQYHkZREfgbe6GySFzeXHhQ21WI8uvTSsZajFA=;
        b=Jz+2mCDuXdIdmrtCR3WXi0BXBafRQaZhGE4f5jaaXvwLTAkWOBi2Ha7WJur6tcXylU
         1Z6XcMjgeS8VZxq65Actum5eQdUCEP3N2dJ5xxojhIseFoLG++ovfBTQRff2gPWtDC+9
         x7vPGvg+u8t8Z3RRdV+dbG41Ul9MpzqvEdzqATleYtKrpivwJ2oPWfZpLI912oi97ncd
         jSd/ppmoHgs6oYY0e1abEgx6G8aTd2Zga2GCygfWD2a/Td0xn6UGe/tS/xrV4VrenblB
         ryb2z6/mIa4iFVahbUS/r4XUf8fTyeA1u/3El17yOda0gxLvuoLbSxTb3oJ1+DAbxL0O
         4J9g==
X-Gm-Message-State: APuU4Z/nlLoVf6ztBgZcHFH9lWhO7j5CJf5iRUH2ARwRGVRIOhCu4L4K
	iZ/2a/MqubuN3YcEsobwbaoi37zra2EALCV1oDG9xJMzLzK6s8pHRHwBqBgsFmKHUFzhraEAmkE
	bjLzu
X-Gm-Gg: AYBFou33OLras3g26F7wAcpUQZesvDumnyTxw9OmA9qWhZZc5GnH3qUPOG92CkJKGJg
	K+Fa/ZizdcPJl/B2AdcJICVQz8ps1TqXYD3pB1LihnMzWL1n+Fj1s7+iR27s5QZhYhn1waE9N0l
	c71Vr95E7xh8yn1mnPPp2LIKf8ZfpvrKESfiVhuxtWjJe6obgqdkiVyl8044TWTJYSt+vFT00Cb
	sH0bZCSBAZC1bnB9uiVLBxDg+tNLVb7wflRsKcIQQOcutjekOWb2NPufb2hhOrM49voLv/1TwBl
	DCRU/gqVBua4J/zdkruvf1rcsogssIVDQJfUmOUWTTLNIj6vaofm7S08qw2aC1l4laOdw7THYZE
	0b82KbH5a3MYULD8W5KaiT4yvMBkd9WE3vOr6aNdZYOSZMftCMRUQZj0kCl4h4H+TwL045I8JGP
	0hXiy7oW7tmeVm98j1mWNCM9FQDq63sIS9Saehez5b1EfasWdQRc0xTJviPu/20PfyGlu1om1CJ
	ZAvWINO6mMCjY16UAmA/4L9y0sk3lcqaBvld3Vj4A/vQQ3FKVveT6Bx1xs+Ly6TgsJs0DkqKg/T
	Li8d3T0alv8hthBZL1Ad6R+Vlzvj8remTb50YZseMzvgG/jJsjH+5SVtdBCdRkyRJ2DbvI2B/gY
	CYk2U6xSihvzYXQv0kLePfJJD/WHygYDXyYDSVOnwdg7l+Ozz4dbbQQ==
X-Received: by 2002:a05:600c:138c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ac1765d3e8mr284975615e9.19.1793701468046;
        Tue, 03 Nov 2026 02:24:28 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:27 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 19/22] python3-twisted: Upgrade 26.4.0 -> 26.10.0
Date: Tue,  3 Nov 2026 12:23:47 +0200
Message-ID: <20261103102350.1952237-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131782
Content-Type: text/plain; charset="utf-8"

Upgrade to release 26.10.0:

Security fixes:

- CVE-2026-83813 (GHSA-jj36-9pvh-vj5r)
- CVE-2023-44487 (GHSA-vpp8-g58w-m8mp)
- CVE-2026-115778 (GHSA-cwm5-jh59-mwxr)
- CVE-2026-115775 (GHSA-3476-c5c2-fr73)
- CVE-2026-115877 (GHSA-q7qq-6mhp-9rc4)
- CVE-2026-115774 (GHSA-2qrf-pqgx-qh9v)
- CVE-2026-115776 (GHSA-53xc-49m8-p798)

Features:

- It is now possible to set the SO_REUSEPORT and SO_REUSEADDR TCP
  socket flags from user code.
- Python 3.14 is now supported.
- twisted.internet.defer.Deferred.__iter__, used when awaiting a
  Deferred, is now about 2-3% faster.

Bugfixes:

- twisted.internet.tcp.Port.startListening() now closes the socket
  when raising CannotListenError.
- Initiating a TCP connection with an address literals and a port
  outside of the 1-65535 range in twisted.internet.tcp.BaseClient
  and twisted.internet.iocpreactor.tcp.Client now triggers an
  errback instead of an unhandled error. This change might also fix
  other unhandled errors occurred while connecting using address
  literals.
- twisted.logger.LoggingFile.fileno now raises
  io.UnsupportedOperation instead of returning -1. This fixes an
  interoperability issue with multiprocessing.
- twistd now exits with a non-zero status when given an unknown
  subcommand.
- twisted.internet.testing.MemoryReactor.removeAll() now returns
  what was removed to comply with IReactorFDSet.removeAll()

- twisted.internet.asyncioreactor.AsyncioSelectorReactor.callLater
  now has the same signature as
  twisted.internet.interfaces.IReactorTime.callLater.
  twisted.internet.asyncioreactor.AsyncioSelectorReactor.callFromThread
  now has the same signature as
  twisted.internet.interfaces.IReactorFromThreads.callFromThread.

- twisted.protocols.ftp.FTPClient now uses ip address of the
  original ftp server to open passive data connections by default,
  instead of trusting PASV responses.

Improved Documentation:

- The "Writing Servers" and "UDP Networking" documentation pages
  have been updated to remove obsolete references to persisting the
  reactor (a feature gone from Twisted for several decades now),
  and to better explain the factory and protocol setup and teardown
  lifecycle.
- Twisted's policy documentation now includes a prominently
  featured, clear explanation of our AI policy: to wit, including
  the outputs of generative AI systems is forbidden.

Deprecations and Removals:

- twisted.internet.tcp.Connection no longer supports returning a
  non-None value from a protocol's dataReceived method, deprecated
  since Twisted 11.0.0.
- twisted.internet.error.PotentialZombieWarning, deprecated since
  Twisted 10.0, has been removed.
- Implementations of twisted.internet.interfaces.IProcessProtocol
  are now required to provide a processExited method. Omitting this
  method was deprecated in Twisted 8.2.
- twisted.internet.ssl.protocolNegotiationMechanisms and
  twisted.internet.ssl.ProtocolNegotiationSupport are deprecated
  because all supported TLS backends provide ALPN. Callers can
  configure ALPN without checking for support.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-twisted_26.4.0.bb => python3-twisted_26.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_26.4.0.bb => python3-twisted_26.10.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb b/meta-python/recipes-devtools/python/python3-twisted_26.10.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_26.10.0.bb
index c294bd2933..8bb22df096 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_26.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_26.10.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://twisted.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ff950f7bafa004a86f478dc9eaf8106f"
 
-SRC_URI[sha256sum] = "dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9"
+SRC_URI[sha256sum] = "5f0355403e507fc23ceea85e9dbb4bc59335aabde41dd324e8b8cea180dd38de"
 
 CVE_PRODUCT = "twisted:twisted"
 
-- 
2.47.3

