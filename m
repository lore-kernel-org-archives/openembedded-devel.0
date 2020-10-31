Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web12.3345.1604166785769827305
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Oct 2020 10:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YFyJK0X7;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id f140so8016956ybg.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2020 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ENDqqv3FL6J43cwktYdQUSX3KT8KnzkW59D01wEu7m8=;
        b=YFyJK0X7zwZURJfJYYEA6QYNWxXrovWbYk5PXCu5WjJoJFmq2gKg9pgcUIOwPqCAI8
         7jNsr6Iv1RSBpJ6QRzqW6qbtiD4y7/cKsnf3pjWhYVb79eP5r3w/uSP0vWfoEXWbaTNS
         aQCmsH4Pzviwry0bRHXJVPh0fu/LDGs4NCdUc7m4p34CJeUFf7RuI7bNcwzQG22V6Mu4
         QoaDaCh2QRvZtkZWECDQX2CAxEvpC2SYDSaXgRgbZKzO179DI60JEZaoHX+4BAI9aqK8
         8MeQrKVhUswikje1llL7gJiwBWoNGiWp2OE6Za1vb0d6B1GwS8pKstBmwYBzt/p8oHyB
         kenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ENDqqv3FL6J43cwktYdQUSX3KT8KnzkW59D01wEu7m8=;
        b=qR+tkKrex7RIeGO25DVa51tL1b8ROvgH2r7tc0r51vK/2kkzYoihttMR5HWsLcOJJT
         LTJQzhM+raGl8jYzvHd7StoZqKGkp6hmYq5A39rc+hkcMlof/4zL+XDf4lkOIwRGW3xh
         9xlIImUhDRfmUYvCWEwECs0UKk/LfZkJH7GcaYTaWaQv/a7/GmdCl0zBmFqp8FsG7JIB
         Keh9heWbmcGQcS8UvwnduMN1hmJprg60xjinTH16uYX//2+5lVFeLhrFAtYoGG+Jx/vV
         qq6K9sidPBLVsH9fgI4EEk3kfZPRzg1cZrlbs4ONZjtuESsLdcjiaKu+8fV/3IWJyzjW
         UTBg==
X-Gm-Message-State: AOAM531HI7YAaFizkoQcMXS+sbJ2UUYxeZhGZoVbpw3jmNeuF9xNg5Lg
	EKrApOMVk/c1QbjeGRv4zEUoRhsuysSUxpM2jl8=
X-Google-Smtp-Source: ABdhPJxhzXxXsciKbU6CkJYl3qGgDKy+SaoQaEYKXNnsBXrSDFItPjBrv3uTeyU+/HQbHwQhLEHKJlz7CkgeKb2B/1s=
X-Received: by 2002:a25:84cd:: with SMTP id x13mr10533165ybm.430.1604166784911;
 Sat, 31 Oct 2020 10:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <BM1PR01MB401942C1F999143BBD303E4E87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BM1PR01MB401942C1F999143BBD303E4E87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Sat, 31 Oct 2020 07:52:54 -1000
Message-ID: <CAGDS+nmwC5mS4qLdLe2Kc3oiEBrSRd6MCnjMHfiv5oAQzJ21=Q@mail.gmail.com>
Subject: Re: [oe] CPE update for polkit
To: saloni <saloni.jain@kpit.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	"Nisha.parakkat@kpit.com" <Nisha.parakkat@kpit.com>, Anuj Chougule <Anuj.Chougule@kpit.com>, 
	Akash Hadke <Akash.Hadke@kpit.com>, Aditya Tayade <Aditya.Tayade@kpit.com>, 
	Nilesh Pawar <Nilesh.Pawar@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Requests for CPE database updates should be sent to: cpe_dictionary@nist.go=
v

Sending them to the OE list won't result in any changes to the database ;-=
)

Steve

On Fri, Oct 30, 2020 at 9:46 AM saloni <saloni.jain@kpit.com> wrote:
>
> Hello,
>
> I would like to make some restrictions to polkit CVE-2013-4288
> https://nvd.nist.gov/vuln/detail/CVE-2013-4288
>
> The changes for the said CVE were fixed in Source-Version: 0.112-1 and a=
re now merged in the reported distributions on stable releases.
> Please find the reference to the links and tar file attesting the same:
>
> http://snapshot.debian.org/archive/debian-security/20181206T212649Z/pool=
/updates/main/p/policykit-1/policykit-1_0.105-18%2Bdeb9u1.debian.tar.xz
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1002375
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D723717
> https://ubuntu.com/security/notices/USN-1953-1
> https://www.security-database.com/detail.php?alert=3DCVE-2013-4288
> https://vuldb.com/?id.65188
>
> The references on above links claims that upgrading to stable releases e=
liminates this vulnerability.
>
> Regards,
> Saloni Jain
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
