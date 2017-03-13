Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4D2070031
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:32:48 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u48so21386237wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OXPTWhyGXsIlpKmWnrsRbZaEDXPIGlEuFxsPzw7z1BQ=;
	b=CfNCASOVPdMBfkc+hPEhgmH9T89YlyOHDWPbTmQ0X1OeXaJP0x+G3ab12RiCwSKxnW
	X/YNWT2NoNmQwnVQ5X70StjA4lCzc4QTDKFIToaEIixFeeHWBCop049zTbGV12HRIT/M
	Lht6COcTQ/LQICJnrGKqJ6TcDvvNLqsD3JNOsz/HFA7Ztb4eRrzKXkEirZA6HPPhNRUE
	wqN7IHXrX+JLPnl7xQEBsLzTW2B8Q1Db0aqO2JYdpDR+KMdmzuD4qsyaQtZbQvtoJ0FD
	ROhExXs35CbBRofVJWa2jj3nuUsWlCf+N4umJaXEU9GBF/KNULxKPeqZObFDo0dcfsf3
	3pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OXPTWhyGXsIlpKmWnrsRbZaEDXPIGlEuFxsPzw7z1BQ=;
	b=PtV6GciT80MTChi+i08ARwwbRo7greGoh+Ig03PHiAPcIxJ1kiQqMduuTNqHTPP9Iw
	Uel2qfmfdr4PD8KAeeiuoGAJm3G1fWOsz9jr+PJWeNqU1DSL9Dtr/IRn6O3E9asARJL7
	hklIBGLzX1MM20KpFzKTwHIRrFHyNxadYGrzxYM0MM7+wHtB+WdW+oakMvaMDbfo5kvi
	LM2K/91gxWSnS5GWwHNjI20K/N19rBQ6HdkpI9DTIkPiBsQAToggJENj0dWDNfiiu0LY
	gfiq4Uwemqg7IUkVWZYxK0chclKz50Acl3Z3MWieRNWxsYz1hi5jNysPYHRV0HtBWa8h
	jHUQ==
X-Gm-Message-State: AMke39kZmeYkGoepbZx3aD6TDwG5fd4bf6rowN28TVwiD1Sjxsgp7nrBobNSd2yk1Y25tlpniINN0crSZ1i6dg==
X-Received: by 10.223.182.133 with SMTP id j5mr32967638wre.19.1489433570165;
	Mon, 13 Mar 2017 12:32:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Mon, 13 Mar 2017 12:32:49 -0700 (PDT)
In-Reply-To: <CAJ86T=Vyib+dD2ujiFZegeUQTFPqBfowTbD0BUNhz9=KZPt7jg@mail.gmail.com>
References: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=Vyib+dD2ujiFZegeUQTFPqBfowTbD0BUNhz9=KZPt7jg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 13 Mar 2017 12:32:49 -0700
Message-ID: <CAJ86T=U+om+yq3pH_E0HazCpuomeKF9ZUq5E5vwwDxyBA=zWHw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
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
X-List-Received-Date: Mon, 13 Mar 2017 19:32:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 13, 2017 at 12:24 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Jan 25, 2017 at 1:43 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> When cross compiling, the word size of the compiler set via HOST_CC
>> must match the word size of the target. That's achieved by appending
>> "-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.
>>
>> Unfortunately the current list of over-rides (powerpc, x86 and arm)
>> does not cover all cases (e.g. it ignores MIPS). Using SITEINFO_BITS
>> is a more generic solution.
>
> Ping.

Actually this patch needs to be rebased since the earlier (incomplete)
fix was merged. Sending a v2.

>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> index 964dc1d..430279f 100644
>> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
>> @@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746bee
>>
>>  S = "${WORKDIR}/LuaJIT-${PV}"
>>
>> -inherit pkgconfig binconfig
>> +inherit pkgconfig binconfig siteinfo
>>
>>  BBCLASSEXTEND = "native"
>>
>> @@ -21,9 +21,7 @@ BBCLASSEXTEND = "native"
>>  # you need to install the multilib development package (e.g.
>>  # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
>>  # (HOST_CC="gcc -m32").
>> -BUILD_CC_ARCH_append_powerpc = ' -m32'
>> -BUILD_CC_ARCH_append_x86 = ' -m32'
>> -BUILD_CC_ARCH_append_arm = ' -m32'
>> +BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
>>
>>  # The lua makefiles expect the TARGET_SYS to be from uname -s
>>  # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
>> --
>> 1.9.1
>>

