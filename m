Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 282436154A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 19:19:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t3so1462138pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 11:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9mFrmZeigSGahjI4EOscvxtmKH45qbdgmI+P5/oJJgs=;
	b=QsC/fq3gXSE+dTxL6H0U2WMBdjArFUQPd7Uh1J1/g7Xco2JPQ+3M2l5fxDtgbxDYbT
	L4vCv5FMRRBOB2NsNp7thz4kNUHwkeyTWK9Nbl0DPJLxoqiUx67hZ/blGh58zWfCoYEu
	dJAsYY77OuLCtUNlSZrp0QpZE03oSghp0wSnE7CUlr522S1e4+lVgMOtPbrb1nH1aaM2
	LT7zkIwBqtsQz2EF1TYky6MiFY/6nB6tH1OpVfAJcl+JYgyljirE9LgN99bFLE/qW2J+
	4S/bCvdCXZVjIg/o07pQxPtQVTS3vqV46wBct1R/boGSarzAOZELt350oZsjbhzwGhQA
	KpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9mFrmZeigSGahjI4EOscvxtmKH45qbdgmI+P5/oJJgs=;
	b=gZGHsqj3qmqrRp7Qy76ax/4ZQuCK6p3NowExtSq7iCJ46t8OBxOS11Lj2yqgqc6240
	t3MtEUOOlM0Iz+EU6ZgC73CrsL82kPkmPQE2sUvnUHT9cfZ4YpBOQ8sKP6SWSn0H5ONR
	THvl8EybE9ycXz6yAnzOuHnhZ4RLzU+o2EpsoC8ObJXEb00WGB0cDHnl5njfRl/KC/oY
	MHQanMsoyTvhoaBxF7Zppn18RMlalzM1OYyjcLjQ9XMosgFi0y85nd99ORR4Q4AdVPzU
	yiRbpwCNgZKqVP14h4Sw8S/zKKtG1Vi18Q2Ljr7tSTTL70cLf3dZwdPvu1YoXmV8/3W5
	kNkw==
X-Gm-Message-State: ANhLgQ3TO4Noy46nOzC/6nPDTIx8NrHj0iZrQ63yIA/4ygTX41CyPZ16
	dluyP9iEGQ3O7kPp54ytbR4=
X-Google-Smtp-Source: ADFU+vtlh0zfbFhXCKkSoeuJo/4ZI31E07bWJZMzOeT7/Q5+Q8L1Uh7QU+M+tokYGLDhEWnswrgKig==
X-Received: by 2002:a63:b91d:: with SMTP id z29mr4106304pge.52.1583349578918; 
	Wed, 04 Mar 2020 11:19:38 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:dcd2:b9cb:142a:850e?
	([2601:646:9200:4e0:dcd2:b9cb:142a:850e])
	by smtp.gmail.com with ESMTPSA id
	a71sm14189776pfa.117.2020.03.04.11.19.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 11:19:38 -0800 (PST)
To: Scott Murray <scott.murray@konsulko.com>, Leo Yan <leo.yan@linaro.org>
References: <20200304122811.16655-1-leo.yan@linaro.org>
	<alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <a7ae7094-c8b4-f0cc-357f-c6cce1231e49@gmail.com>
Date: Wed, 4 Mar 2020 11:19:37 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003041103340.29352@godzilla.spiteful.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v1] OpenCSD: Support for Arm CoreSight decode lib
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
X-List-Received-Date: Wed, 04 Mar 2020 19:19:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/4/20 8:05 AM, Scott Murray wrote:
> On Wed, 4 Mar 2020, Leo Yan wrote:
> 
>> This recipe is to support OpenCSD, which is an open source
>> CoreSight trace decode library and utility.
> 
> Just a thought, this seems like the kind of thing that might make sense
> for the new meta-arm layer that Jon has been working up?
> 

it also says x86_64 in COMPATIBLE_HOST, while coresight seems to be arm
specific is this not supposed to be so ?

>> Signed-off-by: Leo Yan <leo.yan@linaro.org>
>> ---
>>   .../recipes-devtools/opencsd/opencsd_git.bb   | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>>
>> diff --git a/meta-oe/recipes-devtools/opencsd/opencsd_git.bb b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>> new file mode 100644
>> index 000000000..0c3b4837d
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/opencsd/opencsd_git.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
>> +HOMEPAGE = "https://github.com/Linaro/OpenCSD"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
>> +
>> +SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
>> +SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
>> +
>> +EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
>> +                CROSS_COMPILE='${TARGET_SYS}-' \
>> +                CC='${CC}' \
>> +                CXX='${CXX}' \
>> +                LINKER='${CXX}' \
>> +                LINUX64=1 \
>> +                DEBUG=1 \
>> +                "
>> +
>> +do_compile() {
>> +    ( cd ${S}/decoder/build/linux; oe_runmake ${EXTRA_OEMAKE}; cd - )
>> +}
>> +
>> +do_install() {
>> +    ( cd ${S}/decoder/build/linux; oe_runmake PREFIX=${D}/usr install; cd - )
>> +}
>>

