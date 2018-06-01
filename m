Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0C16FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:52:02 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 31-v6so5720196plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jsA0+J6QmXorPKOTpUXjbdLYbK+J0/nbcgfl2rrKPGs=;
	b=vS8et5heSIK5TQzQc9um2lZZN23dxNN/FTWa7u0dGz7MxkpcuIRBjQEO4Hl+fAGjlA
	/30DBa3aw3EcU0XUxedH7TMq7WYr3iYd/IurtdIioPWrwgR/ifs2EonbhBI+tbgvr9xl
	0eRFQ5PXwbznfDWExjUSPMh2jvPiN1Bi7/WhbCRLZVDVbmR0R1EwYISU8GPJgash5c/3
	OoBKGFkrblefprrRTPRhKtD4Q3EwZpqvc4jFutvZy8LvcUvykdU1yvC65KBgjG3prkNU
	AK7kU2QHovVZ5qQA7hKJWkikZP0g+FCmnjr0b/ey6P05FeEixTvPkgIY8Fre9GZ14yGn
	LO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jsA0+J6QmXorPKOTpUXjbdLYbK+J0/nbcgfl2rrKPGs=;
	b=Kl3/SorFpqj45JYr39Q21BtvzTnu/S7vQidal3OVBBn3Up8Phj9xMPAblXo34c/qrs
	dESjWIVld7DO9dwoR5P7ag8bEbHxNXfrmY+gsMbVkbZARlzegOllnkJTeUZKd9yIhT93
	IspjytlBvzjyfoCEvSGA7gavlIdGF9LzVn/xYngrECqjpWVQ+Ly6AyBA+PMyAZrQhAaf
	sQdPNMZUXXngP9hUVPYfHo++RmcdNlOhBI313MXtYL98ANvKxPcdpF3vtdcMoCMU2/0y
	02BfAVvLyx7iQoKyvyOWh6Ybfxu4EHxvREsy8pWnt5VySvQ4VL34LqZibwt7TU6rmZYp
	nxWg==
X-Gm-Message-State: ALKqPwciNiJwI5BVxOGVoZt1wCoOUu90b+S9vUWpkzEKf8iCGGIhQvXk
	PtH2rF6dxCs7ciXlJ5Na49ZW8Si8
X-Google-Smtp-Source: ADUXVKJMr/JHrU7yPS447PINGuw+DC2+ARaqYLSVE65PmaF6du+q2djZa3E5bqQcIVrSZcKuQ655RA==
X-Received: by 2002:a17:902:bd8f:: with SMTP id
	q15-v6mr11544812pls.161.1527871923011; 
	Fri, 01 Jun 2018 09:52:03 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	q68-v6sm71152246pfb.182.2018.06.01.09.52.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 09:52:02 -0700 (PDT)
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <57a8f702-eb09-2e55-936c-869c869b23a1@gmail.com>
Date: Fri, 1 Jun 2018 09:52:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1527865814-9027-1-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] libseccomp: move lib from meta-security to meta-oe
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
X-List-Received-Date: Fri, 01 Jun 2018 16:52:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/1/18 8:10 AM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-security/libseccomp/files/run-ptest    |  4 +++
>  .../libseccomp/libseccomp_2.3.3.bb                 | 42 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-security/libseccomp/files/run-ptest
>  create mode 100644 meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb
> 
> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest b/meta-oe/recipes-security/libseccomp/files/run-ptest
> new file mode 100644
> index 0000000..54b4a63
> --- /dev/null
> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +cd tests
> +./regression -a

should this recover to old pwd after run is over ?

> diff --git a/meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb b/meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb
> new file mode 100644
> index 0000000..8d58163
> --- /dev/null
> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.3.3.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "interface to seccomp filtering mechanism"
> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
> +SECTION = "security"
> +LICENSE = "LGPL-2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
> +
> +SRCREV = "74b190e1aa05f07da0c61fb9a30dbc9c18ce2c9d"
> +
> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.3 \
> +           file://run-ptest \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig ptest
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
> +
> +do_compile_ptest() {
> +    oe_runmake -C tests check-build
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -d ${D}${PTEST_PATH}/tools
> +    for file in $(find tests/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tests/*.tests -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> +    done
> +    for file in $(find tools/* -executable -type f); do
> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> +    done
> +}
> +
> +FILES_${PN} = "${bindir} ${libdir}/${PN}.so*"

I wonder if library should be packaged separately then any binary
utilities that accompanies it.

> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
> +
> +RDEPENDS_${PN} = "bash"
> +RDEPENDS_${PN}-ptest = "bash"
> 

Is this dep needed in some other scripts that are run ? the ptest runner
script itself seems to not need bash


