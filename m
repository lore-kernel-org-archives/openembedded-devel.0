Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8C178A50
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 16:44:53 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 68so5355019pfx.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 08:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/Q3PLc5MpoOmlHre3J+8CUsFC8hjb+XNzyi36Pmd3IM=;
	b=HD73XkwjmFwSexj6Sd3T6m54W/9pVxSBS4DB7dwyD6ENrM8Et+jHT3FOWUSgdfwowq
	9YzTiPBlGSyxDNsurc4CgxN1NGRACovj/Bv8ezRfaYzVC6+M9MeNY4cZRPU2BBPxDXzw
	d923NGWX2idkQG5A5tObsGImpV6q17+eURl0vSBF4LsBWw5blxj6Baw1we6aNO8VAfEA
	VH4aKx+0MGX1+lz/cWDLPQBFgY1DC+APzzr2TBVZj5nsdt9Xg1aJjYrhUVDCMX4M3i+K
	LJpFatUrTRs5Ute+7MtJuZWRF9juqAkqTmBKoa56kskl1USDXGvdAM14Nq8LOpva6BOe
	Bjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/Q3PLc5MpoOmlHre3J+8CUsFC8hjb+XNzyi36Pmd3IM=;
	b=nHjZl78DBbXz10N2FYAp+q8dy8WNdB/KIIoVLHXdBsAIfzAaR87WjqJm5gwLRtQiNT
	ZVveOB8puSD50pWGxVRpGCFthFTBd+GrFP5Fic3rmJTvibELfoXJE45MJLFZzmDPUrV2
	b+u+nVuLwViH87DrC9/4c/KZAU2vEsQN/Or/beNcRetVy1gPfQ68LIpsW+uFIBNf1J7e
	DHqKeJMnUIssi6GFzMl7wtvqSB0HDuY0i/4k/dtXXS9zqhP9cuBArzJ87a5kCwwSxo00
	EITTTqrP4pyONx9C2cQ0ToRXajFQ3s7UU2C/gHqJ0Fqd1214x1cgnvUV/0H0fR3RYuho
	ab4g==
X-Gm-Message-State: APf1xPAG6oPinKlyasG4LdbRR49UBfAWGlsca+xf2P3RjYxiuSGcUUY/
	i3wbvhVVmpx7WV57kZZ7qwYJk3Lu
X-Google-Smtp-Source: AG47ELuKvaj5yv3hcl9UxiUISSyxzMyhRnGNDikY61yiyHdlScQfFTTag1R07oeLFUE/3UcjSsibbQ==
X-Received: by 10.101.97.139 with SMTP id c11mr7915805pgv.447.1520095494469;
	Sat, 03 Mar 2018 08:44:54 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:7529:c02c:43de:27ec])
	by smtp.gmail.com with ESMTPSA id
	h80sm18107337pfj.181.2018.03.03.08.44.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 08:44:53 -0800 (PST)
To: Andrea Adami <andrea.adami@gmail.com>, akuster808 <akuster808@gmail.com>
References: <c6d3abbb-841a-7f24-4b82-474992493bec@gmail.com>
	<CAAQYJAvnmosr9TP5ieytDOt-W48ix+yw-Z_aobYpvxZaGx=XXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <db0211d9-cf35-b455-f604-cfa343853806@gmail.com>
Date: Sat, 3 Mar 2018 08:44:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvnmosr9TP5ieytDOt-W48ix+yw-Z_aobYpvxZaGx=XXg@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the World, Failed tasks 2018-02-26
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
X-List-Received-Date: Sat, 03 Mar 2018 16:44:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/3/18 8:25 AM, Andrea Adami wrote:
> On Fri, Mar 2, 2018 at 12:37 AM, akuster808 <akuster808@gmail.com> wrote:
>> Several of the new failures popped up after 4.15 kernel update.
>>
>>
>>
>> == Failed tasks 2018-02-26 ==
>>
>> INFO: jenkins-job.sh-1.8.43 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/sumo/log.report.20180228_061518.log
>>
>> === common (8) ===
>>      * meta-openembedded/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb:do_compile
>>      * meta-openembedded/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb:do_compile
>>      * meta-openembedded/meta-networking/recipes-support/drbd/drbd_9.0.8-1.bb:do_compile
>>      * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb:do_compile
>>      * meta-openembedded/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb:do_compile
>>      * meta-openembedded/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb:do_compile
>>      * meta-openembedded/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb:do_packagedata
>>      * meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb:do_compile
>>
>> === common-x86 (0) ===
>>
>> === qemuarm (10) ===
>>      * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
>>      * meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_1.0.bb:do_configure
>>      * meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_1.3.5.bb:do_compile
>>      * meta-openembedded/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb:do_compile
>>      * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:do_compile
>>      * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>>      * meta-qt5/recipes-qt/qt5/qtgraphicaleffects_git.bb:do_compile
>>      * meta-qt5/recipes-qt/qt5/qtquickcontrols2_git.bb:do_compile
>>      * meta-qt5/recipes-qt/qt5/qtquickcontrols_git.bb:do_compile
>>      * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb:do_compile
>>
>> === qemuarm64 (4) ===
>>      * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure
>>      * meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb:do_compile
>>      * meta-qt5/recipes-qt/qt5/qt5-creator_4.5.1.bb:do_compile
>>      * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile
>>
> 
> I am about upgrading kexec-tools-klibc to newer release supporting aarch64.
> 
> Strangely I see the oe-core recipe failing in your builder.
> I build here with musl and have seen the differences are basically
> about security flags:
> 
> autobuilder
> 
> | aarch64-oe-linux-gcc  -fstack-protector-strong  -D_FORTIFY_SOURCE=2
> -Wformat -Wformat-security -Werror=format-security
> --sysroot=/home/jenkins/oe/world/shr-core/tmpfs/work/aarch64-oe-linux/kexec-tools/2.0.16-r1/recipe-sysroot
>   -mcmodel=large ...
> 
> musl:
> aarch64-oe-linux-musl-gcc
> --sysroot=/tmp/build/tmp-musl/work/aarch64-oe-linux-musl/kexec-tools/2.0.16-r1/recipe-sysroot
>   -mcmodel=large ...
> 
> Here the recipe builds just fine.

This could perhaps be due to using security_flags in world builds.


