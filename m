Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD836CE8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 02:42:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G2gjPU006774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 19:42:45 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 19:42:44 -0700
Message-ID: <525DFD23.7060707@windriver.com>
Date: Wed, 16 Oct 2013 10:42:43 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Emil Petersen <erp@movis.dk>
References: <1378220304-12867-1-git-send-email-erp@movis.dk>
In-Reply-To: <1378220304-12867-1-git-send-email-erp@movis.dk>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libtest-perl_1.26: added
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
X-List-Received-Date: Wed, 16 Oct 2013 02:42:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2013 10:58 PM, Emil Petersen wrote:
> Test recipe added
>
> Signed-off-by: Emil Petersen <erp@movis.dk>
> ---
>   .../recipes-perl/libtest-perl/libtest-perl_1.26.bb  | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb
>
> diff --git a/meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb b/meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb
> new file mode 100644
> index 0000000..5596ffe
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libtest-perl/libtest-perl_1.26.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Test - provides a simple framework for writing test scripts"
> +AUTHOR = "Jesse Vincent <jesse+cpan@fsck.com>"
> +HOMEPAGE = "https://metacpan.org/module/Test"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;md5=82da57b253d95f830de58fae58c3af4e"
> +
> +RDEPEND_${PN} = "libfile-spec-perl \

Which recipe provides libfile-spec-perl?

//Hongxu

> +                 libtest-harness-perl \
> +                "
> +
> +SRC_URI = "http://cpan.metacpan.org/authors/id/J/JE/JESSE/Test-${PV}.tar.gz"
> +SRC_URI[md5sum] = "6ec6583c34be3770edd466876546fb50"
> +SRC_URI[sha256sum] = "f7701bd28e05e7f82fe9a181bbab38f53fa6aeae48d2a810da74d1b981d4f392"
> +
> +S = "${WORKDIR}/Test-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
> +


