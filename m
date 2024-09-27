Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD865CDD1B3
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 14:07:04 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.69743.1727446023044505264
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 07:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUSiQpan;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e5d0a80db4so1129061eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727446022; x=1728050822; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OwtE7DbWcEOJDQE4qXQT0VnhXwYWsdPwAOZbWYhdzH4=;
        b=DUSiQpanKUNYD7h7XJOiVzzhHC2ozmEjkCFmBsx/NGRuxi0CAkT9+EyDHcx4a4TseX
         EjBJuTdStmrzXR+0lBPagewqSHl+P1OlpGKUqVRIfYn5eonnCD2b7bmgdPuRY0gviC1V
         dSk9dEQxRIfl3wFElxy3ILeNBRw7zOWjwgOS6M1ZAZl7KQ7luRUXmgAT5cDolXaKYNeN
         czVlgT7MSQCUOjy+RmygXxRdoqAKTaRQXTXQLRtrbVqvpFKvnyPiSlTriEU3EjARuy/6
         qn7mxOJdN5kw4sAuCq2u/N8/w9MdbecKbDYEw2Fm7PTiNDFuKSjY6V07ZpbPJ1C6U2YL
         S8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727446022; x=1728050822;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwtE7DbWcEOJDQE4qXQT0VnhXwYWsdPwAOZbWYhdzH4=;
        b=fhPv2SBEhBmgGwD6aNnwxkYwGb7lGp1xwj4KG0cD0VYc9w2PtzyqFNnmcp03RQnluJ
         QpvPznci7hs/GwFejsDn6flW7WQl/jGqjwTMQXF2jcf5sha2a/6HZakFhOjvHOGFU5gA
         HY0X+0zfNmodNpugudcNxGUAfUlDbpduUXj94mMMYoS2gF961lNVNxsjrW2jmpQYfg6n
         e/zXXGy153F8SxBDc8XXOoWv2oZi3oTfYvAsKbC25pU1nKzUNlfw6C9EElVCOV+Uvp9w
         e7W71ma/pPnSaYJ0HVzehEiKDb9FNdZaofFz4DhX02/gN4LvmmiuI8GwozHGW8hwYuGC
         hAag==
X-Gm-Message-State: AOJu0YymoVyQklT2sdoXSf6xBZe4RPJGAM+X9LyI7eS7Ce4ISrKv/kZ/
	CMadEh/gfyiBphsi4M+cg36OyGmqSX3hDJ+Z2kaC7jbSlI9sNI2kdgxthk/eDUsKGwpRrQzLKve
	EY5xJwGmKA7yPDGZgXP3xjCEvm7Qn0stI0cw=
X-Google-Smtp-Source: AGHT+IF3ISgbyz9eY0NFUyIy7+x7sMA8wVMc8CSB69/JkW+k9Sv07x2sIYgoiLHoK7Xpb2bTh3k/ywHx0YffMn1yhP0=
X-Received: by 2002:a05:6820:545:b0:5e5:7086:ebed with SMTP id
 006d021491bc7-5e772804944mr2056005eaf.7.1727446021661; Fri, 27 Sep 2024
 07:07:01 -0700 (PDT)
MIME-Version: 1.0
From: "J. S." <schonm@gmail.com>
Date: Fri, 27 Sep 2024 10:06:49 -0400
Message-ID: <CABTo8gBQY3mRhKOatg6P3EYWODN+uSHFdEthpr7YTsa4Nqif6A@mail.gmail.com>
Subject: [meta-xfce][PATCH] xfce4-panel: upgrade 4.18.3 -> 4.18.4
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/mixed; boundary="0000000000007dcc8006231a5e6a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 14:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112530

--0000000000007dcc8006231a5e6a
Content-Type: text/plain; charset="UTF-8"

Please find attached a patch to upgrade xfce4-panel from version
4.18.3 to  4.18.4.

Thank you,
Jason Schonberg

--0000000000007dcc8006231a5e6a
Content-Type: text/x-patch; charset="US-ASCII"; name="xfce4-panel-4.18.3-4.18.4.patch"
Content-Disposition: attachment; filename="xfce4-panel-4.18.3-4.18.4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m1kspfiq0>
X-Attachment-Id: f_m1kspfiq0

Y29tbWl0IDYxMmNlMjQ0MjAzNDE4MjgzNWZiNmExODU1NTI4MWQ0ODRjYzQ3NGUKQXV0aG9yOiBK
YXNvbiBTY2hvbmJlcmcgPHNjaG9ubUBnbWFpbC5jb20+CkRhdGU6ICAgRnJpIFNlcCAyNyAwOTo1
MzoxOCAyMDI0IC0wNDAwCgogICAgeGZjZTQtcGFuZWw6IHVwZ3JhZGUgNC4xOC4zIC0+IDQuMTgu
NAogICAgCiAgICBDaGFuZ2Vsb2cgZm91bmQgYXQgaHR0cHM6Ly9naXRsYWIueGZjZS5vcmcveGZj
ZS94ZmNlNC1wYW5lbC8tL3RhZ3MveGZjZTQtcGFuZWwtNC4xOC40CiAgICAKICAgIC0gaWNvbnM6
IFNjYWxlIGF0IHNpemUgMTZ4MTYgdG8gMTI4eDEyOCAoRml4ZXMgIzM4NSkKICAgIC0gaWNvbnM6
IEZpeCBjZW50ZXJpbmcgb2Ygb3JnLnhmY2UucGFuZWwKICAgIC0gaWNvbnM6IFJlbmFtZSBvcmcu
eGZjZS5wYW5lbC5zdGF0dXN0cmF5IHRvIG9yZy54ZmNlLnBhbmVsLnN5c3RyYXkKICAgIC0gRml4
IG1lbW9yeSBsZWFrcyBhcm91bmQgZ3RrX2dldF9jdXJyZW50X2V2ZW50KCkKICAgIC0gdGFza2xp
c3Q6IEZpeCB1c2UtYWZ0ZXItZnJlZSBvbiB0YXNrbGlzdCBjaGlsZAogICAgLSBzeXN0cmF5OiBV
cGRhdGUgaWNvbiBhbHNvIG9uIHN0YXR1cyBjaGFuZ2UKICAgIC0gVHJhbnNsYXRpb24gVXBkYXRl
czoKICAgICAgQ2F0YWxhbiwgRXN0b25pYW4sIEZyZW5jaCwgR3JlZWssIEl0YWxpYW4sIEtvcmVh
biwgT2NjaXRhbiAocG9zdAogICAgICAxNTAwKSwgUnVzc2lhbiwgU2xvdmVuaWFuLCBUdXJraXNo
LCBVa3JhaW5pYW4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogSmFzb24gU2Nob25iZXJnIDxzY2hv
bm1AZ21haWwuY29tPgoKZGlmZiAtLWdpdCBhL21ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQt
cGFuZWwveGZjZTQtcGFuZWxfNC4xOC4zLmJiIGIvbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNl
NC1wYW5lbC94ZmNlNC1wYW5lbF80LjE4LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1l
IGZyb20gbWV0YS14ZmNlL3JlY2lwZXMteGZjZS94ZmNlNC1wYW5lbC94ZmNlNC1wYW5lbF80LjE4
LjMuYmIKcmVuYW1lIHRvIG1ldGEteGZjZS9yZWNpcGVzLXhmY2UveGZjZTQtcGFuZWwveGZjZTQt
cGFuZWxfNC4xOC40LmJiCmluZGV4IDdlNzA3NTQ0My4uYzlmYjY1NDc3IDEwMDY0NAotLS0gYS9t
ZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LXBhbmVsL3hmY2U0LXBhbmVsXzQuMTguMy5iYgor
KysgYi9tZXRhLXhmY2UvcmVjaXBlcy14ZmNlL3hmY2U0LXBhbmVsL3hmY2U0LXBhbmVsXzQuMTgu
NC5iYgpAQCAtMTQsNyArMTQsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly8wMDAxLXdp
bmRvd21lbnUtZG8tbm90LWRpc3BsYXktZGVza3RvcC1pY29uLXdoZW4tbm8td2luZG8ucGF0Y2gg
XAogICAgIGZpbGU6Ly8wMDAyLXVzZS1seGRtLXRvLXJlcGxhY2UtZG0tdG9vbC5wYXRjaCBcCiAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGFlMGI4NjE1Yzk4MTExOTRiYmRhMDE3MmE2MzU2N2Vk
N2ZkYjU1MTllYTQ4ZjdhNDYzN2Y0ZTZlNTM2NWUxYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIz
MjMwNGY4MjA5NGVhMzc3OTc0MWY5NjhkYzg1MTAzMmQ4NzkwZWI3OGYzYWEwMTY3NjUyMGI5NmNm
YWNmYjU0IgogCiBFWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS12YWxhIgogCg==
--0000000000007dcc8006231a5e6a--

