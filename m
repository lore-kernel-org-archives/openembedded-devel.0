Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23822C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 21:30:54 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101333.1783114251245085271
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 14:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FT5n6tCO;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8111c0c7561so9434807b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 14:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783114250; cv=none;
        d=google.com; s=arc-20260327;
        b=VuLdrmhl3tdi+g1sPWQaEzdwkqy/h4ky+Y17VBl0wX5G3uHtAcFphTCkuNcyfOy2Uc
         G90v4ry7ue7RrMPANF8qlZookkybI286MRxSah/rpsObw1iXZ/CqvB4JJXsz+pxwhmzi
         GIBwqndFxV1zXiMyEkJEztOgtzv8Oyzw3bjA5TMo8j223GRfR+s0u9ffsdv5yjX1UfFM
         3KXBYzBmEGwmBvVE1W0MVD+H0o88S5GjllLwLZ4gK5ovToMRDlbBMegGMz0+Jt/8XUC6
         SEaLfAK6q1bUQ7getwkPaAM3nqWZZ+UbqpdFwasHkXbvR3JUskmvn1sX6CWxY2ARljb3
         7Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dHw2T4sgvPvu9irAwOUCTscqEi5/ZXERn1+E7VxSmtE=;
        fh=tvH0fRzsTzWp7W9pVcVBj/Hg9HcaDtV/l9F/msdGtu4=;
        b=T3zAjiOMQLt6eFN09gqG6lLPixBHIr+pHBQWqAijB6faykylmUwvSzIZYtdMra62aL
         65XtUcgG2wwJ6JEjjnxOwlbNSMhdiihMxJlCkOoO7g1Fizim44B/ghJ7sk/M0COVi+ef
         ElQ0KV9smyc2Pic7hi3hAovtXaForPxbCLWdV9Uc5SGtWBqT1oDzufU0UTdtnvYlySIP
         SUsg4twOMmWfuBMAFHAOY494jf99w29a12VfgT6Es+g9rfE5okBkdi3XZzIcqhedNXnr
         kIi51cOG10vRaFs7ZgT4KCBu7ufD3SiArPqinoI17pxze5gtnH58lKQLvfdxIxhLbRyn
         608w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783114250; x=1783719050; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dHw2T4sgvPvu9irAwOUCTscqEi5/ZXERn1+E7VxSmtE=;
        b=FT5n6tCOtnUfQ736ia5KyEd46HYnhAOph87IxyKusIvgHqGXZTLsh5wKWp7pXGOp01
         a5WesoXBeNf7KSF83kWySH4PAachkNMMS+xrdOv1EGR7kbkBpvj69McczN93qaHiWSiG
         unNdVTKsMAd6Kilxc+bFuAegTdi58acdVWfaewfETKpSOn4avvW80dmsCjLPmVoJjMH7
         fYXNFeD7u/1MmVrLIuylKKTJEiupqo2+VU/95s4k0kCfOCu6d8W7QsFDalm8MU1UCjyo
         w/NeX0Rtnc/PFAGPsBL0/m33YhN7PnurPJy/nfjrslQzmIUkTAn3fAsQGkhd2CvR1ILD
         nfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783114250; x=1783719050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHw2T4sgvPvu9irAwOUCTscqEi5/ZXERn1+E7VxSmtE=;
        b=mkbPXVKFAyRL7kot0xgSO91/A8e39GU6i2LH1ZjGa6WZIAaK9aIh/zoNxgTjeXY3CP
         QFMDEwkMAZaGQZyds1bPXUQv8H+uLXgKJz2+HQSZIw+Z4wGF/hRaVes40ASkOOklX9Ak
         DdNYLWy3ZJD/+43fSrbl1ujh/qEGeZov904A6uO55bcqX3EupfZVkDuCaaYveYJ6nXDC
         RwSDzpWGUeO3Q/u+IWECl0tTbLgPEalTyOIYWX2QCTrrkEvXeo14fAMPNg2Iv37HEaxE
         QZFORpxJay+6KAFXM8dM9B/jk00kUYWB0FUu+p9bWIfGTUE/et9xJAddBE6eJ9YY5i+E
         kTXw==
X-Gm-Message-State: AOJu0YzohqKoM/JoP2uAbr2eb2Ryw9zTpwgZc56XjzIDgjBqTjKi/frU
	FjqK0CKt6oVxzyy9xjCG/brZ9bqEr/p8T9fLlnvOGR3Kejtx03BGeiWP/w+9JdJmO6e6lNwfoAT
	O9Krs5FQkWDvX4JIyqLdd+f3aE0tWvwkCgzfW7USGYA==
X-Gm-Gg: AfdE7cmyqvim1vBC4UtVDHCKUtyg6KpEAC/r3qFu2nDnxPGT9HzJGyJ8t6E7vK4xlm5
	J70ge4gEdy0bUmurlZHBPcwj9rq8zuyzSaxXsnymQtgh1My9ugfTA9DGrQOWIlmZzM9zlMMwh7o
	4bKKK61IJRlUuJ6V33L3NY2cxMla+v+BJ4SCtevvFIO7D8DPJhnbsGnKFQpczP0nHvzW7hKduch
	fTcpzAKW8Jm5SZEuqkX34uxVns4t7kJiixA6gx0oyK7P6BvpcOcqQM93vZ8Y7UNgYFtymIYbxiI
	73i1l/wDW0K7HKAqJd5zY585R6wdzG8NlXm/NOM3C/W9+zJ9hYoNclSS20AjR8+1EPQDYxzpFFa
	ro2BNFy+GCgMY2ZBS2u1sUsFESteGZu5vNou2+Tcbsmv0J6Xi0fV3CYRqAvgNmKWPyZ+jdA==
X-Received: by 2002:a05:690c:c452:b0:80a:9ff6:c02 with SMTP id
 00721157ae682-817396ecfe2mr9386397b3.54.1783114249994; Fri, 03 Jul 2026
 14:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260703172800.480930-1-mail@michael-fitzmayer.de>
 <CAMKF1sqx57Qh_=gkVecREUxndur18rj-9hJy0YucXxK+-y-mPA@mail.gmail.com> <001601dd0b18$a89cec80$f9d6c580$@michael-fitzmayer.de>
In-Reply-To: <001601dd0b18$a89cec80$f9d6c580$@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jul 2026 14:30:23 -0700
X-Gm-Features: AVVi8CdXy41Bv21bqYE4oF1PAnzIyFLpREq06E3wRDow9L81mJumj3IAG-1RbiU
Message-ID: <CAMKF1sqxt7Lkpv9-e1LcDCDBSmVK0Wfr9pVrPww=u0guqU4PtA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.03
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007706be0655bba3e5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 21:30:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128016

--0000000000007706be0655bba3e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please add License-Update: <reason> tag to commit message and send v2

On Fri, Jul 3, 2026 at 11:20=E2=80=AFAM Michael Fitzmayer via lists.openemb=
edded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:

> canopenterm: the checksum differs from previous version because the
> copyright year span has been updated.
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* 03 July 2026 19:35
> *To:* mail@michael-fitzmayer.de
> *Cc:* OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
> *Subject:* Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.03
>
>
>
> Please document what change in license check sums to differ
>
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128014):
> https://lists.openembedded.org/g/openembedded-devel/message/128014
> Mute This Topic: https://lists.openembedded.org/mt/120103307/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007706be0655bba3e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please add License-Update: &lt;reason&gt; tag to commit me=
ssage and send v2</div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 3, 2026 at 11:20=E2=80=
=AFAM Michael Fitzmayer via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;mail=3D<a href=3D"mailto:michael-fitzmayer.de@lis=
ts.openembedded.org">michael-fitzmayer.de@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg900415979818103081"><div lang=3D"EN-GB"><div class=3D"m_900415979818=
103081WordSection1"><p class=3D"MsoNormal"><span>canopenterm: the checksum =
differs from previous version because the copyright year span has been upda=
ted.<u></u><u></u></span></p><p class=3D"MsoNormal"><span><u></u>=C2=A0<u><=
/u></span></p><p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></=
b><span lang=3D"EN-US"> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt; <br><b>Sent:</b> 03 July 2026 =
19:35<br><b>To:</b> <a href=3D"mailto:mail@michael-fitzmayer.de" target=3D"=
_blank">mail@michael-fitzmayer.de</a><br><b>Cc:</b> OpenEmbedded Devel List=
 &lt;<a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D=
"_blank">openembedded-devel@lists.openembedded.org</a>&gt;<br><b>Subject:</=
b> Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.03<u></u><u><=
/u></span></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div><p class=
=3D"MsoNormal">Please document what change in license check sums to differ<=
u></u><u></u></p></div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div>=
<blockquote style=3D"border-width:medium medium medium 1pt;border-style:non=
e none none solid;border-color:currentcolor currentcolor currentcolor rgb(2=
04,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm"><p =
class=3D"MsoNormal" style=3D"margin-bottom:12pt"><u></u>=C2=A0<u></u></p></=
blockquote></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128014): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128014" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128014</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120103307/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120103307/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--0000000000007706be0655bba3e5--

