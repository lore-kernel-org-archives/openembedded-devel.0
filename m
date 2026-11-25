Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37920.1795594065727019032
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WcP/t1Ry;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385d8a00598so8057105eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594065; x=1796198865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yboKrqF7raK1okFPovraAMFYBuL+UcTdGpR1njIBAY=;
        b=WcP/t1Rys8t0YXRl77k2DXf1CF5c3GnzbX/pd1jr00YOc/IgCCCa8mGLsi+1sLfztN
         XAEFVlEhSF9c0XDld5/QqEMNZIivzCZrov0M3oWVtCoubWkhSS00DrLrb4AElkB/0alo
         KrmmuxyfECDhViUuXnUyvDejAw3T8OngiprrJqLdTmSUKqfdIIwHPu0wxqew9yKOSmlw
         klqXv0nsRtQIRoMPlvvBD0HQXE9OieO47q1qzlyOMRpEDIgFiQ78aimv8IqptiNvLRH6
         /J8I2muH3CRDg2KDdv5U9sMakPd5PMUhCopEQFaUbDYnxF616ODJ4Jp3So40TXAlajCh
         s9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594065; x=1796198865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yboKrqF7raK1okFPovraAMFYBuL+UcTdGpR1njIBAY=;
        b=QHxRLWYPyeTL8bpmMR7D+u/LzaJzzwsHn0TzR+nFrYQKFkVoZYdfwueAbiE7OKW3yW
         O+k9pGdO4XgDHkl2JMFdyON5CQR8s6AoLaPY5wGk6OM3phBlGFkOfWeF2vZ0FuUveXjL
         BorEq+OZsfNAPOuTMaPASBwx4GHk3ekP6npgs3LjMaHVayppyLo5z8KvqWOv3tHhYfO/
         eN9mdsNgMrTl5a8uffQQwsInAyiHTxKvSpCtGBIODqviDzbaocuwlMrJ+4dZPlL57LP2
         vH0LP/e7HJIZoKPnI2tfa1IjPJxRaBOhOd4FNPdzHrHXVBV4lMMq0rjRsuhRXBQbLdUn
         eRSw==
X-Gm-Message-State: APuU4Z8vSfaJOdQK4NXW5Ae8pA0nDs7OhKRzvb27ehtfgokRaCIKQkG/
	11miwG/CQb+U0M765+9FmDLf6mYxy1D2ZXT6C5cepnxLWN6OVyFyoYVKqr1hZ6sv
X-Gm-Gg: AZFdTZe0LzUJlZ5iD2ILSnDTr+svQ3/9Rtlvv06j6HD4TijslMoQk2mVXFVMdocZ0VG
	7EDgQpSib5dfHH+clxaH+ejDxHwg+tDBs0Vhprr1ENo3EZdwSOj0+8BXneZ4BXKdwLuVA74JkOt
	HPK3UOSMxTOgVfouUCMV+N4ifJhs1f6NKxAloJ2Bju2/h/vuLCyWDSJs5al+vdMJsRhv5egkjyO
	/4mrAAwsg01VdWtjbOkr6gmxditR9KJVT1rBztJszLDD1P5b5uFGqUtT/HEGb0qZQKcJd4kW16M
	R/Id6hNcpmLd8NgM7YtxcqWeWgd6J952XFewobZXuzR+kS8eoVsZlLfzncOyRlZMrSqMWpQTl50
	1MuF0pZZL+y8bOCElKkh4FNBz0CaLam+kzr9zFv4+P0kTB9Qj4Ylb7nMOt0MB3EiNmgQSpZSRlc
	L0yE1Cxu4HWCmhmGKBX6ODCgdBuqZxyQwXv/aBVxz9cKFOG3hOoKJ4tfNjwTOQw5F4WusUYr8cz
	sbey4ziRkdILMhNANQwvr62tMmvxQX0J5KT9NnisKN+g/DApEY+sRyZMWXZzsKGRUrXB6/HaJKf
	xL111JXQf0c1lKLg8kPrHiq3EgE25nvN5pk5jE0d+fS+4Yx/0pdZ4C7XAV1Ec73ORFqWBhM+t/H
	pJP6K56JJLM/zwKOMxQV5NhuUtp+LZ9Gxh0lNE7KetXvS/cfotZ4cnFPFPAKu8D167OS+wgYrax
	NHLXa6HohcUv99e10b4wkcqhw3rZOFLfUnk+pRSc7GIWXmBR12zMT0MpUX4m6fFjXUQBqW+Jgpm
	w0AFSeovFpQJDouprVYuBUQRMElDIuyGliB3FXOu60I8ahnUFVQQcvd9Wwcz4agtbQvsA7LEyyR
	siWQ
X-Received: by 2002:a05:693c:8948:20b0:386:b08e:4b7b with SMTP id 5a478bee46e88-386b08e4e93mr8649576eec.29.1795594064740;
        Wed, 25 Nov 2026 00:07:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 5/5] vlan: Fix upstream version check
Date: Wed, 25 Nov 2026 00:06:16 -0800
Message-ID: <20261125080732.2419614-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133003
Content-Type: text/plain; charset="utf-8"

vlan.sourcearchive.com now serves an unrelated site, so the check finds
nothing. SRC_URI already fetches from Ubuntu's Launchpad archive; check
the Launchpad source package page instead, which links each release as
vlan/<version>-<debian revision>.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 845c3cf53c..d4793cf457 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/vlan/1.9-3
 SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
 SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
 
-UPSTREAM_CHECK_URI = "http://vlan.sourcearchive.com/"
-UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
+UPSTREAM_CHECK_URI = "https://launchpad.net/ubuntu/+source/vlan"
+UPSTREAM_CHECK_REGEX = "vlan/(?P<pver>\d+(\.\d+)+)-"
 
 S = "${UNPACKDIR}/${BPN}"
 
