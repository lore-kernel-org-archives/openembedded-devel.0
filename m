Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECEF77ECA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 02:28:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6Q2S3fT021747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jul 2019 19:28:19 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 25 Jul 2019 19:28:08 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D3A65EA.9090601@windriver.com>
Date: Fri, 26 Jul 2019 10:31:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libseccomp: import from meta-security
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
X-List-Received-Date: Fri, 26 Jul 2019 02:28:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年07月25日 21:45, Bruce Ashfield wrote:
> On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Can you share some details as to why this should be pulled from
> meta-security into a different repo ?

Considering there is also some security related recipe under 
meta-oe/recipes-security/, I think it's not strange to add a new one 
libseccomp and libseccomp also provides a basic common filtering mechanism.

Meanwhile, the below yocto compliance check error disappears once we
move libseccomp from meta-security to meta-oe.
ERROR: Nothing PROVIDES 'libseccomp' (but 
/buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-o_git.bb 
DEPENDS on or otherwise requires it).
Close matches:
libcomps
ERROR: Required build target 'meta-world-pkgdata' has no buildable 
providers.

Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 
'cri-o', 'libseccomp']

Thanks,

>
> It seems to fit the mandate of meta-security quite nicely ;)
>
> Is there some sort of dependency issue, or other technical problem
> that is causing a problem ?
>
> Bruce
>
>>
>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>> ---
>>   .../recipes-security/libseccomp/files/run-ptest    |  4 +++
>>   .../libseccomp/libseccomp_2.4.1.bb                 | 41 ++++++++++++++++++++++
>>   2 files changed, 45 insertions(+)
>>   create mode 100644 meta-oe/recipes-security/libseccomp/files/run-ptest
>>   create mode 100644 meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>>
>> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest b/meta-oe/recipes-security/libseccomp/files/run-ptest
>> new file mode 100644
>> index 0000000..54b4a63
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
>> @@ -0,0 +1,4 @@
>> +#!/bin/sh
>> +
>> +cd tests
>> +./regression -a
>> diff --git a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>> new file mode 100644
>> index 0000000..dba1be5
>> --- /dev/null
>> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
>> @@ -0,0 +1,41 @@
>> +SUMMARY = "interface to seccomp filtering mechanism"
>> +DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
>> +SECTION = "security"
>> +LICENSE = "LGPL-2.1"
>> +LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
>> +
>> +SRCREV = "fb43972ea1aab24f2a70193fb7445c2674f594e3"
>> +
>> +SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.4 \
>> +           file://run-ptest \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools-brokensep pkgconfig ptest
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[python] = "--enable-python, --disable-python, python"
>> +
>> +do_compile_ptest() {
>> +    oe_runmake -C tests check-build
>> +}
>> +
>> +do_install_ptest() {
>> +    install -d ${D}${PTEST_PATH}/tests
>> +    install -d ${D}${PTEST_PATH}/tools
>> +    for file in $(find tests/* -executable -type f); do
>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>> +    done
>> +    for file in $(find tests/*.tests -type f); do
>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
>> +    done
>> +    for file in $(find tools/* -executable -type f); do
>> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
>> +    done
>> +}
>> +
>> +FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
>> +FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
>> +
>> +RDEPENDS_${PN}-ptest = "bash"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

