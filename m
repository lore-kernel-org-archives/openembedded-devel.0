Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1D97870E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 00:24:45 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l4so5530530pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 16:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=cHD05pgwdVa5JPNTYjJTsR64NfouWtLQ4EPxtYfXhlI=;
	b=kKM1JE9SVDjVDE8R7HerGx9GY16gd+vRaH8/5THgIpNIcpEQmkvwZB7A8PM0n5fz5j
	1FN2fVgwiRncfqFGb13qmRN9D4YjUlMszI/cQtaWI4El5h3eHqM7qu8tZCrg3qDiuz6N
	lrNB34UNUsXBCJ5lDl1ZlwSdcXMy4R79Qil0YVhHfOXBr0EdxfNQSRdgJB3wulWbIGW3
	294gpYD7e0K2CPDPl/51KYCcx4Uc4M7aSoShED3VszrndILy5zfQ/3OUB8v5uFo2dB5R
	eTaFeEhq1TP2/Wzf1dXufnXm9RZc2kwmfdMUQw6Rs/ZnViHkok0rLeMcX3zSOeylDQtt
	e97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=cHD05pgwdVa5JPNTYjJTsR64NfouWtLQ4EPxtYfXhlI=;
	b=ELUJu3dwxaZyPGrfJXL/X2d793XcsQK+2aI4jzvI3O4Y/MUQkGvqGrm2vFUm4oCbq6
	ID0/QvQDvQ3U8WkUg4CvRmPq48y/mgBx2AHKF04ywDY2bCc43Ak/9890aUgQXPYdY++H
	AbxsJrLkOacKNuz0GSnxykOyyBoQMdCo8Ww9X4G9s0XEUjOvBuurBbe7NS72Slb5Ghnq
	oRtK/PEXDJMTiqrwIM4SH4um7suMZTnJvR6Cw38FIfftN0ffIYqVLoaKDbhehnMVdEiX
	JODXfDDWpvgci214nWMqwWaH+/9ZMV+SgCQlmvX0+R5ALzNLSXv6Wc1aalojPy0YCmKz
	Bsww==
X-Gm-Message-State: APf1xPDy3NdNqxLJVE8RBEpNlu2hAESBLe/tBPWUqppUeDsLWi4uX9Yp
	vUM5ZTu1WEKMGw+LNhuiWSHrQQ==
X-Google-Smtp-Source: AH8x227i7MvoN2OQGljMhLVTmrloHQO9wHJkT2Tn1XfmuN9HjoGGshnplmt1F5W6IplbPm9jtIiJWA==
X-Received: by 10.98.87.29 with SMTP id l29mr8695570pfb.72.1519604686566;
	Sun, 25 Feb 2018 16:24:46 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:ad95:2a34:2e02:2fdf?
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	g16sm15527006pfd.23.2018.02.25.16.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Feb 2018 16:24:45 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20180224105155.14511-1-Martin.Jansa@gmail.com>
	<CAMKF1sqdzo=5r752eUngyj96bConSJ2jfjD2TehBNxQsnR33Bw@mail.gmail.com>
	<CA+chaQd-YthWJ7K6s04=L8ZqtpJihfqt7QZmvjNOSDmbcQVQig@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <feaaa44d-304d-51f0-d4e4-cbb69683863b@gmail.com>
Date: Sun, 25 Feb 2018 16:24:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQd-YthWJ7K6s04=L8ZqtpJihfqt7QZmvjNOSDmbcQVQig@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: upgrade to 5.2.6
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
X-List-Received-Date: Mon, 26 Feb 2018 00:24:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 02/24/2018 08:28 AM, Martin Jansa wrote:
> Yes we can or we can wait for next vbox release which will hopefully
> include support for 4.15 as suggested in Upstream-Status.
>
> On Sat, Feb 24, 2018 at 4:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sat, Feb 24, 2018 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>> * 5.1.26 doesn't build with 4.15 kernel
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  .../linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff | 90

this fails on 4.14 kernel.

vbox_module/vboxguest/VBoxGuest-linux.c:1173:35: error: passing argument
1 of '__check_old_set_param' from incompatible pointer type
[-Werror=incompatible-pointer-types]
|  module_param_call(r3_log_to_host, vgdrvLinuxParamR3LogToHostSet,
vgdrvLinuxParamR3LogToHostGet, NULL, 0664);
|                                    ^

>> ++++++++++++++++++++++
>>>  ...drivers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} | 22 ++++--
>>>  2 files changed, 107 insertions(+), 5 deletions(-)
>>>  create mode 100644 meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
>>>  rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdri
>> vers_5.1.26.bb => vboxguestdrivers_5.2.6.bb} (69%)
>>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
>> b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-
>> rc8-VBoxGuestAdditions-amd64.diff
>>> new file mode 100644
>>> index 0000000000..23a9021f04
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
>>> @@ -0,0 +1,90 @@
>>> +Based on:
>>> +https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-
>> 4.15.0-rc8-VBoxGuestAdditions-amd64.diff
>>> +
>>> +Upstream-Status: Pending (hopefully new vbox will be released soon with
>> proper 4.15 support, this patch isn't backwards compatible)
>>> +
>>
>> can we use something like
>>
>> #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
>>
>> to guard this code so it works with older kernels too
>>
>>> +--- vbox_module.orig/vboxvideo/vbox_mode.c     2018-02-18
>> 16:42:47.000000000 +0000
>>> ++++ vbox_module/vboxvideo/vbox_mode.c  2018-02-18 16:55:14.466029313
>> +0000
>>> +@@ -396,7 +396,7 @@
>>> +
>>> +       /* pick the encoder ids */
>>> +       if (enc_id)
>>> +-              return drm_encoder_find(connector->dev, enc_id);
>>> ++              return drm_encoder_find(connector->dev, NULL, enc_id);
>>> +
>>> +       return NULL;
>>> + }
>>> +--- vbox_module.orig/vboxguest/VBoxGuest-linux.c       2018-02-18
>> 16:42:28.000000000 +0000
>>> ++++ vbox_module/vboxguest/VBoxGuest-linux.c    2018-02-18
>> 16:54:36.793049118 +0000
>>> +@@ -1058,7 +1058,7 @@
>>> + #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
>>> +
>>> + /** log and dbg_log parameter setter. */
>>> +-static int vgdrvLinuxParamLogGrpSet(const char *pszValue, struct
>> kernel_param *pParam)
>>> ++static int vgdrvLinuxParamLogGrpSet(const char *pszValue, const struct
>> kernel_param *pParam)
>>> + {
>>> +     if (g_fLoggerCreated)
>>> +     {
>>> +@@ -1073,7 +1073,7 @@
>>> + }
>>> +
>>> + /** log and dbg_log parameter getter. */
>>> +-static int vgdrvLinuxParamLogGrpGet(char *pszBuf, struct kernel_param
>> *pParam)
>>> ++static int vgdrvLinuxParamLogGrpGet(char *pszBuf, const struct
>> kernel_param *pParam)
>>> + {
>>> +     PRTLOGGER pLogger = pParam->name[0] == 'd' ?
>> RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
>>> +     *pszBuf = '\0';
>>> +@@ -1084,7 +1084,7 @@
>>> +
>>> +
>>> + /** log and dbg_log_flags parameter setter. */
>>> +-static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, struct
>> kernel_param *pParam)
>>> ++static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, const
>> struct kernel_param *pParam)
>>> + {
>>> +     if (g_fLoggerCreated)
>>> +     {
>>> +@@ -1098,7 +1098,7 @@
>>> + }
>>> +
>>> + /** log and dbg_log_flags parameter getter. */
>>> +-static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, struct
>> kernel_param *pParam)
>>> ++static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, const struct
>> kernel_param *pParam)
>>> + {
>>> +     PRTLOGGER pLogger = pParam->name[0] == 'd' ?
>> RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
>>> +     *pszBuf = '\0';
>>> +@@ -1109,7 +1109,7 @@
>>> +
>>> +
>>> + /** log and dbg_log_dest parameter setter. */
>>> +-static int vgdrvLinuxParamLogDstSet(const char *pszValue, struct
>> kernel_param *pParam)
>>> ++static int vgdrvLinuxParamLogDstSet(const char *pszValue, const struct
>> kernel_param *pParam)
>>> + {
>>> +     if (g_fLoggerCreated)
>>> +     {
>>> +@@ -1123,7 +1123,7 @@
>>> + }
>>> +
>>> + /** log and dbg_log_dest parameter getter. */
>>> +-static int vgdrvLinuxParamLogDstGet(char *pszBuf, struct kernel_param
>> *pParam)
>>> ++static int vgdrvLinuxParamLogDstGet(char *pszBuf, const struct
>> kernel_param *pParam)
>>> + {
>>> +     PRTLOGGER pLogger = pParam->name[0] == 'd' ?
>> RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
>>> +     *pszBuf = '\0';
>>> +@@ -1134,7 +1134,7 @@
>>> +
>>> +
>>> + /** r3_log_to_host parameter setter. */
>>> +-static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, struct
>> kernel_param *pParam)
>>> ++static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, const
>> struct kernel_param *pParam)
>>> + {
>>> +     if (    pszValue == NULL
>>> +         || *pszValue == '\0'
>>> +@@ -1152,7 +1152,7 @@
>>> + }
>>> +
>>> + /** r3_log_to_host parameter getter. */
>>> +-static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, struct
>> kernel_param *pParam)
>>> ++static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, const struct
>> kernel_param *pParam)
>>> + {
>>> +     strcpy(pszBuf, g_DevExt.fLoggingEnabled ? "enabled" : "disabled");
>>> +     return strlen(pszBuf);
>>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.1.26.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.2.6.bb
>>> similarity index 69%
>>> rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.1.26.bb
>>> rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.2.6.bb
>>> index fdefe03172..c018b789f2 100644
>>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.1.26.bb
>>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
>>> @@ -12,22 +12,27 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
>>>  VBOX_NAME = "VirtualBox-${PV}"
>>>
>>>  SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_
>> NAME}.tar.bz2 \
>>> -           file://Makefile.utils \
>>> +    file://Makefile.utils \
>>>  "
>>> -SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
>>> -SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d
>> 34a00f0276b89c572eebec363dda80c8a9"
>>> +
>>> +# For default linux-yocto 4.15
>>> +SRC_URI += "file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff"
>>> +
>>> +SRC_URI[md5sum] = "4490d6929dfae41cdf05e34f583318c8"
>>> +SRC_URI[sha256sum] = "fe705288ee50efcce10ff4c80e461a
>> 1c7091e461a7b55f98842fa1c9772ca4e7"
>>>  S = "${WORKDIR}/vbox_module"
>>>
>>>  export BUILD_TARGET_ARCH="${ARCH}"
>>>  export BUILD_TARGET_ARCH_x86-64="amd64"
>>> -export KERN_DIR="${STAGING_KERNEL_DIR}"
>>> +
>>> +EXTRA_OEMAKE += "KERN_DIR='${WORKDIR}/${KERNEL_VERSION}/build'"
>>>
>>>  addtask export_sources before do_patch after do_unpack
>>>
>>>  do_export_sources() {
>>>      mkdir -p "${S}"
>>> -    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules
>> ${T}/vbox_modules.tar.gz
>>> +    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules.sh
>> ${T}/vbox_modules.tar.gz
>>>      tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
>>>
>>>      # add a mount utility to use shared folder from VBox Addition
>> Source Code
>>> @@ -38,6 +43,13 @@ do_export_sources() {
>>>
>>>  }
>>>
>>> +do_configure_prepend() {
>>> +    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:99:
>> *** The variable KERN_DIR must be a kernel build folder and end with /build
>> without a trailing slash, or KERN_VER must be set.  Stop.
>>> +    # vboxguestdrivers/5.2.6-r0/vbox_module/vboxguest/Makefile.include.header:108:
>> *** The kernel build folder path must end in <version>/build, or the
>> variable KERN_VER must be set.  Stop.
>>> +    mkdir -p ${WORKDIR}/${KERNEL_VERSION}
>>> +    ln -snf ${STAGING_KERNEL_DIR} ${WORKDIR}/${KERNEL_VERSION}/build
>>> +}
>>> +
>>>  # compile and install mount utility
>>>  do_compile_append() {
>>>      oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
>>> --
>>> 2.15.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


