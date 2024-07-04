Return-Path: <jacoba@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1685CC3065C
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 09:02:35 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.6252.1720083749582990941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jul 2024 02:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=H/OPZYbz;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.219.182, mailfrom: jacoba@thehoodiefirm.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e03b0e73f14so426063276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720083748; x=1720688548; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kXjCGqlGMEYkCYwty+eJ/4xENib0otHsWj0WzJRlMqQ=;
        b=H/OPZYbzQUFcOIN9i5SOkikSn5jbWAwv39qlwtwpTrGyp8X9xhDIx1qYF+N4QYPDBo
         UOZS4ewQJIMys8JKHkB8Uc9rImERi4Ws1bD2LqLFfVob6//mFCUDx1ffW7NInYoZaE+6
         rXM8DygjSU/uQB5MUL7391tT3cW5bUG490hotBYOzwhZTsHON+IZgaqPUoyQhGBJ8YRF
         rRVW0HhxriFkJrskoj8SfYuhbZe3LOS+HqimpcQFEJ0UI1Sm9xvBvyfZGgViIBJFfWEG
         SlvATrn9MMokkEMXlb1DCIudmENu9UOcRZdxYjcbR+HYWKHetbdggrGN+AFkKkYCigYV
         npFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720083748; x=1720688548;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXjCGqlGMEYkCYwty+eJ/4xENib0otHsWj0WzJRlMqQ=;
        b=lMH/rVw92MXTsLY+KJgqvRuVVedpQtf3GHt51re9IuiyBx/MAfCE3Fa6/J20q0zurK
         mRAJowFx3dLpYVPMAkJ/pSZc5fq4lnmLJArkrLORxKAixQs//aFTEC0cZzs4UWscDldr
         hQoLZhDPhNk8XKU4g6EXBBOzo/hNzjJyFya0yyEA2E3yGALkh1FuDGF+pmtsbYFfiy78
         +Uf6Ee7j6v/hMUKFyaZQZFHt+3+OOJiq3+Kw9akvJL5xhO6GbZqzknHwFI8xOC+LEvYo
         7WuBuqaqthgqMLyJKSWhxoKrb6zLOkemBI7XVVL9/+Vg3Y/If/ccXHwPycKR4uNW1AOk
         9WxQ==
X-Gm-Message-State: AOJu0YyGoAadEJighA12NTLm/nYY2hAZ0xwTmZgNhRUjq42AtqOw/fni
	QvnIxfIzb0aUOBtdSjmkd3Il69U6H90waRAso7mLh2yJ+F3BwWg1GvCjqkmucd74mbM7/zrbYCI
	BCWBzSm6fHzA6xek0fPm97V4gIuJClFSS7ArAlTN+EPtXXaIaM9I=
X-Google-Smtp-Source: AGHT+IHML0kp5M63XK7F5p9oQfitfdl3V8gM2jS70zR5QQWznNhBFyOe1gB6zXDJb8H8s+9v8aXqD5nKNFArGw1Hpz4=
X-Received: by 2002:a05:690c:640f:b0:650:859b:ec8d with SMTP id
 00721157ae682-652d5a140b6mr10794027b3.10.1720083748518; Thu, 04 Jul 2024
 02:02:28 -0700 (PDT)
MIME-Version: 1.0
From: Jacoba Brandner <jacoba@neighbourhood.ie>
Date: Thu, 4 Jul 2024 11:02:17 +0200
Message-ID: <CANgaEnLXUKjX-V65zJ3mhugd2f5CKJpBzvgLzPeaLvOPYoF9Kg@mail.gmail.com>
Subject: Reports for CVE triage
To: openembedded-devel@lists.openembedded.org
Cc: Engineering <engineering@neighbourhood.ie>
Content-Type: multipart/alternative; boundary="000000000000d09dc1061c683407"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 09:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111251

--000000000000d09dc1061c683407
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OpenEmbedded contributors,

This email contains a review of the remaining CVEs from the status list:
https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-statu=
s-master.txt
This work is done as part of "Milestones 3, 4, 5 and 6. Triage CVEs" as
stated in the Scope of Work with Sovereign Tech Fund (STF) (
https://www.sovereigntechfund.de/).

The reports are saved as HTML files here:
- Milestone 3: https://clients.neighbourhood.ie/yocto/81-120.html
- Milestone 4: https://clients.neighbourhood.ie/yocto/121-160.html
- Milestone 5: https://clients.neighbourhood.ie/yocto/161-200.html
- Milestone 6: https://clients.neighbourhood.ie/yocto/201-221.html

The reports contains a review of the CVEs including the following:
- Package versions affected
- Current package version on 'meta-openembedded'
- Notes on how the CVE can be addressed

Please note that for the CVEs marked as 'invalid', separate patch status
updates have been sent to this mailing-list:
openembedded-devel@lists.openembedded.org.

The collection of all emails we've sent to NIST are saved here
https://clients.neighbourhood.ie/yocto/NIST.html

We can also provide this in any other format that might be convenient for
you. Please let us know.

Thanks,
Neighbourhoodie team

--=20
The Neighbourhoodie Software GmbH
Harzer Stra=C3=9Fe 39, 12059 Berlin
neighbourhood.ie

Handelsregister HRB 157851 B Amtsgericht Charlottenburg
Gesch=C3=A4ftsf=C3=BChrung: Jan Lehnardt, Simone Haas

--000000000000d09dc1061c683407
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear OpenEmbedded contributors,<br><br>This email contains=
 a review of the remaining CVEs from the status list:=C2=A0<a href=3D"https=
://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-mas=
ter.txt" target=3D"_blank">https://autobuilder.yocto.io/pub/non-release/pat=
chmetrics-meta-oe/cve-status-master.txt</a><br>This work is done as part of=
 &quot;Milestones 3, 4, 5 and 6. Triage CVEs&quot; as stated in the Scope o=
f Work with Sovereign Tech Fund (STF) (<a href=3D"https://www.sovereigntech=
fund.de/" target=3D"_blank">https://www.sovereigntechfund.de/</a>).<br><br>=
The reports are saved as HTML files here:<br>- Milestone 3:=C2=A0<a href=3D=
"https://clients.neighbourhood.ie/yocto/81-120.html" target=3D"_blank">http=
s://clients.neighbourhood.ie/yocto/81-120.html</a><br>- Milestone 4:=C2=A0<=
a href=3D"https://clients.neighbourhood.ie/yocto/121-160.html" target=3D"_b=
lank">https://clients.neighbourhood.ie/yocto/121-160.html</a><br>- Mileston=
e 5:=C2=A0<a href=3D"https://clients.neighbourhood.ie/yocto/161-200.html" t=
arget=3D"_blank">https://clients.neighbourhood.ie/yocto/161-200.html</a><br=
>- Milestone 6:=C2=A0<a href=3D"https://clients.neighbourhood.ie/yocto/201-=
221.html" target=3D"_blank">https://clients.neighbourhood.ie/yocto/201-221.=
html</a><br><br>The reports contains a review of the CVEs including the fol=
lowing:<br>- Package versions affected<br>- Current package version on &#39=
;meta-openembedded&#39;<br>- Notes on how the CVE can be addressed<br><br>P=
lease note that for the CVEs marked as &#39;invalid&#39;, separate patch st=
atus updates have been sent to this mailing-list:=C2=A0<a href=3D"mailto:op=
enembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-dev=
el@lists.openembedded.org</a>.<br><br>The collection of all emails we&#39;v=
e sent to NIST are saved here=C2=A0<a href=3D"https://clients.neighbourhood=
.ie/yocto/NIST.html" target=3D"_blank">https://clients.neighbourhood.ie/yoc=
to/NIST.html</a><br><br>We can also provide this in any other format that m=
ight be convenient for you. Please let us know.<br><br>Thanks,<br>Neighbour=
hoodie team<br clear=3D"all"><div><br></div><span class=3D"gmail_signature_=
prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div>The Neighbourhoodie Software GmbH</div><div>Harzer Stra=C3=
=9Fe 39,=C2=A0<span style=3D"color:rgb(0,0,0)">12059 Berlin</span></div><di=
v><a href=3D"http://neighbourhood.ie" target=3D"_blank">neighbourhood.ie</a=
></div><div><br></div><div>Handelsregister HRB 157851 B Amtsgericht Charlot=
tenburg</div><div>Gesch=C3=A4ftsf=C3=BChrung: Jan Lehnardt, Simone Haas</di=
v></div></div></div></div></div></div></div>

--000000000000d09dc1061c683407--

