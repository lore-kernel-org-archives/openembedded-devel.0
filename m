Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1CB065DB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:02:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E823oL006177
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:02:04 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 14 Aug 2014 01:02:03 -0700
Message-ID: <53EC6CFA.9050406@windriver.com>
Date: Thu, 14 Aug 2014 16:02:02 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
In-Reply-To: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
X-Originating-IP: [128.224.162.231]
Subject: Re: [meta-perl][PATCH 1/6] libdigest-sha1-perl: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 08:02:09 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

This series of commits is for layer *meta-perl*, and I add it in cover 
letter created by 'git send-email --compose', but it seems doesn't work.

Regards,
Kai



On 2014年08月14日 15:49, Kai Kang wrote:


> Add recipe for libdigest-sha1-perl and enable create -ptest sub-package.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta-perl/recipes-perl/libdigest/files/run-ptest   | 16 ++++++++++++++
>   .../libdigest/libdigest-sha1-perl_2.13.bb          | 25 ++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libdigest/files/run-ptest
>   create mode 100644 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
>
> diff --git a/meta-perl/recipes-perl/libdigest/files/run-ptest b/meta-perl/recipes-perl/libdigest/files/run-ptest
> new file mode 100644
> index 0000000..1c008b5
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libdigest/files/run-ptest
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +for case in `find t -type f -name '*.t'`; do
> +	perl $case >$case.output 2>&1
> +	ret=$?
> +	cat $case.output
> +	if [ $ret -ne 0 ]; then
> +		echo "FAIL: ${case%.t}"
> +	elif grep -i 'SKIP' $case.output; then
> +		echo "SKIP: ${case%.t}"
> +	else
> +		echo "PASS: ${case%.t}"
> +	fi
> +
> +	rm -f $case.output
> +done
> diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> new file mode 100644
> index 0000000..42d5875
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Perl interface to the SHA-1 algorithm "
> +DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
> +HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
> +SECTION = "libs"
> +
> +LICENSE = "Artistic-1.0|GPLv1+"
> +LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
> +           file://run-ptest \
> +          "
> +SRC_URI[md5sum] = "bd22388f268434f2b24f64e28bf1aa35"
> +SRC_URI[sha256sum] = "68c1dac2187421f0eb7abf71452a06f190181b8fc4b28ededf5b90296fb943cc"
> +
> +S = "${WORKDIR}/Digest-SHA1-${PV}"
> +
> +inherit cpan ptest
> +
> +do_install_ptest () {
> +       cp -r ${B}/t ${D}${PTEST_PATH}
> +}
> +
> +BBCLASSEXTEND="native"
> +
> +FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/Digest/SHA1/.debug/"


-- 
Regards,
Neil | Kai Kang


