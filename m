Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CABC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:22:05 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.7221.1743153714442024250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h8w94sz0;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1522112f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743153713; x=1743758513; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dq8mwWCkui9tO6okeBVuvyK7EUiFJxIeGKn/Tk/3hr0=;
        b=h8w94sz00k7MayQ8rIPfzR6c+5NWyu/zxbWQD1E2Tc9m44nHnUMYfGfq1OqtHNxExk
         jmmShNigE1oSGvTcrUs+iMEtlza1kMT0uZfU/pnAmzVNPhFJo7oHp2k4yUyxPLxJdQhd
         h1Nom1tFNH1j6+m2MO2hzqfCaLYOeaJTrxKNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743153713; x=1743758513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq8mwWCkui9tO6okeBVuvyK7EUiFJxIeGKn/Tk/3hr0=;
        b=XklsxJ0P06QVVh6Qg8no3qax0XJ5D15Kp3BoBJQSQlOX+4s/eJ9L3EzHQCV7Y49Yvl
         cdpWQLsNhVE9NopySotXY4T9m/eqAvr8fHPRD5mMoEAYjvPIThoUXgocVfyGuqdByVBr
         jz1cBkt4BONPpcveoe5nOUZsIr8o+sVdM2xq5tT9rQyU7GlgQ2ZcZkcqG0ao9fMJGXYU
         S1QikGpWZuMscG617L8eu0GEK2SDWPOwvG5w/O0wPrcUZHGjgW6M/xEmguIbu+UtmFCY
         6Woy2RIsPEKhfll7LWRZ50aE6DCUYOQWzTjHlgbQL2/iVeXXS+FECU6ZW3dQTkgERm0d
         PTBA==
X-Gm-Message-State: AOJu0YxFzBqlpH8tfavlC0ByBXDBYNrkW1l0vRD+uc9lJxBGzBAdXjQZ
	Xp6fUWzQTR71BCgW9jcV9AXUKD/qaRvjdil9f6TLCS7UYrRurrwgQC9+pWUvfNNY/6hRhccQNz+
	K5HKsMnRV75fb+IjjRK8hvShJFojV+CfHnzIwywvGr8wYf1Fzt+M=
X-Gm-Gg: ASbGncvll4CcM6mlelie08sDWVyoLoeVw3FXKe2A1SUvFNuKhfVXSOykhB1yS9i7BC6
	xO0eR/8acaerGNSIG9dsc6IaQC0rEzBcCjz/dED1LQiOe6CRP1+XUxJCznWhNCIUWYcdc+lit+6
	DcYhcF1NCTos5SfegxoUfLcB7TjPdIstu/bLuDmpeLhRbqVEGkBySsEW6Pe3s=
X-Google-Smtp-Source: AGHT+IGpRoP3xc/uNHbOeSUeKZVsW+U8M9QfczpSGFXrBvcT2vKzjm0VHX9o3nYXCAzo+mZIUreL8C4DkF2v2ptgX7w=
X-Received: by 2002:a5d:5846:0:b0:38d:e304:7470 with SMTP id
 ffacd0b85a97d-39ad174a391mr5743515f8f.25.1743153712663; Fri, 28 Mar 2025
 02:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250328090156.635557-1-haixiao.yan.cn@eng.windriver.com>
In-Reply-To: <20250328090156.635557-1-haixiao.yan.cn@eng.windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 28 Mar 2025 10:21:26 +0100
X-Gm-Features: AQ5f1JrshHXFagjX8C7SS0aWqJrlD-Ts_CR9Qa8llMX01MnrFxerSj2a06ew7tU
Message-ID: <CAMSfU+7JDnenTb7tF+ZJipDekr6SsWT-WzRon1PASPNQWb-xoQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] openvpn: renew the
 sample keys
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d5264c06316399ce"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116348

--000000000000d5264c06316399ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le ven. 28 mars 2025 =C3=A0 10:02, Yan, Haixiao (CN) via lists.openembedded=
.org <
Haixiao.Yan.CN=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Renew the sample keys to fix the test issue:
> WARNING: Your certificate has expired!
>
> The renewed sample keys from [1] contain binary files which can't be
> patched
> by quilt, so archive the files into
> sample-keys-renew-for-the-next-10-years.tar.gz.
>
> [1] https://github.com/OpenVPN/openvpn/commit/98e70e7
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
>  ...mple-keys-renew-for-the-next-10-years.tar.gz | Bin 0 -> 28118 bytes
>

That patch does not apply :
 $ b4 shazam 20250328090156.635557-1-haixiao.yan.cn@eng.windriver.com
Grabbing thread from
lore.kernel.org/all/20250328090156.635557-1-haixiao.yan.cn%40eng.windriver.=
com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
  [PATCH] openvpn: renew the sample keys
---
Total patches: 1
---
Applying: openvpn: renew the sample keys
Patch failed at 0001 openvpn: renew the sample keys
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: cannot apply binary patch to
'meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-=
next-10-years.tar.gz'
without full index line
error:
meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-n=
ext-10-years.tar.gz:
patch does not apply
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch

Look at the patch, it does not contain any data for the tar.gz file. Maybe
use the "--binary" option for git-send-email/git-format-patch?

Regards,


>  .../recipes-support/openvpn/openvpn_2.5.11.bb   |   1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the=
-next-10-years.tar.gz
>
> diff --git
> a/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-t=
he-next-10-years.tar.gz
> b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-t=
he-next-10-years.tar.gz
> new file mode 100644
> index 000000000000..a79e6e4d1576
> Binary files /dev/null and
> b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-t=
he-next-10-years.tar.gz
> differ
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
> b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
> index 810a60308b80..6aed4145ec00 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "
> http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
>             file://openvpn \
>             file://openvpn@.service \
>             file://openvpn-volatile.conf \
> +           file://sample-keys-renew-for-the-next-10-years.tar.gz \
>             "
>
>  UPSTREAM_CHECK_URI =3D "https://openvpn.net/community-downloads"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116347):
> https://lists.openembedded.org/g/openembedded-devel/message/116347
> Mute This Topic: https://lists.openembedded.org/mt/111950963/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000d5264c06316399ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. =
28 mars 2025 =C3=A0=C2=A010:02, Yan, Haixiao (CN) via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;<a href=3D"http://Haixi=
ao.Yan.CN">Haixiao.Yan.CN</a>=3D<a href=3D"mailto:windriver.com@lists.opene=
mbedded.org">windriver.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Haixi=
ao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.com" target=3D"_blank=
">haixiao.yan.cn@windriver.com</a>&gt;<br>
<br>
Renew the sample keys to fix the test issue:<br>
WARNING: Your certificate has expired!<br>
<br>
The renewed sample keys from [1] contain binary files which can&#39;t be pa=
tched<br>
by quilt, so archive the files into sample-keys-renew-for-the-next-10-years=
.tar.gz.<br>
<br>
[1] <a href=3D"https://github.com/OpenVPN/openvpn/commit/98e70e7" rel=3D"no=
referrer" target=3D"_blank">https://github.com/OpenVPN/openvpn/commit/98e70=
e7</a><br>
<br>
Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.c=
om" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0...mple-keys-renew-for-the-next-10-years.tar.gz | Bin 0 -&gt; 28118 b=
ytes<br></blockquote><div><br></div><div>That patch does not apply : <br></=
div><div>=C2=A0$ b4 shazam <a href=3D"mailto:20250328090156.635557-1-haixia=
o.yan.cn@eng.windriver.com">20250328090156.635557-1-haixiao.yan.cn@eng.wind=
river.com</a><br>Grabbing thread from <a href=3D"http://lore.kernel.org/all=
/20250328090156.635557-1-haixiao.yan.cn%40eng.windriver.com/t.mbox.gz">lore=
.kernel.org/all/20250328090156.635557-1-haixiao.yan.cn%40eng.windriver.com/=
t.mbox.gz</a><br>Checking for newer revisions<br>Grabbing search results fr=
om <a href=3D"http://lore.kernel.org">lore.kernel.org</a><br>Analyzing 1 me=
ssages in the thread<br>Checking attestation on all messages, may take a mo=
ment...<br>---<br>=C2=A0 [PATCH] openvpn: renew the sample keys<br>---<br>T=
otal patches: 1<br>---<br>Applying: openvpn: renew the sample keys<br>Patch=
 failed at 0001 openvpn: renew the sample keys<br>When you have resolved th=
is problem, run &quot;git am --continue&quot;.<br>If you prefer to skip thi=
s patch, run &quot;git am --skip&quot; instead.<br>To restore the original =
branch and stop patching, run &quot;git am --abort&quot;.<br>error: cannot =
apply binary patch to &#39;meta-networking/recipes-support/openvpn/openvpn/=
sample-keys-renew-for-the-next-10-years.tar.gz&#39; without full index line=
<br>error: meta-networking/recipes-support/openvpn/openvpn/sample-keys-rene=
w-for-the-next-10-years.tar.gz: patch does not apply<br>hint: Use &#39;git =
am --show-current-patch=3Ddiff&#39; to see the failed patch</div><div><br><=
/div><div>Look at the patch, it does not contain any data for the tar.gz fi=
le. Maybe use the &quot;--binary&quot; option for git-send-email/git-format=
-patch?</div><div><br></div><div>Regards,</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0.../recipes-support/openvpn/<a href=3D"http://openvpn_2.5.11.bb" rel=
=3D"noreferrer" target=3D"_blank">openvpn_2.5.11.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A02 files changed, 1 insertion(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/sa=
mple-keys-renew-for-the-next-10-years.tar.gz<br>
<br>
diff --git a/meta-networking/recipes-support/openvpn/openvpn/sample-keys-re=
new-for-the-next-10-years.tar.gz b/meta-networking/recipes-support/openvpn/=
openvpn/sample-keys-renew-for-the-next-10-years.tar.gz<br>
new file mode 100644<br>
index 000000000000..a79e6e4d1576<br>
Binary files /dev/null and b/meta-networking/recipes-support/openvpn/openvp=
n/sample-keys-renew-for-the-next-10-years.tar.gz differ<br>
diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"http://open=
vpn_2.5.11.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.11.bb</a> b=
/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5.11.b=
b" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.11.bb</a><br>
index 810a60308b80..6aed4145ec00 100644<br>
--- a/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5=
.11.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.11.bb</a><br>
+++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5=
.11.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.11.bb</a><br>
@@ -11,6 +11,7 @@ SRC_URI =3D &quot;<a href=3D"http://swupdate.openvpn.org/=
community/releases/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://swupdate.openvpn.org/community/releases/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn@.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvpn-volatile.conf \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sample-keys-renew-for-the-=
next-10-years.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://openvpn.net/community=
-downloads" rel=3D"noreferrer" target=3D"_blank">https://openvpn.net/commun=
ity-downloads</a>&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#116347): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116347" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/116347</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111950963/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111950963/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000d5264c06316399ce--

