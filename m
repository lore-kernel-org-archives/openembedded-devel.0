Return-Path: <dmkhn@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555B3C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:14:40 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.69671.1747116867451453338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 May 2025 23:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@proton.me header.s=protonmail header.b=J3P2j907;
 spf=pass (domain: proton.me, ip: 185.70.43.22, mailfrom: dmkhn@proton.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747116864; x=1747376064;
	bh=3ApI6ffP0rMwv9JIowI127G9hDnCIR65Bvqxknrm0LY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=J3P2j907o/YXdgxs9kBqety4euURS0gKZZ3M5YcaBX6vvN1iVryYlrRwrjB78Fdz/
	 JcoSpfkHUB0pOeablBjMWfVm+L7iuApjLO046HpXxl3zPXO32CA0yjF7x57ZExZnTf
	 g29MXJaxbO3T7s+/HtkGpUxwXm7i1ogYEf5j2lBWdRDqHbmGbHJCCT2PR+X6YURLD9
	 AT4StSxclsSCS/9IeRonygaB5fLMJcUunooKUtDcJn2C8UqFLnUVbAtK9ryrNyCK5A
	 koLH0lPu5zJKTpbPb1+J6H7OwvXOzOPH5EvdOs/UUMxr0u28ButxOxJiVRDP8m/ZZi
	 pk/GoYfdpjoXQ==
Date: Tue, 13 May 2025 06:14:20 +0000
To: openembedded-devel@lists.openembedded.org
From: dmkhn@proton.me
Cc: raj.khem@gmail.com, Denis Mukhin <dmukhin@ford.com>
Subject: [meta-oe][PATCH v1] iperf3: enable native builds
Message-ID: <20250513061332.3972490-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: de2adddb81b18350ec47b6f576846233886eab81
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 May 2025 06:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117392

From: Denis Mukhin <dmukhin@ford.com>

Enable native variants of iperf3 tool for SDK builds.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/reci=
pes-benchmark/iperf3/iperf3_3.18.bb
index 77b441e506..4a71e83b73 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -30,3 +30,5 @@ PACKAGECONFIG[lksctp] =3D "ac_cv_header_netinet_sctp_h=3D=
yes,ac_cv_header_netinet_sc
 PACKAGECONFIG[openssl] =3D "--with-openssl=3D${RECIPE_SYSROOT}${prefix},--=
without-openssl,openssl"
=20
 CFLAGS +=3D "-D_GNU_SOURCE"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1



