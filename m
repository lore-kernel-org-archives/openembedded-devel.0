Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724F8D116F5
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:26:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3387.1764361602327920243
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=adZgCxYG;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso9349765e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361600; x=1764966400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DrQ27bQ+nJgf4BATwxBiDE5qy/9kUPGlsBlMAwJE1UQ=;
        b=adZgCxYGnVaexSLdUbTH/6/WwFmRB1bu5cEnNu2kVTXhnMlsJZZ4V6pJ+OGQlJq+VV
         Vj2OTuMiunzrazptpw70WjoTWFQlmVmcZDut/JMo0tHW7nNEXUWKRo+w2nokSWjF9M9V
         y3HW8wipOmynduOanKTpJx6OFsUTWKyxuaDBcRJu24T4gGLudqTmLhC2+Mobf21MHmZW
         rJTUizvFlryGfj7x53a7xlstPlb9lJTf93r/lFTu6gsS4IvUNtUYgu2EzbgHm+r33Zdg
         ERkvfRAsmQN6t+dRTBy7iUqRtudLMPnAhORPtEZYsA9aMpVc2997jRkUYPHo1Ce2Qqaz
         Xxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361600; x=1764966400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrQ27bQ+nJgf4BATwxBiDE5qy/9kUPGlsBlMAwJE1UQ=;
        b=hG2VQaC4KPX/CqDHdxdm+IHkSnXiG7hRZe66gLIOx0zzbnRAVJ/8tC0a9eWNe4xFFJ
         B3ODFvoAjU2+KwLd27ufnckD4oYLK+ancF0JjHGaCInBYryuYP28mMOBI/N56H5ZKhZ7
         BgkW0knaqlSOjs9BqX/pEVESbzK5EGTby+LdIofH/Fk+eEPHEsQFj2jgA3eBmH1rA39f
         ag9gwnwt80soaCLhJ2DskOlZX5XFRU71LXAfqFrMGVd6+eUZJWx4WJht+HW4dB3rsOZ9
         0ipp1zmhZFy1Pb3ebK60gtgf51ZfJhtJzPOmO020d+kjzYdU0Q1yvQaTFpjdMjmGEHWG
         rrjQ==
X-Gm-Message-State: AOJu0Yzn9eNEfZcXo2Z93SWgJBZKlTH4UmSupc95X6aTCsxUeJ1sWwqb
	eyEUtfpWBghji6FQ6cZLvmpIDKF/wkS9DxM1YWbBG9y7Q/vGoMrxYEmKz17czw==
X-Gm-Gg: ASbGncvP0anc2nMbEVfB9ynzygj6U6+tFB9cuUYUu8L8hqRy+kLjYrJldNmmooFxGbc
	6vfHbXJ4G9erpK3jcJ4L7mvcyN5mLSziYVURm1Fji3mAwu0VGZQkm8mID7zgXWnLJ2BZgTnPYZ9
	Q7Xy6aGzkDq4b01WS7s0taBMYNQGP9rjhpUxujozt4WzN8fxdgp87dgNstP9josqO/dibco2qCO
	kf8f50mbt0+QqD8pw+Vp8FqVvb7eXvXx3oyxd4HEGCE7AIAcEEnWzmarrrLQWh5Ol6cGcfNrUCh
	5jvz/bsA4O3QFADGluKIRJi6frCWFOeYo0GuELDb2KCBNj72JGytGdDMW9LmGRjh0uJw1rG4giJ
	JBzhukAsHysZ3IrjEMbCppsObbB3gvEigfBFOnolv1QIjye5cbo5Py9uibpUYF481+uUf5gUJ2C
	uwzmt1ZvBr
X-Google-Smtp-Source: AGHT+IEWFvBjHnpkWRD0ZAKvSi1iUvJa31XwPzWh9pwSC+QZpHorRDO+R03wUhochIpjbbpqwTeRoQ==
X-Received: by 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr303877045e9.2.1764361600359;
        Fri, 28 Nov 2025 12:26:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc6f7bsm177198595e9.2.2025.11.28.12.26.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:26:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/3] dbus-broker: upgrade 36->37
Date: Fri, 28 Nov 2025 21:26:37 +0100
Message-ID: <20251128202639.2631231-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122147

Changelog:
- Add `/etc` and `/run` to the search-paths for system services. This
  change is aligned with recent changes to the reference
  implementation.
- Support systemd's `notify-reload` to trigger a reload operation.
  This replaces the old `busctl call ...ReloadConfig` operation.
- Extend `org.freedesktop.DBus.Debug.Stats.GetStats` with all the
  fields defined by the specification.
- Fix a bug in match-rule processing which caused argument processing
  to fail for any but the first message argument.
- Fix a memory leak in configuration processing when parsing invalid
  user or group IDs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

 .../recipes-core/dbus/{dbus-broker_36.bb => dbus-broker_37.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_36.bb => dbus-broker_37.bb} (93%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_36.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
similarity index 93%
rename from meta-oe/recipes-core/dbus/dbus-broker_36.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_37.bb
index 8959927a92..f0312181b6 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_36.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -11,7 +11,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d333d99bd2688135b6d6961e7ad1360099d186078781c87102230910ea4e162b"
+SRC_URI[sha256sum] = "f819a8db8795fa08c767612e3823fd594694a0990f2543ecf35d6a1a6bf2ab5b"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+)"

