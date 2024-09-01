Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76FECD3420
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 19:52:33 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.23452.1725220349959001618
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Sep 2024 12:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m9ccEmY0;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-277e6002b7dso162684fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Sep 2024 12:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725220349; x=1725825149; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jHl9N41U0KnAgbyKqc9cq9XpFTpW746fHxosZQUCRmk=;
        b=m9ccEmY0YWMdaaBJK+neBOKSzycFXWUT7xQkkKWubxPXfTBEiyHP+HamSQ74HMu9Ie
         J2qQ3uHetRdu3GVsv/jO3ei1DVekIx1ie8Tz5x+wczYeQ+NInfC1zzgk8EMOw2RDs9Hm
         p3HrOzdZgwvT8M8qWiNHMGq/VGsAD/x4LS5cgdVtUDuxvwuzo8/0IsUSnabk54oD891b
         nFHrWKJhTbTGUVaLUiSjCIPa2GOijspABVR6DeOtzbdHGdMQhLLWETrxY6S0dh480DSY
         v+s0+p8qX8mWx3Te8k3oMWDt8R5GL5JlRCrpSiZigNTmD1KaI1nCp9TLauf0GzbGoDjN
         hBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725220349; x=1725825149;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jHl9N41U0KnAgbyKqc9cq9XpFTpW746fHxosZQUCRmk=;
        b=B5NBnLTv/pZBFEh3ycpTkMG+rVxhZetWYLKkHcuuqh8jWj9hhFxwh8K9vgPsBmiRmI
         qH/LkYUpmG0mlLyC5mylU7O7J7SVx+5NkjcnfZmJRiIgC6nOou2kFdB+veutnMCFdv5U
         MDOstDpwNeGGk/f+y27pGU9RIDey7YTLt8/nuuIqm4qwIu4tY9vPHrSI/gJ2WTcVBRDi
         G+lKDDdTCjDSsO7srYOXcmKUa1iNzbk2bW9Vl3SljwtreRYPP/1jtNKrGWpGJtbBuvea
         dcWlz7X1MhifkB6ZP0/tOhLYXbRwJBXqYF62SXwhV5nZWE+Jaq5Crje25oe6flCZCOeJ
         lT2Q==
X-Gm-Message-State: AOJu0Yx5HPdjbAFNiPugbaeJpjqwrTBqshNIbAuQM3PF+FgzNJi63pNe
	m3K+ygjZPjTfqx3LR8KSkojhRZv9fBBj1RGenjPz/HZ/LQoS8FNFPHOCOc6I+JUm4Suxz54zF+H
	gHa0jX8Ig55qcbePcHFtNlDk3JzcRQAzhPHo=
X-Google-Smtp-Source: AGHT+IGyhaRTCN3Nn0a6azwzT2Ks8SlvIy1gWIfUta3elkr7Dg/CnHGjiSgeUbAQ/6OV7zBo3SH+i+MsYzNbmnUnll0=
X-Received: by 2002:a05:6870:e38f:b0:260:fd20:a880 with SMTP id
 586e51a60fabf-277c824a4a1mr5811044fac.42.1725220348324; Sun, 01 Sep 2024
 12:52:28 -0700 (PDT)
MIME-Version: 1.0
From: "J. S." <schonm@gmail.com>
Date: Sun, 1 Sep 2024 15:52:16 -0400
Message-ID: <CABTo8gBA2pQW_HZn+je0xa9z0jeMxw6Vw+5Ex1E8W_GHX5fQWQ@mail.gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 20.16.0 -> 20.17.0
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/mixed; boundary="0000000000000591ac0621142ad1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Sep 2024 19:52:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112067

--0000000000000591ac0621142ad1
Content-Type: text/plain; charset="UTF-8"

Please find attached a patch to upgrade nodejs from version 20.16.0 to 20.17.0.

Thank you,
Jason Schonberg

--0000000000000591ac0621142ad1
Content-Type: text/x-patch; charset="US-ASCII"; name="nodejs-upgrade-20.16.0-20.17.0.patch"
Content-Disposition: attachment; 
	filename="nodejs-upgrade-20.16.0-20.17.0.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m0jzivre0>
X-Attachment-Id: f_m0jzivre0

Y29tbWl0IGMxZGRjNjBmZDI1NDU2ZGEwN2Q4NDAyYzg5MTU3YzQzNTRmZGU1YWMKQXV0aG9yOiBK
YXNvbiBTY2hvbmJlcmcgPHNjaG9ubUBnbWFpbC5jb20+CkRhdGU6ICAgV2VkIEF1ZyAyMSAxNzo0
MDowMyAyMDI0IC0wNDAwCgogICAgbm9kZWpzOiB1cGdyYWRlIDIwLjE2LjAgLT4gMjAuMTcuMAog
ICAgCiAgICBMaWNlbnNlIGNoYW5nZSAtIHJlbW92ZSBoaWdobGlnaHQuanMKICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9ub2RlanMvbm9kZS9jb21taXQvMWM1ZmUwNDBhMGE3M2I0ODNjYzNlM2ZlZjc2
ZWZlMmQxNzEyMjA1YgogICAgCiAgICBDaGFuZ2Vsb2cgOgogICAgaHR0cHM6Ly9naXRodWIuY29t
L25vZGVqcy9ub2RlL2Jsb2IvbWFpbi9kb2MvY2hhbmdlbG9ncy9DSEFOR0VMT0dfVjIwLm1kIzIw
LjE3LjAKICAgIAogICAgU2lnbmVkLW9mZi1ieTogSmFzb24gU2Nob25iZXJnIDxzY2hvbm1AZ21h
aWwuY29tPgoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9k
ZWpzLW9lLWNhY2hlLTIwLjE2L29lLW5wbS1jYWNoZSBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29s
cy9ub2RlanMvbm9kZWpzLW9lLWNhY2hlLTIwLjE3L29lLW5wbS1jYWNoZQpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL25vZGVqcy9ub2Rl
anMtb2UtY2FjaGUtMjAuMTYvb2UtbnBtLWNhY2hlCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMt
ZGV2dG9vbHMvbm9kZWpzL25vZGVqcy1vZS1jYWNoZS0yMC4xNy9vZS1ucG0tY2FjaGUKZGlmZiAt
LWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9kZWpzLW9lLWNhY2hlLW5h
dGl2ZV8yMC4xNi5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9kZWpzLW9l
LWNhY2hlLW5hdGl2ZV8yMC4xNy5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL25vZGVqcy9ub2RlanMtb2UtY2FjaGUtbmF0aXZlXzIw
LjE2LmJiCnJlbmFtZSB0byBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbm9kZWpzL25vZGVqcy1v
ZS1jYWNoZS1uYXRpdmVfMjAuMTcuYmIKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9ub2RlanMvbm9kZWpzXzIwLjE2LjAuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
bm9kZWpzL25vZGVqc18yMC4xNy4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9t
IG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9kZWpzXzIwLjE2LjAuYmIKcmVuYW1l
IHRvIG1ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9kZWpzXzIwLjE3LjAuYmIKaW5k
ZXggM2IyNzdjMmQ2Li5mZWUyZWVhZjkgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0
b29scy9ub2RlanMvbm9kZWpzXzIwLjE2LjAuYmIKKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRv
b2xzL25vZGVqcy9ub2RlanNfMjAuMTcuMC5iYgpAQCAtMSw3ICsxLDcgQEAKIERFU0NSSVBUSU9O
ID0gIm5vZGVKUyBFdmVudGVkIEkvTyBmb3IgVjggSmF2YVNjcmlwdCIKIEhPTUVQQUdFID0gImh0
dHA6Ly9ub2RlanMub3JnIgogTElDRU5TRSA9ICJNSVQgJiBJU0MgJiBCU0QtMi1DbGF1c2UgJiBC
U0QtMy1DbGF1c2UgJiBBcnRpc3RpYy0yLjAgJiBBcGFjaGUtMi4wIgotTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9Y2VmNTQ2NzZjNTQ3YTViYmFiNDRhYThiZTNiZTllZjci
CitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0yYWI4NWIzYmFlNDUxMjc2
YTEwOTE5MTYzYmNjNWI3NCIKIAogQ1ZFX1BST0RVQ1QgPSAibm9kZWpzIG5vZGUuanMiCiAKQEAg
LTMzLDcgKzMzLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBcCiBTUkNfVVJJ
OmFwcGVuZDp0b29sY2hhaW4tY2xhbmc6cG93ZXJwYzY0bGUgPSAiIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtcHBjNjQtRG8tbm90LXVzZS1tbWluaW1hbC10b2Mtd2l0aC1jbGFuZy5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZDZjOGZjM2ZmMjYwNmFhZGJj
NzE1NWRiNmY3ZTc3MjQ3ZDJkMDA2NWFjMThlMmY3ZjA0OTA5NTU4NGI4YjQ2IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjlhYmYwM2FjMjMzNjJjNjAzODdlYmI2MzNhNTE2MzAzNjM3MTQ1Y2IzYzE3
N2JlMzM0OGIxNjg4MGZkOGIyOGMiCiAKIFMgPSAiJHtXT1JLRElSfS9ub2RlLXYke1BWfSIKIAo=
--0000000000000591ac0621142ad1--

