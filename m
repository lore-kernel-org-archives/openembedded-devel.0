Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4222360770
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:10:05 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f82so51234576wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6+nq3ogqX/Lj+OMdVKKb2Bk2BXMQtbCw3flP5nG+/jc=;
	b=tJnZAAuh72o26xQg+prlisqB5mrVyOV4Awp1WsIFlDQmAITEDwviaNDMlz9RXKtzqf
	/MComXxJxNdH6+Dk9oyy+LEZ87g6juk/bElOJ9YKTmLJ9lAfXn3LziFICuRM5JHrQN5a
	nv0UMy0kb2/nMyV9tClYcluych68wiFIkD8fSaSoZ22HMKCR+SPzfcg0xB6w2OJ1Z0J3
	3XpJ5VQG3BgoiI12Jg5hrZBCRUwcEehKnvCHv3PCka7yDOODfZLDOMkRDv+bLxI5a+Za
	axO4cqk4gQTSmAcTClv6wJdsVGLgtIndoWp6uKd+f7lA/v2D+8ACO5VLu788zyOmYjjU
	gF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6+nq3ogqX/Lj+OMdVKKb2Bk2BXMQtbCw3flP5nG+/jc=;
	b=KetBGSStwSZnydXRfk1KyJqUSC24x1vBl1ZoYd5LtF1DZxYRI8c3Z6SKZCrkLv6TrP
	0+rJaOtiTfjRTtQvPD9zdsO88cept6PfxpBoXR2yubyCVqsUWAmSW9tAu0K59C65kdfY
	P/UG86AB2ZWzWwMQH/KAEvveM/XznMLy0V+v9SZFGKWXoMr/v8iaN7Y09ug2Fq9hJ76V
	pFWgqCLalC0x3R6DjW4ubBCfqEorhKGpbVyZ/QfAypifgD8aUgrjNUNLsPHMdnojpJgh
	Jf3evNcoeJIMbvOkI4pSPNfKv7FcmGvSkRmyMT2Xl3cZD1gezHtxx/Rtj9QBrJL0pz46
	if4w==
X-Gm-Message-State: AKaTC01NBvOy4h15IKmqvnr/2rfTuCel4TMAAufBhulApRrQWUjHEZFmZL4LxlHN4UvvmvB4iP1x5Fo87nfhUw==
X-Received: by 10.28.184.88 with SMTP id i85mr478797wmf.49.1479856206921; Tue,
	22 Nov 2016 15:10:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Tue, 22 Nov 2016 15:10:06 -0800 (PST)
In-Reply-To: <1479436323-26549-1-git-send-email-derek@asterius.io>
References: <1479436323-26549-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 23 Nov 2016 00:10:06 +0100
Message-ID: <CA+chaQdG_JH9-4YPni759T4Md6TtEka1U55CqUdQ2BdJ5+K9=w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-pycparser: update to version 2.17
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
X-List-Received-Date: Tue, 22 Nov 2016 23:10:07 -0000
Content-Type: text/plain; charset=UTF-8

Causes:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python-subprocess-native' (but virtual:native:
meta-oe/meta-python/recipes-devtools/python/python-pycparser_2.17.bb
<https://anaconda.lgsvl.com/jenkins/job/webos-pro-jansa-master-test-signatures/ws/build/meta-oe/meta-python/recipes-devtools/python/python-pycparser_2.17.bb>
RDEPENDS
on or otherwise requires it)
NOTE: Runtime target 'python-subprocess-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-subprocess-native']
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'python-cryptography', 'python-cffi-native', 'python-pycparser-native',
'python-subprocess-native']

On Fri, Nov 18, 2016 at 3:32 AM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-python/recipes-devtools/python/python-pycparser.inc       | 10
> +++++++---
>  .../{python-pycparser_2.14.bb => python-pycparser_2.17.bb}     |  0
>  meta-python/recipes-devtools/python/python3-pycparser_2.14.bb  |  2 --
>  meta-python/recipes-devtools/python/python3-pycparser_2.17.bb  |  6
> ++++++
>  4 files changed, 13 insertions(+), 5 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pycparser_2.14.bb =>
> python-pycparser_2.17.bb} (100%)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-pycparser_2.14.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pycparser_2.17.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pycparser.inc
> b/meta-python/recipes-devtools/python/python-pycparser.inc
> index bf3b757..88646f0 100644
> --- a/meta-python/recipes-devtools/python/python-pycparser.inc
> +++ b/meta-python/recipes-devtools/python/python-pycparser.inc
> @@ -1,8 +1,12 @@
>  SUMMARY = "Parser of the C language, written in pure Python"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=8fb364772b1441821d391591f340c35a"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d0cfca7bbc0610f849707d9e4fd82eac"
>
> -SRC_URI[md5sum] = "a2bc8d28c923b4fe2b2c3b4b51a4f935"
> -SRC_URI[sha256sum] = "7959b4a74abdc27b312fed1c21e6ca
> f9309ce0b29ea86b591fd2e99ecdf27f73"
> +SRC_URI[md5sum] = "ca98dcb50bc1276f230118f6af5a40c7"
> +SRC_URI[sha256sum] = "0aac31e917c24cb3357f5a4d5566f2
> cc91a19ca41862f6c3c22dc60a629673b6"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-subprocess \
> +    "
> diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.14.bb
> b/meta-python/recipes-devtools/python/python-pycparser_2.17.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pycparser_2.14.bb
> rename to meta-python/recipes-devtools/python/python-pycparser_2.17.bb
> diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
> b/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
> deleted file mode 100644
> index b30db54..0000000
> --- a/meta-python/recipes-devtools/python/python3-pycparser_2.14.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-pycparser.inc
> diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
> b/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
> new file mode 100644
> index 0000000..0bd1c8f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pycparser_2.17.bb
> @@ -0,0 +1,6 @@
> +inherit pypi setuptools3
> +require python-pycparser.inc
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-netclient \
> +    "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

