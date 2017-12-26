Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDA260721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 01:44:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBQ1ivUq016934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 25 Dec 2017 17:44:57 -0800
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 25 Dec 2017 17:44:55 -0800
To: Derek Straka <derek@asterius.io>
References: <1509554484-22352-1-git-send-email-derek@asterius.io>
	<cd040284-bf17-756a-3243-a59ecd609ffd@windriver.com>
	<CADNbA1pBRxme+0BcWt8Mfx0L++SneTh4qXPggLBtFEqQiYNUhw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <116bf520-c8a6-cb3c-db77-6416fa23a329@windriver.com>
Date: Tue, 26 Dec 2017 09:46:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADNbA1pBRxme+0BcWt8Mfx0L++SneTh4qXPggLBtFEqQiYNUhw@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-automat: add an initial recipe for version 0.6.0
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
X-List-Received-Date: Tue, 26 Dec 2017 01:44:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2017 10:18 PM, Derek Straka wrote:
> Chen,
>
> Thanks for bringing this up.  Take a look here to see if this proposed 
> patchset fixes your issue: 
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/116094.html.
>
> -Derek
>

Derek,

Thanks!
Your patch works.

Best Regards,
Chen Qi

> On Fri, Dec 22, 2017 at 4:54 AM, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Hi Derek,
>
>     I noticed in Automat's setup.py script:
>
>         setup_requires=[
>             'setuptools-scm',
>             'm2r',
>         ],
>         install_requires=[
>             "attrs",
>             "six",
>         ],
>
>     Now the installed_requires entry is handled by the RDEPENDS meta
>     data in recipe.
>     How about the setup_requires entry? Do you know how to handle it
>     in recipe?
>
>     I'm asking this because when I build python-automat on my host, I
>     met do_compile error because of being able to download the m2r and
>     setuptools-scm.
>
>     Ideally, we should be able to compile a recipe out without
>     reaching out to the Internet, as long as the recipe's tarball is
>     available in the DL_DIR.
>
>     Best Regards,
>     Chen Qi
>
>
>     On 11/02/2017 12:41 AM, Derek Straka wrote:
>
>         Signed-off-by: Derek Straka <derek@asterius.io
>         <mailto:derek@asterius.io>>
>         ---
>           meta-python/recipes-devtools/python/python-automat.inc  | 16
>         ++++++++++++++++
>           .../recipes-devtools/python/python-automat_0.6.0.bb
>         <http://python-automat_0.6.0.bb>      | 2 ++
>           .../recipes-devtools/python/python3-automat_0.6.0.bb
>         <http://python3-automat_0.6.0.bb>     | 4 ++++
>           3 files changed, 22 insertions(+)
>           create mode 100644
>         meta-python/recipes-devtools/python/python-automat.inc
>           create mode 100644
>         meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>         <http://python-automat_0.6.0.bb>
>           create mode 100644
>         meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>         <http://python3-automat_0.6.0.bb>
>
>         diff --git
>         a/meta-python/recipes-devtools/python/python-automat.inc
>         b/meta-python/recipes-devtools/python/python-automat.inc
>         new file mode 100644
>         index 0000000..1ac5d3b
>         --- /dev/null
>         +++ b/meta-python/recipes-devtools/python/python-automat.inc
>         @@ -0,0 +1,16 @@
>         +DESCRIPTION = "Self-service finite-state machines for the
>         programmer on the go"
>         +HOMEPAGE = "https://github.com/glyph/Automat
>         <https://github.com/glyph/Automat>"
>         +LICENSE = "MIT"
>         +LIC_FILES_CHKSUM =
>         "file://LICENSE;md5=4ad213bcca81688e94593e5f60c87477"
>         +
>         +SRC_URI[md5sum] = "ad7bba58d262d8956d732330cb5ef53d"
>         +SRC_URI[sha256sum] =
>         "3c1fd04ecf08ac87b4dd3feae409542e9bf7827257097b2b6ed5692f69d6f6a8"
>         +
>         +PYPI_PACKAGE = "Automat"
>         +
>         +inherit pypi
>         +
>         +RDEPENDS_${PN} += "\
>         +   ${PYTHON_PN}-attrs \
>         +   ${PYTHON_PN}-six \
>         +"
>         diff --git
>         a/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>         <http://python-automat_0.6.0.bb>
>         b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>         <http://python-automat_0.6.0.bb>
>         new file mode 100644
>         index 0000000..8ac8c9c
>         --- /dev/null
>         +++
>         b/meta-python/recipes-devtools/python/python-automat_0.6.0.bb
>         <http://python-automat_0.6.0.bb>
>         @@ -0,0 +1,2 @@
>         +inherit setuptools
>         +require python-automat.inc
>         diff --git
>         a/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>         <http://python3-automat_0.6.0.bb>
>         b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>         <http://python3-automat_0.6.0.bb>
>         new file mode 100644
>         index 0000000..0469e61
>         --- /dev/null
>         +++
>         b/meta-python/recipes-devtools/python/python3-automat_0.6.0.bb
>         <http://python3-automat_0.6.0.bb>
>         @@ -0,0 +1,4 @@
>         +inherit setuptools3
>         +require python-automat.inc
>         +
>         +RDEPENDS_${PN} += "${PYTHON_PN}-enum "
>
>
>


