Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28216.1793131624410548800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 13:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Da6Y0J/M;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bc4704cbso312047d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793131623; cv=none;
        d=google.com; s=arc-20260327;
        b=Zck9Bq8yfHsFyLgEHUL+BN7UWZbVRUSeszardfNE5+cbHKuz0jHvvdojOVCe9CUwog
         fALZKBinL9k7pAZ4nQZLUVCWZYYJOZk9gZqze4CMHcfBMEQnFNhhUwGKdwUBQbhTrMf4
         IBOryIcdawMih9QqFKYSjBkT5UqtTmevLoGFWXeKmBoZVCpJ0Iz7h6rWvBHD67pe4N+L
         4U2ZcEBnJNvcBx4ql6RMRWkzk5DTxTzXPm9Fe/oMkxqD9k1xskSQbsYq1bbwvAgwXToW
         et1qeCeDL7qTQ+Jrxe3/HNy5NHulGbU9X2YCGULvp2q0ng7yd1+8FnMjm+tFl9nEkvJU
         n1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nxdSyWofl5BJ1ahnoyHceMb/SGdQFpjlukvBg7OJGtc=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=OAb0bAplyPJJJj0OwljE/7w4lRAVCOUIDsei7DofKjIpgjN+czOTTJI1VeLBwgz/xM
         Kxua+eXlskthRBIhHQQhsojPWffzXv/uAc2Fm1LzocliW/rJG9IOkkUBtNrtBdC/Wovh
         L6iQ/G8DUALlUiDtogpA1iMhHALKuwz3BwjbL4Um+NdEleb2B/FOSIoQ1EpG98PWgKcj
         jlYCSyj9HJxtc9c78OIw71MtueYh/Yxgy055SbItD1khYEWC+0s0JuODr4x6bdEbrTSQ
         +2P4cBpMSUUBd4b5Iah9iMebE8BSuhm3EfAjgThw1jhh8dUlHGUMM6PCNAwYtQyL40nr
         D/7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793131623; x=1793736423; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxdSyWofl5BJ1ahnoyHceMb/SGdQFpjlukvBg7OJGtc=;
        b=Da6Y0J/M2MzGBLeD18C1tGGmVEijJ+1LyQduB2q+/KSi73fIc6rrRBbyZ3/SWg1W18
         AVvVly5bbkhfhKJkP6OvZrDDrXHDQOz2OAcxBSBOPQ7yEuSEvtkCzSSbsth4hwU3s2S2
         nj2e5yLpE+Hcxng6JjZCWG0BWhjveFNZYpnybuLXHilhkgeJrUhFc6LRD1KZ5cuPIu/j
         7+p77tAzOx3KD/1U2B1QlObqJHVepa/6R2QZzr4/uxMwYb45/hOESBVSUqML7tMpbUom
         ZX47DSP61PsotbgOtIm7SIylyN+Rhfgpb8G7c2thmnPDHp8GcvvARtH8IdWZHw9yOs9a
         UvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131623; x=1793736423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nxdSyWofl5BJ1ahnoyHceMb/SGdQFpjlukvBg7OJGtc=;
        b=v7T1hQC+i/neZHVT3R1P9hRqm2SqZmbRrEHUXuXrtDivP3M2ODqSRbv0V2gog3E6Mw
         BnxAOb6llmMjbWKigaPZ4n/l7mCRtU40XVE8cx2OwxGcpgBNTffyzJg3A7r9EXcYvm9M
         9pI3CZ9OcywJl1s/toN99NIG3bk/hdIIfTDeKg374WiRp3s2Zw6iVsmE4UEUTLSXhdrM
         XuWw2/qH1EO6sQ+x47ld+7NXPzjpGDfhUIUtmHg0QyvE5fIEgUHu1RF23YIeM3pgJz7l
         DOYLQVuQWIkogptsE1yCdbpwTD/FO6VApYCw3GpkT7U3qsqjJFyDmUG9KMPU99IBgYvH
         Vqhw==
X-Gm-Message-State: AFq9FYLxV4RYkV8IS8ryJbuKZ38Qa0EJydePVllVTpK/hnbr2YqXQRrk
	i+HeSrYGI75Kl8zVJLOnQTILqwqt2+4iRmuXH4VRratXBRoUfVpfPmCLgK/y4Le23jn7pir+bF2
	rT1QVtU5v5jjP//yNQUUv8K8ODzMzQF4=
X-Gm-Gg: AYBFou0y+lCtfQ9iSqGIobB8V3gedJ9kAIGVjK4e9vPJphh/VRKXKpPLLQ7zAF6xOEB
	THC9LGCz1HB0/ZmaRDhMHtNF5TGTF1l3mxwEFihISR2jumT3KjK/9HYfm2pNeq92fs4mExFtm2H
	KOaqVXqMzureFD3idPEHbYYhOsT5jczYbDdcmLJzuycOwtbk1QYHe+PU/Jz5+eA3yErhJZoZP9h
	SVaWWnb23jp0JL/lKT1e4nehDXXmCNhQEENDs2U2f8D3Z8VuCuguQ6eb0vMEX6uEdDk9qB6gC+I
	wKfjchJLr1w5Ex2zCg+NMwYzs/jv7HOvUfTFGmHT8LNgfPNVsHAmjW9hSdi/JCWXamEG/DZf3Vk
	eIrIKtaVsy/SoU+QCrPCOp27pJV13TIAbYNuXznzO14QErju2j+s28/kjXIeCJsP/siA0X+UKaZ
	ZiY7jCu0t3aDP3K8eD+vevrqjmqFlUmU8OJI7FTwzcgMzWClBM3Xhu2szRDStpDXrcKGfJM9CaJ
	5mWSY539kV7gbAHSDMEWRMEk7oO9CCUJrKs77WE8Iyiht79VcJTBio1AnyTavBKTu2pKAZM6ZLD
	RIPrMqMQn1MW5SeHQTWCNVZLUK2ksbF5zKjFvGum7SZ3tzxRqXI9+oOzq9aBoIXF
X-Received: by 2002:a05:690e:4853:b0:67a:5448:7a21 with SMTP id
 956f58d0204a3-67a7bea0850mr302602d50.133.1793131623261; Tue, 27 Oct 2026
 13:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261027092028.782979-1-leon.anavi@konsulko.com> <20261027092028.782979-12-leon.anavi@konsulko.com>
In-Reply-To: <20261027092028.782979-12-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2026 13:06:37 -0700
X-Gm-Features: AclHuK98X9VPMeMxIMEN2_0vKxRUdNRdAUaiIrhQJhHxZH61C7wimGBIq95B_iE
Message-ID: <CAMKF1srmP-BSinrU=_X_ZVi2mhXWFi7T96RzVVoVy-znRGdwUQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 12/61] python3-platformdirs: Upgrade
 4.10.1 -> 4.13.5
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070a935065ed7fdae"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 20:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131547

--00000000000070a935065ed7fdae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails ptests

{'python3-platformdirs':
['tests/test_pytest_plugin.py:test_import_before_pytest_main[main-thread]',

'tests/test_pytest_plugin.py:test_import_before_pytest_main[worker-thread]'=
,

'tests/test_unix.py:test_runtime_dir_unreachable_xdg_runtime_dir_warns[lazy=
-symlink-loop]',

'tests/test_unix.py:test_runtime_dir_unreachable_xdg_runtime_dir_warns[ensu=
re-exists-symlink-loop]']}



On Tue, Oct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 4.13.5:
>
> - Publish a GitHub Release with changelog notes, a PyPI link, and a
>   version comparison after each PyPI release.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...n3-platformdirs_4.10.1.bb =3D> python3-platformdirs_4.13.5.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{
> python3-platformdirs_4.10.1.bb =3D> python3-platformdirs_4.13.5.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-platformdirs_4.10.1.bb b/meta-python/recipes-devtools/python/
> python3-platformdirs_4.13.5.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/
> python3-platformdirs_4.10.1.bb
> rename to meta-python/recipes-devtools/python/
> python3-platformdirs_4.13.5.bb
> index 7c004a1ed3..a371e933b3 100644
> --- a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/platformdirs/platformdir=
s"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d=
17a"
>
> -SRC_URI[sha256sum] =3D
> "ceab4084426fe6319ce18e86deada8ab1b7487c7aee7040c55e277c9ae793695"
> +SRC_URI[sha256sum] =3D
> "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
>
>  inherit pypi python_hatchling ptest-python-pytest
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131476):
> https://lists.openembedded.org/g/openembedded-devel/message/131476
> Mute This Topic: https://lists.openembedded.org/mt/121956752/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000070a935065ed7fdae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails ptests<div><br></div><div>{&#39;python3-platformdirs=
&#39;: [&#39;tests/test_pytest_plugin.py:test_import_before_pytest_main[mai=
n-thread]&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_pytest_plugin.py:test_im=
port_before_pytest_main[worker-thread]&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/=
test_unix.py:test_runtime_dir_unreachable_xdg_runtime_dir_warns[lazy-symlin=
k-loop]&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tests/test_unix.py:test_runtime_dir=
_unreachable_xdg_runtime_dir_warns[ensure-exists-symlink-loop]&#39;]}<br><b=
r><br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 27, 2026 at 2:20=E2=80=AFAM L=
eon Anavi via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.=
org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Upgrade to release 4.13.5:<br>
<br>
- Publish a GitHub Release with changelog notes, a PyPI link, and a<br>
=C2=A0 version comparison after each PyPI release.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://n3-platformdirs_4.10.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">n3-platformdirs_4.10.1.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3-platformdirs_4.13.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-p=
latformdirs_4.13.5.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-platformdirs_4.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-platf=
ormdirs_4.10.1.bb</a> =3D&gt; <a href=3D"http://python3-platformdirs_4.13.5=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-platformdirs_4.13.5.bb</a=
>} (85%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
platformdirs_4.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-platfo=
rmdirs_4.10.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-platformdirs_4.13.5.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-platformdirs_4.13.5.bb</a><br>
similarity index 85%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-p=
latformdirs_4.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-platfor=
mdirs_4.10.1.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-pla=
tformdirs_4.13.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-platformd=
irs_4.13.5.bb</a><br>
index 7c004a1ed3..a371e933b3 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-platfor=
mdirs_4.10.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-platformdirs_=
4.10.1.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-platfor=
mdirs_4.13.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-platformdirs_=
4.13.5.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/platformdi=
rs/platformdirs" rel=3D"noreferrer" target=3D"_blank">https://github.com/pl=
atformdirs/platformdirs</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dea4f5a41454746a9ed111=
e3d8723d17a&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;ceab4084426fe6319ce18e86deada8ab1b7487c7aee70=
40c55e277c9ae793695&quot;<br>
+SRC_URI[sha256sum] =3D &quot;05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9b=
d43680dcb47544788a0&quot;<br>
<br>
=C2=A0inherit pypi python_hatchling ptest-python-pytest<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131476): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131476" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131476</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121956752/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121956752/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000070a935065ed7fdae--
