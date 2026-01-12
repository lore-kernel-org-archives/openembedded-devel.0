Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E314FCF45CC
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 20:00:46 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42167.1768248039649837297
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 12:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BOKD6JyV;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78f99901ed5so63144047b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 12:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768248039; x=1768852839; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm49e6TeVZS4OmNkPSv+8TaD7/xJxG3sM55Foz9/m08=;
        b=BOKD6JyVt0f2h/4Y5qAjOi8zuRdmvEyAzHaPCDdjB1ADScbl9+Xpx76BnWRLBKpgsk
         t4W5ftXfBi/92V0fepErpQtznfy5UCQcWY70CFxOZoOHngLxJ9P3aA7juJsfXvCRjvfu
         E4Yz3RHgUmBAfSpTaBFJs0Qh8HjgyQ5BJTUwjLlNNoddwBGhBMOBbKcGWOjHkjmQZOIG
         bftnFn60umDNdnD3BXFDG5H8CwhUPazGWtMnOTeWiaKkBhptjcgDWXN2FFqvoplQrAna
         9SetFXmRg827gYZf7Azcqb/RPrWDkATdS7qdSbhtxiV306DgAzRmVlEhuuDn9qlD3uGM
         1Afw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768248039; x=1768852839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dm49e6TeVZS4OmNkPSv+8TaD7/xJxG3sM55Foz9/m08=;
        b=TI2adhR2pOAlaHVqpBYguRi1z3O2E6YWCNiWq5QiypanMXp9rqa3F1axfao1wZ3lWI
         wmVXCQCuN0g4Re/J9LQpiv4oryT/mu9qG/hCoGZRySAg0f6ZYdtBmoJSO+xt9YKVzVuA
         dcPg6Yhyevaw4mRN+1xIwrxC72CT2kt9yHCKXcU33tJ4HMHpIG3eNfh/kRukiJL7dqKj
         DFQ86qfeYwNzaknhRDLkENblTN9pi2hOWDPTkB+Cv09YTrjojXI5hqLK35lRzZL2ubVO
         t8sqQmYGWiWFKa+B/re6ZJqhDV/Tb1c0aSoHxQ0v+YfMmIFVvZCqsW3jJ4jiBJDDHPKv
         k/YQ==
X-Gm-Message-State: AOJu0YztyZ2foQBpV30rxSPKutmlNCGa337Dyc0Ib7u8G7mrl3n4O4yg
	5Nwa2P8grstASrAxTpZSWsROR5HhUFaLtrB+F8kvrtoU7ljogiwY0Ed51qxExF3PGBJ84ouUF9c
	As5htAgYae3tt2xMkNferqQbxCIU4Ti0=
X-Gm-Gg: AY/fxX4igk6spbMfJEquW7TQwKUq/Fibfsqq/a0svf/7SRbodR9UOqVwjhPHJB7OJdg
	I8Fi2rTwCBKsXP7NYwx6/eSX9s3m72YpgwFJqvfWdfpsbvnBe1bjzCKkaZ+2lzHeR9YMJQ7IpXn
	DfVlWB4I+fxNsxCk6bkiT7ny459Ksa5w64e9yclhctO16CHWiw7XIhux+YXV0rI0DxoZtQb386w
	UrsV6dMe+YuP4y51GokDtRQzwhiCQxEo0kLDUVB7iv0Y9xI796ClB/PNZO9eD/89CBKK07kIEG7
	CpZXdoBJ0f837ZeBC6v49P71UW/PeDb/tuEwH93vl/3sjn3bRk8VWtzDTEjwti7GlvxajJgtQnH
	PyN1PjxkjU8sikbqo9eYPDchwIUYOT4JiFVesEgSbAg==
X-Google-Smtp-Source: AGHT+IHrXkC2nVePEW93sRtkJMZ461ZDoHEE3tdaAfXO7ev5lToUv0KgTNyHdb50CCfuyWeKwG+STa42ctPvF6mHVIQ=
X-Received: by 2002:a05:690e:4007:b0:644:51a4:4f16 with SMTP id
 956f58d0204a3-64716c37decmr14351562d50.45.1768248038696; Mon, 12 Jan 2026
 12:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20260110115148.9069-1-f_l_k@t-online.de> <CAMKF1soYoKRdX8bpQ5GK62DmXxyjEw7c3Acgob=xys6okTWOjg@mail.gmail.com>
 <K4MR8T.7KIKIKY4AX1B@t-online.de>
In-Reply-To: <K4MR8T.7KIKIKY4AX1B@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jan 2026 12:00:12 -0800
X-Gm-Features: AZwV_QgYkmQUTk6hud73RZAT0r_S04453AYhe6HIBq-Z_m3tiFQPGG73iWOrC68
Message-ID: <CAMKF1sqS+Ov8+s_9YSj1nks0KiJaeoMbsfZivk=Mk_1VNP7QOg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] btop: update 1.4.5 -> 1.4.6
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000038a8ea064836542f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 20:00:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123390

--00000000000038a8ea064836542f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 11:00=E2=80=AFAM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> On Mon, Jan 12 2026 at 10:23:19 -08:00:00, Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org> wrot=
e:
>
> adding native gtest dep is causing build problems with clang/lld as it no=
w
> finds the native version instead of target version.
>
>
> My mistake. I thought it would require native googletest for testing but
> it actually wants to link for target.
>
> Did some testing and either
>
> DEPENDS =3D "googletest"
> or
> EXTRA_OECMAKE +=3D "-DBUILD_TESTING=3DOFF"
>

yeah maybe turn it off for now.


>
> would fix the issue as well.
>
> Maybe the latter would be the better fix since tests are not being
> installed and run on target?
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123389):
> https://lists.openembedded.org/g/openembedded-devel/message/123389
> Mute This Topic: https://lists.openembedded.org/mt/117189895/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000038a8ea064836542f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 12,=
 2026 at 11:00=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.=
de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_8=
950435320587672249geary-body" dir=3D"auto">On Mon, Jan 12 2026 at 10:23:19 =
-08:00:00, Khem Raj via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.=
com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.=
org</a>&gt; wrote:<br><blockquote type=3D"cite">adding native gtest dep is =
causing build problems with clang/lld as it now finds the native version in=
stead of target version.</blockquote><div><br></div><div><div>My mistake. I=
 thought it would require native googletest for testing but it actually wan=
ts to link for target.</div><div><br></div><div>Did some testing and either=
=C2=A0</div><div><br></div><div>DEPENDS =3D &quot;googletest&quot;</div><di=
v>or</div><div>EXTRA_OECMAKE +=3D &quot;-DBUILD_TESTING=3DOFF&quot;</div></=
div></div></blockquote><div><br></div><div>yeah maybe turn it off for=C2=A0=
now.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div id=3D"m_8950435320587672249geary-body" dir=3D"auto"><div><div><br></=
div><div>would fix the issue as well.</div><div><br></div><div>Maybe the la=
tter would be the better fix since tests are not being installed and run on=
 target?</div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123389): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123389" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123389</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117189895/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117189895/1997914</a><br>
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

--00000000000038a8ea064836542f--

