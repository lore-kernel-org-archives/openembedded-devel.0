Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61B0CCFA01
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 21:43:01 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.28503.1727300575522736748
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Sep 2024 14:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VoE1Uv2e;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7124395ca86so141469a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300574; x=1727905374; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3NCsHJvTdaAwbTzpk2duswNJFoEF0laRMDwDjjq333E=;
        b=VoE1Uv2eVnjkZMVnbBEJaF2R9be22spj+mc0APhm9HOoWUGwddcxPVBRF/BZiy3QWO
         X7Rwc0DDJBSt5sT2SAtvPA/W+kwGK+srWor+gM7SBIzPIwXw8S05US33200G2Yp/IENL
         DaMSRuhaZ/DJ5XZ0YaT35CxD5fNkzhfVtvXuhhj6ZjvjC8od2SL0rxHeMFNE9B3HDwRc
         gVW9aGiSPNr3D7WKmYBh+PmIyLEuQ5qm5kdzg3g+enU7DfJ5WxhVTd33ji9dJ7zkglGB
         fAlcLqNrSZRvdbHV2aA9QfGsOmloKP4HFETBvEsZ0kmu8GbV7kpnHnrAE54og5mg/FPG
         bPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300574; x=1727905374;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NCsHJvTdaAwbTzpk2duswNJFoEF0laRMDwDjjq333E=;
        b=Ky5CKBebQT32lwJ3XeDp1WoQvuG+JJLXSJi0iV/5CHe7SnZ94wrB03xhYbCQOHyq8+
         H1q2dJwSh3KmGe7buVw8MOE8UqHDS/UdKFAH2qrXLAVNpMkwHM6XKA/LBuUmHJxou9vw
         3bas9BTXMMYcDmXDzp7TKa8AGD0mrut9HSTiKTT91jW3csFvG6G5lCArm7590yLngyah
         4IDa7UwcnuyoQ8asxarBedBVzvBSNpqHQu8NLWz5kwiyDiGdcgRlXtKMwk79BouZlf9u
         DRtd/yhLwLBOZI9QLD/6NDO5LQedVpElDiKEwsv30y2qfD84KZ96evADCf+UmG3f62HD
         Xidw==
X-Gm-Message-State: AOJu0YxkdwQEsWzKk2quteQgXs/SFE3nlpGAiAAvrjqmHHqSxmURC+ML
	f3UuaDycGUsTxxqsXUufrTYYieOIErLyrIqy3SulNj/jhkl1GJnDoPt0tZMCnBplPTpX2l+Mjqz
	Y628kfIprdNXuWMahTYX2OnAObNq3Cd0l
X-Google-Smtp-Source: AGHT+IGO6ucBO5M3wbWHVIXF2lTDYhNfFk41iiVV0iK7yqC5zFalWJtjVcFpEYutCuXVG2buMT0HxHDY71noHq+QkF8=
X-Received: by 2002:a05:6830:3894:b0:70c:9c46:b83d with SMTP id
 46e09a7af769-713c7e22dbbmr5128236a34.25.1727300574234; Wed, 25 Sep 2024
 14:42:54 -0700 (PDT)
MIME-Version: 1.0
From: "J. S." <schonm@gmail.com>
Date: Wed, 25 Sep 2024 17:42:43 -0400
Message-ID: <CABTo8gBOnxS__v3sywpuqUadqQRd_9OYLSVy=3ZM97Wo8UKung@mail.gmail.com>
Subject: [meta-oe][PATCH] syslog-ng: upgrade 4.6.0 -> 4.7.0
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/mixed; boundary="00000000000025e5020622f881ff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 21:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112501

--00000000000025e5020622f881ff
Content-Type: text/plain; charset="UTF-8"

Please find attached a patch to upgrade syslong-ng from version 4.6.0 to  4.7.0.

Thank you,
Jason Schonberg

--00000000000025e5020622f881ff
Content-Type: text/x-patch; charset="US-ASCII"; name="syslog-ng-upgrade-4.6.0-4.7.0.patch"
Content-Disposition: attachment; 
	filename="syslog-ng-upgrade-4.6.0-4.7.0.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m1ie4a330>
X-Attachment-Id: f_m1ie4a330

Y29tbWl0IDRiNjFkNDhlOGU5N2I0MjhlMTQ1NDQxMDU4ZGM1ZGU3YmJjZjE4YzMKQXV0aG9yOiBK
YXNvbiBTY2hvbmJlcmcgPHNjaG9ubUBnbWFpbC5jb20+CkRhdGU6ICAgV2VkIFNlcCAyNSAxNToy
NTo0NCAyMDI0IC0wNDAwCgogICAgc3lzbG9nLW5nOiB1cGdyYWRlIDQuNi4wIC0+IDQuNy4wCiAg
ICAKICAgIENoYW5nZWxvZyA6CiAgICBodHRwczovL2dpdGh1Yi5jb20vc3lzbG9nLW5nL3N5c2xv
Zy1uZy9yZWxlYXNlcy90YWcvc3lzbG9nLW5nLTQuNy4wCiAgICAKICAgIERyb3BwZWQgcGF0Y2gg
LSBtZXJnZWQgaW4gdGhpcyB2ZXJzaW9uIDoKICAgICAqIDAwMDEtbWFjcm9zLWd1YXJkLWlwdjYt
Y29kZS13aXRoLVNZU0xPR19OR19FTkFCTEVfSVBWNi5wYXRjaAogICAgCiAgICBOZXcganNvbi1j
IGRlcGVuZGVuY3kgZml4ZXMgY29uZmlndXJlIGZhaWx1cmUuCiAgICAKICAgIFNpZ25lZC1vZmYt
Ynk6IEphc29uIFNjaG9uYmVyZyA8c2Nob25tQGdtYWlsLmNvbT4KCmRpZmYgLS1naXQgYS9tZXRh
LW9lL3JlY2lwZXMtc3VwcG9ydC9zeXNsb2ctbmcvZmlsZXMvMDAwMS1tYWNyb3MtZ3VhcmQtaXB2
Ni1jb2RlLXdpdGgtU1lTTE9HX05HX0VOQUJMRV9JUFY2LnBhdGNoIGIvbWV0YS1vZS9yZWNpcGVz
LXN1cHBvcnQvc3lzbG9nLW5nL2ZpbGVzLzAwMDEtbWFjcm9zLWd1YXJkLWlwdjYtY29kZS13aXRo
LVNZU0xPR19OR19FTkFCTEVfSVBWNi5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggZjIxYWQ1ZDcwLi4wMDAwMDAwMDAKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvc3lz
bG9nLW5nL2ZpbGVzLzAwMDEtbWFjcm9zLWd1YXJkLWlwdjYtY29kZS13aXRoLVNZU0xPR19OR19F
TkFCTEVfSVBWNi5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQwICswLDAgQEAKLUZyb20gODk2
ZDc3ZGQ5NDliNTJkNmVhNTc5OGU1YTAzOGJhOTdkNmI4MDJiZSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKLUZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KLURhdGU6
IFRodSwgNCBBcHIgMjAyNCAxNTo0NDoxOCArMDIwMAotU3ViamVjdDogW1BBVENIXSBtYWNyb3M6
IGd1YXJkIGlwdjYgY29kZSB3aXRoIFNZU0xPR19OR19FTkFCTEVfSVBWNgotCi1XaXRoIGlwdjYg
ZGlzYWJsZWQsIHRoZXJlIGFyZSBsaW5raW5nIGVycm9ycyBjdXJyZW50bHkuCi1UaGlzIGZpeGVz
IGl0IGJ5IG5vdCB1c2luZyB0aGUgc3ltYm9scyB3aGVuIElQdjYgaXMgZGlzYWJsZWQuCi0KLVNv
bHZlcyAjNDgxMCB3aXRoIG15IGNvbmZpZyBvcHRpb25zCi1odHRwczovL2dpdGh1Yi5jb20vb3Bl
bmVtYmVkZGVkL21ldGEtb3BlbmVtYmVkZGVkL2Jsb2IvMjQ4N2U2NWVlMzg0MmI2YWUwYzdhMjYy
ODk4NWJlNjE4OWVkOWViZi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zeXNsb2ctbmcvc3lzbG9n
LW5nXzQuNi4wLmJiCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1
Yi5jb20vc3lzbG9nLW5nL3N5c2xvZy1uZy9wdWxsLzQ4ODBdCi0KLVNpZ25lZC1vZmYtYnk6IFBl
dGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4KLS0tLQotIGxpYi90ZW1wbGF0ZS9t
YWNyb3MuYyB8IDIgKysKLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCi0KLWRpZmYg
LS1naXQgYS9saWIvdGVtcGxhdGUvbWFjcm9zLmMgYi9saWIvdGVtcGxhdGUvbWFjcm9zLmMKLWlu
ZGV4IDU0MTQyNzA2Yy4uZmNiODM2MzdmIDEwMDY0NAotLS0tIGEvbGliL3RlbXBsYXRlL21hY3Jv
cy5jCi0rKysgYi9saWIvdGVtcGxhdGUvbWFjcm9zLmMKLUBAIC0yNzcsMTIgKzI3NywxNCBAQCBf
Z2V0X29yaWdpbmF0aW5nX2lwX3Byb3RvY29sKGNvbnN0IExvZ01lc3NhZ2UgKm1zZykKLSAgICAg
cmV0dXJuIDA7Ci0gICBpZiAoZ19zb2NrYWRkcl9pbmV0X2NoZWNrKG1zZy0+c2FkZHIpKQotICAg
ICByZXR1cm4gNDsKLSsjaWYgU1lTTE9HX05HX0VOQUJMRV9JUFY2Ci0gICBpZiAoZ19zb2NrYWRk
cl9pbmV0Nl9jaGVjayhtc2ctPnNhZGRyKSkKLSAgICAgewotICAgICAgIGlmIChnX3NvY2thZGRy
X2luZXQ2X2lzX3Y0X21hcHBlZChtc2ctPnNhZGRyKSkKLSAgICAgICAgIHJldHVybiA0OwotICAg
ICAgIHJldHVybiA2OwotICAgICB9Ci0rI2VuZGlmCi0gICByZXR1cm4gMDsKLSB9Ci0gCi0tLSAK
LTIuMzAuMgotCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zeXNsb2ctbmcv
c3lzbG9nLW5nXzQuNi4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvc3lzbG9nLW5nL3N5
c2xvZy1uZ180LjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhLW9l
L3JlY2lwZXMtc3VwcG9ydC9zeXNsb2ctbmcvc3lzbG9nLW5nXzQuNi4wLmJiCnJlbmFtZSB0byBt
ZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zeXNsb2ctbmcvc3lzbG9nLW5nXzQuNy4wLmJiCmluZGV4
IGFiNGE4ZDE4Mi4uNTg4YTM4MTI2IDEwMDY0NAotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9zeXNsb2ctbmcvc3lzbG9nLW5nXzQuNi4wLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L3N5c2xvZy1uZy9zeXNsb2ctbmdfNC43LjAuYmIKQEAgLTEzLDcgKzEzLDcgQEAgTElDRU5T
RSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9OTI0OTU4Y2VmYzlmN2RlM2UwYjgxODgzMmI4YTFjZWMiCiAKICMg
dXRpbC1saW51eCBhZGRlZCB0byBnZXQgbGlidXVpZAotREVQRU5EUyA9ICJsaWJwY3JlIGZsZXgg
Z2xpYi0yLjAgb3BlbnNzbCB1dGlsLWxpbnV4IGJpc29uLW5hdGl2ZSBjdXJsIgorREVQRU5EUyA9
ICJsaWJwY3JlIGZsZXggZ2xpYi0yLjAgb3BlbnNzbCB1dGlsLWxpbnV4IGJpc29uLW5hdGl2ZSBj
dXJsIGpzb24tYyIKIAogU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vYmFsYWJpdC9zeXNs
b2ctbmcvcmVsZWFzZXMvZG93bmxvYWQvJHtCUH0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAg
ZmlsZTovL3N5c2xvZy1uZy5jb25mLnN5c3RlbWQgXApAQCAtMjMsMTEgKzIzLDEwIEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2JhbGFiaXQvc3lzbG9nLW5nL3JlbGVhc2VzL2Rvd25s
b2FkLyR7QlB9LyR7QlB9LnRhCiAgICAgICAgICAgIGZpbGU6Ly9zeXNsb2ctbmctdG1wLmNvbmYg
XAogICAgICAgICAgICBmaWxlOi8vc3lzbG9nLW5nLnNlcnZpY2UtdGhlLXN5c2xvZy1uZy1zZXJ2
aWNlLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkcGF0aHMtd2Fybmlu
Zy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW1hY3Jvcy1ndWFyZC1pcHY2LWNvZGUt
d2l0aC1TWVNMT0dfTkdfRU5BQkxFX0lQVjYucGF0Y2ggXAogIgogU1JDX1VSSTphcHBlbmQ6cG93
ZXJwYzY0bGUgPSAiIGZpbGU6Ly8wMDAxLXBsdWdpbi5jLXdvcmthcm91bmQtcG93ZXJwYzY0bGUt
c2VnZmF1bHRzLWVycm9yLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjY5ZTMzNjBk
ZmI5NmE3NTRhNGUxY2JlYWQ0ZGFlZjM3MTI4YjExNTJhMjM1NzIzNTZkYjRhYjY0YTQ3NWQ0ZiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiNjAxMjY1MzYyYzYzM2EyNWYyNmM0OTdhN2U1NzU5Mjcz
OWQ1YTU4M2I3OTYzYjcyMmZmNThmMDFiODUzNTA2IgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAi
aHR0cHM6Ly9naXRodWIuY29tL2JhbGFiaXQvc3lzbG9nLW5nL3JlbGVhc2VzIgogCg==
--00000000000025e5020622f881ff--

