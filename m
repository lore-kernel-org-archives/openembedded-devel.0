Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EB3CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 14:33:01 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37893.1779373977292067394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 07:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jPTzYgqU;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c3ea2ebf7so7155086d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 07:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373976; cv=none;
        d=google.com; s=arc-20240605;
        b=S7J36KG7kgT88EbwZKCqRrxj3ZTXR4sDwMw7Ej+l1JNBDr1tD/9lhOq203PQkv1wjp
         cm9f9YEaYXcUVm3+Mbrya6PP/XvK30ZZkYTDMZ6qHGaooJX4sgVVWjyTC7t+G2J7YWZ8
         OEv0VRpQmUSgkkslJO7kji/gGs+NFuk91Ppo7qX55Kxmw7UiTt4QYtFAks9yhxd4NFw+
         b3yVo9Tgv1UndHzjrIe7Ze144kDhraFD+NCBdsoqlyojEemNIL6Ljj+MTD6wTS6ED34j
         iTcScHdDevV4jyljrOjIwclVDq3F7LMF6XH1+/c+WE96cbOQqGsDfwZdUcfxZV4KhNzl
         e4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u5uJ8e416wnoxDqkLni5C9hetDZ8ussQTc6Ir1tSCkM=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=Zl+PNqVLqf8Tsi3eFT6YaDjUZfzr5QN5243p59ldg8VW7VJnpP3Cdb1KzPGwZ2iZDg
         Hu8H4J/Av0FB7HVx8AUbrHA4DW7xGzGC/Jfnc436r2B0SfxRod60p1EhABQeTPyeDUwW
         oqTB14Geh3VkcOS/rD6lZYDY7wk4VcWtHxlz61G6b12Mt6BOfKS3iSPecDnaNz0tTfQI
         efjNc7if/XtHvCN3Y8++6mHS2Ybjf9KR5Pbk3VPWa0YsXIHnps9H4kyUD6C7E/Xwx2n1
         U3O8+9XgJThv5zhfoNP8NvSGBxP3cMje5UEimVUJoItREbpor8+MDVtOCOjXKseUz417
         sqyw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779373976; x=1779978776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5uJ8e416wnoxDqkLni5C9hetDZ8ussQTc6Ir1tSCkM=;
        b=jPTzYgqUtbhQ30402o7y7KPtA1D2cT3c885zPDxSaMaXEwUMf3EVDxir6ygKfpbNpz
         fiE05whbvhFu9+YqhcvziY071vyl8aOChECg0Ro0u2grTlLZVv/aJKl0kpJQzoK8LzM/
         R64+hriqggj0xi87YxvOpIwkXr/nHH2wirDQnVGPpa8ucIdtTGtqnfSN8JHv6OeJya3x
         tH9EuBYzaf7Uqpg57oTg/w/jGtWw5zVVqPHdh7tusq+IUjHKfkbPTHuHYUqpRpztllbg
         rS8RyLLLSxZfANWnlDhkRoI2pNt+NWrqJliCO3D89OlBKTUG//b3J+so4bS2U1D5Zwdt
         FOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373976; x=1779978776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5uJ8e416wnoxDqkLni5C9hetDZ8ussQTc6Ir1tSCkM=;
        b=ovsvRvK6hcwLAn7H6BCHu5KzgLLrv/CwaAQ2QsPS3l0rV6cf0Fkiaes79j2TnN+u4Z
         cYn/Enevl9GnebSc70uaDj0atq6sz/h9m0WudiUxEgKBUt1IfqXyB1LpaZGShdiEsoz+
         MJmDTVkOQB7nOujHm1Tmd/+nZOGwH822q9P2LMdCgEWwpTeOa55z7GKKVrcn/29B8T6o
         bEf413UcuSqK9X2TKioJCu5EY94XOO4Bru7Q/leibMtNDv/oekKIDd67WEaNez7CFjI1
         Jbkyxg7Z6GXNyJPWVkgz6RPq+/apcgQXQwpe4gRGQgRXEYRx4gE0dJThgOn2BwhrJD+8
         WITw==
X-Gm-Message-State: AOJu0Yzbs0cEChOkfzdxdRQzs5v6I+0/FM3fgIeF0jtpBfPiPSFF2oq+
	zC19TUYkOgj9jGLcIpbz0bXGTM3Th8fW+AoF3xV09mKIqpZlSnJquw8naCAWHqObUHw9vKx22YZ
	LQSEARfPrrFAQlgtFkMnchttYc5AJ9WE=
X-Gm-Gg: Acq92OFm5Noo5aBjsdlSiOIHYVo3htlpv2v6mOusZZKQR2sZSkhSBUn6Vwn5ZKFmjfk
	03k8h3VQ3QMhC3DJYzHDVKn/z5eksKlRAe/p/tMgdF+f8PJKvIFdIASGTAjEGJszWPIM9I1sgba
	QGZXIwu7fNdDWltob5dVIQ0ua/mitegnqZ3SpNoRrXEMOwdsxdiXQkU4Aw2X2p9jcsrEkSpqfRv
	oIjFN7cRCa8nrtSKclBufOHksFqp1LcvUhy4MFHSTbqFEB4F9beaqB6bwsltBblfYiEdLYMhGC/
	gDY1l3/YQiku1i7RSn/ks7UFhBzjzHQ48KDMQxYC8rbyYsbbfqSeOIjfaC6IlLeop5qJZgdWtAL
	NnaLlIX8L3A4CBcar6uxOgCUQy7mVa60Pm7JWs4VwqzJnE0AyksRagJzJcBx5PhuK4okaLd5x66
	SgmRK8
X-Received: by 2002:a05:690e:43db:b0:65e:3df3:1c75 with SMTP id
 956f58d0204a3-65eae314a24mr1718699d50.46.1779373976348; Thu, 21 May 2026
 07:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260519113921.655-1-wangmy@fujitsu.com> <20260519113921.655-18-wangmy@fujitsu.com>
In-Reply-To: <20260519113921.655-18-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 May 2026 07:32:30 -0700
X-Gm-Features: AVHnY4KDtd6ihbVTItsEMLNVi-G1IGuVOCKFnJQFt2eFegauNtjNUPOJS3Nbda0
Message-ID: <CAMKF1sqjiukbxN0e9iNDztsGU_QOYK4A4N=TBuFJ9WLU7H7LvA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 18/38] python3-ldap: upgrade 3.4.5 -> 3.4.6
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c86f59065254c9ff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 14:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127135

--000000000000c86f59065254c9ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails to fetch the new tarball. Meanwhile 3.6.7 has been released. I
would suggest to go for 3.6.7 and submit a v2.

On Tue, May 19, 2026 at 4:40=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - attrlist parameter is now properly checked before use, avoiding memory
>   errors due to type mismatches
> - Fixed errors with requestName/requestValue in extop.dds
> - ldif and ldap.schema modules now actively close sockets as they're
>   finished with them
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-ldap_3.4.5.bb =3D> python3-ldap_3.4.6.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-networking/python/{python3-ldap_3.4.5.bb =3D>
> python3-ldap_3.4.6.bb} (91%)
>
> diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
> b/meta-python/recipes-networking/python/python3-ldap_3.4.6.bb
> similarity index 91%
> rename from meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
> rename to meta-python/recipes-networking/python/python3-ldap_3.4.6.bb
> index 5a176b5208..3c56dea31d 100644
> --- a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
> +++ b/meta-python/recipes-networking/python/python3-ldap_3.4.6.bb
> @@ -13,7 +13,7 @@ PYPI_PACKAGE =3D "python_ldap"
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D
> "b2f6ef1c37fe2c6a5a85212efe71311ee21847766a7d45fcb711f3b270a5f79a"
> +SRC_URI[sha256sum] =3D
> "83d6b65c7cbe627d81e556d0d03f3f450e3ac35ba9c1b6011f0097ac92effeb1"
>
>  do_configure:prepend() {
>      sed -i -e 's:^library_dirs =3D.*::' \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127080):
> https://lists.openembedded.org/g/openembedded-devel/message/127080
> Mute This Topic: https://lists.openembedded.org/mt/119388869/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c86f59065254c9ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails to fetch the new tarball. Meanwhile 3.6.7 has b=
een released. I would suggest to go for 3.6.7 and submit a v2.</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Tue, May 19, 2026 at 4:40=E2=80=AFAM wangmy via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D<a href=
=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D=
"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- attrlist parameter is now properly checked before use, avoiding memory<br=
>
=C2=A0 errors due to type mismatches<br>
- Fixed errors with requestName/requestValue in extop.dds<br>
- ldif and ldap.schema modules now actively close sockets as they&#39;re<br=
>
=C2=A0 finished with them<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-ldap_3.4.5.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-ldap_3.4.5.bb</a> =3D&gt; <a href=3D"http://py=
thon3-ldap_3.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.=
6.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-networking/python/{<a href=3D"http://pytho=
n3-ldap_3.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.5.b=
b</a> =3D&gt; <a href=3D"http://python3-ldap_3.4.6.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-ldap_3.4.6.bb</a>} (91%)<br>
<br>
diff --git a/meta-python/recipes-networking/python/<a href=3D"http://python=
3-ldap_3.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.5.bb=
</a> b/meta-python/recipes-networking/python/<a href=3D"http://python3-ldap=
_3.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.6.bb</a><b=
r>
similarity index 91%<br>
rename from meta-python/recipes-networking/python/<a href=3D"http://python3=
-ldap_3.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.5.bb<=
/a><br>
rename to meta-python/recipes-networking/python/<a href=3D"http://python3-l=
dap_3.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.6.bb</a=
><br>
index 5a176b5208..3c56dea31d 100644<br>
--- a/meta-python/recipes-networking/python/<a href=3D"http://python3-ldap_=
3.4.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.5.bb</a><br=
>
+++ b/meta-python/recipes-networking/python/<a href=3D"http://python3-ldap_=
3.4.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ldap_3.4.6.bb</a><br=
>
@@ -13,7 +13,7 @@ PYPI_PACKAGE =3D &quot;python_ldap&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b2f6ef1c37fe2c6a5a85212efe71311ee21847766a7d4=
5fcb711f3b270a5f79a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;83d6b65c7cbe627d81e556d0d03f3f450e3ac35ba9c1b=
6011f0097ac92effeb1&quot;<br>
<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s:^library_dirs =3D.*::&#39; \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127080): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127080" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127080</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119388869/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119388869/1997914</a><br>
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

--000000000000c86f59065254c9ff--

