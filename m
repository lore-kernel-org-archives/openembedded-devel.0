Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F52CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:22:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.22995.1758219736957516575
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 11:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agJJyt5O;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: zboszor@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b54a74f9150so1031883a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758219736; x=1758824536; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9DUkusuaNqH2MrV/fMLud++3SdPBwwmjnPvr5Da2ho=;
        b=agJJyt5OmWMecHo7mUxGmxgI4KSD1dNDRwVf90oi1TUs5b+PbgiyEEkhVVlNolm45N
         kPmFeDgjIGurtW+BrDyhNWXod9RqXX8Q4K1aefPTu4p3sz/+1sf3gPLS2WpkBIytnRQr
         8n0+mXBoLeTbGOXAs0JXomklgJ/Dhb78TtfgyDpbM6udpSh/ds706D2pylbEeVnA6KZu
         oWER0S2/JfuXkYwcYDHK88X5jlz1pjp6EDfd3Ota9WwC2FNhFtd8hhV37ZpVuff1K6+F
         pN25oaSXDRyfo530++UMl4DnYAzTWs43hGsRHiLlJI0HFJrd+P/rlJ7gYFgs5jQMz9zZ
         YOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758219736; x=1758824536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9DUkusuaNqH2MrV/fMLud++3SdPBwwmjnPvr5Da2ho=;
        b=wU5T4UK9RmO+hIGdmaZDL8cCxpWw96mpbGkjthfG3/nzk95fr2DGzTaOdksyIwxiGA
         fRVeVCBnOxI6lNzsUutlsLNnSihMhL9eka99/o8o6Dm4VEZXB/Zep3sWpmBKhxEm5J7M
         PMesOyWMwgy/rd1WabKdQVZPzsjtFu3uacXiO00N0AQSkbp2FVFkTrmjGYOv7hHa06dD
         ME61mseTNE/NQrbs5uH814Q/XIfPM7B/RCofHNrygUkBiULggJxmRKpb1rDoElwBUCK6
         aUhpq2TzLmyfaZMKF3kDP8L1cKOTF2HvyQNoHNWzLo62U9rcGxvHwUA9EN+dSDUFdDu4
         IoHQ==
X-Gm-Message-State: AOJu0YwnVzC+8KtOHMAHp4R+h15TnNze+1LkQgE0HLuDnxXttyH4V02I
	VlxLVYjAYkmTsLeqSqi2sw92VR7Pwr1LCxXOTvvDY6WkMWzO6tgNUZed
X-Gm-Gg: ASbGncvKETDUZNa/VC5tN5v4HVNK+8+xqkSTjWr471iZtgQCK+qCACZdWLGLtOwjduw
	zI43+VDdX9Kl/vKPN0GfKZk6GW0RNwvGas4c3sJUih+FltGW04wSSQ317+RPU973AZZkoHFnweP
	v5/NBi57naTOSZGJTBoaOKLaDFZQvUPQr8y+pv6a0nzvnQdK00ia4FS0qbLNwlcvNme9/UMV3YP
	vqP30oRXifamE8jEb0bo58MYiobqGaKjgUK3/pnd44a0S5PFr5bFP2f2L0alGEf02POrzHAgAN9
	oqXrY0kxdMqf8brVIijH71Hx5cp464cjNP/ok6Luq51h9W4MNHVbUHYU/96IVUJ1+gQnfyr+cc5
	X4pGaT0I48Psrho95bgQ3xZ6o+MYOKqCsEI1a5umdTqBeAlGYDFYztp7cFukbSWfnpy/lp4X5XI
	s=
X-Google-Smtp-Source: AGHT+IHBwrb3uoNJkWfABI14E+Q30zeATfKkaKx6iKj6qCZaj3B+o8LirRKPpEUT/r1YmLnkr5qMkQ==
X-Received: by 2002:a17:903:4912:b0:24d:1f99:713a with SMTP id d9443c01a7336-269ba503ef6mr3986145ad.31.1758219736237;
        Thu, 18 Sep 2025 11:22:16 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016bf11sm31596945ad.34.2025.09.18.11.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 11:22:15 -0700 (PDT)
Message-ID: <f7ce8c19-fb1e-4a4f-80eb-c41c79aef706@gmail.com>
Date: Thu, 18 Sep 2025 20:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20250918102642.487522-1-zboszor@gmail.com>
 <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
 <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 18:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119580

2025. 09. 18. 19:42 keltezéssel, Yoann Congal írta:
>
>
> Le jeu. 18 sept. 2025 à 16:16, Yoann Congal <yoann.congal@smile.fr> a écrit :
>
>     Hello,
>
>     Le jeu. 18 sept. 2025 à 12:26, Zoltan Boszormenyi via lists.openembedded.org
>     <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org> a écrit :
>
>         This fixes an installation error:
>
>         | make[5]: Entering directory
>         '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
>         | chmod 700
>         .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint
>         | chmod: cannot access
>         '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/backend/backend_gutenprint':
>         No such file or directory
>
>
>     What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
>

I got the error with 5.3.4 and it has gone away with 5.3.5.
I admit that I only tried the build once. I will retry tomorrow.

>     The above error is the one I fixed with the patch
>     "0001-cups-fix-a-build-race-condition-around-empty-directo.patch" and this patch has
>     not been merged upstream nor the code I touched changed. I did not see anything
>     related by quickly reading the NEWS.
>     I'd be happy to see this fixed upstream but I'd rather have upstream confirmation
>     that they saw/fixed it (a commit, a changelog, ...).
>     If that is fixed upstream, then we can drop my patch.
>
>
> To be clear, I'm not against upgrading. I just don't think the commit message is correct 
> (but could be convinced otherwise).
>
>     Thanks!
>
>         Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>         ---
>          .../gutenprint/{gutenprint_5.3.4.bb <http://gutenprint_5.3.4.bb> =>
>         gutenprint_5.3.5.bb <http://gutenprint_5.3.5.bb>}    | 2 +-
>          1 file changed, 1 insertion(+), 1 deletion(-)
>          rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb
>         <http://gutenprint_5.3.4.bb> => gutenprint_5.3.5.bb
>         <http://gutenprint_5.3.5.bb>} (96%)
>
>         diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>         <http://gutenprint_5.3.4.bb>
>         b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>         <http://gutenprint_5.3.5.bb>
>         similarity index 96%
>         rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>         <http://gutenprint_5.3.4.bb>
>         rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>         <http://gutenprint_5.3.5.bb>
>         index f90a123293..82953b798c 100644
>         --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>         <http://gutenprint_5.3.4.bb>
>         +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>         <http://gutenprint_5.3.5.bb>
>         @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =
>         "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>          SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz
>         <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz> \
>         file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
>                     "
>         -SRC_URI[sha256sum] =
>         "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
>         +SRC_URI[sha256sum] =
>         "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
>
>          inherit autotools gettext pkgconfig
>
>         -- 
>         2.51.0
>
>
>         -=-=-=-=-=-=-=-=-=-=-=-
>         Links: You receive all messages sent to this group.
>         View/Reply Online (#119552):
>         https://lists.openembedded.org/g/openembedded-devel/message/119552
>         Mute This Topic: https://lists.openembedded.org/mt/115307539/4316185
>         Group Owner: openembedded-devel+owner@lists.openembedded.org
>         <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>         Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>         [yoann.congal@smile.fr]
>         -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
>     -- 
>     Yoann Congal
>     Smile ECS
>
>
>
> -- 
> Yoann Congal
> Smile ECS


