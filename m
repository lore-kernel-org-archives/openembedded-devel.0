Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11.1794324460981245743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FjrodQE7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so25196845e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324459; x=1794929259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLtb78wLXY3+FPQjY5NebE7ZEHk93LnYxCVQocB7aog=;
        b=FjrodQE7mNSlnUHm+qnEYQ+yhxL1yovtiZmvPk4um1b3YDC4N0UtBJXqWBFNxC6wV4
         mJAhLTdLTEPreemL5n+t77H7ZqgnwQVjJsWfS1clm1PpMFRWwKvxtqLBQ7GeFzJwVMfr
         UXdO04G0oSFwlpnW1GQCROgsAXhmtkmmsIZ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324459; x=1794929259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLtb78wLXY3+FPQjY5NebE7ZEHk93LnYxCVQocB7aog=;
        b=LkNSSXsdTWMvfZAwXOwkXVURKKHcdvJuEZGa1Dp/rAJwkM7UymR1hXQ0PIMF3uOIja
         12vq/BdIpScF6l4Cbf0Gn0rYXrBOW5iBHLA2J5uGwhw0oS4Rh8G1FkZj9MhWjtosGhPD
         4ue2egISeZbmTmwtfjphZ0TpYmnkXK1DoDgyLvVHBJG8hF5fgjI8GjD0YVo6npen9SLy
         bAo+o4m0liiogPfrGV/R7ypO/1DPBgU1LUzZ3rDb5EemzMg8vqvyUgXxQNnhqpEOIe8n
         vYnEAs0T1xRWcjYDp7/9XBMkRsU3ggHP2k7c2FpC9/qQreywDhWKVVbGVA0TlqO5d7yH
         q6kA==
X-Gm-Message-State: APuU4Z9I1B+yaYpVRCJUdyOUY+fSr7Puh9P3No9g+bsPSqQ3oMClqVVV
	C1xeVZHf9q8q4ZAsJ6++/IAJtkZ3ScIv2h3fHkd8wM0BxCNR6N+gXn+9br0sTH/6wHIQuLkRrie
	WgFzX
X-Gm-Gg: AYBFou11fKaIx8uBqfZZb2Lxk1WadvulmIt7OspCNsZHnbo8TLPQWLPm9ny07/oFVUp
	VYEdh6kcLdsRfYf2ty0dTf9Fm3KhzkLgIWV81uUYIj2jYTOfMkZfkJxdzxPrzQT0Of2DtJafmen
	aBx3pbR04TLSTeuANk2JsC3I+xuJimFBA76Q9FvZupvnWbuznQMYohbKEPq0j7Ha9g18b4HvRK/
	Dq2ik8FKlklVCVkaG78QumaMlTzeuD2fNGC16EZbcXWH8jW+dpZDn4M8OKXwAfuKHnTnB26tgxk
	2LiSSTbLl2Gr6/UZzAaj6g18dnd9pUakcBmoWtGYTgNWtnT9zprsUqBaJ13387gq9V0hTyh3Tx7
	pv6dbY4YY1AMO7niuCrUUGbVgDS9UlOLwPzCDWdujVkHNrEhErOyDN7Etf5niAzWahDe0ecLDiE
	l4KsqDqp3/Axo6F1XeCTCBNMtpT2srzNOpt4M6QvYzEFr9mkB7IJTya9giZhorbe9JhbKGIcQqF
	6dj6Vusl4Q6gKmH+VJaiNsLCp7W755RcvtiXg5ovVRa9GkRQWquN0wYEqIkII0psK5SuDgJyKMP
	O1g6jh0gSPKRRKuodMwTCZSwO0288JC0OqO+bqFm5o8SH8mx4YKWvrpUkzSvHljMvqU+y7vz3kT
	xeMToAJfXLUui7+/IocXgJG0/6nE3CAJgGbZJ937ikoOPZbau0Iuc3w==
X-Received: by 2002:a05:600c:3551:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4ba023376a2mr48724895e9.8.1794324459150;
        Tue, 10 Nov 2026 07:27:39 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/19] python3-paho-mqtt: Upgrade 2.1.0 -> 2.2.0
Date: Tue, 10 Nov 2026 17:27:18 +0200
Message-ID: <20261110152729.1065911-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132082
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.2.0:

- Update supported Python versions. Drop support for Python 3.7 and
  3.8. Deprecation notice: next release is expected to drop Python
  3.9 and 3.10.
- Possible breaking change: Change some exceptions from ValueError
  to TypeError (in max_queued_messages_set and Client
  callback_api_version parameter) The breaking change is unlikely
  however, both exceptions are expected to only be raised with
  broken code (e.g. need to pass wrong type - not just wrong value).
- Type annotations fix: bytearray was missing as alternative of
  some payload
- Add drop_out_messages to discard outgoing message queue. This
  could be needed if broker lost the session
- Honor MQTTv5 Server Keep Alive from CONNACK Properties
- Fix an keepalive disconnection when receiving large payload
- Fix bug in inflight message tracking & QoS 2 message, which could
  result in negative counter
- Various reinforcement against corrupted or malformed packets
- Expose ReasonCode names as documentation said
- Fix broken reinitialise()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-paho-mqtt_2.1.0.bb => python3-paho-mqtt_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_2.1.0.bb => python3-paho-mqtt_2.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb
index cecd98fca4..fbfbf064d6 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e5f264c6988aec56808a3a11e77b913 \
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4f7c3968fc1723834"
+SRC_URI[sha256sum] = "bcf706f03f1f49e0fc3ae166dc7b67ee35463496f8bdfd7c9c36181f6ba635c9"
 
 do_install:append() {
         install -d -m0755 ${D}${datadir}/${BPN}/examples
-- 
2.47.3

