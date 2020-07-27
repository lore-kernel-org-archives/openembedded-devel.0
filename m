Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.59400.1595866750429429442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s+m0avjS;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id o22so9755307pjw.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 09:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=KlcFL8kCJ0wOAAqmNrnSo77S9XXJuh3hR/VCcW7qaMg=;
        b=s+m0avjS4g9e7J+detpt5ruGHltzmHgypyJWPbcYQMM68D2CUsVIfTnlvEYc06oqdr
         KO2MDzFggxJEmQeccnCowSNpP4476aNQiO2DCPBUgEY+IQrrqtHLCw56XyWsyLGLiqvV
         V54ZF5gfu6tROi9/t/ovhhXTN/URSy1Vjn1ZFJyOGRRagwuXIKZDlf5etnG6bsakqrTS
         kTmuoYHGmRvbFfGHoCsjjqbSt/6viSnllTqt2Q+1cBgi/76ThcwQB3NPCY7fh4TKOYyJ
         U1lMStfW1ZRWkWRtVUbzXQKEeLhGG4Pid41hRivq0dW2Vs+jJlXXLg+JotK8fZqK5npR
         5fEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=KlcFL8kCJ0wOAAqmNrnSo77S9XXJuh3hR/VCcW7qaMg=;
        b=NQ8pP2bpBhUd3ypRl/fa/TFj+byEdryIIaS2MHLS6Rq1pHt8eDDCspzedXcVueOdfG
         NK8BO8olfWVkzCQ7U2NfuFA4VfWuuhN691JA1GQ90sKLFf5lxHnTWqrZ3Z/KfRJ1fbCS
         Taolj2PFuKdFhv/+AHNGFYL6WCN8KdeZpQ1Z4yIeOKZkWmKygDjNkRYVKRN8pCozX+ni
         QIzzc1e48eBaxT6uZ599kBMbT2V/GcTEgG7OToCT7VyhTHNcs8J/qRR5wLeSFsmvw4xU
         VmrufPOLsosB2wNIFgYkqfFqUmr/jNAzKcXkcP84kMIOaO00GyLCe4ij64O9W3wTWNy3
         NLXQ==
X-Gm-Message-State: AOAM531pY8RXh/+vzt+mpwRrNkKXg1b3zGuJZ67i5By2lZPtCyQayANw
	x7RGAA7ZHaegZ5F1p3w6Tu5i5MkgnUA=
X-Google-Smtp-Source: ABdhPJzzpQiAvLlG+aM6F0CIds9WsjC1hbaJj1R0UFFq4g+0H1+clCr7A9VrIdnZ6ElavdtbGARzEQ==
X-Received: by 2002:a17:90a:158f:: with SMTP id m15mr52919pja.93.1595866749780;
        Mon, 27 Jul 2020 09:19:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8df1:f28:d14a:8296? ([2601:202:4180:a5c0:8df1:f28:d14a:8296])
        by smtp.gmail.com with ESMTPSA id x9sm6696187pff.145.2020.07.27.09.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 09:19:09 -0700 (PDT)
Subject: Re: [oe] [PATCH 2/2] khronos: includes virtual/libgles2 , needs opengl
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20200726182237.561-1-akuster808@gmail.com>
 <20200726182237.561-2-akuster808@gmail.com>
 <CA+chaQchMFa1ASRYz=oFyz+fKLm4mbdhrPnShXZ81Hus6cK6NA@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7364871a-0ecd-53bd-2769-37123698267d@gmail.com>
Date: Mon, 27 Jul 2020 09:19:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQchMFa1ASRYz=oFyz+fKLm4mbdhrPnShXZ81Hus6cK6NA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------7D2C7AE3E513A150B5DD5F69"
Content-Language: en-US

--------------7D2C7AE3E513A150B5DD5F69
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/26/20 9:42 PM, Martin Jansa wrote:
> Hi,
>
> I've already sent this one:
> https://lists.openembedded.org/g/openembedded-devel/message/85932 

Cool. it was faster to fix it than look search the mailing list for a fix.

it ended up being a ping in the end

looks like its in the testing queue.

- armin
>
> On Sun, Jul 26, 2020 at 11:22 AM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     add FEATURE_CHECK on opengl.
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 +++-
>      1 file changed, 3 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
>     b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
>     index bd75cdb1f4..1cd0a476aa 100644
>     --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
>     +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
>     @@ -16,7 +16,9 @@ SRCREV_FORMAT = "vk-gl-cts"
>
>      S = "${WORKDIR}/git"
>
>     -inherit pkgconfig cmake
>     +inherit pkgconfig cmake features_check
>     +
>     +REQUIRED_DISTRO_FEATURES = "opengl"
>
>      DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
>
>     -- 
>     2.17.1
>
>     
>


--------------7D2C7AE3E513A150B5DD5F69
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/26/20 9:42 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQchMFa1ASRYz=oFyz+fKLm4mbdhrPnShXZ81Hus6cK6NA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>I've already sent this one:</div>
        <div><a
            href="https://lists.openembedded.org/g/openembedded-devel/message/85932"
            moz-do-not-send="true">https://lists.openembedded.org/g/openembedded-devel/message/85932</a> 
          <br>
        </div>
      </div>
    </blockquote>
    <br>
    Cool. it was faster to fix it than look search the mailing list for
    a fix.<br>
    <br>
    it ended up being a ping in the end <br>
    <br>
    looks like its in the testing queue.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQchMFa1ASRYz=oFyz+fKLm4mbdhrPnShXZ81Hus6cK6NA@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Sun, Jul 26, 2020 at 11:22
          AM akuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">add
          FEATURE_CHECK on opengl.<br>
          <br>
          Signed-off-by: Armin Kuster &lt;<a
            href="mailto:akuster808@gmail.com" target="_blank"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
          ---<br>
           meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 4 +++-<br>
           1 file changed, 3 insertions(+), 1 deletion(-)<br>
          <br>
          diff --git
          a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
          b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc<br>
          index bd75cdb1f4..1cd0a476aa 100644<br>
          --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc<br>
          +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc<br>
          @@ -16,7 +16,9 @@ SRCREV_FORMAT = "vk-gl-cts"<br>
          <br>
           S = "${WORKDIR}/git"<br>
          <br>
          -inherit pkgconfig cmake<br>
          +inherit pkgconfig cmake features_check<br>
          +<br>
          +REQUIRED_DISTRO_FEATURES = "opengl"<br>
          <br>
           DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"<br>
          <br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------7D2C7AE3E513A150B5DD5F69--
