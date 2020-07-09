Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.10246.1594310784521742443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 09:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XHzW1v+l;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id s26so1214537pfm.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=l3vgIPVcbgKTsUK23YBCrBfCXYWUPeJdSfRStkmStf0=;
        b=XHzW1v+lVKKlydo8Dqde4FNMeXsdIjSzkDQQWBmowJJfOlHQbuBsUceNzyzuWoaw+D
         PdhC7eX2/GT/GX+0Cge0cxF6AX3Vhy6qnaBOJAsqRUX9xRyyIeTlc5eWUyvg2VVvG7uG
         O9BTH9/E7fXNITKQHMtPY8xKN9XmgfqGmO70id4H6nn8sty2PfhDnqDYcD0P+SNCO4MX
         6nFw+lic/5mnhnud58B99qMQgIlBV0DcsHD3HtjGPN+nIcVjTa45a3QZfdn7eWZ0QJoh
         grJdUyjbJ1rmYPCJLLwj68iSWSlwIEcQKusROo/k2+FSaq4OybKIlVyCkqeL9t95ghbd
         lUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=l3vgIPVcbgKTsUK23YBCrBfCXYWUPeJdSfRStkmStf0=;
        b=biWEGE4041tgfGsVtn76iVuUaxQUztoiFqgDftRyvRSxIQHUOTwB9FmBI0FzOElMN5
         nBqxo1LE/AiubEuvT3kCFZgMcdclBGeqhwJPo/Ew+d3aLOUCuBxhOi2TyjPvLrdb1xie
         u+Cf5KkIF6+MdDyM3kzwCGohbgnHdBeNvTEag5iFK5hHYv6cEnEPgndZa9PfDZN7gWdV
         RCESyLAvMy/gt5UypjBtTmLDAMlbnrIJq+di2SxSEDRzNX2241slvNRBigsz5qiorZmr
         QTTDiZ1QpGuM4sd5FYwL5BHKU2WCPLvEOMb+1hh7+VTtT/MSuB6bzTfmpKlbMcXzT+Cw
         HnqQ==
X-Gm-Message-State: AOAM532rgv3+nrWQt53Dl/Hg6w20gXgugHeCMGp6G57M4lyGzGhijeUv
	qEFhV3RtTs1p+SQGbTj0qtSnz6JSSOA=
X-Google-Smtp-Source: ABdhPJwLVlr4D7WSC3EYRLxS3uIfXsm1XqaQNWYEW+ApSIaoMyDj9SvR1QNq+DzjcKZw50gR2/lL6w==
X-Received: by 2002:a05:6a00:1346:: with SMTP id k6mr41597972pfu.116.1594310783487;
        Thu, 09 Jul 2020 09:06:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd? ([2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd])
        by smtp.gmail.com with ESMTPSA id 15sm3141141pjs.8.2020.07.09.09.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 09:06:22 -0700 (PDT)
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1593561840.git.akuster808@gmail.com>
 <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
Date: Thu, 9 Jul 2020 09:06:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E0A274DD122871751E7BA731"
Content-Language: en-US

--------------E0A274DD122871751E7BA731
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/9/20 8:21 AM, Martin Jansa wrote:
> FYI this "small" upgrade changes ABI version from libjsoncpp22
> to libjsoncpp24 which might cause some issues to people who expect
> relatively stable ABIs in LTS dunfell.

Well that is not good. I did look at the details but apparently I failed
to catch the "soversion" change.

Would you recommend reverting this?

-armin
>
> On Wed, Jul 1, 2020 at 2:07 AM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Pierre-Jean Texier <pjtexier@koncepto.io
>     <mailto:pjtexier@koncepto.io>>
>
>     See full changelog
>     https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3
>
>     Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io
>     <mailto:pjtexier@koncepto.io>>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     (cherry picked from commit 65e124eef373680726ac045677cbec7d9080a289)
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      .../jsoncpp/{jsoncpp_1.9.2.bb <http://jsoncpp_1.9.2.bb> =>
>     jsoncpp_1.9.3.bb <http://jsoncpp_1.9.3.bb>}              | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>      rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb
>     <http://jsoncpp_1.9.2.bb> => jsoncpp_1.9.3.bb
>     <http://jsoncpp_1.9.3.bb>} (93%)
>
>     diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>     <http://jsoncpp_1.9.2.bb>
>     b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>     <http://jsoncpp_1.9.3.bb>
>     similarity index 93%
>     rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>     <http://jsoncpp_1.9.2.bb>
>     rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>     <http://jsoncpp_1.9.3.bb>
>     index a88410f2ff..97c6361ad8 100644
>     --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>     <http://jsoncpp_1.9.2.bb>
>     +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>     <http://jsoncpp_1.9.3.bb>
>     @@ -11,7 +11,7 @@ SECTION = "libs"
>      LICENSE = "MIT"
>      LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>
>     -SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
>     +SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
>      SRC_URI = "git://github.com/open-source-parsers/jsoncpp
>     <http://github.com/open-source-parsers/jsoncpp>"
>
>      S = "${WORKDIR}/git"
>     -- 
>     2.17.1
>
>     
>


--------------E0A274DD122871751E7BA731
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/9/20 8:21 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">FYI this "small" upgrade changes ABI version
        from libjsoncpp22 to libjsoncpp24 which might cause some issues
        to people who expect relatively stable ABIs in LTS dunfell.</div>
    </blockquote>
    <br>
    Well that is not good. I did look at the details but apparently I
    failed to catch the "soversion" change.<br>
    <br>
    Would you recommend reverting this?<br>
    <br>
    -armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Jul 1, 2020 at 2:07 AM
          akuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Pierre-Jean Texier &lt;<a href="mailto:pjtexier@koncepto.io"
            target="_blank" moz-do-not-send="true">pjtexier@koncepto.io</a>&gt;<br>
          <br>
          See full changelog <a
            href="https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3</a><br>
          <br>
          Signed-off-by: Pierre-Jean Texier &lt;<a
            href="mailto:pjtexier@koncepto.io" target="_blank"
            moz-do-not-send="true">pjtexier@koncepto.io</a>&gt;<br>
          Signed-off-by: Khem Raj &lt;<a
            href="mailto:raj.khem@gmail.com" target="_blank"
            moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
          (cherry picked from commit
          65e124eef373680726ac045677cbec7d9080a289)<br>
          Signed-off-by: Armin Kuster &lt;<a
            href="mailto:akuster808@gmail.com" target="_blank"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
          ---<br>
           .../jsoncpp/{<a href="http://jsoncpp_1.9.2.bb"
            rel="noreferrer" target="_blank" moz-do-not-send="true">jsoncpp_1.9.2.bb</a>
          =&gt; <a href="http://jsoncpp_1.9.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.3.bb</a>} 
                      | 2 +-<br>
           1 file changed, 1 insertion(+), 1 deletion(-)<br>
           rename meta-oe/recipes-devtools/jsoncpp/{<a
            href="http://jsoncpp_1.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.2.bb</a>
          =&gt; <a href="http://jsoncpp_1.9.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.3.bb</a>}
          (93%)<br>
          <br>
          diff --git a/meta-oe/recipes-devtools/jsoncpp/<a
            href="http://jsoncpp_1.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.2.bb</a>
          b/meta-oe/recipes-devtools/jsoncpp/<a
            href="http://jsoncpp_1.9.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.3.bb</a><br>
          similarity index 93%<br>
          rename from meta-oe/recipes-devtools/jsoncpp/<a
            href="http://jsoncpp_1.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.2.bb</a><br>
          rename to meta-oe/recipes-devtools/jsoncpp/<a
            href="http://jsoncpp_1.9.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.3.bb</a><br>
          index a88410f2ff..97c6361ad8 100644<br>
          --- a/meta-oe/recipes-devtools/jsoncpp/<a
            href="http://jsoncpp_1.9.2.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.2.bb</a><br>
          +++ b/meta-oe/recipes-devtools/jsoncpp/<a
            href="http://jsoncpp_1.9.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">jsoncpp_1.9.3.bb</a><br>
          @@ -11,7 +11,7 @@ SECTION = "libs"<br>
           LICENSE = "MIT"<br>
           LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b">"file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"</a><br>
          <br>
          -SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"<br>
          +SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"<br>
           SRC_URI = "git://<a
            href="http://github.com/open-source-parsers/jsoncpp"
            rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/open-source-parsers/jsoncpp</a>"<br>
          <br>
           S = "${WORKDIR}/git"<br>
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

--------------E0A274DD122871751E7BA731--
