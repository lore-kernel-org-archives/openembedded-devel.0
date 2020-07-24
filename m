Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.355.1595608482812746459
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 09:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=USw4AMlO;
 spf=pass (domain: konsulko.com, ip: 209.85.221.67, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f67.google.com with SMTP id q5so8865700wru.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=TAGERVouT+xchRwuJ47Uj19ceNSy6J1xoX/L0vlaekg=;
        b=USw4AMlOgPYLWBmoXJQ9Zs7akAy/gdS5GAeVzR/ftxnXmNBJ8Q6lcXIoVQU8d+d3qS
         KPlwrVq797atGbExP+9qJ5LG3w8SONCn51gSkDJyP8BHyWARUEru99QMzn8gTQvIgzR4
         85ihLK2Z9WbDElRcE8fpTaSvy8FjUta7IKX+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=TAGERVouT+xchRwuJ47Uj19ceNSy6J1xoX/L0vlaekg=;
        b=tnXPqNXQODQVLvbGr73T9cxBIrzcFwSqbBYzyslJj/158xtzKa2Bfidp0AxM3qZKba
         XTsCTqJXBauABsEFuqI2nq197CZ6r0T/zFRflt6iOa6gxrlBlq06+nJpApxewbKljRys
         xIDAt7d85zVj5FHKq+LB6efkAjPpS1TDBOszuwfau6U+ZjmMiQJZVUb+Zxj2whQ+HNrb
         EWSH34c4qL3+w+XIErj+RS59T3Mm48KI6mFFCAonUOJD6txYfsphlprG6dxTudKx+jsH
         uPDBsGS0t1XrMZ8WMPJlqNDhpB3jOe4Qq6AioKcj+rWdyav3qIVFqIPmtuBObZClyfMY
         Niig==
X-Gm-Message-State: AOAM531OMTPivVlx1FB13U/4BwH/Ry9JF+Xb34oo6EKBCAl6+Lzb5uCi
	7UtuTHpja2MrGAG8dUqA5uplgUnlIj8=
X-Google-Smtp-Source: ABdhPJxhPiKiIMpPZ5UFKOow2mc48aX5fSOmBC+HcyT74LLQ0rvu7HtF5h69f2il47bTwqa0uHMekg==
X-Received: by 2002:a5d:60c5:: with SMTP id x5mr9537059wrt.67.1595608480890;
        Fri, 24 Jul 2020 09:34:40 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id s19sm2114800wrb.54.2020.07.24.09.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 09:34:40 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-matplotlib: Upgrade 3.2.2 -> 3.3.0
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
 <20200724103515.21420-7-leon.anavi@konsulko.com>
 <CANx9H-A41PZrWzGFtG0tycV2z26onespUJUz_JmGzMO-a+DYVg@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <a38ac49b-6929-fdfe-911f-2df3f7941f27@konsulko.com>
Date: Fri, 24 Jul 2020 19:34:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-A41PZrWzGFtG0tycV2z26onespUJUz_JmGzMO-a+DYVg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------6D2C5E472E3D9F7EA974DF5B"
Content-Language: en-US

--------------6D2C5E472E3D9F7EA974DF5B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tim,

On 24.07.20 г. 16:31 ч., Tim Orling wrote:
>
>
> On Fri, Jul 24, 2020 at 3:35 AM Leon Anavi <leon.anavi@konsulko.com 
> <mailto:leon.anavi@konsulko.com>> wrote:
>
>     Upgrade to release 3.3.0:
>
>     - Provisional API for composing semantic axes layouts from text
>       or nested lists
>     - New Axes.sharex, Axes.sharey methods
>     - Turbo colormap
>     - colors.BoundaryNorm supports extend keyword argument
>     - Text color for legend labels
>     - Pcolor and Pcolormesh now accept shading='nearest' and 'auto'
>     - Allow tick formatters to be set with str or function inputs
>     - New Axes.axline method
>     - Dates use a modern epoch
>     - Improved font weight detection
>     - Axes3D no longer distorts the 3D plot to match the 2D aspect
>       ratio
>     - More consistent toolbar behavior across backends
>     - Toolbar icons are now styled for dark themes
>     - Cursor text now uses a number of significant digits matching
>       pointing precision
>     - Functions to compute a Path's size
>     - savefig() gained a backend keyword argument
>     - Saving SVG now supports adding metadata
>     - Saving PDF metadata via PGF now consistent with PDF backend
>     - NbAgg and WebAgg no longer use jQuery & jQuery UI
>
>     Create setup.cfg with configuration to use the copy of FreeType
>     installed on the system.
>
> Please use the tag
> License-Update:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


Thank you for the code review. I didn't know about this tag. I have sent 
v2 of the patch and I will use it future.

Thanks,
Leon


>
>     The line and the checksum of the license in setup.py has changed
>     but the license remains the same.
>
>     Signed-off-by: Leon Anavi <leon.anavi@konsulko.com
>     <mailto:leon.anavi@konsulko.com>>
>     ---
>      ...atplotlib_3.2.2.bb <http://atplotlib_3.2.2.bb> =>
>     python3-matplotlib_3.3.0.bb <http://python3-matplotlib_3.3.0.bb>}
>     | 11 ++++++++---
>      1 file changed, 8 insertions(+), 3 deletions(-)
>      rename
>     meta-python/recipes-devtools/python/{python3-matplotlib_3.2.2.bb
>     <http://python3-matplotlib_3.2.2.bb> =>
>     python3-matplotlib_3.3.0.bb <http://python3-matplotlib_3.3.0.bb>}
>     (70%)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
>     <http://python3-matplotlib_3.2.2.bb>
>     b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
>     <http://python3-matplotlib_3.3.0.bb>
>     similarity index 70%
>     rename from
>     meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
>     <http://python3-matplotlib_3.2.2.bb>
>     rename to
>     meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
>     <http://python3-matplotlib_3.3.0.bb>
>     index b32177d9b..2e88efb56 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-matplotlib_3.2.2.bb
>     <http://python3-matplotlib_3.2.2.bb>
>     +++
>     b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
>     <http://python3-matplotlib_3.3.0.bb>
>     @@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
>      SECTION = "devel/python"
>      LICENSE = "PSF"
>      LIC_FILES_CHKSUM = "\
>     -
>     file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753
>     \
>     +
>     file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353
>     \
>      file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
>      "
>      DEPENDS = "\
>     @@ -18,8 +18,8 @@ DEPENDS = "\
>          python3-pytz-native \
>      "
>
>     -SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"
>     -SRC_URI[sha256sum] =
>     "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"
>     +SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"
>     +SRC_URI[sha256sum] =
>     "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"
>
>      inherit pypi setuptools3 pkgconfig
>
>     @@ -34,4 +34,9 @@ RDEPENDS_${PN} = "\
>          python3-pytz \
>      "
>
>     +do_compile_prepend() {
>     +    echo [libs] > ${S}/setup.cfg
>     +    echo system_freetype = true >> ${S}/setup.cfg
>     +}
>     +
>      BBCLASSEXTEND = "native"
>     -- 
>     2.17.1
>
>     
>
-- 
Leon Anavi
Software Engineer
konsulko.com


--------------6D2C5E472E3D9F7EA974DF5B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Tim,<br>
    </p>
    <div class="moz-cite-prefix">On 24.07.20 г. 16:31 ч., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANx9H-A41PZrWzGFtG0tycV2z26onespUJUz_JmGzMO-a+DYVg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Jul 24, 2020 at 3:35
            AM Leon Anavi &lt;<a href="mailto:leon.anavi@konsulko.com"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Upgrade
            to release 3.3.0:<br>
            <br>
            - Provisional API for composing semantic axes layouts from
            text<br>
              or nested lists<br>
            - New Axes.sharex, Axes.sharey methods<br>
            - Turbo colormap<br>
            - colors.BoundaryNorm supports extend keyword argument<br>
            - Text color for legend labels<br>
            - Pcolor and Pcolormesh now accept shading='nearest' and
            'auto'<br>
            - Allow tick formatters to be set with str or function
            inputs<br>
            - New Axes.axline method<br>
            - Dates use a modern epoch<br>
            - Improved font weight detection<br>
            - Axes3D no longer distorts the 3D plot to match the 2D
            aspect<br>
              ratio<br>
            - More consistent toolbar behavior across backends<br>
            - Toolbar icons are now styled for dark themes<br>
            - Cursor text now uses a number of significant digits
            matching<br>
              pointing precision<br>
            - Functions to compute a Path's size<br>
            - savefig() gained a backend keyword argument<br>
            - Saving SVG now supports adding metadata<br>
            - Saving PDF metadata via PGF now consistent with PDF
            backend<br>
            - NbAgg and WebAgg no longer use jQuery &amp; jQuery UI<br>
            <br>
            Create setup.cfg with configuration to use the copy of
            FreeType<br>
            installed on the system.<br>
            <br>
          </blockquote>
          <div dir="auto">Please use the tag</div>
          <div dir="auto">License-Update:</div>
          <div dir="auto">
            <div><a
                href="https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines"
                moz-do-not-send="true">https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a></div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
      Thank you for the code review. I didn't know about this tag. I
      have sent v2 of the patch and I will use it future.<br>
      <br>
      Thanks,<br>
      Leon<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANx9H-A41PZrWzGFtG0tycV2z26onespUJUz_JmGzMO-a+DYVg@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">The
            line and the checksum of the license in setup.py has changed<br>
            but the license remains the same.<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a
              href="mailto:leon.anavi@konsulko.com" target="_blank"
              moz-do-not-send="true">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
             ...<a href="http://atplotlib_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">atplotlib_3.2.2.bb</a>
            =&gt; <a href="http://python3-matplotlib_3.3.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-matplotlib_3.3.0.bb</a>}
            | 11 ++++++++---<br>
             1 file changed, 8 insertions(+), 3 deletions(-)<br>
             rename meta-python/recipes-devtools/python/{<a
              href="http://python3-matplotlib_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.2.2.bb</a>
            =&gt; <a href="http://python3-matplotlib_3.3.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">python3-matplotlib_3.3.0.bb</a>}
            (70%)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a
              href="http://python3-matplotlib_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.2.2.bb</a>
            b/meta-python/recipes-devtools/python/<a
              href="http://python3-matplotlib_3.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.3.0.bb</a><br>
            similarity index 70%<br>
            rename from meta-python/recipes-devtools/python/<a
              href="http://python3-matplotlib_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.2.2.bb</a><br>
            rename to meta-python/recipes-devtools/python/<a
              href="http://python3-matplotlib_3.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.3.0.bb</a><br>
            index b32177d9b..2e88efb56 100644<br>
            --- a/meta-python/recipes-devtools/python/<a
              href="http://python3-matplotlib_3.2.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.2.2.bb</a><br>
            +++ b/meta-python/recipes-devtools/python/<a
              href="http://python3-matplotlib_3.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">python3-matplotlib_3.3.0.bb</a><br>
            @@ -7,7 +7,7 @@ HOMEPAGE = "<a
              href="https://github.com/matplotlib/matplotlib"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/matplotlib/matplotlib</a>"<br>
             SECTION = "devel/python"<br>
             LICENSE = "PSF"<br>
             LIC_FILES_CHKSUM = "\<br>
            -   
<a class="moz-txt-link-freetext" href="file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753">file://setup.py;beginline=253;endline=253;md5=2a114620e4e6843aa7568d5902501753</a>
            \<br>
            +   
<a class="moz-txt-link-freetext" href="file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353">file://setup.py;beginline=251;endline=251;md5=e0ef37de7122ce842bcd1fb54482b353</a>
            \<br>
               
             <a class="moz-txt-link-freetext" href="file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74">file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74</a>
            \<br>
             "<br>
             DEPENDS = "\<br>
            @@ -18,8 +18,8 @@ DEPENDS = "\<br>
                 python3-pytz-native \<br>
             "<br>
            <br>
            -SRC_URI[md5sum] = "b60cd68f792a30173d825e16482aedd8"<br>
            -SRC_URI[sha256sum] =
            "3d77a6630d093d74cbbfebaa0571d00790966be1ed204e4a8239f5cbd6835c5d"<br>
            +SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"<br>
            +SRC_URI[sha256sum] =
            "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"<br>
            <br>
             inherit pypi setuptools3 pkgconfig<br>
            <br>
            @@ -34,4 +34,9 @@ RDEPENDS_${PN} = "\<br>
                 python3-pytz \<br>
             "<br>
            <br>
            +do_compile_prepend() {<br>
            +    echo [libs] &gt; ${S}/setup.cfg<br>
            +    echo system_freetype = true &gt;&gt; ${S}/setup.cfg<br>
            +}<br>
            +<br>
             BBCLASSEXTEND = "native"<br>
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

--------------6D2C5E472E3D9F7EA974DF5B--
