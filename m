Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0638ECD585A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:33:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3833.1767785626311574612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0hkADLu;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso9143835e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767785625; x=1768390425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hh9VeUa4eSSxc0mlEOwiRCqbb36Y3QNhdDYNLM5K9Y=;
        b=U0hkADLubLyb94uJV9xjOa9o9WlQAruwB9kd1B21d/EdCkn4psIvZjyUorx8vTzx9z
         100m8Y9itaYnTiCWNaFx//KMpEzGI2CWpSwGhdYtM6M84ycT5YX67N55vvH+fR9hU7kz
         xfbdgy8/S+dvqGicKe86Oe/czSHVq+3m3SU/zPP5ufgYIQ4lngoA1CL8zgnrk7aM7tkh
         RXGPvBISfb3rW7MPkvDezVfbIhth5Ouvsfv59rjzDdowFx28EApqbQtWRQW7kyKnwMJa
         xwaW9juVL0gUF5Ul/cU0FqkCpwx1S2UxZP3Jh0vzu91zczWPAOf7PeNzm4NpK/TltRgp
         /csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767785625; x=1768390425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hh9VeUa4eSSxc0mlEOwiRCqbb36Y3QNhdDYNLM5K9Y=;
        b=wuoqloGms3OTcfIZx3qe1TUiKfNsqpxMQT5nmv6pZAZ898gMc6hn2j/Ha+DLTGmUrk
         dwrHmIcYACANJzmLuq7SCIAeXUET4A1NBXvR7INWT9Bb8Gz7BA+GB+j1gej59DkLDQXC
         BJCVd9+MPzTGY65c1xAliUQ1AnJjnwKdBVZpDEvNQCluRgl07tAo/wfGQlbTudlcb0UX
         in1QUzvE1o8rDqTCYsbr2PyRnQK6np7ImHO5ye1YQbjNwLcLs32S1mexQm4tpkML+jwr
         tm8D+YYtd4aQPxod9Ce7OlbNAMWo6W5XQvAYzwqNTZB7R7q+uqz0EwU7Dn2JX9jzo63H
         43Iw==
X-Gm-Message-State: AOJu0YwZb94eNXUo4E5AfJUn3manfSYg7nz0lFnCv8PlpFLGLwPz3kvW
	EsnVEVWvKjD0iWcz3oSKjTLR7pDznNOTLYAWdqvXP6+IqxA7rYNyomMO6hPOVw==
X-Gm-Gg: AY/fxX5up4iIvkpSK6OOke7SbL+61bCtp3pBzNcEjsJKbWnglE5cJsqScv5GaVSGVxv
	PaQjzyQxvfcAnhFpDg+0QcfYSwTrxejC/u4ejpaBjqDrXfcnlVRE/fkP452PrzMGI+TNfzABE7/
	dmKYRfX3VYjp1Ovr/nhZER7Wo+5/hCggI9PFfy5+9pj3escIPxTsNhDjVsmfwFsmSrmm2RyzrXT
	jcOzsSQpMkUS2krTVNbQ8d7cWaVeh76sxJrNqyidgsAp6/m1GYhpADYcEo5K8MwWCIt1M/1YHr/
	okpE5S7LnRmrLJl0vt32tOLr+xNcvIobjGEgylG131INQ+13b6gQf+30Fl5nd9BQRpq8guoXFGv
	F+7ON93VslUIPMr5r0REZtVS9s16Y3m4a0gf1VsKHKdSIQmYKX9/1NaxITtx5ehtAglcYrS9OY8
	tnM3tyENrF
X-Google-Smtp-Source: AGHT+IFtazUGUdB2F2HxsSdwU5L01xmjKEX5r3B7aLuCno/rQaymDwannh+SObl3vpo/iqo32pYFgg==
X-Received: by 2002:a05:600c:4ed3:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47d84b34785mr27528075e9.21.1767785624476;
        Wed, 07 Jan 2026 03:33:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe67csm9560266f8f.40.2026.01.07.03.33.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:33:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-m2crypto: ignore CVE-2009-0127
Date: Wed,  7 Jan 2026 12:33:42 +0100
Message-ID: <20260107113343.2238185-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 11:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123223

Details: https://nvd.nist.gov/vuln/detail/CVE-2009-0127

The vulnerability is disputed[1] by upstream:
"There is no vulnerability in M2Crypto. Nowhere in the functions
are the return values of OpenSSL functions interpreted incorrectly.
The functions provide an interface to their users that may be
considered confusing, but is not incorrect, nor it is a vulnerability."

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2009-0127

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index 9aac7b344f..efb6c79fa7 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -12,6 +12,8 @@ SRC_URI += " \
           file://0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch \
 "
 
+CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
+
 inherit pypi siteinfo python_setuptools_build_meta
 
 DEPENDS += "openssl swig-native"

