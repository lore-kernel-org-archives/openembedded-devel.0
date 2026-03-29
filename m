Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73A3FC97E8
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 18:57:41 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34825.1774810652120031763
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 11:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JKt/FUw8;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d7447778b9so1947909a34.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 11:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774810651; cv=none;
        d=google.com; s=arc-20240605;
        b=eIMZXSBupS/gkMSmB/q42B+eR1C0bGOyAgZE6O5GdKR7UwJNOJilUwDRbtiKVPM40v
         77zMhiSv5jPj0rovA3H8xi0zqxtqI1iEz+OAf0rQgAcggyG7VgiDjlPXRQ/ykvyCbicy
         1Xw2HZsGrShlSTdH6nvh/a2v5Y8J+Ux/8S2+1OIDm62ahv1Hi0pbwuQJsBliiCGSVSL6
         ggf0FOMTgdupujkfHERzwRLAw22C6poYdS15wpc4tVitGdzOFc9Dj5kPSgtApCKikD5/
         NgKC2RTrJqljZkCfGU4YuGyIFaufhjy7i058s+Z187G7QNfvEb3JO/44/C1crdTT7040
         bQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FPVeq6vLW0PbrzvU0BXHipHSwP8xQSWAqs9KkgJ0WdY=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=LpqKnDmH2GJJCelQmNupDNQ2r0+B4SyoMOgy8F/BR/vrdc6oX8cy76uZRMhiksQPAl
         DPahj7F5dupr2MwJWmO6IQ0gyokyJlJl3843UNtDikBLxSVslSGVl4A7PUXEeIr5OV0w
         4LRXOMeE0TPJyUmwUrV6fhT4kSYMeceQnjqOokM49MeL0qbMqQ6hOCNo3Seb+Zq438x0
         NYgorTy0GGqaqJ/UCDRJjduGTS+pj3Pyq7DVsBcO/vAxYEXubsngg3CUy0V6dUhoCbIl
         /K5aenfPC4u5hVuHBZ6Kwj16CaemC/2gyQFF6z2Sbo+9OudA90ZofMJVN1f+uDISCvJR
         Oihg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810651; x=1775415451; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPVeq6vLW0PbrzvU0BXHipHSwP8xQSWAqs9KkgJ0WdY=;
        b=JKt/FUw8ipa23IsZKwiLZ3jUdLPCuWLdi7pf4Bxot2+qplTOo/HIvq8qpYS+QEWhL8
         lk+5jMKtxWMSo91PgbB0GMhnuLJq+FLeb2lWWeEomqme+rtkgwTVCgLDK8idB+QbtS4j
         J3XTI3PzXazlzzbpiuUDa4U+TNkUD0YtsXW7QAKV0sExdEYgWWs3Ki2tdQ2V20jeAjoN
         2Ftguk59dJPSj84G8JBgvlWx5tqysK/HWrSLCKd40U+q0FZreabsTayIeBcbfrdCKnx2
         gdxQ7u6VqxwgFbSu2k8HAat/GuZfYNuHA2cwo4T1Qz2cN9k6GkVGm/tA74UPNrBA+MEZ
         DLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810651; x=1775415451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPVeq6vLW0PbrzvU0BXHipHSwP8xQSWAqs9KkgJ0WdY=;
        b=A041Ff+q+6RkoxRLMaCUHrSLrEKFUqb1QwHs8tMYx4rPzvzWdyqZE/zVTgd2ipmyi1
         w5KsGdzmKaSA2/Bprt8MmF1OAFQRjoNt09D8Rz8muw4nnubbJwZ2bpkNU4pgRbuX2XxR
         q2v4RzxEbv1XNxsp+AQT52snVbkywCMkHgSDGpYwwwdZWnwmjJ3qCSNhzVjPQbEQQ8Cr
         jyGARppA2wvUNeO3xL1PSIYkxrFQQyC4mDkJXLrZB8T0eeZW8luhp5VFb4G3h9bJcd7M
         0aCIk0KqYVJx9vN8i7GkLC2460Q78D/FM5smGrwNpsJyWVSU6JBd4i79BxS1a3OJIsIC
         CfRw==
X-Gm-Message-State: AOJu0Ywly9cSaF3Opn40Rt3zqTVYVVXZsOkTR58KE0wUsart7FaRjKqD
	FK2DK7+5cAKfS3MlewVw48RcU+y4zJMB8eIRIVqv+sEli5jNMFyumLFd2e+AN1FnLY+Df2q+fTo
	spaFWmKrfG5OTn7uP1n5nYwUHKtjEVEMkFqnS
X-Gm-Gg: ATEYQzyBuWMqDSC+5I05XccPrFNreRC30nPGikDkazbUaYQUVyoxXnnD+SzR+a6IeCF
	pcTmqQOI1L/5V9ZZ76Uen0eVj0bIhOv/5q2EMw5t98fNXlMWW2de82lKE9XvzrOYLiBgWwWi3sh
	T4315avNT9N0h6sRjohfDVWGARVM1f6emubkL658O+emfDmhAu3Pzs/iliVUx8IlMnhzNQu9NU+
	feMUq3Sg/sbEJXgzwTCjLWgEB6JkNziuBwh66xQhrydMLCgV9JyBYUY6hM9hQJyU4fqW8LN4c4u
	y25uWE07
X-Received: by 2002:a05:6820:1506:b0:67e:2adf:1e68 with SMTP id
 006d021491bc7-67e2adf205emr2028605eaf.68.1774810651077; Sun, 29 Mar 2026
 11:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260328213046.2297947-1-mail@michael-fitzmayer.de>
In-Reply-To: <20260328213046.2297947-1-mail@michael-fitzmayer.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 30 Mar 2026 07:57:20 +1300
X-Gm-Features: AQROBzBMPYV3VG2KiNiVvIJ0ry84MmYdHcKwRH3jV05UVNG-tr-Bj-0U6N_yOZw
Message-ID: <CADySD0Hh1Y9ymzZxXwd08hPrEvcezw47nnpMB3_UyngazXwNbw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Add recipe: canvenient 1.00
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 18:57:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125806

On Sun, Mar 29, 2026 at 10:30=E2=80=AFAM Michael Fitzmayer via
lists.openembedded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> CANvenient is an abstraction layer for multiple CAN APIs on Windows and L=
inux. It provides a unified
> interface for CAN communication, allowing developers to write code that i=
s portable across different
> platforms and CAN hardware.
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  .../canvenient/canvenient_1.00.bb             | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/canvenient/canvenient_1.00.b=
b
>
> diff --git a/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb b/met=
a-oe/recipes-devtools/canvenient/canvenient_1.00.bb
> new file mode 100644
> index 0000000000..a4d5a212c1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/canvenient/canvenient_1.00.bb
> @@ -0,0 +1,41 @@
> +
> +SUMMARY =3D "CANvenient is an abstraction layer for multiple CAN APIs \
> +          on Windows and Linux. \
> +          "
> +DESCRIPTION =3D "CANvenient is an abstraction layer for multiple CAN API=
s on \
> +              Windows and Linux. It provides a unified interface for CAN=
 \
> +              communication, allowing developers to write code that is \
> +              portable across different platforms and CAN hardware. \
> +              "
> +HOMEPAGE =3D "https://canopenterm.de/canvenient"
> +BUGTRACKER =3D "https://github.com/CANopenTerm/CANvenient/issues"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe=
7dda79"
> +
> +DEPENDS =3D "libsocketcan"
> +
> +SRC_URI =3D "git://github.com/CANopenTerm/CANvenient.git;protocol=3Dhttp=
s;branch=3Dmain"

can please include tag=3Dv${PV} in the SRC_URI

> +
> +SRCREV  =3D "abdfc48b316b3644ec1d0d225c45fd0fd8b07dd7"

Is this intentional? Because upstream tagged commit is
c1a2c37361cf9dd9c87e213146e37b36be306c8a

> +
> +inherit cmake ptest
> +
> +
> +do_install:append() {
> +    install -d ${D}${includedir}
> +    install -d ${D}${libdir}
> +
> +    install -m 0644 ${S}/include/CANvenient.h ${D}${includedir}/
> +    install -m 0755 ${B}/libCANvenient.so.1.0.0 ${D}${libdir}/
> +
> +    ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenient.so.1
> +    ln -sf libCANvenient.so.1.0.0 ${D}${libdir}/libCANvenient.so
> +}
> +
> +FILES:${PN} +=3D "${libdir}/libCANvenient.so ${libdir}/libCANvenient.so.=
*"
> +FILES:${PN}-dev +=3D "${includedir}"
> +
> +SOLIBS =3D ".so"
> +
> +RDEPENDS:${PN} =3D "libsocketcan"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125802): https://lists.openembedded.org/g/openembedde=
d-devel/message/125802
> Mute This Topic: https://lists.openembedded.org/mt/118556741/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

