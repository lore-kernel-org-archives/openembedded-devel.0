Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.6561.1601504089600229465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NhcJPo1G;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id di5so1805460qvb.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=3++FAL/dkz0cHVr0I9byeCneX27qUOY+QPo75UMROls=;
        b=NhcJPo1GodisKWqyMRNdUqT2RwYuhEhMfjTzAZHgmOE8mZxrxvogIhwrLu1/gs2CMx
         M5dFELIQgEDTMwWTafOUgXLQmov0quF44xcPJHlnhxVm+2dchQ8wjqFmWF6yIMB2Q+Az
         pF/FtcQvnGoIVvR78Mb8XBuYM426DzAVSg/oq1Mn2Bx0W+eaA5ClsZybXCz6lFVF2VgD
         J5G9u5meRZ0JRqrkJPUlwFIUJuJapSERvsNSUT5bLwTLGRcFGD1nEsoSDxxzPnLwhKq1
         jek796aEtj6V6wDmM14m+g64ui3LMutdR3hqGn5e7gBjesxTKQxqDrk8MVsD07ZdulfW
         ZrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=3++FAL/dkz0cHVr0I9byeCneX27qUOY+QPo75UMROls=;
        b=DG8jbxjjzOsoOCQ6fJDNrWikm3CzTraNUfhLGaHEfD95VHNvWqaEjXfXxvrkgj74ng
         BA0Ds6N0WT+yMPpm2hmlgxG03Geo2z0QyqLliMs+QsiUNWseC2YzKRwscxN9m7PAkaN1
         syza+33jv0/TdOP0Eo0EHIHk1dTtIuo3It69ZGKh/i29knAOAjksb4Oq3d07oY2Z6fS4
         ol30vHsag3WIuxXHtVyDj4zRYC4ij56bsrheCColu+oRoXah9tFXstUgSeaFM2Ecqs2p
         8pFR0K+m/vJeGIefCfwPr3l52dV7+K5sJZUqVIidMEZPS55fpUwCYNJTzb0UymOpwLCh
         VG3Q==
X-Gm-Message-State: AOAM532/fVvKc7afhFt+vWim5vPdhknIndqczJ7dA4It1Bj7YoVpDbkM
	FQaBHZnGyyZ21zQ66b8vg04=
X-Google-Smtp-Source: ABdhPJxusJ2YD58IsplaM52kKk9hdl4j5PoDog6R9L0C5zWxJUbhEI+b5G2ix7dlMcJZxOiQQQjKLQ==
X-Received: by 2002:ad4:408f:: with SMTP id l15mr4837179qvp.4.1601504088801;
        Wed, 30 Sep 2020 15:14:48 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id m67sm3817663qkf.98.2020.09.30.15.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:14:48 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH v2 2/2] python3-pytest: 5.4.3 -> 6.1.0
To: kai <kai.kang@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, ticotimo@gmail.com
References: <20200927084320.17334-1-kai.kang@windriver.com>
 <20200927084320.17334-3-kai.kang@windriver.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <02d0a421-c32a-16bd-3cd2-8880e8c24141@gmail.com>
Date: Wed, 30 Sep 2020 18:14:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200927084320.17334-3-kai.kang@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------CF26D818D491785E529BB368"
Content-Language: en-US

--------------CF26D818D491785E529BB368
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/27/20 4:43 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade python3-pytest from 5.4.3 to 6.1.0
> * add runtime dependency python3-iniconfig
>
> And the release changelog is at:
>
> https://docs.pytest.org/en/stable/changelog.html#pytest-6-1-0-2020-09-26
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...he-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------
>   ...ytest_5.4.3.bb => python3-pytest_6.1.0.bb} |  3 +-
>   2 files changed, 21 insertions(+), 17 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb => python3-pytest_6.1.0.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> index c29fb12de..8c5c17247 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> +++ b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> @@ -14,23 +14,26 @@ Upstream-Status: Inappropriate [oe specific]
>   Signed-off-by: Derek Straka <derek@asterius.io>
>   
>   Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> +
> +Rebase for pytest 6.1.0.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   ---
> - setup.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index adbafb5..75fdd09 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -19,7 +19,7 @@ INSTALL_REQUIRES = [
> - def main():
> -     setup(
> -         use_scm_version={"write_to": "src/_pytest/_version.py"},
> --        setup_requires=["setuptools-scm", "setuptools>=40.0"],
> -+        setup_requires=["setuptools>=40.0"],
> -         package_dir={"": "src"},
> -         extras_require={
> -             "testing": [
> + setup.cfg | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.cfg b/setup.cfg
> +index 60f6564..c4d1471 100644
> +--- a/setup.cfg
> ++++ b/setup.cfg
> +@@ -55,7 +55,6 @@ package_dir =
> + 	=src
> + setup_requires =
> + 	setuptools>=40.0
> +-	setuptools-scm
> + zip_safe = no
> +
> + [options.entry_points]
>   --
>   2.17.1
>   
> diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
> index ca67223db..1da43c4f9 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
> @@ -3,7 +3,7 @@ SUMMARY = "Simple powerful testing with python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
>   
> -SRC_URI[sha256sum] = "7979331bfcba207414f5e1263b5a0f8f521d0f457318836a7355531ed1a4c7d8"
> +SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
>   
>   SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
>   
> @@ -13,6 +13,7 @@ RDEPENDS_${PN}_class-target += " \
>       ${PYTHON_PN}-attrs \
>       ${PYTHON_PN}-debugger \
>       ${PYTHON_PN}-doctest \
> +    ${PYTHON_PN}-iniconfig \
>       ${PYTHON_PN}-json \
>       ${PYTHON_PN}-pluggy \
>       ${PYTHON_PN}-py \
>
> 
>

--------------CF26D818D491785E529BB368
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/27/20 4:43 AM, kai wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200927084320.17334-3-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Upgrade python3-pytest from 5.4.3 to 6.1.0
* add runtime dependency python3-iniconfig

And the release changelog is at:

<a class="moz-txt-link-freetext" href="https://docs.pytest.org/en/stable/changelog.html#pytest-6-1-0-2020-09-26">https://docs.pytest.org/en/stable/changelog.html#pytest-6-1-0-2020-09-26</a>

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite"
      cite="mid:20200927084320.17334-3-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...he-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------
 ...ytest_5.4.3.bb =&gt; python3-pytest_6.1.0.bb} |  3 +-
 2 files changed, 21 insertions(+), 17 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb =&gt; python3-pytest_6.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
index c29fb12de..8c5c17247 100644
--- a/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ b/meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -14,23 +14,26 @@ Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Derek Straka <a class="moz-txt-link-rfc2396E" href="mailto:derek@asterius.io">&lt;derek@asterius.io&gt;</a>
 
 Signed-off-by: Yuan Chao <a class="moz-txt-link-rfc2396E" href="mailto:yuanc.fnst@cn.fujitsu.com">&lt;yuanc.fnst@cn.fujitsu.com&gt;</a>
+
+Rebase for pytest 6.1.0.
+
+Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
 ---
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index adbafb5..75fdd09 100644
---- a/setup.py
-+++ b/setup.py
-@@ -19,7 +19,7 @@ INSTALL_REQUIRES = [
- def main():
-     setup(
-         use_scm_version={"write_to": "src/_pytest/_version.py"},
--        setup_requires=["setuptools-scm", "setuptools&gt;=40.0"],
-+        setup_requires=["setuptools&gt;=40.0"],
-         package_dir={"": "src"},
-         extras_require={
-             "testing": [
+ setup.cfg | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/setup.cfg b/setup.cfg
+index 60f6564..c4d1471 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -55,7 +55,6 @@ package_dir =
+ 	=src
+ setup_requires = 
+ 	setuptools&gt;=40.0
+-	setuptools-scm
+ zip_safe = no
+ 
+ [options.entry_points]
 -- 
 2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
index ca67223db..1da43c4f9 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Simple powerful testing with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b">"file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"</a>
 
-SRC_URI[sha256sum] = "7979331bfcba207414f5e1263b5a0f8f521d0f457318836a7355531ed1a4c7d8"
+SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
 
 SRC_URI_append = <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch">" file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "</a>
 
@@ -13,6 +13,7 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-doctest \
+    ${PYTHON_PN}-iniconfig \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-pluggy \
     ${PYTHON_PN}-py \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CF26D818D491785E529BB368--
