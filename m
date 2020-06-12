Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.633.1591995395394727104
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 13:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MNyAZYuF;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id ne5so4113602pjb.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=hTefwjTfwmAoWtRf5Uayhxwgyyj91epUwtXa8IgKC00=;
        b=MNyAZYuF199A7BQNX75TrUnXE0S13RNkODqukVk4ohsYHNkJfGrk1f9mbq84EajWHP
         DZxCF1mLPaMQMHw+D5b1hqxKsssvpQVHiW9CKTd/4lN6Bn5a+529GkoOLSHmz45cVb9l
         dgfak4dpPR4MdpZjv91xm7UE//5s/+8FVrn/y6uszs+kdF0quBPg/+vUGA6dizkt0vwH
         pjE+79ac6jQLkhjkqc2+OkgOUGyKZ/tGbupZCVpwgJqHmn2E1ijB9AmUsLXuyEr35GRC
         f5Opddy+JWlMIFijp8qyMkyGIk+lFXEPMzf4n/IkCMCw9ux0cmE+gPahrb8L+nWdPlua
         Lr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=hTefwjTfwmAoWtRf5Uayhxwgyyj91epUwtXa8IgKC00=;
        b=E3pHm32Ig44KLeDD+DJcRa3FH7B+fhDDXoXVFT1QYuiLZwCgQtt28tfTSheFMZrIXq
         nXtH4FfhFldMiC4/xY3r747cE/3t9/akraunUzkR8e+uHhrL/99AUAGJdM2xkGYMfUf6
         EHQSbEvkB+OKMs61Bylp4uqM4B7Di4kibepV5Zv1JbyEfk1RW7VypbfWzUS2vEGOJJ86
         rr/YGdN2CMcf+mdi4OBUGq5UbcLPYBBuT56N1Begv0AyYE/Jn0ogI5h67EDuOh2yBnUq
         s3PGtdGBY/ZQv8krQKO2G/tfNDu7gOY6XyRWTt8otP1BoKgSiEkBHHD17lAjXS/+ryE8
         55NA==
X-Gm-Message-State: AOAM5337m3J4k+u2SRrHufnVmACDEu1FlzpTtQgg4/kZ994K8smpvOOp
	eCeN+IxbFzjHK1OYDFisDHE=
X-Google-Smtp-Source: ABdhPJzqZkQVO3KzP7Xgz3assjnF5LNgwvQXlO/Bpx7S0TgDNBggLoCEy4F1CxmDMMoqI2IRhGj9oA==
X-Received: by 2002:a17:90b:11d8:: with SMTP id gv24mr758675pjb.66.1591995394930;
        Fri, 12 Jun 2020 13:56:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:5030:aa9f:23eb:a3d9? ([2601:202:4180:a5c0:5030:aa9f:23eb:a3d9])
        by smtp.gmail.com with ESMTPSA id q16sm7039193pfg.49.2020.06.12.13.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 13:56:34 -0700 (PDT)
Subject: Re: [oe] [dunfell-backport meta-python PATCH 01/22] python3-argh: Add recipe version 0.26.2
To: Otavio Salvador <otavio.salvador@gmail.com>,
 Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <93cc762c-be2e-ef93-7159-36bb2daf78ef@gmail.com>
Date: Fri, 12 Jun 2020 13:56:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
Content-Type: multipart/alternative;
 boundary="------------CA4A1EBFCDEAAC325B1C6552"
Content-Language: en-US

--------------CA4A1EBFCDEAAC325B1C6552
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 6/12/20 11:35 AM, Otavio Salvador wrote:
> From: Domarys Correa <domarys.correa@ossystems.com.br>
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit ae8968122461df7e1fa39138f32caa35218bb71f)
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Am I missing the context around "dunfell-fallback" ? Was there a cover
letter that would explain that I missed?

Generally adding new packages don't fall inside a Stable branch policy.

please clarify.

- armin

> ---
>
>  .../recipes-devtools/python/python3-argh_0.26.2.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
> new file mode 100644
> index 000000000..6aa758876
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Pattern matching and various utilities for file systems paths."
> +
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad"
> +
> +SRC_URI[sha256sum] = "e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-logging \
> +"
> +
> +BBCLASSEXTEND = "native nativesdk"
>
> 


--------------CA4A1EBFCDEAAC325B1C6552
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/12/20 11:35 AM, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200612183607.108989-1-otavio@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">From: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a>

Signed-off-by: Domarys Correa <a class="moz-txt-link-rfc2396E" href="mailto:domarys.correa@ossystems.com.br">&lt;domarys.correa@ossystems.com.br&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
(cherry picked from commit ae8968122461df7e1fa39138f32caa35218bb71f)
Signed-off-by: Otavio Salvador <a class="moz-txt-link-rfc2396E" href="mailto:otavio@ossystems.com.br">&lt;otavio@ossystems.com.br&gt;</a></pre>
    </blockquote>
    <br>
    Am I missing the context around "dunfell-fallback" ? Was there a
    cover letter that would explain that I missed?<br>
    <br>
    Generally adding new packages don't fall inside a Stable branch
    policy.<br>
    <br>
    please clarify.<br>
    <br>
    - armin<br>
    <br>
    <blockquote type="cite"
      cite="mid:20200612183607.108989-1-otavio@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">
---

 .../recipes-devtools/python/python3-argh_0.26.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-argh_0.26.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
new file mode 100644
index 000000000..6aa758876
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-argh_0.26.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Pattern matching and various utilities for file systems paths."
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad">"file://PKG-INFO;beginline=8;endline=8;md5=cede70b648dcc81baf5b431d38905bad"</a>
+
+SRC_URI[sha256sum] = "e9535b8c84dc9571a48999094fda7f33e63c3f1b74f3e5f3ac0105a58405bb65"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+"
+
+BBCLASSEXTEND = "native nativesdk"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CA4A1EBFCDEAAC325B1C6552--
