Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6FCCD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 22:47:04 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.6042.1712270823872174226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 15:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=HwyFDxKo;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1712270823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vQ++wl/LFuzXwu9c7/do92/iE4u4lkrj15rQ7xUdOmo=;
	b=HwyFDxKo1efac6NpK9PN1mGHDNGWUzBIajQG1hzopdub8K2mYM2Rs26wLuf2HqPsK9iMa4
	ao5N2qjD4VoZgVzXrl2oYpulay/C2E+Tja0SQfZRVD7zKWLr6YPOgLbIDvYD7jxsH9w+oa
	bNllwtGwohwS9bVxV29C3YQccZ3W6Gw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-37-Wa5_mrawMqqUG-uRilHbGw-1; Thu, 04 Apr 2024 15:47:00 -0700
X-MC-Unique: Wa5_mrawMqqUG-uRilHbGw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-343d6732721so256071f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 15:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712270818; x=1712875618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGlol2rvLpLTkp7+lzJv1AweNtXPQWjgDP8QDB5S/y0=;
        b=AaZkplqY/IX4tw+oh0mOQ1e5HLIy6/vC+i67z5jBLqceTIKVAytT9OHj4pB7gI0tOq
         7hQkIYbXK0MwolUY0kgkXAjrn/+UC2nrYVRN65cOPJq0ng8yBAK+QmK70TBFkjXxPJQE
         EUMLmm1eSY3dpfa/LY1Oa76B1NYvpgZgEYfkc4Fpt9ZR79LTpmEzTjnvL7snLD4Zbc3F
         oHarj4b2HhTxVk7jJnnDjJOkDsMrRbs9QLxdGvXpHp8jdZKfqT5WPPApTmkpxaUYjTn0
         /zil7dKt3dr9aUraWMXCiJAWC0Jl1CXdyGTZ3uP08KGSXGIdyhZpI3AoaWDs2JBHTHTc
         u85Q==
X-Gm-Message-State: AOJu0Yz8CBdmKt36g2xcVJJWJc/rru+S7JgviIQofZttMd+L1vs5CCFF
	tG8aJ9cvZXtfDEC2/reimj7MzRwgXmIdRjD+dG16E0SsXM+kLpbOISVdwjZKR4qw8+YIYSllBBs
	8IYI5WRNK4tEfboa1V9ORvkk7D+n+ZTBpMd/ZRY7YbNCf7bF1q05I9J8qMYNIrphXg0/O1Gc89G
	BidO7lORRA/dLBn4qND6xC/mPoLORmAmUxr1+JuVio8jC6WM1K8s5mro8H1LXJASJbgDvr
X-Received: by 2002:a5d:65c4:0:b0:343:7abf:1a9d with SMTP id e4-20020a5d65c4000000b003437abf1a9dmr681819wrw.14.1712270818348;
        Thu, 04 Apr 2024 15:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH44UvcFm/UucWcWD4BOR/hMF+a6VWrL5NNcQJQP2XIsAU5vEd4rAdOCbodyriRgmCmLp4cSw==
X-Received: by 2002:a5d:65c4:0:b0:343:7abf:1a9d with SMTP id e4-20020a5d65c4000000b003437abf1a9dmr681808wrw.14.1712270818035;
        Thu, 04 Apr 2024 15:46:58 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b0041469869d11sm4132492wmq.47.2024.04.04.15.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 15:46:57 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hains van den Bosch <hainsvdbosch@ziggo.nl>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][kirkstone][PATCH 2/2] python3-twisted: Add python3-asyncio to RDEPENDS
Date: Thu,  4 Apr 2024 22:45:22 +0000
Message-Id: <20240404224522.4303-2-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240404224522.4303-1-gudnimar@noxmedical.com>
References: <20240404224522.4303-1-gudnimar@noxmedical.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404041547022411"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 22:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109809

--MCBoundary=_12404041547022411
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Hains van den Bosch <hainsvdbosch@ziggo.nl>

To fix crash due to missing module:

from twisted.internet import defer
File "/usr/lib/python3.11/site-packages/twisted/internet/defer.py", line 14=
, in <module>
from asyncio import AbstractEventLoop, Future, iscoroutine
ModuleNotFoundError: No module named 'asyncio'

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 3225b6c98..c55c86ea5 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -57,6 +57,7 @@ RDEPENDS:${PN} =3D "\
 "
=20
 RDEPENDS:${PN}-core =3D "${PYTHON_PN}-appdirs \
+                       ${PYTHON_PN}-asyncio \
                        ${PYTHON_PN}-automat \
                        ${PYTHON_PN}-constantly \
                        ${PYTHON_PN}-core \
--=20
2.34.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--MCBoundary=_12404041547022411
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>From: Hains van den Bosch &lt;hainsvdbosch@ziggo.nl=
&gt;<BR>
<BR>
To fix crash due to missing module:<BR>
<BR>
from twisted.internet import defer<BR>
File &quot;/usr/lib/python3.11/site-packages/twisted/internet/defer.py&quot=
;, line 14, in &lt;module&gt;<BR>
from asyncio import AbstractEventLoop, Future, iscoroutine<BR>
ModuleNotFoundError: No module named 'asyncio'<BR>
<BR>
Signed-off-by: Hains van den Bosch &lt;hainsvdbosch@ziggo.nl&gt;<BR>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb | 1 +<BR>
 1 file changed, 1 insertion(+)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
index 3225b6c98..c55c86ea5 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
@@ -57,6 +57,7 @@ RDEPENDS:${PN} =3D &quot;\<BR>
 &quot;<BR>
 <BR>
 RDEPENDS:${PN}-core =3D &quot;${PYTHON_PN}-appdirs \<BR>
+                       ${PYTHON_PN}-asyncio \<BR>
                        ${PYTHON_PN}-automat \<BR>
                        ${PYTHON_PN}-constantly \<BR>
                        ${PYTHON_PN}-core \<BR>
-- <BR>
2.34.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
/p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666;">Warning=
:  Copyright Nox Health.  This communication is confidential and may contai=
n privileged information.  By the use of email over the Internet or other c=
ommunication systems, Nox Health is not waiving either confidentiality of, =
or legal privilege in, the content of the email and of any attachments.  If=
 the recipient of this message is not the intended addressee, please call N=
ox Health immediately by calling (+1) 888.505.0280</p></body></html>

--MCBoundary=_12404041547022411--


