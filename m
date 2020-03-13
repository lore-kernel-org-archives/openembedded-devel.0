Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7688161C82
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:36:23 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id c7so5191376pgw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Sc7gnlJuYIit6ueV7qyAxRxY8P3B0S08VmDKCBydL+I=;
	b=Jc55BQD5cRAyTniMNxOFmi722Tt3m0TNXBFFAA6dFxjUNhFIqVz29+P0g85iNMuhFx
	X4dXKmpzzVobovi8qVm8k4XToFSN8DDRJErOdFqj/JT1EsnahMY+JK/xmh+VSk2Vzb4D
	4rzsx9EZQi4+uoS8Jc+N8guGLpF8zWd5ubQK80CRQeOCkopf8Qkopgs0aTXg0dVCk+nc
	9RKifO+UQQA0IslR3jqIn+h1f6tiqYbyMBcK4xLXmDALXWO7/sb005ia04Gcou1/sTEx
	nMXqyQlgEXtYmfwmTeTv8kSuqsIVOGz1eDd9E/2nQLFz+n6n8+Us3YnslGKwpas5UW2T
	fiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Sc7gnlJuYIit6ueV7qyAxRxY8P3B0S08VmDKCBydL+I=;
	b=h6Bztb6ewJUf/DQVtqkv723MlxUGW9Ea/xt++oku4DPCeUfOMJZLSijeGclvhNsJLt
	v2ixk5gijpfbsjiXJHNHgpnm6F2C0BT/im1E5cKOSp45lNq3IardmDhY763Kmv85H3BN
	ea6xhDMjBudhn9DyeMhBIbUvMcK6qYEkdm+lOZFCRsHZculrxcKihliD191qyeyPEkKm
	g1efXK+ERw02JMEjYAZZg/a14Itcxjrcljh1pd52Ymc5B03EMSlLtmc6utptO4ar7wXl
	OqPjGZ5GBp7HAeyBWHk6kL2doYC1dkuxrZH2eOC9Pcx0dbsKKPpk3vrVNdUlaK5fQl/l
	+6iw==
X-Gm-Message-State: ANhLgQ2E7Gsp1ZfMHmkg08QF3TlkWoVoiI3EmxZhCmW1vQ1Lt2j722E5
	Z5Yd38K4mrrDlq7UHiAv/BtUimvO
X-Google-Smtp-Source: ADFU+vt/sqalgvkhBVm/hC59yUK2p72MM8dxg6m+7ssn58Ci2+1NUitpcguapKOGFLjmYvFLm7iFhQ==
X-Received: by 2002:a63:7453:: with SMTP id e19mr13434845pgn.50.1584113784307; 
	Fri, 13 Mar 2020 08:36:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:b971:4aa1:90b2:e851?
	([2601:202:4180:a5c0:b971:4aa1:90b2:e851])
	by smtp.gmail.com with ESMTPSA id
	jz19sm8466625pjb.48.2020.03.13.08.36.22
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Mar 2020 08:36:23 -0700 (PDT)
To: Haiqing Bai <Haiqing.Bai@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <1584094764-17831-1-git-send-email-Haiqing.Bai@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <652c9f72-5751-7494-c6e8-245e8e6af43e@gmail.com>
Date: Fri, 13 Mar 2020 08:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1584094764-17831-1-git-send-email-Haiqing.Bai@windriver.com>
Subject: Re: [meta-python][zeus][PATCH] python-urllib3/python3-urllib3: fix CVE-2020-7212
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Mar 2020 15:36:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/13/20 3:19 AM, Haiqing Bai wrote:
> Optimize _encode_invalid_chars for a denial of service (CPU consumption)

is this fix in master?


>
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  .../python/python-urllib3/CVE-2020-7212.patch      | 54 ++++++++++++++++++++++
>  .../python/python-urllib3_1.25.6.bb                |  2 +
>  .../python/python3-urllib3/CVE-2020-7212.patch     | 54 ++++++++++++++++++++++
>  .../python/python3-urllib3_1.25.6.bb               |  2 +
>  4 files changed, 112 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
> new file mode 100644
> index 0000000..a2bb0fb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-urllib3/CVE-2020-7212.patch
> @@ -0,0 +1,54 @@
> +From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
> +From: Quentin Pradet <quentin.pradet@gmail.com>
> +Date: Tue, 21 Jan 2020 22:32:56 +0400
> +Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
> +
> +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> +
> +Upstream-Status: Backport
> +[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/urllib3/util/url.py | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
> +index 9675f74..e353937 100644
> +--- a/src/urllib3/util/url.py
> ++++ b/src/urllib3/util/url.py
> +@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
> + 
> +     component = six.ensure_text(component)
> + 
> ++    # Normalize existing percent-encoded bytes.
> +     # Try to see if the component we're encoding is already percent-encoded
> +     # so we can skip all '%' characters but still encode all others.
> +-    percent_encodings = PERCENT_RE.findall(component)
> +-
> +-    # Normalize existing percent-encoded bytes.
> +-    for enc in percent_encodings:
> +-        if not enc.isupper():
> +-            component = component.replace(enc, enc.upper())
> ++    component, percent_encodings = PERCENT_RE.subn(
> ++        lambda match: match.group(0).upper(), component
> ++    )
> + 
> +     uri_bytes = component.encode("utf-8", "surrogatepass")
> +-    is_percent_encoded = len(percent_encodings) == uri_bytes.count(b"%")
> +-
> ++    is_percent_encoded = percent_encodings == uri_bytes.count(b"%")
> +     encoded_component = bytearray()
> + 
> +     for i in range(0, len(uri_bytes)):
> +@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
> +         if (is_percent_encoded and byte == b"%") or (
> +             byte_ord < 128 and byte.decode() in allowed_chars
> +         ):
> +-            encoded_component.extend(byte)
> ++            encoded_component += byte
> +             continue
> +         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill(2).upper()))
> + 
> +-- 
> +2.23.0
> +
> diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
> index 6c81f1d..9f2d2c8 100644
> --- a/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
> +++ b/meta-python/recipes-devtools/python/python-urllib3_1.25.6.bb
> @@ -1,2 +1,4 @@
>  inherit pypi setuptools
>  require python-urllib3.inc
> +
> +SRC_URI += "file://CVE-2020-7212.patch"
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
> new file mode 100644
> index 0000000..a2bb0fb
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-7212.patch
> @@ -0,0 +1,54 @@
> +From aff951b7a41eb5b958b32c49eaa00da02adc9c2d Mon Sep 17 00:00:00 2001
> +From: Quentin Pradet <quentin.pradet@gmail.com>
> +Date: Tue, 21 Jan 2020 22:32:56 +0400
> +Subject: [PATCH] Optimize _encode_invalid_chars (#1787)
> +
> +Co-authored-by: Seth Michael Larson <sethmichaellarson@gmail.com>
> +
> +Upstream-Status: Backport
> +[from git://github.com/urllib3/urllib3.git commit:a2697e7c6b]
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/urllib3/util/url.py | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
> +index 9675f74..e353937 100644
> +--- a/src/urllib3/util/url.py
> ++++ b/src/urllib3/util/url.py
> +@@ -216,18 +216,15 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
> + 
> +     component = six.ensure_text(component)
> + 
> ++    # Normalize existing percent-encoded bytes.
> +     # Try to see if the component we're encoding is already percent-encoded
> +     # so we can skip all '%' characters but still encode all others.
> +-    percent_encodings = PERCENT_RE.findall(component)
> +-
> +-    # Normalize existing percent-encoded bytes.
> +-    for enc in percent_encodings:
> +-        if not enc.isupper():
> +-            component = component.replace(enc, enc.upper())
> ++    component, percent_encodings = PERCENT_RE.subn(
> ++        lambda match: match.group(0).upper(), component
> ++    )
> + 
> +     uri_bytes = component.encode("utf-8", "surrogatepass")
> +-    is_percent_encoded = len(percent_encodings) == uri_bytes.count(b"%")
> +-
> ++    is_percent_encoded = percent_encodings == uri_bytes.count(b"%")
> +     encoded_component = bytearray()
> + 
> +     for i in range(0, len(uri_bytes)):
> +@@ -237,7 +234,7 @@ def _encode_invalid_chars(component, allowed_chars, encoding="utf-8"):
> +         if (is_percent_encoded and byte == b"%") or (
> +             byte_ord < 128 and byte.decode() in allowed_chars
> +         ):
> +-            encoded_component.extend(byte)
> ++            encoded_component += byte
> +             continue
> +         encoded_component.extend(b"%" + (hex(byte_ord)[2:].encode().zfill(2).upper()))
> + 
> +-- 
> +2.23.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
> index 19eb702..e3583a0 100644
> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.6.bb
> @@ -1,2 +1,4 @@
>  inherit pypi setuptools3
>  require python-urllib3.inc
> +
> +SRC_URI += "file://CVE-2020-7212.patch"


