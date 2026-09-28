Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBF0CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 20:24:22 +0000 (UTC)
Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67427.1790627054846543128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 13:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dr1+ULTP;
 spf=pass (domain: gmail.com, ip: 74.125.224.166, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f38.google.com with SMTP id 00721157ae682-8ab3e848918so612397b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 13:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790627054; cv=none;
        d=google.com; s=arc-20260327;
        b=SVdvIsqTQ3UAjzEb/5jbrGkwW/mUYmLWRBHjBZ6HAB3U0ctECA0m9nkTISllXkordm
         HKGgNcqavsP0hGyib9hQMMFVl9bgSxgzpS2jOcrZP6EXb7/ncGCXhm3kq8bZOkOq+xVw
         S9AGXKU0WpHOu4teBCVHkOm0tw0uuKzXeRhx/jbctwl1tIfZ0o+M29f+uLJbx4zoMQrz
         A1ly/Hps5D+DCvo5LEUc0n3yWlYyeWkT32848fq8OlsrZT7vKKkiXxO5YlDxTXWx4qrV
         P110HISlCvRmTmyaJYtsZ0QTWLYikSAR25L8cAa6lzxNe4vOG9avcYLy9WmT4PISyM/a
         Sj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2IVjQelKj7wY1Dr0adp7FGvR2LuWpma+Mv6CWE1Grlg=;
        fh=z3PwvM7VNberB9FAXxX7DrRfyp1Sr/N9pzdNsDquXHg=;
        b=fOXtS8vWKGBWI25DDPpJbSK/ZsjrYpClukPkhLSXacm3NEL4XjueS1zw4N1/0jZuv+
         SxvGpMBVIaVKtSFVQmtYGbPZVmn6iYAMInl9aYGROtnatediodquqcJEggZqVa7f9p6Z
         crMLFYo2TaruKbag57tLhzURVBKaZzSy6NcwShbxY4uLPhmtbAfs1sVORqEjXu0lzJSx
         /lR1Ra2XXrGYPh6I/eND9AdcjkJzIFw1SoMB1w4S7AU9n3Oxb8U51yb+12OLyH01Ohi+
         G9H8sOEh8remFFhhN6hbG8bwaC1jwoax9tglDTrGPQJdBaXImR45nVYI9VZufobC+1KZ
         xqlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790627054; x=1791231854; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IVjQelKj7wY1Dr0adp7FGvR2LuWpma+Mv6CWE1Grlg=;
        b=dr1+ULTPrzQjuwIcsmKsqyEWbSVFOskCY4djJshzPBYlZcXWrilAYB2pYOrCsqZEy8
         Lo0d9MMeUDhWvvMrnACQpN7IR29NqGLgeVLylyeVQ9mYTDxMY02rHgltLUnidqSvm2U6
         /fv1PvAxCHBvTHHG+87XTepZzcAbUR07vwq3Hq4hCBWHgofTAKrlt2xTdTQydUEf3Z+I
         xa5VB+G7JshDnOZkKHasBe+vuwn7YGpZ5UF6voAXVjI2R017LlLdXv/QFjxj9P44JTYN
         DhYL0ctuv1KsjtySQqfQy9+w88daBI5yhGKKkrdmrANEUvk76bma1CkmZhkZwcGDUM8A
         J43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790627054; x=1791231854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2IVjQelKj7wY1Dr0adp7FGvR2LuWpma+Mv6CWE1Grlg=;
        b=QsoY1LMuCwTSLgt9a273aRn+esQXrGRy61MiXJVm1NVgb1WfM9MY7FEavCrUYwjIU9
         1yg86mlsF0jlSzqIbiLQWv4u8dPFx9oY6Q3MtXVChqADLg+6CGapFyUtf1Dc1ULWJ6HW
         a5uzy1qPCI0Igr7u3yy3j/I57IuvG3Lm/YTCMPOsKAUQ9y1dyhCCnBQWMUavopUSEpFF
         A/zPpfrgflYSRX6tD6OR3PDzA7dyJEwTr6gPkoTk8jqq385iAGdld4YSwKx+RdW1sGNv
         yHtPSFrUkjophl32XLCP/tvcXBGdxcqi8JVFV7rPL/SuM6xDJbwwU82Ufdfid9F+Tv5s
         +gZA==
X-Forwarded-Encrypted: i=1; AKwUvBzxZwn2eUKCmn0B5pIyG+HvO/KEkgJhbhAS/8CSw1N25LnCvXGSwDOdn1lRDkHGw6n8t6RNTdEjZE8FacsF31Xv6bU=@lists.openembedded.org
X-Gm-Message-State: AFq9FYKXc1c5KoedO+bjpjxbuUqaxwUNwr8YXgBfIS5aCJErNzVLLYXJ
	vnZUO3N+de+YO0gwr3h+Hcr31zGQRVxg5WqHeIQtP2V2MS9gjEd6LGWUfjHNXZ80LS9g1D+u56N
	fQdFeeezrX2k6KHcWafLyVmcbQCVvCZY=
X-Gm-Gg: AYBFou17KvCBUFebRjrFpT88YTeb5wsgjnf8iuX+DC4DECul3eW1XaAnDgPUBfDp7hT
	RryRPZTuk8o7h364Ex0d0hWW+j+r/oF+4ljGInhvxdJKkcMumjSsxq7XaKjHrNT1K3WcD07ADUe
	Q5UrjNt12RI1kHQG4TtSthu5LMplowPsxaMp7pJjEbu3fYYtAb6H0y57U86sjQEQnXnNyUulOEZ
	74PfGkNIqXAeCE/QjBMTvvZcsmB8vJRuzjBjz4pGsjWqlPCmvntWswHj+won17029Vp5sUPB3NW
	8NkLN3L4s4fNAsOq6nEHQrHss3e2M2rhlmhCKLq+5BBLbfrZD/IZjPiaYGCaQ1BNqRNpG6u2X9j
	JXCDfh7nC2QwuCK5SZMOIcB46QDRCEmuSda0DJvXrG14H+3E4+BxlJvhhfYsiA0PWK5eCgbKUHu
	l95OQDr3ryeGMQ/w1p+T0JEu7voHMKJm5U8KI70pluff24M0aRdqTy64KjXq1MrMX6ZX/UrHjjI
	I35uca66CQA3L2pohXwwgbg1ALADuCgzhtEzxuGRGT/PDmNt9pyWbsNpWhii4jEFkwe6VMC3Gav
	0FjQlheM6mqkWUilw7Q=
X-Received: by 2002:a05:690e:14c1:b0:672:99e1:1204 with SMTP id
 956f58d0204a3-672ed56b46cmr5217428d50.161.1790627053723; Mon, 28 Sep 2026
 13:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260928130631.4254-1-mark.jonas@de.bosch.com>
 <20260928130631.4254-2-mark.jonas@de.bosch.com> <CAMRc=Mdv7cj-Sq7QdhyeVaQxQ3Q3vSzSYe+32tu_WEA3RkJhXg@mail.gmail.com>
In-Reply-To: <CAMRc=Mdv7cj-Sq7QdhyeVaQxQ3Q3vSzSYe+32tu_WEA3RkJhXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Sep 2026 13:23:46 -0700
X-Gm-Features: AclHuK_vPpkPxUZMnJARa2yGmH_vNzmVXbDDLM2_TkPp0mjJNXsgDJP9hKLkip4
Message-ID: <CAMKF1soenLaOSVd-Jm-YLPCOO8r5+=ssN3eNhaePKKe0gPgNRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 1/2] libgpiod: update libgpiodbus license
To: brgl@kernel.org
Cc: mark.jonas@de.bosch.com, bartosz.golaszewski@oss.qualcomm.com, 
	khem.raj@oss.qualcomm.com, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, 
	openembedded-devel@lists.openembedded.org, 
	"Mark Jonas via lists.openembedded.org" <mark.jonas=de.bosch.com@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007668e7065c90d960"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 20:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130470

--0000000000007668e7065c90d960
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing

NOTE: libgpiod: md5 checksum matched for
file://LICENSES/GPL-2.0-or-later.txt;md5=3Db234ee4d69f5fce4486a80fdaf4a4263
NOTE: libgpiod: md5 checksum matched for
file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4b54a1fd55a448865a0b32d41598759=
d
NOTE: libgpiod: md5 checksum matched for
file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b94d88bfb9b81369b869a1e9a20f
ERROR: QA Issue: libgpiod: The LIC_FILES_CHKSUM does not match for
file://LICENSES/CC0-1.0.txt;md5=3D3b83ef96387f14655fc854ddc3c6bd57
libgpiod: The new md5 checksum is 65d3616852dbf7b1a6d4b53b00626032
libgpiod: Here is the selected license text:

On Mon, Sep 28, 2026 at 8:03=E2=80=AFAM Bartosz Golaszewski via
lists.openembedded.org <brgl=3Dkernel.org@lists.openembedded.org> wrote:

> On Mon, 28 Sep 2026 15:06:30 +0200, "Mark Jonas via
> lists.openembedded.org"
> <mark.jonas=3Dde.bosch.com@lists.openembedded.org> said:
> > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> >
> > The license for libgpiodbus in upstream has been updated to
> > LGPL-2.1-or-later.
> >
> > Thus, update the package license and backport the upstream change
> > until it lands in a release.
> >
>
> Not: this patch now no longer updates the package license.
>
> Anyway:
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130441):
> https://lists.openembedded.org/g/openembedded-devel/message/130441
> Mute This Topic: https://lists.openembedded.org/mt/121470950/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007668e7065c90d960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am seeing<div><br></div><div>NOTE: libgpiod: md5 checksu=
m matched for file://LICENSES/GPL-2.0-or-later.txt;md5=3Db234ee4d69f5fce448=
6a80fdaf4a4263<br>NOTE: libgpiod: md5 checksum matched for file://LICENSES/=
LGPL-2.1-or-later.txt;md5=3D4b54a1fd55a448865a0b32d41598759d<br>NOTE: libgp=
iod: md5 checksum matched for file://LICENSES/CC-BY-SA-4.0.txt;md5=3Dfba3b9=
4d88bfb9b81369b869a1e9a20f<br>ERROR: QA Issue: libgpiod: The LIC_FILES_CHKS=
UM does not match for file://LICENSES/CC0-1.0.txt;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57<br>libgpiod: The new md5 checksum is 65d3616852dbf7b1a6d4b53b=
00626032<br>libgpiod: Here is the selected license text:<br></div></div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Sep 28, 2026 at 8:03=E2=80=AFAM Bartosz Golaszewski vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
brgl=3D<a href=3D"mailto:kernel.org@lists.openembedded.org">kernel.org@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Mon, 28 Sep 2026 15:06:30 +0200, &quot;Mark Jonas via<=
br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a>&quot;<br>
&lt;mark.jonas=3D<a href=3D"mailto:de.bosch.com@lists.openembedded.org" tar=
get=3D"_blank">de.bosch.com@lists.openembedded.org</a>&gt; said:<br>
&gt; From: Ricardo Simoes &lt;<a href=3D"mailto:ricardo.simoes@pt.bosch.com=
" target=3D"_blank">ricardo.simoes@pt.bosch.com</a>&gt;<br>
&gt;<br>
&gt; The license for libgpiodbus in upstream has been updated to<br>
&gt; LGPL-2.1-or-later.<br>
&gt;<br>
&gt; Thus, update the package license and backport the upstream change<br>
&gt; until it lands in a release.<br>
&gt;<br>
<br>
Not: this patch now no longer updates the package license.<br>
<br>
Anyway:<br>
<br>
Acked-by: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz.golaszewski@oss=
.qualcomm.com" target=3D"_blank">bartosz.golaszewski@oss.qualcomm.com</a>&g=
t;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130441): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130441" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130441</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121470950/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121470950/1997914</a><br>
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

--0000000000007668e7065c90d960--

