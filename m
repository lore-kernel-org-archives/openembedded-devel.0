Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUTDX-0007Wt-2I
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 03:39:55 +0200
Received: by eaal1 with SMTP id l1so39621eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 18:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Yf3sbJiEsihRz8zCu1ruOoBx2ra7slBC05NpI2VqtFg=;
	b=I/bgsG9oO1mKkkba80ZlIb7BcjrWzbbm7t46NaXkceGZbNxnrT91cy1BQ7hrsAsz6e
	QNIvNJigwITjhiJ9BIcL5QHdHMrrV/dpkKt7fV/3mPDwbDsZn8B84+g9SVzbdU7+tK0v
	pHfpdoY90RKu4sbOIs2WjXNinJNbM9noyk+PlOui7G0mlx9j9FKNfbkJ1ca/94drLsr6
	/z+7uWDp2JN8mNZ/sJgzvsl7+Tk95mJWPtT1zrURm1GAvzHXfSW9Rt1A66d6fhg7gpTj
	WlGJfppjpCe019QtN/+Pp0uvnW1h+i6L+IWXVD3L0QrXtEuEduLzrfmI+Kvdl3VJ0FwA
	KTLA==
MIME-Version: 1.0
Received: by 10.14.47.131 with SMTP id t3mr133370eeb.118.1337131793581; Tue,
	15 May 2012 18:29:53 -0700 (PDT)
Received: by 10.14.2.132 with HTTP; Tue, 15 May 2012 18:29:53 -0700 (PDT)
In-Reply-To: <20120515222710.GI14763@denix.org>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<20120515222710.GI14763@denix.org>
Date: Tue, 15 May 2012 18:29:53 -0700
Message-ID: <CAMKF1spVc9s9NcmxooYxq3CzdHjXv=ukxOPdRhLvOLoQHpqLoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 01:39:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tuesday, May 15, 2012, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, May 15, 2012 at 03:01:42PM -0700, Khem Raj wrote:
>> Hi Koen
>>
>> Since meta-oe is not branched for denzil this patch removes the old
>
> Did you mean "is now branched" above?

Yes indeed it was a typo
>
> Since 4.6/4.7 is now seems to work fine for me:
>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>
>
>> components in there for toolchain recipes. I have left gcc 4.6 in there
>> for now since OE-Core still have those recipes.
>>
>> The following changes since commit
14869e500c1a2f6be4704bf7399435fda00dc34c:
>>
>>   klibc: upgrade to latest git (pre 2.0) (2012-05-14 16:02:03 +0200)
>>
>> are available in the git repository at:
>>   git://git.openembedded.org/meta-openembedded-contribkraj/remove-gcc-4.5
>>
>> Khem Raj (3):
>>       eglibc-2.12: Remove
>>       binutils-2.20: Remove
>>       gcc-4.5: Remove
>>
>>  .../eglibc/cross-localedef-native_2.12.bb          |   43 -
>>  .../eglibc/eglibc-2.12/IO-acquire-lock-fix.patch   |   17 -
>>  .../eglibc-2.12/armv4-eabi-compile-fix.patch       |   25 -
>>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
>>  .../eglibc/eglibc-2.12/generate-supported.mk       |   11 -
>>  .../eglibc/eglibc-2.12/ld-search-order.patch       |   56 -
>>  .../eglibc/eglibc-2.12/mips-rld-map-check.patch    |   23 -
>>  .../eglibc/eglibc-2.12/ppc-enable-603e-cpu.patch   |   26 -
>>  .../eglibc-2.12/shorten-build-commands.patch       |   81 -
>>  .../recipes-core/eglibc/eglibc-initial_2.12.bb     |    6 -
>>  .../recipes-core/eglibc/eglibc-locale_2.12.bb      |    1 -
>>  toolchain-layer/recipes-core/eglibc/eglibc_2.12.bb |  109 -
>>  .../binutils-2.20.1/110-arm-eabi-conf.patch        |   22 -
>>  .../152_arm_branches_to_weak_symbols.patch         |  240 -
>>  .../binutils-2.20.1/200_elflink_%B_fixes.patch     |   65 -
>>  .../201_elflink_improve_noaddneeded_errors.patch   |   70 -
>>  .../202_elflink_noaddneeded_vs_weak.patch          |   87 -
>>  .../binutils-2.20.1/binutils-2.16.1-e300c2c3.patch |   18 -
>>  .../binutils-2.19.1-ld-sysroot.patch               |   37 -
>>  .../binutils-2.20.1/binutils-mips-pie.patch        |   29 -
>>  .../binutils/binutils-2.20.1/binutils-poison.patch |  253 -
>>  .../binutils-uclibc-100-uclibc-conf.patch          |   34 -
>>  ...binutils-uclibc-300-001_ld_makefile_patch.patch |   50 -
>>  ...binutils-uclibc-300-006_better_file_error.patch |   43 -
>>  ...ils-uclibc-300-012_check_ldrunpath_length.patch |   47 -
>>  .../binutils-uclibc-gas-needs-libm.patch           |   38 -
>>  .../binutils-x86_64_i386_biarch.patch              |   26 -
>>  .../binutils-2.20.1/libiberty_path_fix.patch       |   20 -
>>  .../binutils-2.20.1/libtool-2.4-update.patch       |31174
--------------------
>>  .../binutils-2.20.1/libtool-rpath-fix.patch        |   36 -
>>  .../binutils/binutils-cross-canadian.inc           |   22 -
>>  .../binutils/binutils-cross-canadian_2.20.1.bb     |    3 -
>>  .../recipes-devtools/binutils/binutils-cross.inc   |   30 -
>>  .../binutils/binutils-cross_2.20.1.bb              |    3 -
>>  .../binutils/binutils-crosssdk_2.20.1.bb           |   12 -
>>  .../recipes-devtools/binutils/binutils.inc         |  149 -
>>  .../recipes-devtools/binutils/>
_______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

