Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D91C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 00:40:40 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.9568.1724200834654762481
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ROxSpGW0;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: schonm@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70940c9657dso2882863a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 17:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724200834; x=1724805634; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1IhNR2uEYjqPL74+8JJYSP2IT+xlDL9/TtHA2oUBDXQ=;
        b=ROxSpGW0dZ7ovkjO0qJhqIyM5q7dmNhmDW8lVKZdP1N4OEoldnwUVX8KFK2yQaF4np
         2N9AlHHtz/9DAvItVUpg6iLXHSWPHTCPXLJmgYa5xvZFo2yMgyurzVhZavveeMEsUWz/
         xCs+bu+ytjFNbTHYAGRIqaW4VtmeaRd0YIRHnyeZhHAxtUzOI9SYn/QXcmhjoadxWoCw
         6Aj9CHkE8KGgLblQV6oHD26xR7OjnBSEwigTUkCMM9l0kwyGJP2M2ZD+9Y32AgnInBSD
         KNy1bwU8uuXQsRNHs9mXjDuGDONJQTpsd+yN/UccFj7DCiFktgwownKYEHUO2GjjyzVC
         6fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724200834; x=1724805634;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1IhNR2uEYjqPL74+8JJYSP2IT+xlDL9/TtHA2oUBDXQ=;
        b=KQ7CdQEPt13cCqyGntC1QasE8hgZiENqrJXr3SIqSDYhPe7uVAmDcULu+7kmUFnSkJ
         YUX0suji+sa0UmVr+Ry52Qgb/A9zKpgkK8HYXbTKb3NYsBJJO8Y0TSzERZccd6gANBXE
         SxBqmpzTv8RQjomWXXXTZIZS98sUSXUzfDWZZTHSDkTIGlzoX8b5FK3on8Y6IDyRtC5+
         QMJ86X9Ws0manUO36Dvz2ldOOtH1GhtQR6qMFhFM7V0Z5TAOtqXK41L5NA9yNRwE/xZn
         siVQYOcPHWT/4BrTBQFyhiuKik4Bq319ii7cVpBllSlW9QSRo5FhrSCi/GlHr0kY6iQW
         A4hQ==
X-Gm-Message-State: AOJu0Yz+tGdn3i6emSHt8YF35HqhB7r0hthDrT4XvFaJ4hdR7yPe8tMe
	ozETSK/HEAf39P6yxXqFK9mqUSaH0twmYpNevQsmRTjmkFzOkHZfbua5JqxqqXiMqoKC+wrdhm2
	9lJ0q1ZO4A7JpV48md+QHO56P9FL7fLC0
X-Google-Smtp-Source: AGHT+IEJxYu5UUc/xbRUTb7VLJSHnwk7G4SeW+VHOWFAv1/8VF0lT1LSdKnxHO4h5A6Rg9klKUAQ8ivCQESIwgvJcFI=
X-Received: by 2002:a05:6870:e0c7:b0:26f:fc66:e456 with SMTP id
 586e51a60fabf-2737eeaae8amr635985fac.4.1724200833204; Tue, 20 Aug 2024
 17:40:33 -0700 (PDT)
MIME-Version: 1.0
From: "J. S." <schonm@gmail.com>
Date: Tue, 20 Aug 2024 20:40:22 -0400
Message-ID: <CABTo8gAO181y199LjOHn-4ShmudgMk7-3-TuAyQ+ypcMRhfzgw@mail.gmail.com>
Subject: [oe][meta-webserver][PATCH] webmin: upgrade 2.111 -> 2.202
To: openembedded-devel@lists.openembedded.org
Cc: derek@asterius.io
Content-Type: multipart/mixed; boundary="0000000000002f78ec062026caf2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111873

--0000000000002f78ec062026caf2
Content-Type: text/plain; charset="UTF-8"

 Please find attached a patch to upgrade webmin from version 2.111 to 2.202.

Thank you,
Jason Schonberg

--0000000000002f78ec062026caf2
Content-Type: text/x-patch; charset="US-ASCII"; name="webmin-2.202.patch"
Content-Disposition: attachment; filename="webmin-2.202.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m034ms0s0>
X-Attachment-Id: f_m034ms0s0

Y29tbWl0IGY2ZDI3ODEwYjRmNDg1NjJhMDZjZTUwMDZiMTU1OTM3OGYzMGM5OWMKQXV0aG9yOiBK
YXNvbiBTY2hvbmJlcmcgPHNjaG9ubUBnbWFpbC5jb20+CkRhdGU6ICAgTW9uIEF1ZyAxOSAwMDoy
Njo0OCAyMDI0IC0wNDAwCgogICAgd2VibWluOiB1cGdyYWRlIDIuMTExIC0+IDIuMjAyCiAgICAK
ICAgIENoYW5nZWxvZzoKICAgIGh0dHBzOi8vd2VibWluLmNvbS9jaGFuZ2Vsb2cvd2VibWluLTIu
MjAyLXJlbGVhc2VkLwogICAgCiAgICBNb2RpZmllZCBuZXQtZ2VuZXJpYy5wYXRjaCB0byB1cGRh
dGUgYSBoYXJkY29kZWQgdmVyc2lvbiBudW1iZXIgdG8gYXZvaWQKICAgIHBhdGNoIGZ1enouCiAg
ICAKICAgIFNpZ25lZC1vZmYtYnk6IEphc29uIFNjaG9uYmVyZyA8c2Nob25tQGdtYWlsLmNvbT4K
CmRpZmYgLS1naXQgYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLXdlYmFkbWluL3dlYm1pbi9maWxl
cy9uZXQtZ2VuZXJpYy5wYXRjaCBiL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtd2ViYWRtaW4vd2Vi
bWluL2ZpbGVzL25ldC1nZW5lcmljLnBhdGNoCmluZGV4IDVmZDgzYTQyOS4uZjE5NjVhNzg4IDEw
MDY0NAotLS0gYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLXdlYmFkbWluL3dlYm1pbi9maWxlcy9u
ZXQtZ2VuZXJpYy5wYXRjaAorKysgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLXdlYmFkbWluL3dl
Ym1pbi9maWxlcy9uZXQtZ2VuZXJpYy5wYXRjaApAQCAtNiw3ICs2LDcgQEAgU2lnbmVkLW9mZi1i
eTogUGF1bCBFZ2dsZXRvbiA8cGF1bC5lZ2dsZXRvbkBsaW51eC5pbnRlbC5jb20+CiAtLS0gYS9u
ZXQvbW9kdWxlLmluZm8KICsrKyBiL25ldC9tb2R1bGUuaW5mbwogQEAgLTEsNyArMSw3IEBACi0g
dmVyc2lvbj0yLjExMQorIHZlcnNpb249Mi4yMDIKICBsb25nZGVzYz1Db25maWd1cmUgYm9vdCB0
aW1lIGFuZCBhY3RpdmUgaW50ZXJmYWNlcywgRE5TLCByb3V0aW5nIGFuZCAvZXRjL2hvc3RzLgog
IG5hbWU9TmV0d29ya2luZwogLW9zX3N1cHBvcnQ9c29sYXJpcyBjb2hlcmVudC1saW51eCByZWRo
YXQtbGludXgvNS4wLSogbWFuZHJha2UtbGludXggdW5pdGVkLWxpbnV4IHN1c2UtbGludXgvNi4w
LSogb3Blbi1saW51eCB1bml4d2FyZSB0dXJiby1saW51eC80LjAgZnJlZWJzZC8zLjItKiBvcGVu
YnNkIGRlYmlhbi1saW51eC8yLjItKiBjb2JhbHQtbGludXgvMi4yLSogbXNjLWxpbnV4IGdlbnRv
by1saW51eCBtYWNvcy8xLjUtKiB0cnVzdGl4LWxpbnV4IHNsYWNrd2FyZS1saW51eC84LjAtKiBv
cGVubWFtYmEtbGludXggY3lnd2luIHdpbmRvd3MgcGFyZHVzLWxpbnV4CmRpZmYgLS1naXQgYS9t
ZXRhLXdlYnNlcnZlci9yZWNpcGVzLXdlYmFkbWluL3dlYm1pbi93ZWJtaW5fMi4xMTEuYmIgYi9t
ZXRhLXdlYnNlcnZlci9yZWNpcGVzLXdlYmFkbWluL3dlYm1pbi93ZWJtaW5fMi4yMDIuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy13ZWJh
ZG1pbi93ZWJtaW4vd2VibWluXzIuMTExLmJiCnJlbmFtZSB0byBtZXRhLXdlYnNlcnZlci9yZWNp
cGVzLXdlYmFkbWluL3dlYm1pbi93ZWJtaW5fMi4yMDIuYmIKaW5kZXggNjA1OGFmYjhjLi4xODA4
MjE0OWIgMTAwNjQ0Ci0tLSBhL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtd2ViYWRtaW4vd2VibWlu
L3dlYm1pbl8yLjExMS5iYgorKysgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLXdlYmFkbWluL3dl
Ym1pbi93ZWJtaW5fMi4yMDIuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JDX1VSSSA9ICIke1NPVVJD
RUZPUkdFX01JUlJPUn0vd2ViYWRtaW4vd2VibWluLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IGZpbGU6Ly9teXNxbC1jb25maWctZml4LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3dlYm1p
bi5zZXJ2aWNlIFwKICAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MDAwY2U1
NTI3NTQ5NDgwMmVjNDMzZTJkZTYzNDI4OTk4OWY1ZDk5ZWEyOTcwNzE2ZDdkOWM5N2UzOGYyZjVl
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRmMWM0NjdhZWRhMGRlZDU0NmU2OWYzMzJjNzY4NjY1
YjZhMDUzN2Q2YTY5ZTYwOTIyMWY5NDY1MTIxZjc3NWUiCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAi
aHR0cDovL3d3dy53ZWJtaW4uY29tL2Rvd25sb2FkLmh0bWwiCiBVUFNUUkVBTV9DSEVDS19SRUdF
WCA9ICJ3ZWJtaW4tKD9QPHB2ZXI+XGQrKFwuXGQrKSspLnRhci5neiIKIAo=
--0000000000002f78ec062026caf2--

