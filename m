Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id C6F476070B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 19:15:52 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f7so2652099wml.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2020 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=yFXXZLpLgiGh+lf/LFnGCeOKKWxAXT2Egl/Lvj5MJow=;
	b=XUmOIwUX06wlHcmj8oUrMJOVVNgyJ2rKdGyXhfKGepTcbiHEqOYKk7UBsS0U8RD+JP
	0yZZMMMELYsL/Fr3vBnGku4qYd7GxyODTGvRaji4WWP/LJOPVMPJ4AZlbQ9FrLHE1E6w
	JcDZnY6UY6vUOAQ7d9j4+PgGFmZR1atZBjQEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=yFXXZLpLgiGh+lf/LFnGCeOKKWxAXT2Egl/Lvj5MJow=;
	b=ss/5GucFFrfNI0K4qrnZI4ngF2iVvtPFQdrJKTpC3erPjArKOMFPvfZ8iAzNGHne5I
	MgWNs2iHjLc0TnnIlzWngwVjUF7t54IDhbZIkGuQwOfHcjua9F2bc/s10PkIEdchEfqv
	h/mYS+mGQsCp/i+1wVzxpturIvz7KSvmPc5CEsZ3yUCkwPDFBiujejQyZ6MIMs5Kx9yd
	SceRJmw6OnWHhSnnHG6lCRDXyvIBBYbPZUS0vzjHgxzHicFzCYmojOcAZdMkEUPK54qm
	K7wfoact6Zu9fAf5gh4qC9/UmWULYYlOxsPGpkXUrh+KJ7zw2fEme4vGo7TP5figxdLG
	2gmQ==
X-Gm-Message-State: ANhLgQ0Fw025SxpeiisjOvL0lTiefn/ijZMP5U8eRriSiMfTYzKDUqm/
	omrz6Bbng36kvQo+GBF2QFViqw==
X-Google-Smtp-Source: ADFU+vtbUxIJCkGlQi1JtDzmIhBgTTeA1Z+ZBn19pUihVfSEJRck3aWt5ICPx+KVQHlM5PoqJ6+8XQ==
X-Received: by 2002:a1c:f21a:: with SMTP id s26mr3532781wmc.39.1583867753055; 
	Tue, 10 Mar 2020 12:15:53 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	u25sm5164291wml.17.2020.03.10.12.15.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Mar 2020 12:15:52 -0700 (PDT)
To: Tim Orling <ticotimo@gmail.com>
References: <20200310024936.18941-1-scott.branden@broadcom.com>
	<CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <2bdaa8bf-73cd-18d4-fbf7-2f08469e7a00@broadcom.com>
Date: Tue, 10 Mar 2020 12:15:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CANx9H-A_bpFV7c+u_-3p23a4kUmjiuQ+FUE5LqtKu2_rDW+BzQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Rajesh Ravi <rajesh.ravi@broadcom.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python3-pycryptodomex: add 3.9.4 recipe
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
X-List-Received-Date: Tue, 10 Mar 2020 19:15:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2020-03-09 10:50 p.m., Tim Orling wrote:
> This probably should have an RCONFLICTS with python3-cryptodme (and 
> maybe even python3-crypto).
>
> These three packages step all over each other with same functionality...

Good feedback Tim.

Rajesh, could you look if the other recipes do what is needed or can be 
enhanced and used instead?
>
> On Mon, Mar 9, 2020 at 7:50 PM Scott Branden via Openembedded-devel 
> <openembedded-devel@lists.openembedded.org 
> <mailto:openembedded-devel@lists.openembedded.org>> wrote:
>
>     From: Rajesh Ravi <rajesh.ravi@broadcom.com
>     <mailto:rajesh.ravi@broadcom.com>>
>
>     Add python3-pycryptodomex 3.9.4 recipe needed to build
>     such components as optee 3.8.0.
>
>     Signed-off-by: Rajesh Ravi <rajesh.ravi@broadcom.com
>     <mailto:rajesh.ravi@broadcom.com>>
>     Signed-off-by: Scott Branden <scott.branden@broadcom.com
>     <mailto:scott.branden@broadcom.com>>
>     ---
>      .../python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>    | 30 +++++++++++++++++++
>      1 file changed, 30 insertions(+)
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>
>     b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>
>     new file mode 100644
>     index 000000000..be6b10f3f
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
>     <http://python3-pycryptodomex_3.9.4.bb>
>     @@ -0,0 +1,30 @@
>     +SUMMARY = "Cryptographic library for Python"
>     +DESCRIPTION = "PyCryptodome is a self-contained Python package of
>     low-level\
>     + cryptographic primitives."
>     +HOMEPAGE = "http://www.pycryptodome.org"
>     +LICENSE = "PD & BSD-2-Clause"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
>     +
>     +SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
>     +SRC_URI[sha256sum] =
>     "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
>     +
>     +inherit pypi
>     +inherit setuptools3
>     +
>     +RDEPENDS_${PN} += " \
>     +    ${PYTHON_PN}-io \
>     +    ${PYTHON_PN}-math \
>     +"
>     +
>     +RDEPENDS_${PN}-tests += " \
>     +    ${PYTHON_PN}-unittest \
>     +"
>     +
>     +PACKAGES =+ "${PN}-tests"
>     +
>     +FILES_${PN}-tests += " \
>     +    ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
>     + ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
>     +"
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


