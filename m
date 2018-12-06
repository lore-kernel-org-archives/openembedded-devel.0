Return-Path: <eduardas.m@fods.com>
Received: from pastas.balt.net (pastas.balt.net [217.117.28.48])
	by mail.openembedded.org (Postfix) with ESMTP id EABA4600BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 15:58:52 +0000 (UTC)
Received: from [192.168.4.82] (unknown [213.197.143.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: eduardas.m@fods.com)
	by pastas.balt.net (Postfix) with ESMTPSA id 0EB111BE1E;
	Thu,  6 Dec 2018 17:58:50 +0200 (EET)
To: Khem Raj <raj.khem@gmail.com>
References: <20181204141512.25927-1-eduardas.m@fods.com>
	<CAMKF1sphTtnuYGNFsWAPoeitakGJNxkt+ZzHGd6J8wOgG+DBJA@mail.gmail.com>
From: Eduardas Meile <eduardas.m@fods.com>
Message-ID: <65364b83-0f80-5aa4-8fc4-94fe7f703c4e@fods.com>
Date: Thu, 6 Dec 2018 17:58:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sphTtnuYGNFsWAPoeitakGJNxkt+ZzHGd6J8wOgG+DBJA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.4 at neptunas3.balt.net
X-Virus-Status: Clean
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH] mksh: add version 56
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
X-List-Received-Date: Thu, 06 Dec 2018 15:58:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I have made a second version of the patch after feedback on the mailing 
list:

http://lists.openembedded.org/pipermail/openembedded-devel/2018-December/197814.html

I honestly have no idea why the install step failed for you.

Just in case I have tested the second version of the recipe using the 
yoe-distro yoe/mut branch.

Build tested for raspberrypi3 using musl:

Build Configuration:
BB_VERSION = "1.40.0"
BUILD_SYS = "x86_64-linux"
NATIVELSBSTRING = "universal"
TARGET_SYS = "arm-yoe-linux-musleabi"
MACHINE = "raspberrypi3"
DISTRO = "yoe"
DISTRO_VERSION = "2.6"
TUNE_FEATURES = "arm armv7ve vfp thumb neon vfpv4 callconvention-hard 
cortexa7"
TARGET_FPU = "hard"
meta-yoe = "HEAD:32a5f0c16165a1115a9f7b502f50e69dc1e8484c"
meta-qcom = "HEAD:a38028357962542f80a3075b7ec2e089fcc5d321"
meta-raspberrypi = "HEAD:c8a05f2fcf17ca2556f8a56086ea36da2e777d0f"
meta-96boards = "HEAD:10af9ab9265184ae90e0b62e9de0594119159922"
meta-odroid
meta-odroid-extras = "HEAD:986b43faf572a69fa889f5688cef4562257fcd38"
meta-freescale = "HEAD:15a354ee592866a61a893562760ef84bf8fe5e4d"
meta-freescale-3rdparty = "HEAD:6e2ad96fce82bb7a12bba506ac15511752c4f007"
meta-riscv = "HEAD:9fa432afcf4a09340cf0a3511b95e2b2360aaf8b"
meta-ti = "HEAD:53f0eecf8729c79b664a134a74659c515cb39c7a"
meta-browser = "HEAD:d59e2ff84e293e062b5812b63e617a0c5c543127"
meta-rust = "HEAD:4c9068bd0913633eafe7188147988e21f52fe31a"
meta-qt5 = "HEAD:f22750291b224a3ee68456f0319ba18d428e197a"
meta-filesystems
meta-gnome
meta-initramfs
meta-multimedia
meta-networking
meta-oe
meta-perl
meta-python
meta-webserver
meta-xfce = "HEAD:ebc7b9e20ac22f6f2ad373621917f53e8a9af81c"
meta = "HEAD:9f5f4b31df01a29fd07ce27efc7534b4ea29a778"

I can see the compiled binary and configuration file packaged properly 
in the .ipk

Note that Docker was not used (DOCKER_REPO=none).

This was done on an x86_64 machine running Kubuntu 18.04


Also, if possible could you explain the role of yoe-distro in the 
process of testing

recipes with meta-openembedded? Is this integrated into the main autobuilder

that Yocto project uses and the Yocto project release process? I am just

assuming this from the error report page. Honestly, this is the first 
time I have heard

of the Yoe Distribution.

If yoe-distro is a good way to test a recipe, what would be the recommended

configurations to test with before submitting? Should I use the yoe/mut 
branch

or a Yocto release related branch to test? Could be useful in the future.


On 2018-12-05 00:59, Khem Raj wrote:
> Fails to build with musl - http://errors.yoctoproject.org/Errors/Details/203419/
> On Tue, Dec 4, 2018 at 6:16 AM Eduardas Meile <eduardas.m@fods.com> wrote:
>> The MirBSD Korn Shell is a permissively licensed shell currently used
>> by Android.
>>
>> Signed-off-by: Eduardas Meile <eduardas.m@fods.com>
>> ---
>>   meta-oe/recipes-shells/mksh/mksh_56.bb | 34 ++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 meta-oe/recipes-shells/mksh/mksh_56.bb
>>
>> diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-shells/mksh/mksh_56.bb
>> new file mode 100644
>> index 000000000..2ddcc6607
>> --- /dev/null
>> +++ b/meta-oe/recipes-shells/mksh/mksh_56.bb
>> @@ -0,0 +1,34 @@
>> +DESCRIPTION = "The MirBSD Korn Shell - an enhanced version of the public domain ksh"
>> +HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
>> +SECTION = "base/shell"
>> +
>> +LICENSE = "MirOS & ISC"
>> +LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=25;md5=7204fec4d12912f2a13fe8745bc356f9 \
>> +                    file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
>> +                   "
>> +
>> +SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz"
>> +
>> +SRC_URI[md5sum] = "4799a9ac6d55871d79ba66713d928663"
>> +SRC_URI[sha256sum] = "dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4cdab08ca135d02afb77"
>> +
>> +inherit autotools update-alternatives
>> +
>> +S = "${WORKDIR}/${PN}"
>> +
>> +ALTERNATIVE_${PN} = "sh"
>> +ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
>> +ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
>> +ALTERNATIVE_PRIORITY = "100"
>> +
>> +do_compile() {
>> +    chmod +x ${S}/Build.sh
>> +    ${S}/Build.sh
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}${base_bindir}
>> +    install -m 0755 ${S}/mksh ${D}${base_bindir}/mksh
>> +}
>> +
>> +RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

