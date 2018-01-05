Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 133F078072
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 08:37:43 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b141so1048631wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jan 2018 00:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wFFzV4vcSA4pSYWsZrvFN1RPhMJcH2kv3WaUZauBDEQ=;
	b=jMrevowQ4AE2flf0YQenJb4eMcixVnOCqhDIDqc9bEaZxJxw1tHtYpnu8BbCWjZjN2
	IY9bf0JwjtA/4L8I90IxbsR6ybCAxeZi4vXA0LBtg5Oa7fgejYFg2KTS6WjcdWp6js6h
	h1d2ZQjR3QjCvxcvPd7awo5WToZznGuDNtba/uuXiuiGaMT/GKzXq421R157/LQTygcE
	2heGR0DFIf361HAXSq45783GEKaxtYe0sB+MKtFnsySFf7DSjQTPIsGu6QBOIBVztX0X
	uzBQa8CnZTjEoIpWDr+1J8FaDUTVmA0zZNbJUNa38LmB4RX9wlai7jy9Jd4MpdIltbyC
	lYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wFFzV4vcSA4pSYWsZrvFN1RPhMJcH2kv3WaUZauBDEQ=;
	b=V06d40YkG8A5eY3T85kYGebGNZzbvn0YlFPFHNzM2bQcFXtoKne4yjfhBeBUGv28lc
	F19fKpLsJAruKIuqtnn3QkebDX5yONHvJqP4p2DK4hae3HLTpixtoGARdBvKcZEGJLGk
	5SUAPmCdWdl3tvBo1QyaftGp0p/AAow9qtBMRdvzsl61+pFUl4yjB/v9BIGSqXnoD+P7
	J7cEHWUjmtrXVB1GgaFyaE7B+PJRuKcQndU4ZTrlPvo6NCg7/abXfjrdKGPCIoXsChr1
	msqR1ZRwyMzlLbFlCWgl/sCDK46Wz537kyGB6V9U1I3bjRxNGJQDQ/qx2uAeXSYtu8JX
	O9ow==
X-Gm-Message-State: AKGB3mKOaexqVcEwrtEzyPmczyaUoG5Tf3fxSqpk3mW1JUt44gGR7zPG
	toJpnVLtIjj1TTDlyK/skeJMN0P4ZnqhJmk3FBQ=
X-Google-Smtp-Source: ACJfBou2HZi8XnWHLA4/F4U93hqQbcgQVyiQAMLKI2TX2rrQy/HQ5BzptW0PwgVaDD47FLMCTafdXeWoDpbv2Yi5iyo=
X-Received: by 10.80.154.196 with SMTP id p62mr3129176edb.278.1515141464760;
	Fri, 05 Jan 2018 00:37:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.178.38 with HTTP; Fri, 5 Jan 2018 00:37:44 -0800 (PST)
In-Reply-To: <BY2PR02MB347D87A57F9309E4A17F533B91F0@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1515087122-23570-1-git-send-email-akuster808@gmail.com>
	<BY2PR02MB347D87A57F9309E4A17F533B91F0@BY2PR02MB347.namprd02.prod.outlook.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 5 Jan 2018 09:37:44 +0100
Message-ID: <CAAQYJAuvJVe4-2Yb_J7X+PZ9QvZ5W5p5r=L64EHpfZGbzQfEFQ@mail.gmail.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Cc: "akuster@mvista.com" <akuster@mvista.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexec-tools-klibc: update to fix build issues after core changes.
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
X-List-Received-Date: Fri, 05 Jan 2018 08:37:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 4, 2018 at 11:28 PM, Manjukumar Harthikote Matha
<MANJUKUM@xilinx.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Armin Kuster
>> Sent: Thursday, January 04, 2018 9:32 AM
>> To: akuster@mvista.com; openembedded-devel@lists.openembedded.org
>> Subject: [oe] [meta-initramfs][PATCH] kexec-tools-klibc: update to fix build issues
>> after core changes.
>>
>> Parsing recipes...ERROR: ParseError at ../meta-initramfs/recipes-
>> kernel/kexec/kexec-tools-klibc_2.0.2.bb:2: Could not include required file recipes-
>> kernel/kexec/kexec-tools.inc
>>
>> This was introduced by:
>> http://cgit.openembedded.org/openembedded-
>> core/commit/?id=491f6d523b72b91dc7b186a6f273756435804581
>>
>> removed the kexec-tools.inc so place those changes into the recipe.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> Tested-by: Jaewon Lee <jaewon.lee@xilinx.com>
> Acked-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
>
> Thanks,
> Manju
>
>
>> ---
>>  .../kexec/kexec-tools-klibc_2.0.2.bb               | 33 +++++++++++++++++++---
>>  1 file changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-
>> initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
>> index 49c53a3..1c37531 100644
>> --- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
>> +++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
>> @@ -1,10 +1,16 @@
>>  # the binaries are statically linked against klibc -require recipes-kernel/kexec/kexec-
>> tools.inc
>>  SUMMARY = "Kexec tools, statically compiled against klibc"
>> -SRC_URI[md5sum] = "92eff93b097475b7767f8c98df84408a"
>> -SRC_URI[sha256sum] =
>> "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
>> +AUTHOR = "Eric Biederman"
>> +HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
>> +SECTION = "kernel/userland"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
>> +
>> file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687a
>> d3e09"
>> +DEPENDS = "zlib xz"
>>
>> -inherit klibc
>> +PR = "r1"
>> +
>> +inherit klibc autotools
>>
>>  FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
>>
>> @@ -35,7 +41,26 @@ EXTRA_OECONF += "--without-zlib --without-lzma --
>> without-xen"
>>  CFLAGS += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -
>> I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
>>  CFLAGS_x86-64 += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -
>> I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
>>
>> +do_compile_prepend() {
>> +    # Remove the prepackaged config.h from the source tree as it overrides
>> +    # the same file generated by configure and placed in the build tree
>> +    rm -f ${S}/include/config.h
>> +
>> +    # Remove the '*.d' file to make sure the recompile is OK
>> +    for dep in `find ${B} -type f -name '*.d'`; do
>> +        dep_no_d="`echo $dep | sed 's#.d$##'`"
>> +        # Remove file.d when there is a file.o
>> +        if [ -f "$dep_no_d.o" ]; then
>> +            rm -f $dep
>> +        fi
>> +    done
>> +}
>> +
>>  PACKAGES =+ "kexec-klibc kdump-klibc"
>>
>>  FILES_kexec-klibc = "${sbindir}/kexec"
>>  FILES_kdump-klibc = "${sbindir}/kdump"
>> +
>> +INSANE_SKIP_${PN} = "arch"
>> +
>> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-
>> (linux|freebsd.*)'
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Thanks for fixing the parsing error!
There is now the open issue " configure: error: unsupported
architecture aarch64 ".

I could not yet work on meta-initramfs fixes but I hope to be able to
update both failing recipes soon (kexec-tools-klibc and
ubi-utils-klibc).
Otherwise I'll have to mask out aarch64 (or even restrict both recipes
to arm only because apparently these are only used by armv4/v5 by
devices in meta-handheld).).

Regards
Andrea

