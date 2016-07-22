Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC45D60290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2016 02:34:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6M2YwD8007945
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:34:58 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 21 Jul 2016 19:34:57 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1468893439-29598-1-git-send-email-mingli.yu@windriver.com>
	<20160721111416.6xtpu574dgaavsbx@jama>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <579185C8.4080204@windriver.com>
Date: Fri, 22 Jul 2016 10:32:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160721111416.6xtpu574dgaavsbx@jama>
X-Originating-IP: [128.224.163.140]
Subject: Re: [meta-oe][PATCH V2] grubby: add grubby 8.40-1
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
X-List-Received-Date: Fri, 22 Jul 2016 02:34:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年07月21日 19:14, Martin Jansa wrote:
> On Tue, Jul 19, 2016 at 09:57:19AM +0800, mingli.yu@windriver.com wrote:
>> * Add grubby bb
>> * Rename grub2-editenv to grub-editenv as
>>    we don't use the name grub2-editenv for grub2
>> * Add ptest support
>> * Update #!/bin/bash to #!/bin/sh in test.sh to remove
>>    bashisms
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../grubby/grubby-remove-bashisms-in-test.sh.patch | 29 +++++++++
>>   ...ubby-rename-grub2-editenv-to-grub-editenv.patch | 69 ++++++++++++++++++++++
>>   meta-oe/recipes-support/grubby/grubby/run-ptest    |  3 +
>>   meta-oe/recipes-support/grubby/grubby_8.40.bb      | 38 ++++++++++++
>>   4 files changed, 139 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
>>   create mode 100644 meta-oe/recipes-support/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
>>   create mode 100644 meta-oe/recipes-support/grubby/grubby/run-ptest
>>   create mode 100644 meta-oe/recipes-support/grubby/grubby_8.40.bb
>>
>> diff --git a/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch b/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
>> new file mode 100644
>> index 0000000..6734e7f
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/grubby/grubby/grubby-remove-bashisms-in-test.sh.patch
>> @@ -0,0 +1,29 @@
>> +From c3a004b8d6dff1a767573dd7baf5d45efddb9f2b Mon Sep 17 00:00:00 2001
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Fri, 15 Jul 2016 11:23:17 +0800
>> +Subject: [PATCH] grubby: remove bashisms in test.sh
>> +
>> +* Update #!/bin/bash to #!/bin/sh in test.sh to
>> +  remove below warning:
>> +  QA Issue: /usr/lib/grubby/ptest/test.sh contained
>> +  in package grubby-ptest requires /bin/bash, but no
>> +  providers found in RDEPENDS_grubby-ptest? [file-rdeps]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test.sh | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/test.sh b/test.sh
>> +index f738388..f3537f3 100755
>> +--- a/test.sh
>> ++++ b/test.sh
>> +@@ -1,4 +1,4 @@
>> +-#!/bin/bash
>> ++#!/bin/sh
>> + #
>> + # test.sh -- grubby regression tests
>> + #
>> +--
>> +2.8.1
>> +
>> diff --git a/meta-oe/recipes-support/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch b/meta-oe/recipes-support/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
>> new file mode 100644
>> index 0000000..d936249
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/grubby/grubby/grubby-rename-grub2-editenv-to-grub-editenv.patch
>> @@ -0,0 +1,69 @@
>> +From 0841706a5b5280e501c8e392c70c466c5fbcf0aa Mon Sep 17 00:00:00 2001
>> +From: Jackie Huang <jackie.huang@windriver.com>
>> +Date: Tue, 4 Aug 2015 23:54:41 -0700
>> +Subject: [PATCH] rename grub2-editenv to grub-editenv
>> +
>> +We don't use the name grub2-editenv for grub2.
>> +
>> +Upstream-Status: Inappropriate
>> +
>> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> +---
>> + grubby.c | 4 ++--
>> + test.sh  | 6 +++---
>> + 2 files changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/grubby.c b/grubby.c
>> +index d4ebb86..47a1a15 100644
>> +--- a/grubby.c
>> ++++ b/grubby.c
>> +@@ -290,7 +290,7 @@ static char *grub2GetEnv(struct configFileInfo *info, char *name)
>> +     char *s = NULL;
>> +     char *ret = NULL;
>> +     char *envFile = info->envFile ? info->envFile : "/boot/grub2/grubenv";
>> +-    int rc = asprintf(&s, "grub2-editenv %s list | grep '^%s='", envFile, name);
>> ++    int rc = asprintf(&s, "grub-editenv %s list | grep '^%s='", envFile, name);
>> +
>> +     if (rc < 0)
>> + 	return NULL;
>> +@@ -361,7 +361,7 @@ static int grub2SetEnv(struct configFileInfo *info, char *name, char *value)
>> +     if (!value)
>> + 	    return -1;
>> +
>> +-    rc = asprintf(&s, "grub2-editenv %s set '%s=%s'", envFile, name, value);
>> ++    rc = asprintf(&s, "grub-editenv %s set '%s=%s'", envFile, name, value);
>> +     free(value);
>> +     if (rc <0)
>> + 	return -1;
>> +diff --git a/test.sh b/test.sh
>> +index 6379698..f738388 100755
>> +--- a/test.sh
>> ++++ b/test.sh
>> +@@ -574,7 +574,7 @@ if [ "$testgrub2" == "y" ]; then
>> +         --title='title' --initrd=/boot/new-initrd --boot-filesystem=/boot/ \
>> +         --copy-default
>> +     commandTest "saved_default output" \
>> +-        "grub2-editenv test/grub2-support_files/env_temp list" \
>> ++        "grub-editenv test/grub2-support_files/env_temp list" \
>> +         "saved_entry=Linux, with Fedora 2.6.38.8-32.fc15.x86_64"
>> +
>> +     testing="GRUB2 add kernel with default=saved_entry and a terrible title"
>> +@@ -587,13 +587,13 @@ if [ "$testgrub2" == "y" ]; then
>> +     testing="GRUB2 set default with default=saved_entry and a terrible name"
>> +     grub2Test grub2.9 add/g2-1.9 --env grubenv.1 --set-default-index=0
>> +     commandTest "saved_default output" \
>> +-        "grub2-editenv test/grub2-support_files/env_temp list" \
>> ++        "grub-editenv test/grub2-support_files/env_temp list" \
>> +         'saved_entry=Fedora (3.10.3-300.fc19.x86_64) 19 (Schrödinger’s Cat)'
>> +
>> +     testing="GRUB2 set default with default=saved_entry"
>> +     grub2Test grub2.8 add/g2-1.8 --env grubenv.1 --set-default-index=0
>> +     commandTest "saved_default output" \
>> +-        "grub2-editenv test/grub2-support_files/env_temp list" \
>> ++        "grub-editenv test/grub2-support_files/env_temp list" \
>> +         "saved_entry=title"
>> +
>> +     testing="GRUB2 --default-index with default=saved_entry"
>> +--
>> +2.3.5
>> +
>> diff --git a/meta-oe/recipes-support/grubby/grubby/run-ptest b/meta-oe/recipes-support/grubby/grubby/run-ptest
>> new file mode 100644
>> index 0000000..b06ac59
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/grubby/grubby/run-ptest
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +./test.sh -v
>> diff --git a/meta-oe/recipes-support/grubby/grubby_8.40.bb b/meta-oe/recipes-support/grubby/grubby_8.40.bb
>> new file mode 100644
>> index 0000000..dc6cc62
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/grubby/grubby_8.40.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY = "A command line tool for updating and displaying info about boot loaders"
>> +DESCRIPTION = "grubby is a command line tool for updating and displaying information \
>> +about the configuration files for the grub, lilo, elilo (ia64), yaboot (powerpc) and \
>> +zipl (s390) boot loaders. It is primarily designed to be used from scripts which install \
>> +new kernels and need to find information about the current boot environment. \
>> +"
>> +LICENSE = "GPLv2+"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
>> +
>> +DEPENDS = "popt util-linux"
>> +
>> +SRC_URI = "https://github.com/rhinstaller/${BPN}/archive/${PV}-1.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
>> +           file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
>> +           file://run-ptest \
>> +           file://grubby-remove-bashisms-in-test.sh.patch \
>> +"
>> +
>> +SRC_URI[md5sum] = "1005907b275d6d93368d045274537d86"
>> +SRC_URI[sha256sum] = "85f1c678484f74c8978e8643451594967defce463a86c35cb1ee56d12767a9df"
>> +
>> +S = "${WORKDIR}/${BPN}-${PV}-1"
>> +
>> +RDEPENDS_${PN} += "dracut"
>
> dracut is in meta-initramfs and meta-oe doesn't depend on
> meta-initramfs, can you make this runtime dependency optional or just
> move whole recipe to meta-initramfs?
Thanks! Have already moved grubby to meta-initramfs in V3 version.

Thanks,
Grace
>
>> +inherit autotools-brokensep ptest
>> +
>> +EXTRA_OEMAKE = "'CC=${CC}'"
>> +
>> +do_install_ptest() {
>> +	install -d ${D}${PTEST_PATH}
>> +	cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
>> +	sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
>> +}
>> +
>> +RDEPENDS_${PN}-ptest = "util-linux-getopt"
>> +
>> +COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

