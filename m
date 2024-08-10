Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6285EC3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:40:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7872.1723304407319663099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KB6S0wNC;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso20256585e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723304405; x=1723909205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=un8CVeDDgxs7y36GlI+dJhTzG3aFeb/mAGl6JdIbogY=;
        b=KB6S0wNCTbzZmT4qOk91efuHZVRpN2XCOlIdW2BtQ0JxoUdzh8hb8B/0E65WyFKJk9
         /Nty0BP6B0uti153aLexPt4ONfZc9IvxwACHvZVRDrPtAnzY9P5DlcHanRRsHqu3pTR/
         Ez+777mUu5mvhl1jdgCBCRUq/3ue3bdhydmb6FM0BlQzoC5rirXbTD5Ze4bKi0cp9AgL
         MtnS9ogf0ofp11FgImbBnPqpUMAaviU5Iq6Ugbv0qdHAELqRhRBTUfIasbYZRqaQ9KDe
         zTCAntkznHp5RlX2qWIQ0fhZ07JPL3kYnAEKJRiyCeiBJKTVjFdxbSF9HNtAeJJvh2Sz
         79Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723304405; x=1723909205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=un8CVeDDgxs7y36GlI+dJhTzG3aFeb/mAGl6JdIbogY=;
        b=xMAOt7uP0PANXrw0gsCpSno1vFXEXW9LIrK+UHrk/OSUMVXNC3qUepz213vLoI3rN4
         csU7UVk5+EIkh9w8l8KUxdA1ws9tBFXOh6B5XkKBpwPM0DdJruSgR1OB4kTw1V5ODU0l
         ISg6m0GZmiooBLAZnbdKEsCfNg0vK5RCP/bxGxW0f92wjZ8ylxqxZ9uraLe0Z0AWN86z
         nIRk00eX3cfF9HpsBcsYP/luL5E3yjQXdVUykEa1lBLPB+0MGLIz8jyi7fFCRGSV9KPT
         qXaWjooI6mrkwlscQBvdHY5x8L7PpSaM7pClMEEQHMRTD1/OfyklTvKpeRPT3DWe8Ryr
         IMwQ==
X-Gm-Message-State: AOJu0YzADb6l+qVEfK8efVvDVzCbzRnQx9Uc9pqQFoZKo09hfXzXRp81
	uJtOcAGONZ67yFdreapjhSV3b6oarI3ZS7be307Dsl9JOPTV1ecKetkqEA==
X-Google-Smtp-Source: AGHT+IHKsuK8tRpDlbGa7TUBwSi0Xr4o6tTJXjMC4vDDTweGTxvTzH/kqI2dJWIEq44l0sy9WP7Z4w==
X-Received: by 2002:a05:600c:a41:b0:428:d83:eb6b with SMTP id 5b1f17b1804b1-429c3a1a133mr40442805e9.15.1723304404738;
        Sat, 10 Aug 2024 08:40:04 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c77372dbsm34099435e9.38.2024.08.10.08.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 08:40:04 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [meta-python][PATCH] python3-twisted: upgrade 24.3.0 -> 24.7.0
Date: Sat, 10 Aug 2024 15:39:49 +0000
Message-Id: <20240810153949.3671-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111750

Changelog:

Twisted 24.7.0 (2024-08-08)
===========================

24.7.0.rc2 fixed an unreleased regression caused by PR 12109. (#12279)
No other changes since 24.7.0.rc2

Security Advisories
-------------------
- twisted.web.util.redirectTo now HTML-escapes the provided URL in the fallback response body it returns (GHSA-cf56-g6w6-pqq2, CVE-2024-41810). (#9839)
- The HTTP 1.0 and 1.1 server provided by twisted.web could process pipelined HTTP requests out-of-order, possibly resulting in information disclosure (CVE-2024-41671/GHSA-c8m8-j448-xjx7) (#12248)

Features
--------
- twisted.protocols.ftp now supports the IPv6 extensions defined in RFC 2428. (#9645)
- twisted.internet.defer.inlineCallbacks can now yield a coroutine. (#9972)
- twisted.python._shellcomp.ZshArgumentsGenerator was updated for Python 3.13. (#12065)
- twisted.web.wsgi request environment now contains the peer port number as `REMOTE_PORT`. (#12096)
- twisted.internet.defer.Deferred.callback() and twisted.internet.defer.Deferred.addCallbacks() no longer use `assert` to check the type of the arguments. You should now use type checking to validate your code. These changes were done to reduce the CPU usage. (#12122)
- Added two new methods, twisted.logger.Logger.failuresHandled and twisted.logger.Logger.failureHandler, which allow for more concise and convenient handling of exceptions when dispatching out to application code.  The former can arbitrarily customize failure handling at the call site, and the latter can be used for performance-sensitive cases where no additional information needs to be logged. (#12188)
- twisted.internet.defer.Deferred.addCallback now runs about 10% faster. (#12223)
- twisted.internet.defer.Deferred error handling is now faster, taking 40% less time to run. (#12227)

Bugfixes
--------
- twisted.internet.ssl.Certificate.__repr__ can now handle certificates without a common name (CN) in the certificate itself or the signing CA. (#5851)
- Type annotations have been added to twisted.conch.interfaces.IKnownHostEntry and its implementations, twisted.conch.client.knownhosts.PlainHost and twisted.conch.client.knownhosts.HashedHost, correcting a variety of type confusion issues throughout the conch client code. (#9713)
- twisted.python.failure.Failure once again utilizes the custom pickling logic it used to in the past. (#12112)
- twisted.conch.client.knownhosts.KnownHostsFile.verifyHostKey no longer logs an exception when automatically adding an IP address host key, which means the interactive `conch` command-line no longer will either. (#12141)

Improved Documentation
----------------------
- The IRC server example found in the documentation was updated for readability. (#12097)
- Remove contextvars from list of optional dependencies. (#12128)
- The documentation for installing Twisted was moved into a single page. (#12145)
- The project's compatibility policy now clearly indicates that the GitHub Actions test matrix defines the supported platforms. (#12167)
- Updated imap4client.py example, it no longer references Python 2. (#12252)

Deprecations and Removals
-------------------------
- twisted.internet.defer.returnValue has been deprecated. You can replace it with the standard `return` statement. (#9930)
- The `twisted-iocpsupport` is no longer a hard dependency on Windows.
  The IOCP support is now installed together with the other Windows soft
  dependencies via `twisted[windows-platform]`. (#11893)
- twisted.python.deprecate helper function will now always strip whitespaces from the docstrings.
  This is done to have the same behaviour as with Python 3.13. (#12063)
- twisted.conch.manhole.ManholeInterpreter.write, twisted.conch.manhole.ManholeInterpreter.addOutput, twisted.mail.imap4.IMAP4Server.sendUntaggedResponse `async` argument, deprecated since 18.9.0, has been removed. (#12130)
- twisted.web.soap was removed.
  The SOAP support was already broken, for at least the last 4 years.
  The SOAP support in Twisted has no active maintainer. (#12146)

Misc
----
- #11744, #11771, #12113, #12154, #12169, #12179, #12193, #12195, #12197, #12215, #12221, #12243, #12249, #12254, #12259, #12669

Conch
-----

Bugfixes
~~~~~~~~
- twisted.conch.insults.window.Widget.functionKeyReceived now dispatches functional key events to corresponding `func_KEYNAME` methods, where `KEYNAME` can be `F1`, `F2`, `HOME`, `UP_ARROW` etc. This is a regression introduced with #8214 in Twisted 16.5.0, where events changed from `const` objects to bytestrings in square brackets like `[F1]`. (#12046)

Web
---

Features
~~~~~~~~
- twisted.web.agent.Agent now allows duplicate Content-Length headers having the same value, per RFC 9110 section 8.6. It is otherwise more strict when parsing Content-Length header values. (#9064)
- twisted.web.client.HTTPConnectionPool used by HTTP clients now runs faster by using a little less CPU. (#12108)
- twisted.web.http_headers now uses less CPU, making a small HTTP client request 10% faster or so. (#12116)
- twisted.web's HTTP/1.1 server now runs a little faster, with about 10% lower CPU overhead. (#12133)
- twisted.web's HTTP 1.1 server is an additional 5% faster. (#12155)

Bugfixes
~~~~~~~~
- twisted.web.http.IM_A_TEAPOT was added and returns `I'm a teapot`
  as default message for the status code 418,
  as defined in RFC 2324 section 2.3.2. (#12104)
- The HTTP 1.0/1.1 server provided by twisted.web is now more picky about the first line of a request, improving compliance with RFC 9112. (#12233)
- The HTTP 1.0/1.1 server provided by twisted.web now constraints the character set of HTTP header names, improving compliance with RFC 9110. (#12235)

Improved Documentation
~~~~~~~~~~~~~~~~~~~~~~
- Fix ReverseProxyResource example in developer guide. (#12152)

Deprecations and Removals
~~~~~~~~~~~~~~~~~~~~~~~~~
- twisted.web.util.ChildRedirector, which has never worked on Python 3, has been removed. (#9591)
- ``twisted.web.http.Request.setResponseCode()`` no longer validates the types of inputs; we encourage you to use a type checker like mypy to catch these sort of errors. The long-deprecated ``twisted.web.server.string_date_time()`` and ``twisted.web.server.date_time_string()`` APIs were removed altogether. (#12133)
- twisted.web.http.HTTPClient is now deprecated in favor of twisted.web.client.Agent (#12158)

Misc
~~~~
- #12098, #12194, #12200, #12241, #12257

Mail
----
No significant changes.

Words
-----
No significant changes.

Names
-----
No significant changes.

Trial
-----
No significant changes.

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 .../{python3-twisted_24.3.0.bb => python3-twisted_24.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_24.3.0.bb => python3-twisted_24.7.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
index 336c17389..af95996d5 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.7.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://twisted.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c1c5d2c2493b848f83864bdedd67bbf5"
 
-SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"
+SRC_URI[sha256sum] = "5a60147f044187a127ec7da96d170d49bcce50c6fd36f594e60f4587eff4d394"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


