Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2226C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:05:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.173945.1783429508112088054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OC3LTUnV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47dec32798aso473357f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783429506; x=1784034306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo0S3t4fslDA69ZdTjflHi/7g4tr8TzWhXIOyhkJl9c=;
        b=OC3LTUnVgho6/+Pt+c7RihR/7ArVUtXUasQMHpG5r7nhO/lrHxuUEQGl7JO/yGxPWG
         Uy1DX5sCwEWg663CBM4L5j/60tNGn659a5GKqVju2znQ8NVajy7QXqSQKcFs6taNUbt2
         16d4umVoJ1JvhWaVAC6KaKd8ZEuZObEAb5JPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429506; x=1784034306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jo0S3t4fslDA69ZdTjflHi/7g4tr8TzWhXIOyhkJl9c=;
        b=go3PT1x1EpU+jbxJyvawrMW47jnseK7pMw6tdUfITzaE1nsB2ufpfLmj2zJgWYQwZQ
         ob3IQJCZSCNhVNsZ5wcH1W+nlFdLjieek+cq51UqC+x6St3EdYnJKPdGOAfwNqnxcjAJ
         BTxnD/aT1OS5iZHEnxDlk/UGyyGdJpY5lX1L3BB3zxxJAoCwOnonsTIQdCsaohcsbQaH
         7JkznSsrayEfioBn5i13kCZ2fd7ffqfLNyT9RZkn4OWfSDb1E1guB8O1G0imdbPT7GZW
         xmTV+bha1LQQqqLWwImgyJhtlFgm6X0jtcfnpSE4b0T/hMBQ5bqorXgxuEC9yVLDsoxg
         537g==
X-Gm-Message-State: AOJu0YzmexXAQbpKPVPaj+kuDhI/XxByptbRVP4v61xaarJebV+R7dSo
	z1zzJ08DJXIU/pBSi2gDyFKJkRcYqvan66WLpAlVHbIybxWfzZVbjTvN8gUrKQAw0C6csrzwdCn
	hgKXY
X-Gm-Gg: AfdE7clBugo96Udo7tKcWJ2us4xnQ0StkP6+kKTVhPo5uJcn48FQ8fdOtsFV1+vLAVU
	MFvbUN2IwsSsbN7t9pZyguftTS7a8Ac029NJqB8eXnY7sVWoi1dOKvwbWrfFOQs/ZmWZPX72II0
	Mwr+pjJVvQxD6uVmeAkxPmx35PTrOpgMDINo8rjPsvIGwXZUndVrZiEwxLLe1g0mNx1+DcCch0p
	kYKrEXysYObGKOKAUp9/rskbTj/xgQz29z08z9TifVZB60Zxm4vE763OT66rA1g1k8D0BCVeuHN
	o6ylY4vK3K5Cm2J8Zwo9GAWXZy9rBhT9ssMbjqkJmmJ5ZdwucaaykblakO5uIMFYIwYtV8Y2rlT
	9s3UMZsz4n5s2enw7GGAWkTQqrbMHaC9EEedrjoXWCJv6WVaPp1LyGExFavV1fRw0O5w3QZ+W+n
	g3ypzSJnIRFZU5GDW0uMS0pbXjRVLZQTjJem8ovXXexQnn25txddBZfnAE1+RN87HHW6hViCxVn
	eu4A59ZyZ5x1dEsBOWr8QVix5MsbEeGHXyD37X9sA==
X-Received: by 2002:a05:6000:1aca:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-47de660346bmr5896002f8f.9.1783429506139;
        Tue, 07 Jul 2026 06:05:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm33986385f8f.3.2026.07.07.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:05:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-pycurl: Upgrade 7.46.0 -> 7.47.0
Date: Tue,  7 Jul 2026 16:04:58 +0300
Message-ID: <20260707130500.888218-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260707130500.888218-1-leon.anavi@konsulko.com>
References: <20260707130500.888218-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128062

Upgrade to release 7.47.0:

- Use dynamic SSL ports in certificate tests
- Harden test_clear_assignment_inside_socket_callback_resets_socketp
  test
- Rename index field to idx in HstsIndex to avoid shadowing
- Fix test_callbacks_non_minus_one_return_continues_transfer on macOS
- Use PYCURL_REQUIRE_HANDLE and PYCURL_REQUIRE_NOT_RUNNING instead of
  magic numbers
- Convert pycurl to a Python package with the C extension renamed to
  pycurl._pycurl
- Fix flaky CONNECT_ONLY send/recv tests by waiting on active socket
  readiness instead of sleeping after EAGAIN
- Add PyMutex support on Python 3.13+
- Modernize ssh_key_cb_test and use a local SFTP server
- Use set instead of dict for saving refs to easy objects in multi
- Make closed as property instead a method
- Add free-threaded CPython support
- Add AsyncCurlMulti
- Fix flaky memory_mgmt callback
- Add libcurl strerror wrappers (easy/multi/share/url)
- Modernize write/header tests
- Implement Curl multi notify API
- Pin socket callback tests to IPv4 to handle dual-stack localhost
  resolution
- Integrate notify in AsyncCurlMulti
- Review GIL management
- Capture more expected warnings during tests
- Fix/update/remove some examples
- Fix truncated timeout value in multi timer callback
- Fix incorrect argument type in debug callback
- Fix some reference leaks
- Ensure errors are logged in progress/xferinfo callbacks
- Support zero-copy write/header callbacks
- Evolve CurlShare with share()/unshare(), Python-level thread safety,
  and CURLSHcode error propagation
- Fix test_default_mode_autopongs_server_ping with libcurl 8.21.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pycurl_7.46.0.bb => python3-pycurl_7.47.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.46.0.bb => python3-pycurl_7.47.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
index fa98ad1e03..7259957174 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.47.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "422ed7005b98768fe60fe6b6cb8bb6a4e1fc18b5433402e8fbdaba91811c4604"
+SRC_URI[sha256sum] = "5e3cf357939da8d4ceefe3c7f305afcf9b47cba66cfd95e7768ca43b38445e14"
 
 DEPENDS = "curl"
 
-- 
2.47.3


