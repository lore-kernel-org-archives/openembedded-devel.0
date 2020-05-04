Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.4448.1588593440480579126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 04:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rq/uJ/8G;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: wickbergster@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id t12so13266091edw.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=yGkGw0Msg9o2tuktqCbtkSmuEQNvobSYbYZtGhjvHWE=;
        b=Rq/uJ/8GDE3ErGwgel2HQbzmgEtbWtlKev0VQ7GekWZC3z7iPSOGuj3H3ZSAKj3h8P
         cnXnsywZsg1GXGs0aNm8Wtl/gXVnmv/PfEi185uKSLFiRi4DAWT3OhR/SLk5Qwc6Vw5Q
         MX1zxc7ghFMEMFS8u9VhLoPBNqlzHYzbHbpIFYTEfxd9jz9CQ9c4OvOCdpCA07GSZFO/
         12Z8/RScr01yzjgAavH4SOrAaSawC+gMGjgXGUfNOUm+4A2K9Vl1Zg40EBHRscguFSd6
         xo30vhn7550iWb9n0rSCKAyT+0VGOOk4UZBJuAA8YPjgtkWxTj0GopDibLSYiuOMOVXO
         yu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=yGkGw0Msg9o2tuktqCbtkSmuEQNvobSYbYZtGhjvHWE=;
        b=uh2hLdVUboqk1UWwU3cBrcBU0v55uMdhXIiEMNO5gKI2Y27H1C235nBBYe8OaMOXgC
         5CcHv6ZVB8HBMfpzhrr4uL4jdZtRDv5XIaAnYuVzmZk68jM28OhRreOfrFnFjyELtRTr
         6XA8zaBtlYDihxr+Gd7zRLs2V1h/yH1rHl9zmm/vS1XKMJanS3eFc+pY+sn29ZzEZh86
         NVUm/fVwJU/9z1IEMmil8+CUylxYMgTqEUcnMNV7c59BKKBI8Tl+Zpp/0oegaMxEB2/Z
         /6k6QDonoVIO3+OkO9U125ygtwgSUzTw+wVNTz1/66NbwtOPEOLV+rX0aO0x2VSdzlL7
         14iQ==
X-Gm-Message-State: AGi0PuZlwR+WB485BifuAfwDVH0OzqtTbEnKNhEDoTZRWMgHksEgW1Li
	tH9QVrKbztVuE7z0kUsk9F/WeyRo47ULo1bsgKbLnEDT
X-Google-Smtp-Source: APiQypJhgh+5AblbQ53mlnVbwh6lxyq5YCpZJiBNRfVjdw40bd9RF+9X37tji5n4s6uWAx6j4/fsNXoUfw4bDbgv0dQ=
X-Received: by 2002:aa7:c795:: with SMTP id n21mr14523990eds.6.1588593438703;
 Mon, 04 May 2020 04:57:18 -0700 (PDT)
MIME-Version: 1.0
From: wickbergster@gmail.com
Date: Mon, 4 May 2020 13:57:08 +0200
Message-ID: <CAAxSGfag8qgjxUOGSZRCQgQoYWDTpK7DaytoYC-BhmHBJJvpag@mail.gmail.com>
Subject: [meta-networking][PATCH] tcpdump: Fix PACKAGECONFIG for OpenSSL
To: "openembedded-devel@lists.openembedded.org Group Moderators" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009b436405a4d13bfc"

--0000000000009b436405a4d13bfc
Content-Type: text/plain; charset="UTF-8"

This fixes building TCPDump without OpenSSL. Current version does not
recognize the option --without-openssl.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 05fc99bdc..94543dd1d 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -27,7 +27,7 @@ inherit autotools-brokensep ptest
 PACKAGECONFIG ?= "openssl"

 PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
-PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl
--without-crypto,openssl"
+PACKAGECONFIG[openssl] = "--with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
 # Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
-- 
2.25.1

--0000000000009b436405a4d13bfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fixes building TCPDump without OpenSSL. Current versi=
on does not<br>recognize the option --without-openssl.<br><br>Signed-off-by=
: Alexander Vickberg &lt;<a href=3D"mailto:wickbergster@gmail.com">wickberg=
ster@gmail.com</a>&gt;<br>---<br>=C2=A0meta-networking/recipes-support/tcpd=
ump/<a href=3D"http://tcpdump_4.9.3.bb">tcpdump_4.9.3.bb</a> | 2 +-<br>=C2=
=A01 file changed, 1 insertion(+), 1 deletion(-)<br><br>diff --git a/meta-n=
etworking/recipes-support/tcpdump/<a href=3D"http://tcpdump_4.9.3.bb">tcpdu=
mp_4.9.3.bb</a> b/meta-networking/recipes-support/tcpdump/<a href=3D"http:/=
/tcpdump_4.9.3.bb">tcpdump_4.9.3.bb</a><br>index 05fc99bdc..94543dd1d 10064=
4<br>--- a/meta-networking/recipes-support/tcpdump/<a href=3D"http://tcpdum=
p_4.9.3.bb">tcpdump_4.9.3.bb</a><br>+++ b/meta-networking/recipes-support/t=
cpdump/<a href=3D"http://tcpdump_4.9.3.bb">tcpdump_4.9.3.bb</a><br>@@ -27,7=
 +27,7 @@ inherit autotools-brokensep ptest<br>=C2=A0PACKAGECONFIG ?=3D &qu=
ot;openssl&quot;<br>=C2=A0<br>=C2=A0PACKAGECONFIG[libcap-ng] =3D &quot;--wi=
th-cap-ng,--without-cap-ng,libcap-ng&quot;<br>-PACKAGECONFIG[openssl] =3D &=
quot;--with-crypto,--without-openssl --without-crypto,openssl&quot;<br>+PAC=
KAGECONFIG[openssl] =3D &quot;--with-crypto,--without-crypto,openssl&quot;<=
br>=C2=A0PACKAGECONFIG[smi] =3D &quot;--with-smi,--without-smi,libsmi&quot;=
<br>=C2=A0# Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing d=
isabled)<br>=C2=A0PACKAGECONFIG[smb] =3D &quot;--enable-smb,--disable-smb&q=
uot;<br>-- <br>2.25.1<br></div>

--0000000000009b436405a4d13bfc--
