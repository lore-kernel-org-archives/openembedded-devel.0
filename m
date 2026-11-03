Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14614.1793721326933759236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 07:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I8bJgIc8;
 spf=pass (domain: konsulko.com, ip: 209.85.219.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b89c6caffso33461926d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793721326; cv=none;
        d=google.com; s=arc-20260327;
        b=E2uPLdv3hRfiM81Q5IMb9/RfAv16bsY6jkplQl0sKr7VH2kSWBdad/1lzCr35bTTpJ
         lhABkZgb+WRxerLx3R9RcUsjEfQ58eUyj+93wzfhxcl7xOMIAGMnsZAU4k13FJhe0hjU
         Z5Khen7+mV/Mt7f+zbB3ywpvOps0gemzbf7qUGNRprX8i247U7oJxFmRr2uJ5fcxsUjj
         NLnidYkDNNi0zrm0kvDf9DeGZYFqfb876yYjSWj5HRb2geWsofD7AqARcYM+FbFvZMFw
         3o0pT7HPZv6nz54FyBICnknDzYt8zABFYboYGxcyCZJrTQ4NRmb5CTDkwcIwjGoETFD9
         D0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pa+AdbuHi1jaN/cO2hrFMACfWt/srW8oRTWGswp85Gw=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=SPiFAZad+S355mvzNZzmgGV1/bUpqLYM5hnFmkTIn0Kb0AyM1T3RbQ7kM/yrweClLL
         DLT/1DUiTccevs6JWiIDnVf7aQoUq/mwuoOOQi7NpjyIjD04MaE3BKeg/xPTv5rcivNL
         Q2K5LUSOWtmvvSTT8N4fbh/5wWMJYB7ZJliENkwiPE+FfCrtbbCJD9+0QwiDhyaako8D
         O2OR7r8T2nbFw01hViC85c+nsNpZgoYMCyo47dtVG7AcoGDKu++1UGyO1GlR+LhpvW0v
         kmnoomgK0AOd7XegFNTidEmSu/DVzYXEil8062KFyCrCoyyP0DWeE3JWSWpUNNKpFWkf
         ccTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793721326; x=1794326126; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pa+AdbuHi1jaN/cO2hrFMACfWt/srW8oRTWGswp85Gw=;
        b=I8bJgIc8rGzhJDe+DqzBTV4c/kI2ppoLPqrbxGYAURgkZ2EqP9dUELbwePO1s8AecH
         JMtISrXAgkKiEb4BZYWnXnLwzgDhnPIg+TVHyPQtY/cRPN3PX7FLH51lnMG4S4T/5sDw
         RLuAWSsUTNxFH+lKgb0XeoqOD2oAxnGUPCUfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721326; x=1794326126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pa+AdbuHi1jaN/cO2hrFMACfWt/srW8oRTWGswp85Gw=;
        b=b2QTcO5X8Yrl9O5diltWBzLqqABKD6pQhOUtO/vCxSl72Q6dRhFZY1OmISe+ayxn8G
         Jrplup6L65Z4cSpmIIgd7wUmkONXbRzHtYrpAB3k0hi7chdbY2qONPr3POB0EsJHa9hi
         s7AfD9280k3G3jJmZYCaarPvXy2xfPYLHDWSgQIAXgcDAaSILNpGquYjJS088qJ2Fsko
         LYM/CAxR3aM5j0zPkoGyUdKw2Zp6PnQgpoRMFu8xMt6nTFMBWSFBO1QVysEKGWbhT5ug
         ntI8AIdaJxnjquBWKKm69b3rl1HGJPG8SAsSlWkLNAnq6PsvYZGrRke2PFv8xoUCaIzk
         ipzw==
X-Gm-Message-State: APuU4Z/MpulBSrvSuojjn8TpvHXuIP8Dk/lsEHtLG6UBdCmK38jI0BBZ
	HBhne6r08PpzGiU8XQlQIy4HNwoN7c/4eQNGfMKFMhWk9INLaUsWWAgNMCUgQOlYiP2oPOyRZ/0
	mzyJWkd0iVYeXWiMz5XpSV/CL/vJKGes46R3fzjAKZg==
X-Gm-Gg: AYBFou3AI65m8uvJdBi/V/nmo1/RkP9KzE7uimllJxo/rRpodPwy/VE28qw+1OM+Qd1
	t97uVg3ZMKD/9L8XjZH5PyPawXTam5b4Jj2JHK3h2EEzQTNv5cRSKl4fRJS6BYBkKULYXRS79aB
	VSYdWyk0kBuAo08dXU7RBF4SG6XVeLP42Od0xEYGEuzKxbDn1LZ1257h4CGdaTtMxVGWusiWjva
	4ds7XbE1qi37h8ORCmEiWAW+hVv/EYxFCq7bJXDgweWAAIlzrSdvZ2QXVB/sEJuP5fe3AZY3sny
	tffMRQdqXOaRh2SGvj8OWBj8S80UJ503/vcA+cNLmFodbOkF2GG7KlwIvmvLv1i39QlvU1067+7
	ct3y5/2YPSPL/jfRttuOvtnB0PPsYRNqyUUpsirNCFmWOZ5XwWBAcLcV4T9cRgYXLQ1utfbSMV5
	scRY1EjoFrI1yNDK5X/TVTpr8bqeGUQ/9f5eSjUpjZ4VN3fXYb
X-Received: by 2002:a05:620a:6484:b0:93e:bbda:dd06 with SMTP id
 af79cd13be357-944213d6502mr2179840285a.0.1793721325619; Tue, 03 Nov 2026
 07:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20261103145328.1973965-1-leon.anavi@konsulko.com>
 <20261103145328.1973965-3-leon.anavi@konsulko.com> <CAMKF1soPVRZnP2TMvtwU1KOgsndQjJmNZbVgsFxncDu+-oO20Q@mail.gmail.com>
In-Reply-To: <CAMKF1soPVRZnP2TMvtwU1KOgsndQjJmNZbVgsFxncDu+-oO20Q@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Tue, 3 Nov 2026 17:55:14 +0200
X-Gm-Features: AclHuK9_ga_-N9pKd6oAQU0DwvdZlI_OkxhyX8ZswL8ynf9sU7s2x6w2MmTa2bs
Message-ID: <CALtQ3O2J4cssDgK=6QV990gB+JJaUekjhM1wzS2LoZPWFD3-6A@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 3/3] overlayfs-tools: Upgrade
 2025.01 -> 2026.10
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000709e7c065f614acf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131797

--000000000000709e7c065f614acf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Tue, Nov 3, 2026 at 4:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Nov 3, 2026 at 6:53=E2=80=AFAM Leon Anavi via openembedded-devel
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
>> Upgrade to release 2026.10:
>>
>> - meson: Disable tests build by default
>> - Define attr dependency
>> - Test if merged overlay is usable after mounting
>> - Remove trusted xattrs from upperdir metacopies before copying
>>   attributes
>> - Add Option To Use rsync for merge Operation
>> - Support merge metacopy file
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  ...verlayfs-tools_2025.01.bb =3D> overlayfs-tools_2026.10.bb} | 6 +----=
-
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>  rename meta-filesystems/recipes-utils/overlayfs/{
>> overlayfs-tools_2025.01.bb =3D> overlayfs-tools_2026.10.bb} (68%)
>>
>> diff --git a/meta-filesystems/recipes-utils/overlayfs/
>> overlayfs-tools_2025.01.bb b/meta-filesystems/recipes-utils/overlayfs/
>> overlayfs-tools_2026.10.bb
>> similarity index 68%
>> rename from meta-filesystems/recipes-utils/overlayfs/
>> overlayfs-tools_2025.01.bb
>> rename to meta-filesystems/recipes-utils/overlayfs/
>> overlayfs-tools_2026.10.bb
>> index 3b5963bb26..6a3d609567 100644
>> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.b=
b
>> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.b=
b
>> @@ -7,14 +7,10 @@ SRC_URI =3D "\
>>      git://
>> github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv${PV}
>> <http://github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;branch=3Dma=
ster;tag=3Dv$%7BPV%7D>
>> \
>>  "
>>
>> -SRCREV =3D "6e925bbbe747fbb58bc4a95a646907a2101741f6"
>> +SRCREV =3D "950d0cf35e4f917b6836565d76e38bcf7fcf2d5f"
>>
>>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
>>
>>  inherit meson pkgconfig
>>
>>  DEPENDS:append:libc-musl =3D " fts"
>> -
>> -do_configure:prepend() {
>> -       sed -i '/Custom targets for testing overlay function/,/command :
>> .*permanent...changes/ d' ${S}/meson.build
>> -}
>>
>
> Why is this hunk removed ?
>

In version 2026.10 the tests build is disabled by default because file
meson.build has been modified to include "if get_option('tests')".
Following this change I don't think we still need it and anyway if we keep
do_configure:prepend the build will fail with: "ERROR: Expecting endif got
eof."

Best regards, Leon


>
>
>> --
>> 2.47.3
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#131793):
>> https://lists.openembedded.org/g/openembedded-devel/message/131793
>> Mute This Topic: https://lists.openembedded.org/mt/122076983/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000709e7c065f614acf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem,</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, 2026 at =
4:55=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 3, 2026 at 6:5=
3=E2=80=AFAM Leon Anavi via openembedded-devel &lt;leon.anavi=3D<a href=3D"=
mailto:konsulko.com@lists.openembedded.org" target=3D"_blank">konsulko.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Upgrade to release 2026.10:<br>
<br>
- meson: Disable tests build by default<br>
- Define attr dependency<br>
- Test if merged overlay is usable after mounting<br>
- Remove trusted xattrs from upperdir metacopies before copying<br>
=C2=A0 attributes<br>
- Add Option To Use rsync for merge Operation<br>
- Support merge metacopy file<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://verlayfs-tools_2025.01.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">verlayfs-tools_2025.01.bb</a> =3D&gt; <a href=3D"http://ove=
rlayfs-tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-too=
ls_2026.10.bb</a>} | 6 +-----<br>
=C2=A01 file changed, 1 insertion(+), 5 deletions(-)<br>
=C2=A0rename meta-filesystems/recipes-utils/overlayfs/{<a href=3D"http://ov=
erlayfs-tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-to=
ols_2025.01.bb</a> =3D&gt; <a href=3D"http://overlayfs-tools_2026.10.bb" re=
l=3D"noreferrer" target=3D"_blank">overlayfs-tools_2026.10.bb</a>} (68%)<br=
>
<br>
diff --git a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://ove=
rlayfs-tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-too=
ls_2025.01.bb</a> b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"htt=
p://overlayfs-tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overla=
yfs-tools_2026.10.bb</a><br>
similarity index 68%<br>
rename from meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://over=
layfs-tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tool=
s_2025.01.bb</a><br>
rename to meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overla=
yfs-tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_=
2026.10.bb</a><br>
index 3b5963bb26..6a3d609567 100644<br>
--- a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overlayfs-=
tools_2025.01.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_2025=
.01.bb</a><br>
+++ b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overlayfs-=
tools_2026.10.bb" rel=3D"noreferrer" target=3D"_blank">overlayfs-tools_2026=
.10.bb</a><br>
@@ -7,14 +7,10 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/kmxz/overlayfs-tools=
.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" =
target=3D"_blank">github.com/kmxz/overlayfs-tools.git;protocol=3Dhttps;bran=
ch=3Dmaster;tag=3Dv${PV}</a> \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;6e925bbbe747fbb58bc4a95a646907a2101741f6&quot;<br>
+SRCREV =3D &quot;950d0cf35e4f917b6836565d76e38bcf7fcf2d5f&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
=C2=A0inherit meson pkgconfig<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; fts&quot;<br>
-<br>
-do_configure:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/Custom targets for testing overlay=
 function/,/command : .*permanent...changes/ d&#39; ${S}/meson.build<br>
-}<br></blockquote><div><br></div><div>Why is this hunk removed ?</div></di=
v></div></blockquote><div><br></div><div>In version 2026.10 the tests build=
 is disabled by default because file meson.build has been modified to inclu=
de &quot;if get_option(&#39;tests&#39;)&quot;. Following this change I don&=
#39;t think we still need it and anyway if we keep do_configure:prepend the=
 build will fail with: &quot;ERROR: Expecting endif got eof.&quot;<br><br>B=
est regards, Leon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131793): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131793" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131793</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122076983/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122076983/1997914</a><br>
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
</blockquote></div></div>

--000000000000709e7c065f614acf--
