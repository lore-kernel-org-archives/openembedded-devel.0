Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D1BC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:58:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.1765.1711396702537091385
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ff3981OW;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5688eaf1165so6585028a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711396700; x=1712001500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ackXZhfyqq6XtnAJYKb168iyTHqbOr4H+8ENLu/gO0=;
        b=ff3981OWfqZpEEYnRVWBDfpyiol6klhJqXTWpISgQyrk2RVtRDdf/NMwF9vw96ZqZV
         Keu4a4YPjPfz+Utw7Do6saQKt84/dyXdfTmowbce1/LXXEy5lji5cZnf3kGskpTBqMaE
         ssuLpmjPFFX5hJ6meac9oaj/aLtencGX4kjnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396700; x=1712001500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ackXZhfyqq6XtnAJYKb168iyTHqbOr4H+8ENLu/gO0=;
        b=uXuUyBvnoFvgpayhhYVZ3QEI3cQFaT+Qs0cX/WoM2ebmd41vkSfdkYB18CkQKlaU4W
         +Np1tU7j/EPBfsS/DwEAurTUrHceqejV/gOzYLgqzrfyRhZ1+VVz/mCknBAh7Xui7Pst
         ZKu05LVvku0s7qtOOeOaCgmM4J3xZdhSsGmRM9vY8zmk77MMM3rOMLXNyfxABJTUwA1F
         BXC/HjT+So6SLYbwBl5+gltXyvlZMlJUGvWR0i9kcrFPHKFCvhXPT3AUlSlt78WKb8v2
         ttuJlnWHRV+YlPQaImZjyDjIhIyufPMOk0w0YzmU6QPg5wYISRKV8BGT3qozCua4zcLo
         ZnHg==
X-Gm-Message-State: AOJu0YxpEw7qgvgaaGUHovg0T5hxM51ejwTzw//TGfivBBAJAn69tHob
	0OPVIoXWAnyfZAbE8QwVMWKxYWA3CBgB7GOvJDmcCDd3/Pf6+TnKtXYC4CzKeAlu8m0NV/yhPjq
	F
X-Google-Smtp-Source: AGHT+IF8jaDbuE1guSZnljx21zH5NT/d8b4/rqYcmgvp0QW7ztKWKwTirj8tE9tycea/o0D1zavTfQ==
X-Received: by 2002:a50:950e:0:b0:56b:a852:74b7 with SMTP id u14-20020a50950e000000b0056ba85274b7mr6700986eda.6.1711396700125;
        Mon, 25 Mar 2024 12:58:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r13-20020a056402018d00b0056c18b79cd3sm898574edv.22.2024.03.25.12.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:58:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-paho-mqtt: Upgrade 1.6.1 -> 2.0.0
Date: Mon, 25 Mar 2024 21:58:14 +0200
Message-Id: <20240325195814.2825816-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325195814.2825816-1-leon.anavi@konsulko.com>
References: <20240325195814.2825816-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109607

Upgrade to version 2.0.0:

- **BREAKING** Added callback_api_version. This break *ALL* users
  of paho-mqtt Client class. See migrations.md for details on how
  to upgrade. tl; dr; add CallbackAPIVersion.VERSION1 to first
  argument of Client()
- **BREAKING** Drop support for Python 2.7, Python 3.5 and Python
  3.6. Minimum tested version is Python 3.7. Python version up to
  Python 3.12 are tested.
- **BREAKING** connect_srv changed it signature to take an
  additional bind_port parameter. This is a breaking change, but in
  previous version connect_srv was broken anyway.
- **BREAKING** Remove some deprecated argument and method:
  * ``max_packets`` argument in loop(), loop_write() and
    loop_forever() is removed
  * ``force`` argument in loop_stop() is removed
  * method ``message_retry_set()`` is removed
- **BREAKING** Remove the base62, WebsocketWrapper and
  ConnectionState, as user shouldn't directly use them.
- Possible breaking change: Add properties to access most Client
  attribute. Since this add new properties like `logger`, if a
  sub-class defined `logger`, the two `logger` will conflict.
- Add version 2 of user-callback which allow to access MQTTv5
  reason code & properties that were missing from on_publish
  callback. Also it's more consistent in parameter order or between
  MQTTv3 and MQTTv5.
- Add types to Client class, which caused few change which should
  be compatible. Known risk of breaking changes:
  - Use enum for returned error code (like MQTT_ERR_SUCCESS). It
    use an IntEnum which should be a drop-in replacement. Excepted
    if someone is doing "rc is 0" instead of "rc == 0".
  - reason in on_connect callback when using MQTTv5 is now always
    a ReasonCode object. It used to possibly be an integer with the
    value 132.
  - MQTTMessage field "dup" and "retain" used to be integer with
    value 0 and 1. They are now boolean.
- Add support for ALPN protocols on TLS connection.
- Add on_pre_connect() callback, which is called immediately before
  a connection attempt is made.
- Fix subscribe.simple with MQTTv5.
- Use better name for thread started by loop_start.
- Fix possible bug during disconnection where self._sock is
  unexpectedly None.
- Fix loading too weak TLS CA file but setting allowed ciphers
  before loading CA.
- Allow to manually ack QoS > 0 messages.
- Improve tests & linters. Modernize build (drop setup.py, use
  pyproject.toml)
- Fix is_connected property to correctly return False when
  connection is lost and loop_start/loop_forever isn't used.
- Fix wait_for_publish that could hang with QoS == 0 message on
  reconnection or publish during connection.
- Correctly mark connection as broken on SSL error and don't crash
  loop_forever.
- Fix handling of MQTT v5.0 PUBREL messages with remaining length
  not equal to 2.
- Raise error on ``subscribe()`` when `topic` is an empty list.
- Raise error on `publish.multiple()` when ``msgs`` is an empty
  list.
- Don't add port to Host: header for websockets connections when
  the port if the default port.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-paho-mqtt_1.6.1.bb => python3-paho-mqtt_2.0.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paho-mqtt_1.6.1.bb => python3-paho-mqtt_2.0.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.0.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-paho-mqtt_2.0.0.bb
index 9055772b5..e4cf77a13 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.0.0.bb
@@ -5,9 +5,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8e5f264c6988aec56808a3a11e77b913 \
 "
 SRCNAME = "paho-mqtt"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2a8291c81623aec00372b5a85558a372c747cbca8e9934dfe218638b8eefc26f"
+SRC_URI[sha256sum] = "13b205f29251e4f2c66a6c923c31fc4fd780561e03b2d775cff8e4f2915cf947"
+
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/73/b7/a4df0f93bbdae237e16ba402752151eceee576cbe80c235a2475fbf81eea/paho_mqtt-${PV}.tar.gz"
+
+S = "${WORKDIR}/paho_mqtt-${PV}"
 
 DEPENDS += "python3-pytest-runner-native"
 
-- 
2.39.2


