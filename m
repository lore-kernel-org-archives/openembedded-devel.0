Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 053D776512
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 00:27:10 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so33134817pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 17:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=yxxbSVbLRruJ2dmGdGVOnDxyZH8fras98Ew72w218Lw=;
	b=Xr2CKjDEpWBEq4KOvepKzpkEuoxbiEJXybvR77vmXxyPm3PK27bb4W4y1mOl2fOfq8
	xqSo+HWNHc5rBKlSpa369VUtzKlMU52bwGH2sxgnulrTItz9vLLbVz+i34fKAaSasgd+
	JEovbh5jc++ILDIy7utPAULwgUmzFo1gVMzgp8e6iAT1BifZy6gXOkLqCjc3owY3NmwO
	I7gqQogbfz9EFvWNIUN370lNsJlsQczG6RRbhsptQlImIMDw96b3ToEEUruFjvVkVuZN
	pFXhOoljAjXWIM6QFeoatyRyQruwdasDiUkVCnmnQqsBHzaD2s6Tj9URGepQ7Mi28KCF
	C59w==
X-Received: by 10.70.108.137 with SMTP id hk9mr112379762pdb.105.1438302430829; 
	Thu, 30 Jul 2015 17:27:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:911d:7f67:c8fa:6339?
	([2601:202:4000:1239:911d:7f67:c8fa:6339])
	by smtp.googlemail.com with ESMTPSA id
	fu2sm4196059pdb.32.2015.07.30.17.27.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 17:27:09 -0700 (PDT)
Message-ID: <55BAC0CE.4030101@gmail.com>
Date: Thu, 30 Jul 2015 17:26:54 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1437620893-8149-1-git-send-email-akuster808@gmail.com>
	<20150729145808.GB12478@jama>
In-Reply-To: <20150729145808.GB12478@jama>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [meta-networking][PATCH] netmap: add new package
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
X-List-Received-Date: Fri, 31 Jul 2015 00:27:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Martin,


On 07/29/2015 07:58 AM, Martin Jansa wrote:
> On Wed, Jul 22, 2015 at 08:08:13PM -0700, Armin Kuster wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> this adds netmap, the fast packet I/O framework
>> http://info.iet.unipi.it/~luigi/netmap/
>
> Fails to build on jenkins log in:
> http://errors.yoctoproject.org/Errors/Build/7660/
>

I have a lame typo in the configure parameter that my local build didn't 
show. As I try this on other arch's it is barfing in other areas.

I am going to traveling for the next two weeks so you can remove this or 
black list it until I can resolve the issues. I do hate cause you more work.

my apologizes,
Armin
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   .../recipes-kernel/netmap/netmap-modules_git.bb    | 33 ++++++++++++++++++++++
>>   meta-networking/recipes-kernel/netmap/netmap.inc   | 14 +++++++++
>>   .../recipes-kernel/netmap/netmap_git.bb            | 32 +++++++++++++++++++++
>>   3 files changed, 79 insertions(+)
>>   create mode 100644 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>   create mode 100644 meta-networking/recipes-kernel/netmap/netmap.inc
>>   create mode 100644 meta-networking/recipes-kernel/netmap/netmap_git.bb
>>
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> new file mode 100644
>> index 0000000..63ca50f
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> @@ -0,0 +1,33 @@
>> +require netmap.inc
>> +
>> +DEPENDS = "virtual/kernel"
>> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
>> +
>> +inherit module
>> +
>> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
>> +
>> +CLEANBROKEN = "1"
>> +
>> +export INSTALL_MOD_DIR="kernel/netmap-modules"
>> +
>> +EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>> +                --kernel-sources=${STAGING_KERNEL_DIR} \
>> +                --install-mod-path=${D} \
>> +                --driver-suffix="-netmap" \
>> +                "
>> +
>> +do_configure () {
>> +    cd ${S}/LINUX
>> +    ./configure ${EXTRA_OECONF}
>> +}
>> +
>> +do_compile () {
>> +    cd ${S}/LINUX
>> +    make
>> +}
>> +
>> +do_install () {
>> +    cd ${S}/LINUX
>> +    oe_runmake install
>> +}
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-networking/recipes-kernel/netmap/netmap.inc
>> new file mode 100644
>> index 0000000..4a101a1
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
>> @@ -0,0 +1,14 @@
>> +SUMMARY = "netmap and VALE - very fast packet I/O from userspace (FreeBSD/Linux)"
>> +DESCRIPTION= "NETMAP is a framework for very fast packet I/O from userspace.  VALE is an equally fast in-kernel software switch using the netmap API.  Both are implemented as a single kernel module for FreeBSD and Linux, and can deal with line rate on real or emulated 10 Gbit ports."
>> +SECTION = "networking"
>> +HOMEPAGE = "http://code.google.com/p/netmap/"
>> +LICENSE = "GPLv2+"
>> +
>> +LIC_FILES_CHKSUM = "file://README;beginline=13;endline=14;md5=f64f2b172fe6903ff7b6272c6edde588"
>> +
>> +SRCREV = "a14a35b839fe7ab6855f25f1e86e306ee7ad8123"
>> +PV = "master+git${SRCPV}"
>> +
>> +SRC_URI = "git://github.com/luigirizzo/netmap.git"
>> +
>> +S = "${WORKDIR}/git"
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>> new file mode 100644
>> index 0000000..da80bad
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>> @@ -0,0 +1,32 @@
>> +require netmap.inc
>> +
>> +DEPENDS = "netmap-modules"
>> +
>> +EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
>> +                --kernel-sources=${STAGING_KERNEL_DIR} \
>> +                --install-mod-path=${D} \
>> +                --no-drivers \
>> +                --prefix=${prefix} \
>> +                --destir=${D} \
>> +                --cc='${CC}' \
>> +                --ld='${LD}' \
>> +                "
>> +
>> +do_configure () {
>> +    cd ${S}/LINUX
>> +    ./configure ${EXTRA_OECONF}
>> +}
>> +
>> +do_compile () {
>> +    cd ${S}/LINUX
>> +    make  apps
>> +}
>> +
>> +do_install () {
>> +    cd ${S}/LINUX
>> +    make install-apps DESTDIR=${D}
>> +}
>> +
>> +FILES_${PN} += "${bindir}"
>> +RDEPENDS_${PN} = "kernel-module-netmap"
>> +RRECOMMENDS_${PN} = "kernel-module-netmap"
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

