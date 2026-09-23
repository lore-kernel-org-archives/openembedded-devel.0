Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733F9C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 03:51:18 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4130.1790135475819589021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 20:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b2jKqPQz;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac929eso457703d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 20:51:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790135475; cv=none;
        d=google.com; s=arc-20260327;
        b=HYhMC8zwU1BlUnug72m1ZWkhs3n8STAMbairzpCeJZ5hv5xRxY1eB4yw+HEGVTrKDP
         /7P6iNk3Wbj4iUOQI/NJM5xq/ZphyQfhqpRURbbEymhwf+zJT3Nq4gYoh4IpaogYACEN
         Qu/FI07JCOcXW4BjV539/hw912fWTifUXI2QxutOJ2dTQHNLren7+nVdIiICOBpVnUyy
         U4w3/lRAfaZ/Vo3PQ2E6Wol0Zg1kwL3MgdyvuDO90/GUZh6/80/lOTvsCae3tpFGVc8I
         PfFLLbQQ2Ixqt1wrGJCiKSyMlzNgea6dwmdGhuAfwFHJNQEmvTlDB4JVjZGkapdcqCuv
         q+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B7ARWVgACTGSnhgIPyPg1zTpaB6TWR5t2mn+AUBYFSs=;
        fh=zMjjQ2/3xS5gOjCx82DbEQJVX07OSnRFcILHjF1qOQM=;
        b=nQuQo/BAaQcsnTA2d2as26XiOHJNVL0VrgS2kkBvuCY9NZEsGVKf9HFLR1seBqX87n
         nd89bkng5HcU775hALt9/M9BAHJ2eBiCOXQXTWAzadxWZLOA3KWPM0DQnV3lOlhqhLoo
         hEa17vQj2ujiFyUNFvStefHFDd76tiVo3ZPpQswT2Utzh4twBSXPIN1Xgp2g/92xNteK
         4H3BIHWjstMAA1OzAvwV5YRAYYrNrIzbDwQNbBMNqoUDIoor27DpeoXXwmv9S2VGJpkw
         d/6nEtYO/EebvLrqaL7my6RRBER7jMU/U5O9qwAmxhe3h7esWV8yuVT0bMS7cNooJ4EL
         ePng==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790135475; x=1790740275; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7ARWVgACTGSnhgIPyPg1zTpaB6TWR5t2mn+AUBYFSs=;
        b=b2jKqPQzZiJ4shqYzWxF6Y2aeqXMPxsHUmNF2lslqqDi8fMuh0cOCxksl1+14IUgJb
         tnqOTBm0hE9+tgdGdEOwC4/1+PH4A7Yzy7meJYXx6a3AzpHRe2WVMlfSzwg8U0LdCHgi
         oKY1uqTip+Vd8ywmmm93qWdrIaGXOwyIVyMNTxYGigdL27YMp+Jznpiqxripr28BSllt
         Tk1NodCKH5ibYDTU+uTpFnsTp9Waxsun3Z2C96wDc+qId+xGzF5oc4WJQpJAO4hN/sT5
         +WgYLzutdFuRK6x1DKnHepPGpKlbfubSdIbZm7wmI5zZUipM9IIiUIwUOT+u0wv8oHmg
         8Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135475; x=1790740275;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B7ARWVgACTGSnhgIPyPg1zTpaB6TWR5t2mn+AUBYFSs=;
        b=SuJItnCBr33qlAV0bY7zGVCjodVh4rfjNKrru3GYV87TcXjEalLktBn/Yur/NOL5uy
         CXlMS0H4xi9wLYfTFFImBbMu604nvW0JlP3LFF03Ab66avvXJUsIDgt1oQi0emPwS1ih
         qqaZreGCD0m+pWS37qEp+8X1TgRzz09COsynZH3I5GW4zSTzODKnrfr7InhHD+51iRHY
         sbZ3rmWzTaxrbvn98/+TJXcf6UaLw9/pzWnF7/uRjumemDdQ+1IUFrdrImwY3EwJJ2UB
         0mR+6GXOp1kr8RxysUDw/eP0yT8k3wTJxBGWgJR+VF3cagtHUNeOJBFQdvpLCy9/jccs
         QcUg==
X-Forwarded-Encrypted: i=1; AKwUvBxVSD1spNMm8RF6i4lsIvNY7yqX1zPFxyXsfaiWQd9Y41Xdo09YClPs5eyTYbLZlVYOxtwoTRO3GIFW0o1Y9pZxIj4=@lists.openembedded.org
X-Gm-Message-State: AFuF++nr6vjF1tNUT/Mb4n/ztGovpeLXJ7FBlerHyn5T1SCbmz57hflc
	Z9pw3qnbQC5qyZkx2oV5vj3cwJaueDQ36aoBHeycX1zEnRms+RPL9xsFVxqOt1Aq526TeKocEUB
	QOQmNuUYVPe1VQgv5D8OJn6H8GqOf0mg=
X-Gm-Gg: AYBFou0NrWPuXehzmRku3izB02KUf5+PEzcqe/Z3Mjpkb2bpz8cn1Uz80lsFEjGOICa
	GTeboFcmHvrNwUGcimHDr8aed9vrox+YanDF5HzCi2fg78J+ImMzgvFd91kC3zZGJBLNit2RGS4
	4XYyLLruvYNZqJ7gi7Y2Mwts2mD/3HXrBVsfOQU+e0KpS6KT80G8sNX/P1saHjOq2P4XCOjjNEH
	wsdwPNcmXz1YSAsCcD8VBvOQqnmFX1JhtQn9Yd0n/6+kRTltH8BEL7/f5hdmT9SYV5n6HMhPg7J
	vvsgOjpdNY/APqbe2uIuyD1H4FjbG+3ZaOnobDtitUZyeaDP1rlV/OJbSUeaW8J7AcpKOr73fKK
	Zs9gdMXITgDtirZidYwZql1gRdIevyBRl5ry99xxrthr5mOvSzNbsh+AJ8byFo419kryEzWcEq7
	dBY0/FiRR11kmFVcXHeUuo3fBV1QO3Ghy2riVeSBxchkhfybtPRcgM/r2ELqduUGT/bSI30WAW7
	ytwi2yW6Vh5FDg1xI3q15psOftioiF4xjElD1A2qoUJGa1rqacq6D2DXN4JQBTUxSEc9CqM4GOg
	ST07311U6IqJz+PozHAVqfzKF2G4kOxpbmX1i/aN
X-Received: by 2002:a05:690e:4499:b0:66f:c1be:a64f with SMTP id
 956f58d0204a3-672d589812fmr595290d50.65.1790135474696; Tue, 22 Sep 2026
 20:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260923012442.3830864-1-csiltala@atcorp.com> <CANx9H-DpC+P=Dn+z7dfTpYzerZGbgjZnF-4SuywLt-SzHGtRbw@mail.gmail.com>
In-Reply-To: <CANx9H-DpC+P=Dn+z7dfTpYzerZGbgjZnF-4SuywLt-SzHGtRbw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Sep 2026 20:50:48 -0700
X-Gm-Features: AcwNN1WErRi7Y9FWowWlAZPdNhPEX-IV3aXkR8xMt6wfaMOpuw_0omyVuTdFolA
Message-ID: <CAMKF1spqyYgSRYjhjf0bwZLp0mx=dnXxYrYxCsjeiMXTZLjQsg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] bmon: upgrade 4.0 -> 5.0
To: ticotimo@gmail.com
Cc: csiltala@atcorp.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000011b8d8065c1e6542"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130179

--00000000000011b8d8065c1e6542
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:11=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Sep 22, 2026 at 7:58=E2=80=AFPM Corey Siltala via lists.openembed=
ded.org
> <csiltala=3Datcorp.com@lists.openembedded.org> wrote:
>
>> Fixes:
>> - out_curses: use xcalloc instead of a fixed buffer
>> - Avoid trying to include <values.h> on Android
>> - Fix typographical errors
>> - curses: Fix seperator lines
>> - Fix build in FreeBSD/DragonflyBSD
>> - fix segfault on element removal
>> - fix: Fix memory leaks in module_set()
>> - fix: Convert usage of strdup/free to xstrdup/xfree
>> - Fix compile issue in OpenBSD
>> - Fix spelling and grammar in docs and comments
>>
>> Features:
>> - Allow numeric colors in bmonrc
>> - curses: Add CTRL-N/CTRL-P for next/previous element
>> - feat: Add IPv4/IPv6 addresses to additional info
>> - feat: Add configure option to disable IPv6 in netlink module
>> - feat: Add ability to toggle TC elements
>> - curses: render graphs with Braille cells
>> - display filters for TC ingress and egress
>> - Add support for JSON output
>> - Remove the 'Really quit' dialog and just exit cleanly
>>
>> Misc:
>> - Update to autoconf of the common era
>>
>> See full release notes at
>> https://github.com/Jafaral/bmon/releases/tag/v5.0
>>
>
> It would nice to explain why the git repo changed. There is no mention
> anywhere that I can find.
>
>>
>> Signed-off-by: Corey Siltala <csiltala@atcorp.com>
>> ---
>>  .../recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.bb}        | 5 ++--=
-
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>  rename meta-networking/recipes-support/bmon/{bmon_4.0.bb =3D> bmon_5.0.=
bb}
>> (56%)
>>
>> diff --git a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>> b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>> similarity index 56%
>> rename from meta-networking/recipes-support/bmon/bmon_4.0.bb
>> rename to meta-networking/recipes-support/bmon/bmon_5.0.bb
>> index f47069471a..0ceff05984 100644
>> --- a/meta-networking/recipes-support/bmon/bmon_4.0.bb
>> +++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
>> @@ -1,11 +1,10 @@
>>  DESCRIPTION =3D "Portable Bandwidth Monitor and rate estimator"
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D
>> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302=
"
>> -# only works with libnl-0.5.0
>>  DEPENDS =3D "libnl libconfuse ncurses"
>>
>> -SRCREV =3D "1b3f11bde315e221474f7d066ce4efb4ff4d39e3"
>> -SRC_URI =3D "git://github.com/tgraf/bmon.git;branch=3Dmaster;protocol=
=3Dhttps"
>> +SRC_URI =3D "
>> https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BPN}-${PV}.=
tar.gz
>> "
>>
>
you can use BP here instead of BPN-PV which essentially is the same but
concise.


> +SRC_URI[sha256sum] =3D
>> "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
>>
>>  inherit autotools pkgconfig
>>
>> --
>> 2.34.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130178):
> https://lists.openembedded.org/g/openembedded-devel/message/130178
> Mute This Topic: https://lists.openembedded.org/mt/121387285/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000011b8d8065c1e6542
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22,=
 2026 at 8:11=E2=80=AFPM Tim Orling via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ticotimo=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Sep 22, 2026 at 7:58=E2=80=AFPM Corey Siltala via <a href=3D"http://li=
sts.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;csil=
tala=3D<a href=3D"mailto:atcorp.com@lists.openembedded.org" target=3D"_blan=
k">atcorp.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Fixes:<br>
- out_curses: use xcalloc instead of a fixed buffer<br>
- Avoid trying to include &lt;values.h&gt; on Android<br>
- Fix typographical errors<br>
- curses: Fix seperator lines<br>
- Fix build in FreeBSD/DragonflyBSD<br>
- fix segfault on element removal<br>
- fix: Fix memory leaks in module_set()<br>
- fix: Convert usage of strdup/free to xstrdup/xfree<br>
- Fix compile issue in OpenBSD<br>
- Fix spelling and grammar in docs and comments<br>
<br>
Features:<br>
- Allow numeric colors in bmonrc<br>
- curses: Add CTRL-N/CTRL-P for next/previous element<br>
- feat: Add IPv4/IPv6 addresses to additional info<br>
- feat: Add configure option to disable IPv6 in netlink module<br>
- feat: Add ability to toggle TC elements<br>
- curses: render graphs with Braille cells<br>
- display filters for TC ingress and egress<br>
- Add support for JSON output<br>
- Remove the &#39;Really quit&#39; dialog and just exit cleanly<br>
<br>
Misc:<br>
- Update to autoconf of the common era<br>
<br>
See full release notes at <a href=3D"https://github.com/Jafaral/bmon/releas=
es/tag/v5.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/Jafara=
l/bmon/releases/tag/v5.0</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It would nice to=
 explain why the git repo changed. There is no mention anywhere that I can =
find.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Signed-off-by: Corey Siltala &lt;<a href=3D"mailto:csiltala@atcorp.com" tar=
get=3D"_blank">csiltala@atcorp.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/bmon/{<a href=3D"http://bmon_4.0.bb" rel=3D"noref=
errer" target=3D"_blank">bmon_4.0.bb</a> =3D&gt; <a href=3D"http://bmon_5.0=
.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/bmon/{<a href=3D"http://bmon_4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a> =3D&gt; <a href=
=3D"http://bmon_5.0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a=
>} (56%)<br>
<br>
diff --git a/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a> b/meta-networkin=
g/recipes-support/bmon/<a href=3D"http://bmon_5.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">bmon_5.0.bb</a><br>
similarity index 56%<br>
rename from meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0=
.bb" rel=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a><br>
rename to meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><br>
index f47069471a..0ceff05984 100644<br>
--- a/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">bmon_4.0.bb</a><br>
+++ b/meta-networking/recipes-support/bmon/<a href=3D"http://bmon_5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">bmon_5.0.bb</a><br>
@@ -1,11 +1,10 @@<br>
=C2=A0DESCRIPTION =3D &quot;Portable Bandwidth Monitor and rate estimator&q=
uot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D083=
5ade698e0bcf8506ecda2f7b4f302&quot;<br>
-# only works with libnl-0.5.0<br>
=C2=A0DEPENDS =3D &quot;libnl libconfuse ncurses&quot;<br>
<br>
-SRCREV =3D &quot;1b3f11bde315e221474f7d066ce4efb4ff4d39e3&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/tgraf/bmon.git;branch=
=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/tgraf/bmon.git;branch=3Dmaster;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/Jafaral/$%7BBPN%7D/release=
s/download/v$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${B=
PN}-${PV}.tar.gz</a>&quot;<br></blockquote></div></div></blockquote><div><b=
r></div><div>you can use BP here instead of BPN-PV which essentially is the=
 same but concise.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+SRC_URI[sha256sum] =3D &quot;6016e41fdda9166b86b09a0ac601a0c453c3b35acdf90=
4c97a8a555459ad73c0&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130178): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130178" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130178</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121387285/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121387285/1997914</a><br>
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

--00000000000011b8d8065c1e6542--

