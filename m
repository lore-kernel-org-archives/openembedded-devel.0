Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id E1FDC601A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:43:08 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so2449244pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=cqQk+c9/QanD/oZZ1pSjG+zuKfT+viUbj5K+t8iPfqo=;
	b=ZPTFpb6e6SHQU9KdRtpTA2bhFNztdBGPC+JBIU5QUC4ONtMQ2C0Gvp7zi7AkQvbI7s
	K76vm/gux5NKNpgILhEYrzIRLQ/wyFZtgdfGFWa73jQ+W8qK4hWDWWUCB7tZbNRio6oi
	SObqfABj5EV2QHG3afvQwQdWxRJj98DaU0peQHrQqGQgbgFz2pEkak8an1uslkYd0UnD
	Z8G7TKVdBqP5rewy20EuoLtEMYJLxi9xuuA8OH7aXRgaSywuYboleM09rBboX4FNgVHW
	CRYkMrEnTWgT/RibIYqK3evZmXUKNNpwL6Et5PzQlP7ExuvYqhYWqzKy2Rj1Em3IOV/c
	awtQ==
X-Gm-Message-State: ALoCoQn6Oi/nBvg31Puh/zax5VhTHouJ2QMz9s/B7R23L3JjE8Up2w9J2dJnr1FwhZ1om6psm6fB
X-Received: by 10.67.4.1 with SMTP id ca1mr7347134pad.50.1408056189386;
	Thu, 14 Aug 2014 15:43:09 -0700 (PDT)
Received: from [10.7.100.251] (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id et1sm6338520pbc.39.2014.08.14.15.43.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 15:43:08 -0700 (PDT)
Message-ID: <53ED3B7B.4030705@mvista.com>
Date: Thu, 14 Aug 2014 15:43:07 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: kai.kang@windriver.com
References: <1408007615-23880-1-git-send-email-kai.kang@windriver.com>
	<1408007615-23880-5-git-send-email-kai.kang@windriver.com>
In-Reply-To: <1408007615-23880-5-git-send-email-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/6] libnet-ssleay-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 22:43:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Kai,

Thanks.

This recipe is also in meta-security so once it commit to oe, I will 
remove the recipe from meta-security.

- Armin

On 08/14/2014 02:13 AM, Kai Kang wrote:
> Add recipe for libnet-ssleay-perl. Inherit ptest to enable build
> -ptest sub-package and add file 'run-ptest'.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-perl/recipes-perl/libnet/files/run-ptest      | 16 ++++++++
>   .../recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 43 ++++++++++++++++++++++
>   2 files changed, 59 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libnet/files/run-ptest
>   create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
>
> diff --git a/meta-perl/recipes-perl/libnet/files/run-ptest b/meta-perl/recipes-perl/libnet/files/run-ptest
> new file mode 100644
> index 0000000..c9f9ca9
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libnet/files/run-ptest
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +for case in `find t -type f -name '*.t'`; do
> +    perl $case >$case.output 2>&1
> +    ret=$?
> +    cat $case.output
> +    if [ $ret -ne 0 ]; then
> +        echo "FAIL: ${case%.t}"
> +    elif grep -i 'SKIP' $case.output; then
> +        echo "SKIP: ${case%.t}"
> +    else
> +        echo "PASS: ${case%.t}"
> +    fi
> +
> +    rm -f $case.output
> +done
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
> new file mode 100644
> index 0000000..63594b9
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
> @@ -0,0 +1,43 @@
> +SUMMARY = "Net::SSLeay - Perl extension for using OpenSSL"
> +DESCRIPTION = "This module offers some high level convenience functions for accessing \
> +web pages on SSL servers (for symmetry, same API is offered for \
> +accessing http servers, too), a sslcat() function for writing your own \
> +clients, and finally access to the SSL api of SSLeay/OpenSSL package \
> +so you can write servers or clients for more complicated applications."
> +HOMEPAGE = "http://search.cpan.org/dist/Net-SSLeay/"
> +SECTION = "libs"
> +
> +LICENSE = "OpenSSL"
> +LIC_FILES_CHKSUM = "file://README;beginline=274;endline=294;md5=49f415984b387be999ee2ad0e5c692fe"
> +
> +DEPENDS = "openssl zlib"
> +RDEPENDS_${PN} += "perl-module-carp \
> +                   perl-module-errno \
> +                   perl-module-extutils-makemaker \
> +                   perl-module-mime-base64 \
> +                   perl-module-socket \
> +                  "
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
> +           file://run-ptest \
> +          "
> +SRC_URI[md5sum] = "19600c036e9e0bbfbf9157f083e40755"
> +SRC_URI[sha256sum] = "2fb1371120b85f018944d95736c107163f04ba56b6029c0709a2c3d6247b9c06"
> +
> +S = "${WORKDIR}/Net-SSLeay-${PV}"
> +
> +inherit cpan ptest
> +
> +EXTRA_CPANFLAGS = "LIBS='-L=${libdir} -L=${base_libdir}' \
> +                   INC=-I=${includedir} \
> +                   'EXTRALIBS=-lssl -lcrypto -lz' \
> +                   'LDLOADLIBS=-lssl -lcrypto -lz' \
> +                  "
> +
> +do_install_ptest() {
> +    cp -r ${B}/t ${D}${PTEST_PATH}
> +}
> +
> +BBCLASSEXTEND = "native"
> +
> +FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Net/SSLeay/.debug/"
>

