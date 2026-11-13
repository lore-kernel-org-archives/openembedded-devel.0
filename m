Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4576.1794543212090207442
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 20:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=e7yXdzNC;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67990a45e02so508501d50.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 20:13:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543211; cv=none;
        d=google.com; s=arc-20260327;
        b=HD/Q+CJE1XfAMPk00ERXYYBImJENa5NBBRfGIjxC6CnRmz3Ea0yhiXbrqIXLXT1UGI
         lvE532Ix7ppQp3G0E2OcK2qZEh3W6IohIXzqSV0kDeV6AOqxlYgY8VW5vwlWC9P0hMyY
         O4WRSbI636hvb4x/VVRvPLUqaHGLv0xfMgz3Hgd3OClpZ+ds6vMdy971uvvvSNTyxxNW
         QXvm5nmb+Iw3nVkw7zjRmrDiWOw6CFP3GUMCJpd4uTnwX9N2vtWmBO6SMMXBOPwoezQR
         235ple30tj2O9yfCgCmHUXExz+PxYwPFfGfmHau/iEQVThw9KCfjEBwXd3Uk+f1Ai05I
         i7AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zafBJsuGRt1pjAh85m/2TFXT5/zMTKgSMFE2d9Ch5Pw=;
        fh=zDV/DJKlvtgdBhH596m+CAdizR6eZ4xdrOYuUQ4WjP4=;
        b=UPNuFs8ueUWa9UYsafb0c+0xzCd4G70RVgWAXWza5uyqZnbi2ASNlGkH9jZLyXotb/
         7/zwzoOp3bzn7jo6sP138CHkn86+MLPQJPnoExII5fbLEklJ4CdyACcd5G5UAVfqEVzr
         +bGfRS7lx7LCqp5M1cgvQJJV5XaUE1MA6bxx+ATx442zSoaIZx62jav/LcBWf1SZpxVk
         QpIxg6+Ux2w6EjRZ9QnHEeinaxgEpcdI5GyS3uH/hJI8AjMUpI+aPpfyRG18c6++1OLG
         7nDgVdiU7G90GezSl0MgOS3+ModrdmvJx/9PAG5HvLg6nmDDQ26ORWOvJH2vDNfrOZ2F
         LQqA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543211; x=1795148011; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zafBJsuGRt1pjAh85m/2TFXT5/zMTKgSMFE2d9Ch5Pw=;
        b=e7yXdzNC+DkzUpBdvwDMOUFFLtVN2Qd51cWuhZp1SxIf0zJJNsD6hbhnSB1WRiMJCC
         67l3VkgAZw5ypq7xbleGCH4fQuvNF2AabrGH/iwpub8vVPZIUahI5xW1e+GXMH7Nuan2
         9GTwgAzgN1guI03dZkupTxCeRDXeAHRZLMYVtrbyD20IpHISkAPl9fXAQQT7c6sVPnX+
         SNpctng7IgnXze4b4ub7HMbdNMmEItqD2pcnxuliocW2hQt06iQ5Ewo7khUI8urcuTYU
         yVjUijqebkeELOUyky3jvtGcacJf6E5TqPjEtBC7/fs58OIDyK2dDz7Q1tYpaZliAaBh
         e8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543211; x=1795148011;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zafBJsuGRt1pjAh85m/2TFXT5/zMTKgSMFE2d9Ch5Pw=;
        b=0W7MqO6HLNs3xxb56gfSo1Ninzzv2R5NlNnzgAjv0llRIeYJRmC8KSxqBFn50L/O9V
         c5Mnm9nRPdVqeprJajqt9NnkAUuCzoflsrdyxM2JgC9Z0khHAEw4ekIH8OjTgmBXrgt9
         H4RvOyEeqqB8up0ctHYcx6HQNXz0AVq2OzFohZc/Q/kZeEi00yi48ZDvs2kEvFZPxTu5
         cxz+n+2W6QWfnFhIAuTZKEGrWBfnCE9XBVj0C9YheFSbQdAHzL/GeHwITaK+MK9k2tJR
         UFTz5gi3QyeJoqCwMG+I97cghZ1D4l1O41djR/0M5zAyImcLaM7tiSLA2OP86Xe10ZdL
         fBwg==
X-Gm-Message-State: APuU4Z+Knzh0nCTR6gHgwm3ss4kqSOdcozCToc3qncBO54rL96/qJ/Wk
	IzPfvPArvdIevTFN2i8QxXp3x05POtLlZm54r4A5SH39ytHZbZcmtyqHtXhudwFd9AzUtbiw2yp
	0ZkbXHOvMxpuR+sWaVpsXhbyZeamH0Io=
X-Gm-Gg: AYBFou0+1fZVIKpuTfi5A5mwJAHNjSBzHJVB3EcMMOPBse3525P/RaLSBcQk1w5k3sD
	Op9Yd0YJCzGkE8Q6f/0eYWHE3kX64+JqFP9UtLzEDTRaYjWsUBeMVVwBnYPi2zBwNIwO3QrC8tM
	BwgbySvLZqo8OcNSASsXlUbqcx1KEZrtf6FogKcDFytr7SLjcjLFRRhbpCi3PP3ICu//rr7TWpE
	el7pGgvzFr6/3THM5Zg2oDjKYtXWyL0XZ5678OuQtlJ0P3nKF2tDQxHMGRE+hkwkjWd3EupUogc
	RklZmbQKfMnwPhPPMwc3s+euJHtMmInSrJc7zjB9eO0bA7Kl6U3L38mBedluvLEomDlrabW0HaY
	RxTI34EFQDLSqtk7VMU008zfijUoqM9iHK99HqpK7Tu3Oq1edEFYWAKAXe27NKGeZyCtRqFFnek
	SyZ+5K9F2pLbByZdy+CIS3voZ6qhOtmsoRANzWv++f7xdxi+MpV+DYjBkRnadidfv0Rr+21Tmg+
	3muBWStbXqSzkTpdA1MHNqCJC/9wVr4wcsYwbdXsmvtqiCURu4QlT2dYrulwuo0+1GuuByeYHUY
	P48Fcw3EMKYVsYokbO0YjXh71TQjZ0sPig2sS8EZqL0Wxe6Wo/PSoINbxxIkG0UHkLKCFxl+SyO
	FcIsmOgLMAPM2y37TbalcBQ==
X-Received: by 2002:a05:690e:169a:b0:679:a650:a083 with SMTP id
 956f58d0204a3-67d896a34eamr1209786d50.21.1794543210858; Thu, 12 Nov 2026
 20:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20261113040121.1553219-1-schonm@gmail.com>
In-Reply-To: <20261113040121.1553219-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Nov 2026 20:13:04 -0800
X-Gm-Features: AclHuK-GibDUKRa7rcJ4v6dLGTbxhIzCCQbSyDds00tA2se_SAHWgBX8Pd7vab4
Message-ID: <CAMKF1srcAjzY9z183F5=baesz1HJXTFhQh_+CyaE=za2LBA0Jg@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.70 -> 2.4.71
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e0d71066020a616"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 04:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132223

--0000000000009e0d71066020a616
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 8:01=E2=80=AFPM J. S. via openembedded-devel <schon=
m=3D
gmail.com@lists.openembedded.org> wrote:

> Fix [buildpaths] qa issue in config_vars.mk
>
> Changes with Apache 2.4.71
>
>   *) SECURITY: CVE-2026-119618: mod_http2: heap corruption and RCE in
>      assign_headers (cve.mitre.org)
>      Concurrent Execution using Shared Resource with Improper
>      Synchronization vulnerability in Apache HTTP Server's mod_http2
>      in assign_headers() can lead to RCE.
>      This issue affects Apache HTTP Server: from 2.4.55 through
>      2.4.70.
>      Affected releases of mod_h2 from GitHub: from 2.0.8 through
>      2.0.42.
>      Credits: Anthropic's OSS Scanner, as vulnerability
>      ANT-2026-MAPKT6MZ
>
>   *) SECURITY: CVE-2026-109163: mod_vhost_alias 1 byte stack buffer
>      overwrite (after CVE-2026-63292) (cve.mitre.org)
>      Stack-based buffer overflow vulnerability in Apache HTTP
>      Server's mod_vhost_alias (after=C3=82 CVE-2026-63292)
>      This issue affects Apache HTTP Server: 2.4.69 and 2.4.70.
>      Credits: Gustavo Aiello
>
>   *) SECURITY: CVE-2026-106023: mod_md NULL pointer dereference leads
>      to child process crash (cve.mitre.org)
>      NULL pointer dereference vulnerability in Apache HTTP Server's
>      mod_md during HTTP request processing.
>      This issue affects Apache HTTP Server: from 2.4.30 through
>      2.4.70.
>      Credits: hexb1n, Yang Song, and JiaSheng He of 360 Vulnerability
>      Research Institute, working with 360 TuLongFeng.
>
>   *) mod_md: MDHttpProxy and MDCACertificateFile can now be set per
> MDomain.
>      New directive MDHttpProxyCACertificateFile sets the CA certificates
>      used to verify an HTTPS proxy.
>      [Michael Kaufmann <mail michael-kaufmann.ch>]
>
>   *) mod_deflate: Read the gzip extra-field (FEXTRA) length as unsigned s=
o
> a
>      length byte with the high bit set is no longer sign-extended, fixing
>      inflation of gzip streams that carry an extra field.
>      [arshiya tabasum <arshi bugqore.com>]
>
>   *) mod_remoteip: Apply RemoteIP{Trusted,Internal}ProxyList to the
> virtual host
>      they are configured in, and merge the proxy entries of the main serv=
er
>      and of the virtual host, logging a warning when both have some.
>      PR 70207.  [Arturo Bernal]
>
>   *) mod_dav: Fix handling of invalid or overflowing "Timeout:"
>      request headers, which could silently grant a lock with an
>      already-expired timeout instead of the RFC 4918 maximum.
>      PR 65788 [Arturo Bernal]
>
>   *) mod_http2: Correctly handle the asterisk-form of OPTIONS requests
>      instead of rejecting them as malformed.  PR 70195.
>      [Arturo Bernal <abernal apache.org>]
>
>   *) mod_http2: Fix duplicate logging of header limit violations.
>      [Michael Kaufmann <mail michael-kaufmann.ch>]
>
>   *) mod_http2: Fix a crash creating an HTTP/2 session with
>      "H2PushDiarySize 0" and debug logging enabled.  [Joe Orton]
>
>   *) mod_dav_lock: Fix dav_generic_load_lock_record() reading the
>      indirect-lock key length with the wrong width, which could read
>      back a wrong length on big-endian platforms. PR 70299
>      [Arturo Bernal]
>
>   *) mod_remoteip: Log a connection closed before a complete PROXY protoc=
ol
>      header was received at info level rather than as an error.  PR 63893=
.
>      [Joe Orton]
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../apache2/{apache2_2.4.70.bb =3D> apache2_2.4.71.bb}           | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.70.bb =3D>
> apache2_2.4.71.bb} (99%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.71.bb
> similarity index 99%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.71.bb
> index f34d622495..35c4b2f8b9 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.71.bb
> @@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D " \
>             "
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbddeddfac80b2c9a882241d008bb4=
1c3"
> -SRC_URI[sha256sum] =3D
> "1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3"
> +SRC_URI[sha256sum] =3D
> "2bc5da5a33c247341de082717d4ebcb5cb49e8b73a05b7fddf7d5d6dc2f8de62"
>
>  S =3D "${UNPACKDIR}/httpd-${PV}"
>
> @@ -134,6 +134,7 @@ do_install:append:class-target() {
>             -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^
> ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
>             -e 's,${HOSTTOOLS_DIR}/,,g' \
>             -e 's,APU_INCLUDEDIR =3D .*,APU_INCLUDEDIR =3D ,g' \
> +           -e 's,${HOME},,g' \
>

why is this needed ?


>             -e 's,APU_CONFIG =3D .*,APU_CONFIG =3D ,g'
> ${D}${libexecdir}/${PN}/build/config_vars.mk
>
>      sed -i -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132222):
> https://lists.openembedded.org/g/openembedded-devel/message/132222
> Mute This Topic: https://lists.openembedded.org/mt/122242379/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e0d71066020a616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 12,=
 2026 at 8:01=E2=80=AFPM J. S. via openembedded-devel &lt;schonm=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Fix [buildpaths] qa issue in <a href=3D"http://config_vars.mk" rel=3D"nor=
eferrer" target=3D"_blank">config_vars.mk</a><br>
<br>
Changes with Apache 2.4.71<br>
<br>
=C2=A0 *) SECURITY: CVE-2026-119618: mod_http2: heap corruption and RCE in<=
br>
=C2=A0 =C2=A0 =C2=A0assign_headers (<a href=3D"http://cve.mitre.org" rel=3D=
"noreferrer" target=3D"_blank">cve.mitre.org</a>)<br>
=C2=A0 =C2=A0 =C2=A0Concurrent Execution using Shared Resource with Imprope=
r<br>
=C2=A0 =C2=A0 =C2=A0Synchronization vulnerability in Apache HTTP Server&#39=
;s mod_http2<br>
=C2=A0 =C2=A0 =C2=A0in assign_headers() can lead to RCE.<br>
=C2=A0 =C2=A0 =C2=A0This issue affects Apache HTTP Server: from 2.4.55 thro=
ugh<br>
=C2=A0 =C2=A0 =C2=A02.4.70.<br>
=C2=A0 =C2=A0 =C2=A0Affected releases of mod_h2 from GitHub: from 2.0.8 thr=
ough<br>
=C2=A0 =C2=A0 =C2=A02.0.42.<br>
=C2=A0 =C2=A0 =C2=A0Credits: Anthropic&#39;s OSS Scanner, as vulnerability<=
br>
=C2=A0 =C2=A0 =C2=A0ANT-2026-MAPKT6MZ<br>
<br>
=C2=A0 *) SECURITY: CVE-2026-109163: mod_vhost_alias 1 byte stack buffer<br=
>
=C2=A0 =C2=A0 =C2=A0overwrite (after CVE-2026-63292) (<a href=3D"http://cve=
.mitre.org" rel=3D"noreferrer" target=3D"_blank">cve.mitre.org</a>)<br>
=C2=A0 =C2=A0 =C2=A0Stack-based buffer overflow vulnerability in Apache HTT=
P<br>
=C2=A0 =C2=A0 =C2=A0Server&#39;s mod_vhost_alias (after=C3=82 CVE-2026-6329=
2)<br>
=C2=A0 =C2=A0 =C2=A0This issue affects Apache HTTP Server: 2.4.69 and 2.4.7=
0.<br>
=C2=A0 =C2=A0 =C2=A0Credits: Gustavo Aiello<br>
<br>
=C2=A0 *) SECURITY: CVE-2026-106023: mod_md NULL pointer dereference leads<=
br>
=C2=A0 =C2=A0 =C2=A0to child process crash (<a href=3D"http://cve.mitre.org=
" rel=3D"noreferrer" target=3D"_blank">cve.mitre.org</a>)<br>
=C2=A0 =C2=A0 =C2=A0NULL pointer dereference vulnerability in Apache HTTP S=
erver&#39;s<br>
=C2=A0 =C2=A0 =C2=A0mod_md during HTTP request processing.<br>
=C2=A0 =C2=A0 =C2=A0This issue affects Apache HTTP Server: from 2.4.30 thro=
ugh<br>
=C2=A0 =C2=A0 =C2=A02.4.70.<br>
=C2=A0 =C2=A0 =C2=A0Credits: hexb1n, Yang Song, and JiaSheng He of 360 Vuln=
erability<br>
=C2=A0 =C2=A0 =C2=A0Research Institute, working with 360 TuLongFeng.<br>
<br>
=C2=A0 *) mod_md: MDHttpProxy and MDCACertificateFile can now be set per MD=
omain.<br>
=C2=A0 =C2=A0 =C2=A0New directive MDHttpProxyCACertificateFile sets the CA =
certificates<br>
=C2=A0 =C2=A0 =C2=A0used to verify an HTTPS proxy.<br>
=C2=A0 =C2=A0 =C2=A0[Michael Kaufmann &lt;mail <a href=3D"http://michael-ka=
ufmann.ch" rel=3D"noreferrer" target=3D"_blank">michael-kaufmann.ch</a>&gt;=
]<br>
<br>
=C2=A0 *) mod_deflate: Read the gzip extra-field (FEXTRA) length as unsigne=
d so a<br>
=C2=A0 =C2=A0 =C2=A0length byte with the high bit set is no longer sign-ext=
ended, fixing<br>
=C2=A0 =C2=A0 =C2=A0inflation of gzip streams that carry an extra field.<br=
>
=C2=A0 =C2=A0 =C2=A0[arshiya tabasum &lt;arshi <a href=3D"http://bugqore.co=
m" rel=3D"noreferrer" target=3D"_blank">bugqore.com</a>&gt;]<br>
<br>
=C2=A0 *) mod_remoteip: Apply RemoteIP{Trusted,Internal}ProxyList to the vi=
rtual host<br>
=C2=A0 =C2=A0 =C2=A0they are configured in, and merge the proxy entries of =
the main server<br>
=C2=A0 =C2=A0 =C2=A0and of the virtual host, logging a warning when both ha=
ve some.<br>
=C2=A0 =C2=A0 =C2=A0PR 70207.=C2=A0 [Arturo Bernal]<br>
<br>
=C2=A0 *) mod_dav: Fix handling of invalid or overflowing &quot;Timeout:&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0request headers, which could silently grant a lock with=
 an<br>
=C2=A0 =C2=A0 =C2=A0already-expired timeout instead of the RFC 4918 maximum=
.<br>
=C2=A0 =C2=A0 =C2=A0PR 65788 [Arturo Bernal]<br>
<br>
=C2=A0 *) mod_http2: Correctly handle the asterisk-form of OPTIONS requests=
<br>
=C2=A0 =C2=A0 =C2=A0instead of rejecting them as malformed.=C2=A0 PR 70195.=
<br>
=C2=A0 =C2=A0 =C2=A0[Arturo Bernal &lt;abernal <a href=3D"http://apache.org=
" rel=3D"noreferrer" target=3D"_blank">apache.org</a>&gt;]<br>
<br>
=C2=A0 *) mod_http2: Fix duplicate logging of header limit violations.<br>
=C2=A0 =C2=A0 =C2=A0[Michael Kaufmann &lt;mail <a href=3D"http://michael-ka=
ufmann.ch" rel=3D"noreferrer" target=3D"_blank">michael-kaufmann.ch</a>&gt;=
]<br>
<br>
=C2=A0 *) mod_http2: Fix a crash creating an HTTP/2 session with<br>
=C2=A0 =C2=A0 =C2=A0&quot;H2PushDiarySize 0&quot; and debug logging enabled=
.=C2=A0 [Joe Orton]<br>
<br>
=C2=A0 *) mod_dav_lock: Fix dav_generic_load_lock_record() reading the<br>
=C2=A0 =C2=A0 =C2=A0indirect-lock key length with the wrong width, which co=
uld read<br>
=C2=A0 =C2=A0 =C2=A0back a wrong length on big-endian platforms. PR 70299<b=
r>
=C2=A0 =C2=A0 =C2=A0[Arturo Bernal]<br>
<br>
=C2=A0 *) mod_remoteip: Log a connection closed before a complete PROXY pro=
tocol<br>
=C2=A0 =C2=A0 =C2=A0header was received at info level rather than as an err=
or.=C2=A0 PR 63893.<br>
=C2=A0 =C2=A0 =C2=A0[Joe Orton]<br>
<br>
Signed-off-by: Jason Schonberg &lt;<a href=3D"mailto:schonm@gmail.com" targ=
et=3D"_blank">schonm@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../apache2/{<a href=3D"http://apache2_2.4.70.bb" rel=3D"noreferrer" =
target=3D"_blank">apache2_2.4.70.bb</a> =3D&gt; <a href=3D"http://apache2_2=
.4.71.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.71.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.70.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.70.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.71.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.71.bb</a>} (99%)<br>
<br>
diff --git a/meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2=
_2.4.70.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.70.bb</a> b/me=
ta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_2.4.71.bb" rel=
=3D"noreferrer" target=3D"_blank">apache2_2.4.71.bb</a><br>
similarity index 99%<br>
rename from meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_=
2.4.70.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.70.bb</a><br>
rename to meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_2.=
4.71.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.71.bb</a><br>
index f34d622495..35c4b2f8b9 100644<br>
--- a/meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_2.4.70=
.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.70.bb</a><br>
+++ b/meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_2.4.71=
.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.71.bb</a><br>
@@ -27,7 +27,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbddeddfac80b2c9a88224=
1d008bb41c3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766=
869d39b8bcf0b1bafc3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2bc5da5a33c247341de082717d4ebcb5cb49e8b73a05b=
7fddf7d5d6dc2f8de62&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/httpd-${PV}&quot;<br>
<br>
@@ -134,6 +134,7 @@ do_install:append:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,-fdebug-prefix-map[^ ]*=
,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,${HOSTTOOLS_DIR}/,,g&#3=
9; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,APU_INCLUDEDIR =3D .*,A=
PU_INCLUDEDIR =3D ,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,${HOME},,g&#39; \<br></=
blockquote><div><br></div><div>why is this needed ?</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,APU_CONFIG =3D .*,APU_C=
ONFIG =3D ,g&#39; ${D}${libexecdir}/${PN}/build/<a href=3D"http://config_va=
rs.mk" rel=3D"noreferrer" target=3D"_blank">config_vars.mk</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,--sysroot=3D${STAGING_DIR_TARGET},,g&#=
39; \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132222): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132222" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132222</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122242379/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122242379/1997914</a><br>
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

--0000000000009e0d71066020a616--
