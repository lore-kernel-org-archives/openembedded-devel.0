Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.7849.1591094362586777178
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 03:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hwlLOBmN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id r9so2418417wmh.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2020 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=eEZMGxswfrNSrg8HADhzSgwDq6h9ODt4ne5UOIDnMRU=;
        b=hwlLOBmN5ew/GRik5/BCfCceJddk7u+NMMLXm3CxNHFo0PByMHS1J0mA39YwfXWJaD
         BocEmQoumpohvhxfvNM8QOspBLZouNWLDC2Pkl/HxxUPW0dTSd/xOJLa/9p5LM8fkUk8
         zLW0g+V2QmAaTq5F1yOr/Tad8zSEwKLGxvqsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=eEZMGxswfrNSrg8HADhzSgwDq6h9ODt4ne5UOIDnMRU=;
        b=tf0znz3mu1YTizMSF2cukB95VHKRmt47aK3JRSB+ss8drnocvXGwVMTtXkwufd34v/
         dmCbQ18gONCAZttJP8h2sit/WtO45wLWTH03m5lgboBzTXa3Cay+yyKKaIDQENkzzkQt
         Ufu595hFaAt+gAI04E0xv87neY7Tfu0MSgzCAOiwXKwVF44imI2B+fYrGr8m+s0d+Z4s
         S+Ov2XvDEH6iLvMUXCnSHsWHUSuyzYfBKVA8PCWjQ6enIdRbu/gPxcb/WyFDpDrWcODT
         G+dmVxa+Z3hxk+Tkii96FsqKkZ/KGg/X9yl1cq0hGbXI9wGKIiyvDsFKJ/It51W3+kZO
         4Dww==
X-Gm-Message-State: AOAM531+MlnXtlRYtvkgxJdrvY7qrHFe97nRFTrAL9ZGEZ44g9pRSyec
	AKJUaLBGPMLSV1JnVskS/agee34IggQ=
X-Google-Smtp-Source: ABdhPJynx3MQlR38Hf3m5lQlVRzJpggotwBqWEV7jnkL932uiFbpd4MGz90gWpbNUUW3ELRU2crNhQ==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr3555565wmy.30.1591094360766;
        Tue, 02 Jun 2020 03:39:20 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id j18sm3378151wrn.59.2020.06.02.03.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 03:39:20 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-humanize: Upgrade 0.5.1 -> 2.4.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200601135308.18379-1-leon.anavi@konsulko.com>
 <CAMKF1so7X3xT-WXhrAhVC0Ex4sY3QCpxtKa9LhhDNGemvzxeDg@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <439bb338-d748-14c4-7c73-6ef205754a96@konsulko.com>
Date: Tue, 2 Jun 2020 13:39:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so7X3xT-WXhrAhVC0Ex4sY3QCpxtKa9LhhDNGemvzxeDg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------D50C18577DEC44378119CB8B"
Content-Language: en-US

--------------D50C18577DEC44378119CB8B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

Thank you for the feedback. Following your recommendation I have just 
updated the commit message and submitted version 3 of the patch (version 
2 had a typo - sorry).

The year in file LICENCE of humanize has been recently updated therefore 
the checksum has been changed but it still remains a MIT License. For 
details have a look at:
https://github.com/jmoiron/humanize/commit/0acf89e0cfcd81b471e7b8c829e5aa2a6b30ad16

Best regards,
Leon

On 2.06.20 г. 6:53 ч., Khem Raj wrote:
> Did the license checksum
> Change ? If so perhaps document it in commit
>
> On Mon, Jun 1, 2020 at 6:53 AM Leon Anavi <leon.anavi@konsulko.com 
> <mailto:leon.anavi@konsulko.com>> wrote:
>
>     Upgrade to release 2.4.0 and consolidate into a single file.
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com
>     <mailto:leon.anavi@konsulko.com>>
>     ---
>      .../python/python-humanize.inc                | 14 -------------
>      .../python/python3-humanize_0.5.1.bb
>     <http://python3-humanize_0.5.1.bb>         |  2 --
>      .../python/python3-humanize_2.4.0.bb
>     <http://python3-humanize_2.4.0.bb>         | 20 +++++++++++++++++++
>      3 files changed, 20 insertions(+), 16 deletions(-)
>      delete mode 100644
>     meta-python/recipes-devtools/python/python-humanize.inc
>      delete mode 100644
>     meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
>     <http://python3-humanize_0.5.1.bb>
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
>     <http://python3-humanize_2.4.0.bb>
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python-humanize.inc
>     b/meta-python/recipes-devtools/python/python-humanize.inc
>     deleted file mode 100644
>     index 17a3449e7..000000000
>     --- a/meta-python/recipes-devtools/python/python-humanize.inc
>     +++ /dev/null
>     @@ -1,14 +0,0 @@
>     -SUMMARY = "Python humanize utilities"
>     -HOMEPAGE = "http://github.com/jmoiron/humanize"
>     -
>     -LICENSE = "MIT"
>     -LIC_FILES_CHKSUM =
>     "file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"
>     -
>     -SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"
>     -SRC_URI[sha256sum] =
>     "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"
>     -
>     -RDEPENDS_${PN} += "\
>     -    ${PYTHON_PN}-datetime \
>     -"
>     -
>     -BBCLASSEXTEND = "native nativesdk"
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
>     <http://python3-humanize_0.5.1.bb>
>     b/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
>     <http://python3-humanize_0.5.1.bb>
>     deleted file mode 100644
>     index 04464ac59..000000000
>     ---
>     a/meta-python/recipes-devtools/python/python3-humanize_0.5.1.bb
>     <http://python3-humanize_0.5.1.bb>
>     +++ /dev/null
>     @@ -1,2 +0,0 @@
>     -inherit pypi setuptools3
>     -require python-humanize.inc
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
>     <http://python3-humanize_2.4.0.bb>
>     b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
>     <http://python3-humanize_2.4.0.bb>
>     new file mode 100644
>     index 000000000..6bb6946ff
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-humanize_2.4.0.bb
>     <http://python3-humanize_2.4.0.bb>
>     @@ -0,0 +1,20 @@
>     +SUMMARY = "Python humanize utilities"
>     +HOMEPAGE = "http://github.com/jmoiron/humanize"
>     +
>     +LICENSE = "MIT"
>     +LIC_FILES_CHKSUM =
>     "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>     +
>     +SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"
>     +SRC_URI[sha256sum] =
>     "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"
>     +
>     +inherit pypi setuptools3
>     +
>     +DEPENDS += "\
>     +    ${PYTHON_PN}-setuptools-scm-native \
>     +"
>     +
>     +RDEPENDS_${PN} += "\
>     +    ${PYTHON_PN}-datetime \
>     +"
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>     -- 
>     2.17.1
>
>     
>
-- 
Leon Anavi
Software Engineer
konsulko.com


--------------D50C18577DEC44378119CB8B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Khem,<br>
      <br>
      Thank you for the feedback. Following your recommendation I have
      just updated the commit message and submitted version 3 of the
      patch (version 2 had a typo - sorry).<br>
      <br>
      The year in file LICENCE of humanize has been recently updated
      therefore the checksum has been changed but it still remains a MIT
      License. For details have a look at:<br>
      <a
href="https://github.com/jmoiron/humanize/commit/0acf89e0cfcd81b471e7b8c829e5aa2a6b30ad16">https://github.com/jmoiron/humanize/commit/0acf89e0cfcd81b471e7b8c829e5aa2a6b30ad16</a><br>
      <br>
      Best regards,<br>
      Leon<br>
    </p>
    <div class="moz-cite-prefix">On 2.06.20 г. 6:53 ч., Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1so7X3xT-WXhrAhVC0Ex4sY3QCpxtKa9LhhDNGemvzxeDg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div>
        <div dir="auto">Did the license checksum</div>
      </div>
      <div dir="auto">Change ? If so perhaps document it in commit </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Jun 1, 2020 at 6:53
            AM Leon Anavi &lt;<a href="mailto:leon.anavi@konsulko.com"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade to
            release 2.4.0 and consolidate into a single file.<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             .../python/python-humanize.inc                | 14
            -------------<br>
             .../python/<a href="http://python3-humanize_0.5.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-humanize_0.5.1.bb</a> 
                    |  2 --<br>
             .../python/<a href="http://python3-humanize_2.4.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-humanize_2.4.0.bb</a> 
                    | 20 +++++++++++++++++++<br>
             3 files changed, 20 insertions(+), 16 deletions(-)<br>
             delete mode 100644
            meta-python/recipes-devtools/python/python-humanize.inc<br>
             delete mode 100644 meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_0.5.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_0.5.1.bb</a><br>
             create mode 100644 meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_2.4.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_2.4.0.bb</a><br>
            <br>
            diff --git
            a/meta-python/recipes-devtools/python/python-humanize.inc
            b/meta-python/recipes-devtools/python/python-humanize.inc<br>
            deleted file mode 100644<br>
            index 17a3449e7..000000000<br>
            ---
            a/meta-python/recipes-devtools/python/python-humanize.inc<br>
            +++ /dev/null<br>
            @@ -1,14 +0,0 @@<br>
            -SUMMARY = "Python humanize utilities"<br>
            -HOMEPAGE = "<a href="http://github.com/jmoiron/humanize"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://github.com/jmoiron/humanize</a>"<br>
            -<br>
            -LICENSE = "MIT"<br>
            -LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e">"file://LICENCE;md5=d2eff82fc25dd07c919a02465884f02e"</a><br>
            -<br>
            -SRC_URI[md5sum] = "e8473d9dc1b220911cac2edd53b1d973"<br>
            -SRC_URI[sha256sum] =
            "a43f57115831ac7c70de098e6ac46ac13be00d69abbf60bdcac251344785bb19"<br>
            -<br>
            -RDEPENDS_${PN} += "\<br>
            -    ${PYTHON_PN}-datetime \<br>
            -"<br>
            -<br>
            -BBCLASSEXTEND = "native nativesdk"<br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_0.5.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_0.5.1.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_0.5.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_0.5.1.bb</a><br>
            deleted file mode 100644<br>
            index 04464ac59..000000000<br>
            --- a/meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_0.5.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_0.5.1.bb</a><br>
            +++ /dev/null<br>
            @@ -1,2 +0,0 @@<br>
            -inherit pypi setuptools3<br>
            -require python-humanize.inc<br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_2.4.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_2.4.0.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_2.4.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_2.4.0.bb</a><br>
            new file mode 100644<br>
            index 000000000..6bb6946ff<br>
            --- /dev/null<br>
            +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-humanize_2.4.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-humanize_2.4.0.bb</a><br>
            @@ -0,0 +1,20 @@<br>
            +SUMMARY = "Python humanize utilities"<br>
            +HOMEPAGE = "<a href="http://github.com/jmoiron/humanize"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://github.com/jmoiron/humanize</a>"<br>
            +<br>
            +LICENSE = "MIT"<br>
            +LIC_FILES_CHKSUM =
            <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">"file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"</a><br>
            +<br>
            +SRC_URI[md5sum] = "010e86a4196ed6030112e7bc681e7353"<br>
            +SRC_URI[sha256sum] =
            "42ae7d54b398c01bd100847f6cb0fc9e381c21be8ad3f8e2929135e48dbff026"<br>
            +<br>
            +inherit pypi setuptools3<br>
            +<br>
            +DEPENDS += "\<br>
            +    ${PYTHON_PN}-setuptools-scm-native \<br>
            +"<br>
            +<br>
            +RDEPENDS_${PN} += "\<br>
            +    ${PYTHON_PN}-datetime \<br>
            +"<br>
            +<br>
            +BBCLASSEXTEND = "native nativesdk"<br>
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

--------------D50C18577DEC44378119CB8B--
