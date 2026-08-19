Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D4DC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 22:06:24 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1234.1787177176227883671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 15:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=foYu0CYS;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836cbcd0a48so24635987b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 15:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787177175; cv=none;
        d=google.com; s=arc-20260327;
        b=ooxtBalP4NWWilzXcLbHBz8qQNYK4rb68yQC0rXgKuf7ySwvz0gjoVvrX8ZpEpZihR
         G8Ui03VfJ5w8pf/slebnwUy5sR6lGQSzXAo+sCbyvKJhtlo7PRWp1vJAuWTAyQAecJ1p
         KYOFWT+TeS86LV7A57lm9so8b0V9zWLSR6SpvVOeoTjdMKEkPclTAimWUr5bi+vfCAv/
         7tkjyx66ccHmqr3qfdfZSauebuZwIgSWQ0a6bF74ZlS62n7Dy+rujNuuY4coXHRgkTTz
         piuQM2cHn7WcuSZaFUaivghzfdvT/UxjneNJjY79hWnriSwgdUTM9kzA8sVm8aNSXRBz
         iYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/0c68u8hqyKu8u9QO4luBKOhMHSg5o3TjkYmSz50s/8=;
        fh=dz80R/ANer/tTKnFUKbHHPAtVJQ496f0Tb/SEnVRJXc=;
        b=oAzwSQ6O1xDQlQ3iO4NFwPRFMvl95ALPWsVcdP2Po77FAENq5VCu8MlotoKxnfNZaw
         AVj5xAydhC3heZPWFgghCMP4OxB1OJvqgeEBbxIKtAD3zzMFNf81B77QQaHEAA1ie4AD
         6mDHChazrClbBdB4LmdKDtUPwVW4PxqNr2Vh5zo9bSQRzW0M/vKPRAti/5wlQhzD7rkj
         GfLWWLJdMwteqlF2OTcpJimnYP0deaKxOjVHxiDTUQaDq8Fa0ivFdcYY+nNjoRtvr6J/
         /UrX6DPoYfGhCTOXB0u7JKQvefX0+Hy0LWxTfomoxSFKR/+rOsbq/UCca/vyVB2xeLOf
         36tw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177175; x=1787781975; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0c68u8hqyKu8u9QO4luBKOhMHSg5o3TjkYmSz50s/8=;
        b=foYu0CYS2FyFqrCHRlk03DpyZ2oh0zRkucOB86C1BCyGa/EqpzzefNdpf8LkphzJjY
         TN2ENRlF8cfbYIP0htQe2Ng1ISMqXNK6Bn1btOsscVKfoL9SBEHgMwMhNjfYJ6qgtRja
         1XH5A89FDhBISjKvwPNRK0eD3aTG4ed5YB4fjmBMcyTjsZF6QdIik+ncjI/vyJ24aQhj
         uYdQjyXTjor3YW+s2WjH2epYO/nRKwu2wSXHdzn9q/rTO2HPLKH1qPwtn+RCuZLTwbGW
         t/qsa5ZXz+FPSqsDRipqjnD6sj6FFAJWOgcqJttVJofdPrYnc12opIG06jchpBMiMRk0
         cnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177175; x=1787781975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/0c68u8hqyKu8u9QO4luBKOhMHSg5o3TjkYmSz50s/8=;
        b=XujgDwC1cIkX5gOQgfUtK89QJO9DyxZ2mPiigtnXWVNLQs+r1KuOd4HBKgduqf1z/C
         Fx8tQwT6+oDWZ8dAu0owQTnLnJI8AyTFkBHv3K0fIwJIrLNtTioqM2SPgWJBhgwaNpvT
         br95Ly64VAFI/yGhLyWyEAx9kiK4nkz/mGczxB8YT014nNUfsagO5f30+Dp7qRp1muM6
         VT+0+CUmmuCGyV9OKAMBFQ9SrkqBGgaeWYec2hX3llQiKw8Os31qbK46MzpfK9uZJVXj
         rfZjfB/aRXrL7nZaCwHLdt6JQoLb7F1awEobsq/Ff0kJbpJYG3g85JoZPyDNwVbuhPLD
         +YMg==
X-Gm-Message-State: AFuF++mYilom2UUtOyUNd0DfHNXMR3tVLJMLjTiqcyuASDQtcZ1KA9DS
	VS3l/eTIhyzm5A+wmKBfFiQLL+IoTyA75b22IqJemyPEqOH732j5WD49Ao2Ee3waiVs2i7J9CrP
	haXgrPuqcSY62BzBpMQMPX4XS4IYXCwg=
X-Gm-Gg: AR+sD10iBy5O/7ZAkLx/rCFVbKHnrCmEC7gxFod6wTIpOZgRD21NtcfUcz+W6DKP369
	6pNLUEcQ/6LgImhUtPLpZ0lIbSd8ty0xHdFutFZ6OAkdOIN9SkdOFJLn7I1lYcdtteRptifrv5S
	zbsmy+J4wM99+95E4q8z7KWqviHN5Z7KZ9lDbQkEkcmgexYG1H87d/phiUcI8e0uju9dILtU1iL
	Ht4vjtxXI4PSEc1flIdzMLdyXOZrAYtK/S48ip6+b7gkd0GtjwU0yaVzY+ggbkzwbM6D1eiCCCl
	Rit305daCp5qjnVvTgrHEgv90CJCA2bXdNUTiAAAoPqj6JtLcY7rlNwQE/FSHm52nVtnl2y1nif
	LNBsqkl1TtO07Em24GS5fj0E/9yqIIoa5hdSD+csn1yigefmqyqtzUCmX2CVGym+SDiKvi7l+x4
	gI3f0Fl7v0+Ufpu9mMA+dzblpyIt834uE18UR5psIdNJ94KlYVJ7Hp+hwvJ4VcixyT0Do1DscNB
	XKEvngTFf2WLtYAcIebhCJh
X-Received: by 2002:a05:690c:e684:20b0:80c:5ce9:8f1a with SMTP id
 00721157ae682-844e34a8387mr31148467b3.34.1787177175109; Wed, 19 Aug 2026
 15:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230316033356.2199649-1-zhixiong.chi@windriver.com> <1818840.1787148388748094144@lists.openembedded.org>
In-Reply-To: <1818840.1787148388748094144@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Aug 2026 15:05:48 -0700
X-Gm-Features: AcwNN1XaRfy1WncFfiwoem18k6ep8-EqMzR120TCUG3t3Eeh2Iph64EcmbN7s98
Message-ID: <CAMKF1sr0oXtP7y2Nu9cSo5kKvBuCk9Y2iF99JNk69QUjTd-NTg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ntp: drop the deprecated ntpdate
To: michalwsieron@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ac539c06596d9cab"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 22:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129367

--000000000000ac539c06596d9cab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 7:06=E2=80=AFAM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> I know this is an old topic, but I just noticed that ntpdate is still
> being built and packaged as part of ntp-utils.
> Is this intended, or should we `rm -f ${D}${sbindir}/ntpdate` in
> do_install (or patch ntpdate subdir out of Makefile.am)?
>

hmm that should be fixed yes.


>
> Br,
> Michal
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129362):
> https://lists.openembedded.org/g/openembedded-devel/message/129362
> Mute This Topic: https://lists.openembedded.org/mt/97643958/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ac539c06596d9cab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 19,=
 2026 at 7:06=E2=80=AFAM Michal Sieron via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>I kn=
ow this is an old topic, but I just noticed that ntpdate is still being bui=
lt and packaged as part of ntp-utils.</div>
<div>Is this intended, or should we `rm -f ${D}${sbindir}/ntpdate` in do_in=
stall (or patch ntpdate subdir out of Makefile.am)?</div></blockquote><div>=
<br></div><div>hmm that should be fixed yes.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Br,</div>
<div>Michal</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129362): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129362" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129362</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97643958/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97643958/1997914</a><br>
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

--000000000000ac539c06596d9cab--

