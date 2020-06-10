Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.5504.1591773548252345446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hw4BCNj5;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id q11so1005585wrp.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=MAq8tq7MobUuna92yE9FDYPTnfImiF5nW0GmkevYT3E=;
        b=hw4BCNj5eByfBsr1c22HSRlM9m9L3jtZO1XdfNh5uFfoXiUTxRkdNYAYUOP3Fw4u2e
         GJH74a68i0cqgXeVSY+2ld+iC3Wo78MSw0p/NfadgH60K5vlVcGdXBUuL/F2Go3wNIB1
         WLnoiY6u+prlzHPZnSKwnQfJt/q22DbnKHkJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=MAq8tq7MobUuna92yE9FDYPTnfImiF5nW0GmkevYT3E=;
        b=K5A92tVvK2k2QCc9fikWBcaSvsRmWTPqJSxwf8mLJ5Omo72PkM8IrmpDO81AIuMD+j
         dd9ticgfL5zpajSy5kjCvuW8p+HSdJifg4C7BBCnccoo8g1JCkj3bUdb2QloMRgNeYcx
         0YYlbzFh/XEf4upY2LmHI62pzyb84DhNq73SQvlNdePqp2AJRIOCseCv3HKIOEZYj4s2
         EdTh3wUu1lTgCLkDFR2FDn1LEZooxYOPaMQovd6Zu9gyNczo0QORVU62zBH2r6+uIYlD
         3rx1kJPZ24dI1lVtAhp5+bmifF/Lo4SmDLpFYkmY4y1tFkByqVjtztJfOGWzR3iWGfqa
         PkxQ==
X-Gm-Message-State: AOAM532lq6uHQn6u49JoER1k5b1CQis5vQ0k4ZyKz2glis1uvVs5oVim
	JwEhwU95GQUHVGPsPBZq627tRlO1eD4=
X-Google-Smtp-Source: ABdhPJxjOk2BOdzjnSAJkoGUnslbx0OPeJZIbscksjl04BfwYFMfx8MgYVcCqPKvoal7RBUD/p0Wag==
X-Received: by 2002:adf:a283:: with SMTP id s3mr1886317wra.147.1591773546260;
        Wed, 10 Jun 2020 00:19:06 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id n19sm5567866wmi.33.2020.06.10.00.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 00:19:05 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-soupsieve: Upgrade 1.9.4 -> 2.0.1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200609134311.13299-1-leon.anavi@konsulko.com>
 <20200609134311.13299-3-leon.anavi@konsulko.com>
 <CANx9H-Avsf9vEQNSGh1wbtNCc51WgucHL44pXm+Ci6aLVKmjCA@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <55bb1901-e74c-b00f-8d99-9eb06fe464e8@konsulko.com>
Date: Wed, 10 Jun 2020 10:19:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-Avsf9vEQNSGh1wbtNCc51WgucHL44pXm+Ci6aLVKmjCA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------C56E85601D1C9CA4F0AA7FB5"
Content-Language: en-US

--------------C56E85601D1C9CA4F0AA7FB5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tim,

On 10.06.20 г. 8:18 ч., Tim Orling wrote:
>
>
> On Tue, Jun 9, 2020 at 6:43 AM Leon Anavi <leon.anavi@konsulko.com 
> <mailto:leon.anavi@konsulko.com>> wrote:
>
>     Upgrade to release 2.0.1.
>
>
> I would like to see more information in the commit message for major 
> version upgrades (or any upgrades for that matter).
>
> If you simply go to the source and look for Changelog or similar and 
> copy paste it takes 10-30 seconds and adds a lot of value for quickly 
> reviewing.
>
> Not picking on you, but the nearly empty commit messages on upgrades 
> are not doing any of us any favors. It is simply bad practice and if 
> we had patchtest running on meta-OpenEmbedded these would get Nacked.
Noted. Thank you for the feedback. I've submitted with version 2 of the 
patch with summary of the changelog. I will keep doing this in future 
for other similar major version upgrades.

Best regards,
Leon
>
>
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com
>     <mailto:leon.anavi@konsulko.com>>
>     ---
>      ...{python3-soupsieve_1.9.4.bb
>     <http://python3-soupsieve_1.9.4.bb> => python3-soupsieve_2.0.1.bb
>     <http://python3-soupsieve_2.0.1.bb>} | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>      rename
>     meta-python/recipes-devtools/python/{python3-soupsieve_1.9.4.bb
>     <http://python3-soupsieve_1.9.4.bb> => python3-soupsieve_2.0.1.bb
>     <http://python3-soupsieve_2.0.1.bb>} (65%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
>     <http://python3-soupsieve_1.9.4.bb>
>     b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
>     <http://python3-soupsieve_2.0.1.bb>
>     similarity index 65%
>     rename from
>     meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
>     <http://python3-soupsieve_1.9.4.bb>
>     rename to
>     meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
>     <http://python3-soupsieve_2.0.1.bb>
>     index df69e007f..aa087c920 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-soupsieve_1.9.4.bb
>     <http://python3-soupsieve_1.9.4.bb>
>     +++
>     b/meta-python/recipes-devtools/python/python3-soupsieve_2.0.1.bb
>     <http://python3-soupsieve_2.0.1.bb>
>     @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
>      LICENSE = "MIT"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
>
>     -SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"
>     -SRC_URI[sha256sum] =
>     "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"
>     +SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"
>     +SRC_URI[sha256sum] =
>     "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"
>
>      inherit pypi setuptools3
>
>     -- 
>     2.17.1
>
>     
>
-- 
Leon Anavi
Software Engineer
konsulko.com


--------------C56E85601D1C9CA4F0AA7FB5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Tim,<br>
    </p>
    <div class="moz-cite-prefix">On 10.06.20 г. 8:18 ч., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-Avsf9vEQNSGh1wbtNCc51WgucHL44pXm+Ci6aLVKmjCA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Jun 9, 2020 at 6:43
            AM Leon Anavi &lt;<a href="mailto:leon.anavi@konsulko.com"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade to
            release 2.0.1.</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I would like to see more information in the
            commit message for major version upgrades (or any upgrades
            for that matter).</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">If you simply go to the source and look for
            Changelog or similar and copy paste it takes 10-30 seconds
            and adds a lot of value for quickly reviewing.</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Not picking on you, but the nearly empty
            commit messages on upgrades are not doing any of us any
            favors. It is simply bad practice and if we had patchtest
            running on meta-OpenEmbedded these would get Nacked.</div>
        </div>
      </div>
    </blockquote>
    Noted. Thank you for the feedback. I've submitted with version 2 of
    the patch with summary of the changelog. I will keep doing this in
    future for other similar major version upgrades.<br>
    <br>
    Best regards,<br>
    Leon<br>
    <blockquote type="cite"
cite="mid:CANx9H-Avsf9vEQNSGh1wbtNCc51WgucHL44pXm+Ci6aLVKmjCA@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             ...{<a href="http://python3-soupsieve_1.9.4.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-soupsieve_1.9.4.bb</a>
            =&gt; <a href="http://python3-soupsieve_2.0.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-soupsieve_2.0.1.bb</a>}
            | 4 ++--<br>
             1 file changed, 2 insertions(+), 2 deletions(-)<br>
             rename meta-python/recipes-devtools/python/{<a
              href="http://python3-soupsieve_1.9.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_1.9.4.bb</a>
            =&gt; <a href="http://python3-soupsieve_2.0.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-soupsieve_2.0.1.bb</a>}
            (65%)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-soupsieve_1.9.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_1.9.4.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-soupsieve_2.0.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_2.0.1.bb</a><br>
            similarity index 65%<br>
            rename from meta-python/recipes-devtools/python/<a
              href="http://python3-soupsieve_1.9.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_1.9.4.bb</a><br>
            rename to meta-python/recipes-devtools/python/<a
              href="http://python3-soupsieve_2.0.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_2.0.1.bb</a><br>
            index df69e007f..aa087c920 100644<br>
            --- a/meta-python/recipes-devtools/python/<a
              href="http://python3-soupsieve_1.9.4.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_1.9.4.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-soupsieve_2.0.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-soupsieve_2.0.1.bb</a><br>
            @@ -4,8 +4,8 @@ HOMEPAGE = "<a
              href="https://github.com/facelessuser/soupsieve"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/facelessuser/soupsieve</a>"<br>
             LICENSE = "MIT"<br>
             LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5">"file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"</a><br>
            <br>
            -SRC_URI[md5sum] = "43d8ea20c58494446aa65ba5cc6320fe"<br>
            -SRC_URI[sha256sum] =
            "605f89ad5fdbfefe30cdc293303665eff2d188865d4dbe4eb510bba1edfbfce3"<br>
            +SRC_URI[md5sum] = "62a7481c7dbf6d8cc21e4e3a79c72034"<br>
            +SRC_URI[sha256sum] =
            "a59dc181727e95d25f781f0eb4fd1825ff45590ec8ff49eadfd7f1a537cc0232"<br>
            <br>
             inherit pypi setuptools3<br>
            <br>
            -- <br>
            2.17.1<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Leon Anavi
Software Engineer
konsulko.com</pre>
  </body>
</html>

--------------C56E85601D1C9CA4F0AA7FB5--
