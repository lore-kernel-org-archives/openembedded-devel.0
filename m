Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263C0C074FD
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5393.1699931301321753477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=klcrZAgO;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cc921a4632so46889885ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931300; x=1700536100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZfSdMooxMNQ0O6RroQJjFeTaJB9nJipPM8woiifvYQ=;
        b=klcrZAgOckUbWqUSk5fyDzii78GLLocac3d6IF8yxFN/BVyoPEYlMYjeKsWs9ybwb9
         Xl3F/HPqwXQnzrrTlgvM6zB+ywrs+U94iHTPgo9HRiMo5GIVEwtzb3ix7HyqrM5HyhLA
         3+tcH8v49pBYWMfKXNRroXiYMqowVOqVQCc723kR8itA2gOcpypOxM6E/9/f2wXd71z/
         /ZhNk7BzkYBeP/bv/yvaoHvzXSWwAtlddGP/QAaun6Syu3dWkSepF2TW5Bflpt0OxvBH
         tPIJRDow84wnFPd1mjz5ILDCBbMdVpD1Oj+yUcbKVdlgciT6ysbsgq1vZh0xd5TDjPMP
         0JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931300; x=1700536100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZfSdMooxMNQ0O6RroQJjFeTaJB9nJipPM8woiifvYQ=;
        b=iZBNShnOn6DtZ6YhyvyYGVvcDFsVlYszt6ibm0XdwTaBdM0eH1vRyMR1gDfTaeUbyF
         RQSuYcnx+Bg/eqdssuKsY+awcCiqqGYYcjnFx9gixBUKbk9wr5CNhnWYji1l+ieMzx4B
         tyPh9brKUzRv6pBoyQVkQyIS0JwuKyvbjs8M+QXxCN81Xhqe2GmWdRRbBb5iwAg8TUNN
         0D0nKXFlNvJ2pKZfOxb2lbs9HoU4gRlLp22RUMOF7I+wrpwue1GkPzMC+ffjHBUyR7EV
         fwmAo5iM022FnTRsI/j3ZMraWEyeXiRuVfq0OOANrVyQ5Ee97hBfT69YeA3X4OJtiIG6
         l2dA==
X-Gm-Message-State: AOJu0YyCM2aR6YqDtDKn3er693TlArapx7gRDOtE8HsgSL5b1xIT9HpN
	3hpjotgrU0jPTU86Yahh75zY8/8nK6ChmA==
X-Google-Smtp-Source: AGHT+IHLlWEZNZIApi+a9mq3vmdiWCCfzd+rH7X2aaZjvhgdsKFjrxxboFfVyZr68AJkgLcKE+cYqQ==
X-Received: by 2002:a17:903:1207:b0:1cc:1dde:8680 with SMTP id l7-20020a170903120700b001cc1dde8680mr1324585plh.45.1699931300391;
        Mon, 13 Nov 2023 19:08:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 05/10] dleyna: Skip all dleyna recipes, slated for removal
Date: Mon, 13 Nov 2023 19:08:06 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-5-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106692

Upstream has marked it unsupported [1] and no development is going on=0D
=0D
[1] https://github.com/intel/dleyna-core/commit/47638f14fdd0f1a1d3c0c0bd1ce=
31aa64c66025f=0D
=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 .../recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb            | =
2 ++=0D
 meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb          | =
2 ++=0D
 meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb      | =
2 ++=0D
 meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb        | =
2 ++=0D
 4 files changed, 8 insertions(+)=0D
=0D
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbu=
s_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbu=
s_0.3.0.bb=0D
index 033854f19e..bed5af9bf3 100644=0D
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0=
.bb=0D
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0=
.bb=0D
@@ -16,3 +16,5 @@ inherit autotools pkgconfig=0D
 FILES:${PN} +=3D "${libdir}/dleyna-1.0/connectors/*.so"=0D
 FILES:${PN}-dev +=3D "${libdir}/dleyna-1.0/connectors/*.la"=0D
 FILES:${PN}-dbg +=3D "${libdir}/dleyna-1.0/connectors/.debug/*.so"=0D
+=0D
+SKIP_RECIPE[dleyna-connector-dbus] ?=3D "Upstream is dead moreover needs p=
orting to work with latest gupnp >=3D 1.2"=0D
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=
 b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=0D
index 20a54b1bd7..8aaab7893e 100644=0D
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=0D
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb=0D
@@ -18,3 +18,5 @@ SRCREV =3D "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"=0D
 S =3D "${WORKDIR}/git"=0D
 =0D
 inherit autotools pkgconfig=0D
+=0D
+SKIP_RECIPE[dleyna-core] ?=3D "Upstream is dead moreover needs porting to =
work with latest gupnp >=3D 1.2"=0D
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.=
0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb=0D
index e7f918333a..a385a50de7 100644=0D
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb=0D
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-renderer_0.6.0.bb=0D
@@ -23,3 +23,5 @@ CFLAGS +=3D " -I${S}"=0D
 =0D
 FILES:${PN} +=3D "${datadir}/dbus-1"=0D
 FILES:${PN}-dev +=3D "${libdir}/${BPN}/*.so"=0D
+=0D
+SKIP_RECIPE[dleyna-renderer] ?=3D "Upstream is dead moreover needs porting=
 to work with latest gupnp >=3D 1.2"=0D
diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.=
bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb=0D
index 071379758c..719aecede1 100644=0D
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb=0D
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb=0D
@@ -20,3 +20,5 @@ inherit autotools pkgconfig=0D
 =0D
 FILES:${PN} +=3D "${datadir}/dbus-1"=0D
 FILES:${PN}-dev +=3D "${libdir}/${BPN}/*.so"=0D
+=0D
+SKIP_RECIPE[dleyna-server] ?=3D "Upstream is dead moreover needs porting t=
o work with latest gupnp >=3D 1.2"=0D
=0D
-- =0D
2.42.1=0D
=0D

