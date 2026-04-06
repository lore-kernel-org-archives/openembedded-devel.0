Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B484DF46C5A
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 16:46:29 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59404.1775493988570600628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 09:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i/4BLC/C;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501418152cso3813235d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 09:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775493988; cv=none;
        d=google.com; s=arc-20240605;
        b=a87WtEVLoZaiK6SK+Q8EmwbrYrZSFoqwDGsFVPAZSmkVSYpDZOfyhm6KP54ujH5V4q
         TDBHJqs5Xyu5B5dbgrlmKpo3KR6G4rxn7RUAl8LNY21/XexKRy8vPOsvPgOSnkuK48KE
         Zze4Aq5h4yZVf7QZenYEOXClkooQgylPTjfsMtiLrKHRfgKuXGWn7eRXuIkljWQMRb/9
         P8oiG2V4hyS80Kq0o5bi754Asi5J3VYuASeK1jW+5sPaieztTLsvfkPcQwfSsOmByS+V
         pwCVjE+xTzhtshyqY7oOFtgiZ5WjYcSGTYG7Ia3vy7/4IkCuye/BTDM1CqsEbnlvFsFf
         DzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bXAH+tDFnbCwE/DHJ33e8YghTKNyV8LEK9VoDD2ZBkk=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=ihKqgnXhLu0yEXUTogmvgKigZkeYeOaWRN2xMn6+0Mxe1jGbSlfAI7SzuO/FKqBM7/
         Iie1h3dC823gSJEMv9J6596VAXFgoNm2I4XKef/MrCmL8x1H0okTs/3K7vo4zIQfifqD
         1S1LZLoOMTqtkHmoKekSmc70UxvpaP2PyqnV6HgVbpS+iZA+0KPUZq1AXq0L6Rmaxs3L
         euu4xvsBulGrbd0StO57GwNaFG5goLyVel310eznx7ZoiYJ3TEN8RVU/vMRyKS38kih6
         t9o2TvJBEdyPRVjasVV45CSEvklx21bRjRtuxni5pyVPVCl0MsE/YPiTM1WtxzVZo296
         n9Og==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775493988; x=1776098788; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bXAH+tDFnbCwE/DHJ33e8YghTKNyV8LEK9VoDD2ZBkk=;
        b=i/4BLC/CXx98oLw89tGWltdlZEa6wcJdOcn0wwqt10DY+62v6MxZ+XgLHBMltcj8ZE
         bA8FlWkGBZGeV8VJTUo20Dg2NIqX4sGvyJsDEBNdBJcXzPDeRUF/fT9pilKw6wkrNfrT
         ZvJcCclnPBtPNyQKXlqjd8noiN7u1i8hBULGUAYImx6HXNxGi3h3Qxfp0KyZpnKfJw2g
         LNeqcETpSB1HfesixEM1SqLheZfWo/qH4d118BSr/S0eD6Tgh/maYA6IWyBl1besK4yV
         ke9sw+K/fvecKEjzdXKtXAN3EuQa9KKiSB2pJwaTq9orIFdReu23NHEvoJzW6yktzrUy
         AAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493988; x=1776098788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXAH+tDFnbCwE/DHJ33e8YghTKNyV8LEK9VoDD2ZBkk=;
        b=kqdymZzzhHrTTUfLXXtYb/LmJbp5dA3OSHcwGGfeexBJYl2sP+PD8L2CwPhBwHJOvz
         NcfdrjE1Hfk3cZX78+xM2l8RMn1s4mwU+oZyjKfsVncwIxyA2qYhJxDDB6NUT1qNqKHR
         qW7veiuSZKX11BYIUM250v3u1k8TZpkpsItZ1njprfiU8DP6ZhaNsoVnIy2B35SzUK32
         tvyB8OHJzfB2uiVhrtQJB9NEKBjEAXVu5dJxEiKYqPnl1WwUI43vWfe2mrqthWybMrm3
         S9fv8Xke0cMvSYFKe6BPGpJ2oQNg1mhYriGXn/Tw4dpa1liO+ytLWirUfgCgv2zDTDaZ
         bDGg==
X-Gm-Message-State: AOJu0Yzq8HMDe/2tIkUOkLgwKoTW8m1vIp/IHx+fPKg4s9oVj4mL/8Bt
	1eLwjQAyxdrGAagjzK5xjSZ7hoAEhY+BpDxdgvx0vM3J39cmUBGbjsttxJM251BhT5IX3GuR06w
	wENYYwIAyOhnQXHLrzWE1207SVIKhLrI=
X-Gm-Gg: AeBDieub+RRkgkLCllCuMP1uLIYnzZU8Q8YzmokxJsBSWBI/4+m8wDbh06VV3ze4Rtz
	E9m+eKlZbJqnjY1EQ791VtJfRih3J1aTcn3+x4bSpDNibp8PJQuqsI3AeQT/Uq7BDKR11iOWBOp
	dAVTKLcAAwL71I/QmvrfEbGcrB61iE6JZymf46UdpmIm9FI8yiI3ja02cSTdoqXr1A1RdvEH3la
	exzjdd/9KKQxT7wVUcvpB9D1EqtpDTanUmDBj2zvBtfkrAlXMsHuaOWpHpNwHUrdqcFCuapLuH+
	6MtSg/lnwEm/gsDbHAlXQKZEWTfH/DfXIGDLvl2omlopkPPaxAFWDKLvWYdbS1GcMiHS9mF6iD1
	X00lvjSg3mnll4wx/r7XZagzxSRKdmo0kfk0=
X-Received: by 2002:a05:690e:1309:b0:649:c36a:a9bb with SMTP id
 956f58d0204a3-650488bf9d6mr12854725d50.61.1775493987494; Mon, 06 Apr 2026
 09:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260406155044.3662500-1-skandigraun@gmail.com>
In-Reply-To: <20260406155044.3662500-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Apr 2026 09:45:59 -0700
X-Gm-Features: AQROBzCxfB8VQXKOFNaax313fsBPl537CIMdeBQVwSbyp5VfbmBw9ecxcKl56h4
Message-ID: <CAMKF1sqY05YKLDQjhv4X8v=ownZkR15iWvOfFo7bqfZfJmcjfg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] tinyproxy: patch CVE-2026-3945
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006cf180064ecd68b6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 16:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126053

--0000000000006cf180064ecd68b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 8:50=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
>
> Backport the patches which are references by the NVD avisory.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../tinyproxy/tinyproxy/CVE-2026-3945-1.patch | 29 +++++++++++++++++
>  .../tinyproxy/tinyproxy/CVE-2026-3945-2.patch | 31 +++++++++++++++++++
>  .../tinyproxy/tinyproxy_1.11.3.bb             |  2 ++
>  3 files changed, 62 insertions(+)
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.patch
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.patch
>
> diff --git
> a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.pat=
ch
> b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.pat=
ch
> new file mode 100644
> index 0000000000..99c4ea705d
> --- /dev/null
> +++
> b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.pat=
ch
> @@ -0,0 +1,29 @@
> +From 245946bb789c8fc0e4758c344f735a5d53827dce Mon Sep 17 00:00:00 2001
> +From: rofl0r <rofl0r@users.noreply.github.com>
> +Date: Thu, 12 Mar 2026 14:26:24 +0000
> +Subject: [PATCH] reqs: check negative length values when reading chunked
> data
> +
> +this could lead to a DoS when a legitimate client reads from an
> +attacker-controlled web server.
> +
> +closes #597
> +
> +CVE: CVE-2026-3945
> +Upstream-Status: Backport [
> https://github.com/tinyproxy/tinyproxy/commit/969852ccdb1d19d7ed302f0e1d3=
24661be641e0a
> ]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/reqs.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/reqs.c b/src/reqs.c
> +index a562c68..94ce767 100644
> +--- a/src/reqs.c
> ++++ b/src/reqs.c
> +@@ -613,6 +613,7 @@ static int pull_client_data_chunked (struct conn_s
> *connptr) {
> +                 }
> +
> +                 chunklen =3D strtol (buffer, (char**)0, 16);
> ++                if (chunklen < 0) goto ERROR_EXIT;
> +
> +                 if (pull_client_data (connptr, chunklen+2, 0) < 0)
> +                         goto ERROR_EXIT;
> diff --git
> a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.pat=
ch
> b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.pat=
ch
> new file mode 100644
> index 0000000000..3da30b54eb
> --- /dev/null
> +++
> b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.pat=
ch
> @@ -0,0 +1,31 @@
> +From 8f12872b8e50fe22be0a65ead260ebbedde905cd Mon Sep 17 00:00:00 2001
> +From: rofl0r <rofl0r@users.noreply.github.com>
> +Date: Sun, 29 Mar 2026 16:48:54 +0200
> +Subject: [PATCH] reqs: prevent potential int overflow when parsing chunk=
ed
> + data (#603)
> +
> +follow-up to 969852ccdb1d19d7ed302f0e1d324661be641e0a
> +
> +closes #602
> +
> +CVE: CVE-2026-3945
> +Upstream-Status: Backport [
> https://github.com/tinyproxy/tinyproxy/commit/bb7edc4778041b3bc8ad7fca448=
b67d98039cc7d
> ]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + src/reqs.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/reqs.c b/src/reqs.c
> +index 94ce767..7aacfd3 100644
> +--- a/src/reqs.c
> ++++ b/src/reqs.c
> +@@ -613,7 +613,8 @@ static int pull_client_data_chunked (struct conn_s
> *connptr) {
> +                 }
> +
> +                 chunklen =3D strtol (buffer, (char**)0, 16);
> +-                if (chunklen < 0) goto ERROR_EXIT;
> ++                /* prevent negative or huge values causing overflow */
> ++                if (chunklen < 0 || chunklen > 0x0fffffff) goto
> ERROR_EXIT;
> +
> +                 if (pull_client_data (connptr, chunklen+2, 0) < 0)
> +                         goto ERROR_EXIT;
> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.b=
b
> b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
> index 745c55bc0d..56e3296066 100644
> --- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb


We have 1.11.2 in master branch, we should do the upgrade to 1.11.3 before
applying this patch.


>
> @@ -7,6 +7,8 @@ SRC_URI =3D "
> https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
>             file://tinyproxy.service \
>             file://tinyproxy.conf \
>             file://run-ptest \
> +           file://CVE-2026-3945-1.patch \
> +           file://CVE-2026-3945-2.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126051):
> https://lists.openembedded.org/g/openembedded-devel/message/126051
> Mute This Topic: https://lists.openembedded.org/mt/118692463/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006cf180064ecd68b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 6, =
2026 at 8:50=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Details: <a=
 href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3945" rel=3D"noreferrer"=
 target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2026-3945</a><br>
<br>
Backport the patches which are references by the NVD avisory.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-3945-1.patch | 29 +++++++++++++++++<=
br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-3945-2.patch | 31 ++++++++++++++++++=
+<br>
=C2=A0.../tinyproxy/<a href=3D"http://tinyproxy_1.11.3.bb" rel=3D"noreferre=
r" target=3D"_blank">tinyproxy_1.11.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A03 files changed, 62 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-3945-1.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-3945-2.patch<br>
<br>
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3=
945-1.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-=
3945-1.patch<br>
new file mode 100644<br>
index 0000000000..99c4ea705d<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-1.p=
atch<br>
@@ -0,0 +1,29 @@<br>
+From 245946bb789c8fc0e4758c344f735a5d53827dce Mon Sep 17 00:00:00 2001<br>
+From: rofl0r &lt;<a href=3D"mailto:rofl0r@users.noreply.github.com" target=
=3D"_blank">rofl0r@users.noreply.github.com</a>&gt;<br>
+Date: Thu, 12 Mar 2026 14:26:24 +0000<br>
+Subject: [PATCH] reqs: check negative length values when reading chunked d=
ata<br>
+<br>
+this could lead to a DoS when a legitimate client reads from an<br>
+attacker-controlled web server.<br>
+<br>
+closes #597<br>
+<br>
+CVE: CVE-2026-3945<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/tinyproxy/tinypro=
xy/commit/969852ccdb1d19d7ed302f0e1d324661be641e0a" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/tinyproxy/tinyproxy/commit/969852ccdb1d19d=
7ed302f0e1d324661be641e0a</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ src/reqs.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/src/reqs.c b/src/reqs.c<br>
+index a562c68..94ce767 100644<br>
+--- a/src/reqs.c<br>
++++ b/src/reqs.c<br>
+@@ -613,6 +613,7 @@ static int pull_client_data_chunked (struct conn_s *co=
nnptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunklen =3D=
 strtol (buffer, (char**)0, 16);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chunklen &lt;=
 0) goto ERROR_EXIT;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pull_cli=
ent_data (connptr, chunklen+2, 0) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto ERROR_EXIT;<br>
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3=
945-2.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-=
3945-2.patch<br>
new file mode 100644<br>
index 0000000000..3da30b54eb<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-3945-2.p=
atch<br>
@@ -0,0 +1,31 @@<br>
+From 8f12872b8e50fe22be0a65ead260ebbedde905cd Mon Sep 17 00:00:00 2001<br>
+From: rofl0r &lt;<a href=3D"mailto:rofl0r@users.noreply.github.com" target=
=3D"_blank">rofl0r@users.noreply.github.com</a>&gt;<br>
+Date: Sun, 29 Mar 2026 16:48:54 +0200<br>
+Subject: [PATCH] reqs: prevent potential int overflow when parsing chunked=
<br>
+ data (#603)<br>
+<br>
+follow-up to 969852ccdb1d19d7ed302f0e1d324661be641e0a<br>
+<br>
+closes #602<br>
+<br>
+CVE: CVE-2026-3945<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/tinyproxy/tinypro=
xy/commit/bb7edc4778041b3bc8ad7fca448b67d98039cc7d" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/tinyproxy/tinyproxy/commit/bb7edc4778041b3=
bc8ad7fca448b67d98039cc7d</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ src/reqs.c | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/reqs.c b/src/reqs.c<br>
+index 94ce767..7aacfd3 100644<br>
+--- a/src/reqs.c<br>
++++ b/src/reqs.c<br>
+@@ -613,7 +613,8 @@ static int pull_client_data_chunked (struct conn_s *co=
nnptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunklen =3D=
 strtol (buffer, (char**)0, 16);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chunklen &lt;=
 0) goto ERROR_EXIT;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* prevent negati=
ve or huge values causing overflow */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chunklen &lt;=
 0 || chunklen &gt; 0x0fffffff) goto ERROR_EXIT;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pull_cli=
ent_data (connptr, chunklen+2, 0) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0goto ERROR_EXIT;<br>
diff --git a/meta-networking/recipes-support/tinyproxy/<a href=3D"http://ti=
nyproxy_1.11.3.bb" rel=3D"noreferrer" target=3D"_blank">tinyproxy_1.11.3.bb=
</a> b/meta-networking/recipes-support/tinyproxy/<a href=3D"http://tinyprox=
y_1.11.3.bb" rel=3D"noreferrer" target=3D"_blank">tinyproxy_1.11.3.bb</a><b=
r>
index 745c55bc0d..56e3296066 100644<br>
--- a/meta-networking/recipes-support/tinyproxy/<a href=3D"http://tinyproxy=
_1.11.3.bb" rel=3D"noreferrer" target=3D"_blank">tinyproxy_1.11.3.bb</a><br=
>
+++ b/meta-networking/recipes-support/tinyproxy/<a href=3D"http://tinyproxy=
_1.11.3.bb" rel=3D"noreferrer" target=3D"_blank">tinyproxy_1.11.3.bb</a></b=
lockquote><div><br></div><div>We have 1.11.2 in master branch, we should do=
 the upgrade to 1.11.3 before applying this patch.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>
@@ -7,6 +7,8 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/=
$%7BBPN%7D/releases/download/$%7BPV%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/${BPN}/${BPN}/releases/download/${PV}=
/${BP}.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tinyproxy.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tinyproxy.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-3945-1.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-3945-2.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;9bcf46db1a2375ff3e3d27a41982f1efec4706cc=
e8899ff9f33323a8218f7592&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126051): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126051" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126051</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118692463/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118692463/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006cf180064ecd68b6--

