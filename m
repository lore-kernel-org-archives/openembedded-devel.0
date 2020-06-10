Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.13624.1591803093976776724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 08:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EDurUCnd;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id k2so976075pjs.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=ET7bkJx//8omUDtqJeuiprthYrn+wOLX4xdBzoQ0qek=;
        b=EDurUCndlTmmGzpWSHPrjAysV9Hl3jXn3mVqPBhLTU6gJ4h/5uW07YgL2k7auky6RZ
         M4U5cFVwPDEA6QZ5ICxR1mBfaRbMdvuQCEhPq85sYfakNcAIhMroeMESSE04AdlP8n4I
         gJ04ZgQxx7hlZkO3/HCeyhuLYp3J0glyT5FXdc4hs73Xlq5wutkMaXahGmaGE1ZHuDPH
         cFJjB3yGLkb+O0oB9L/Gwh398smb2A+Nj7m3ARtKznkgclegk8r1Vac+8HD/ln3UhCW0
         Uot0YefbnjbdL53d/mpwRXsTQMIxvYs5GPb8Brt+WTeH3pGNG1YYs9AvdG84dFp3rj3a
         cy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=ET7bkJx//8omUDtqJeuiprthYrn+wOLX4xdBzoQ0qek=;
        b=VkcogUHrPr6G8n6vvC5rFwD6u12sOWMvpUKNidTOVNfWUR3yT5CCrGFajKSUuyu/uV
         bgaYz99xaIxiJEEwJrN/BhU98VphN9HAhj0sEK0kRaFhRIna3ktmWzysv611fIn5kmKT
         WI+tVfeR9bV/ls6I2CmqGFiTBIhYZWOOreN5Ojo0MlUej2L3s278jY3Axx+qCyHVrA4k
         UNwp902ShYzgvroOBrNHxe4wgEL8RVAcMJaK/KJCTw2Hm2C2f+bM9iTwpA+O/knuKcou
         nWD/4qgiQOCFRAmfzoB+Xa9kobc+t/o150Le+eB+Oz54q4uw0+hZVdel1WgDiBK+ylBE
         hLtg==
X-Gm-Message-State: AOAM533aeI/KCh3QsJgag58OlZr6fQriLv9sPF9nOn8gkOOzpMEA4J9/
	gb+RArhrgUI+QVbpF1L6dDZblEOH
X-Google-Smtp-Source: ABdhPJweNIG3ZtpVZr6EBaV5feSAb2B99AM9rutq+ShwHTJjPtcvhl5KJUJsDDzoCZe9AC7d0Yihew==
X-Received: by 2002:a17:902:bccc:: with SMTP id o12mr3619581pls.29.1591803092646;
        Wed, 10 Jun 2020 08:31:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:254a:4327:67e1:d5be? ([2601:202:4180:a5c0:254a:4327:67e1:d5be])
        by smtp.gmail.com with ESMTPSA id y4sm217743pgr.76.2020.06.10.08.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 08:31:32 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] qpdf: fix typo in RDEPENDS
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20200610070254.9851-3-bunk@stusta.de>
 <161734680D9462D5.22420@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <de85eca5-e1a5-3099-abc9-d864b7aed2b4@gmail.com>
Date: Wed, 10 Jun 2020 08:31:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <161734680D9462D5.22420@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------29D6B8BFA9C6ACA8B29DF533"
Content-Language: en-US

--------------29D6B8BFA9C6ACA8B29DF533
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 6/10/20 7:16 AM, akuster via lists.openembedded.org wrote:
>
>
> On 6/10/20 12:02 AM, Adrian Bunk wrote:
>> From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>
>> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Adrian Bunk <bunk@stusta.de>
>> ---
>>  meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/rec=
ipes-printing/qpdf/qpdf_10.0.1.bb
>> index 3883a8dcf..600508097 100644
>> --- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
>> +++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
>> @@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf =3D "1"
>>  PACKAGES =3D+ "libqpdf"
>>  FILES_libqpdf =3D "${libdir}/libqpdf.so.*"
>>  
>> -RDEPEND_${PN} =3D "libqpdf"
>> +RDEPENDS_${PN} =3D "libqpdf"
> Ah, now I see it.

Correction.=C2=A0 I have this already in stable/dunfell-nut
https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable/=
dunfell-nut&id=3D1f97b33ee11e132f4afc0b25d85d58ccea0b77ec

-armin
>
> thanks,
> armin
>>
>
>
>=20


--------------29D6B8BFA9C6ACA8B29DF533
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/10/20 7:16 AM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:161734680D9462D5.22420@lists.openembedded.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      <div class="moz-cite-prefix">On 6/10/20 12:02 AM, Adrian Bunk
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20200610070254.9851-3-bunk@stusta.de">
        <pre class="moz-quote-pre" wrap="">From: Maciej Pijanowski <a class="moz-txt-link-rfc2396E" href="mailto:maciej.pijanowski@3mdeb.com" moz-do-not-send="true">&lt;maciej.pijanowski@3mdeb.com&gt;</a>

Signed-off-by: Maciej Pijanowski <a class="moz-txt-link-rfc2396E" href="mailto:maciej.pijanowski@3mdeb.com" moz-do-not-send="true">&lt;maciej.pijanowski@3mdeb.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com" moz-do-not-send="true">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Adrian Bunk <a class="moz-txt-link-rfc2396E" href="mailto:bunk@stusta.de" moz-do-not-send="true">&lt;bunk@stusta.de&gt;</a>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 3883a8dcf..600508097 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf = "1"
 PACKAGES =+ "libqpdf"
 FILES_libqpdf = "${libdir}/libqpdf.so.*"
 
-RDEPEND_${PN} = "libqpdf"
+RDEPENDS_${PN} = "libqpdf"</pre>
      </blockquote>
      Ah, now I see it.<br>
    </blockquote>
    <br>
    Correction.  I have this already in stable/dunfell-nut<br>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/dunfell-nut&amp;id=1f97b33ee11e132f4afc0b25d85d58ccea0b77ec">https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/dunfell-nut&amp;id=1f97b33ee11e132f4afc0b25d85d58ccea0b77ec</a><br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:161734680D9462D5.22420@lists.openembedded.org"> <br>
      thanks,<br>
      armin<br>
      <blockquote type="cite"
        cite="mid:20200610070254.9851-3-bunk@stusta.de"> <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <br>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------29D6B8BFA9C6ACA8B29DF533--
