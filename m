Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8217.1795739723062634087
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BNddgH4K;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385d8a00598so10997294eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739722; x=1796344522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5t6Y5ZWbIzBh4t0Dl4rg+uk4//9qLUzQs9g4NsPtbA=;
        b=BNddgH4K/Q3bolVm4aURbr6IVZPLZF9q8EYaVlfne+5yXhg4vEI7PaiC3TQoYtnCac
         7Byt33MoV/icReQbqsIrH5s5V/663wp1n3iLAdukkDrPm/lKAXIPU5+5xyP5L6hl9a6c
         8Nl3VwyCswir2nxEkrb9R9ViKvoQmwM9cOu9Q8rZ2X7+y8LxIpBaxSMn4G5ym34QD/G4
         iVpmURZ6ft7fxW2zEPohjImwtpipEOslGU06JtsVj9QqOSmsPAn5PNnqgLrb8ChOJvOO
         S/b0DsvAoW2bEaAvzSsdVAk/Q7KyTwxYjf8cFXzlwLcZOxvUbpuf3HauYIpSO47g5dF7
         LC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739722; x=1796344522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5t6Y5ZWbIzBh4t0Dl4rg+uk4//9qLUzQs9g4NsPtbA=;
        b=CVEaJeGxOSdabrCdAxFwXIwzXSb0P9b/DH7oHozrr/iJSKIltQKplYEAork93lHt53
         3m8DgsL9blo+v8T7H2qvkgxLpP/G7B/BM1oD0cC9v80eL9tU52Iu+c0bDWW4QEVIvkeR
         XUKpsqBATPHDRvqDuTJAQZp3CcaOeZ+UtwnXxfqd6AGGqvo4h7aZbnc59g+jdVbYRrYV
         UBwuiG7FuCWHUt1BLAfwD8B4pLBCyKLoCFQMWPPwuFTtsvfhZAMnFrL0b8psEwVr7lzK
         JdU2R7mBw4TxKPDmSREJzt5wdjgs8GhfLKHoSwgTB4AqT3SoekS7V2My913K2dxIp6sb
         Bngw==
X-Gm-Message-State: APuU4Z9BH3WmpZWIYhi8bIC51NwTposJC6h3QHe+GujPkzUS9ECmuIDL
	YZ7U6zbGsIl+q3yntvn9qg0lAfNBk4AhHXjq93bdjCNCaSfYfwzrAHMJxhFo+yzE
X-Gm-Gg: AZFdTZdX86oCiTae2MnAoe14oN2nBXU4f1v0mDT3PAjuE7PzCxhCL4pnjSySbqWKEVg
	4sy+ttGIHRCH17+qMjWB3GIKCvzq4ASrwaK4D2FX2jpeGc1BrkiQEuKGW5IFrIFb6BQNqVZ48bh
	qYJgZBWObw59yp+BvVksUE1EKyRKz9ww7kyaPozScb5K7OP++k+BvAK8M1mUjRtFwKB+M1ohXnM
	qCo3rYFbvng+Lzlzh3hzKWvUL6RIY+J5BEIw4yDeAAtpsIIL7ubE1lcvvSjOE0inaCj4Zr0CVDA
	Bb/rwYrhichbHJFpo728x25kEOyBw4g0gGh9s6AaPSkJTshy8OWFM02tnozZcNmOomP6BaB1CRk
	GJbmXWNrlLVhnanSzb1SCBodjdAyTc+smmgMQZYsVBs9cJFQxx/IctG+2ovGChAxuBuO0jl0fXT
	klc9n5AFT/7JkK8nE0ji0J/LJzlkGj//QtQ9HpS+rTSnoghjOpUfIWH/xNtuTj9DHITwT04fk95
	vuTjlV8Ys9vZs/MttybmGLiI/yhioX/Jf4MV/n7oClX9Y+WhmOJzhXRxrKWlNXW2raj+q4erVXn
	fqymGFA6QwJ9mBPgBA9IJBZCDDAPc+3pR7+be0FSLrKPqpEqXUjtu3VKEknnNXT/V6D3L8Cyj4t
	wYWJo1pEvzFoDjVG/1NHNZ4IRaslpSoRWCW5Hn/Qv7VvPMwbJQkmLGHXayzlNjHuQylgXjAACRn
	Lv9u7+BWxXrGKVjWeS0S/ClSid9ciZHkz/yrULQKq2NO6kg0vS+KJwjiXL9Vh3Nje9iGRJPpZwk
	Udj6o/YE3vfDUoVdv1uczcU33J0vkGEBwU/Y4rC5STZLpuDfV/jTF19ht6fD8bn15MNW/fdYDQo
	jTgY
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr20280984eec.37.1795739722407;
        Thu, 26 Nov 2026 16:35:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 50/69] exiv2: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:06 -0800
Message-ID: <20261127003425.2166632-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133150
Content-Type: text/plain; charset="utf-8"

The default tag regex matched the digit in test tags such as testIPO_3
and reported 3. Only consider v<version> release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb
index e2387eaeca..287007b3dc 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.9.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x;tag=v${
            file://0001-Allow-test-data-path-configuration.patch \
            "
 SRCREV = "b0859fc61fea5dedfc898aece6b15893ddf4314e"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake gettext ptest
 
