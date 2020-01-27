Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8967F89A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:04:08 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id l18so6147652lfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 05:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=DVJmgsS/Cpxedh3Fkej6mSNaa3PbF9+V8Dqv71HrUU4=;
	b=pdZE3xh44goBxCDr3sHLpLrOiRLtlSgxcuWcypVuZvD1A5P9AOscDCMA22eN6B582x
	SdCN5UBz48+iv02O2NknkhjHy8jJup1PLGrH4fs4PsA6bDOX1PPUgBLQwu5AUhw5BVKz
	NV+z9DZI24N5MUWNsbAFVC9DHctExatp5x3XmARcWVP8HHD1PtUhi2r+vSk11J0Fze9S
	0RxGG3uExNyabKFqSY6Qax28nRWVCNz46ZWzgoMY+7FBa0nsbRU3GWUG8KmkRXBpixSo
	wiRQAFOgpxUo0rZ199p3GgZgA9kxX17WoJF5VcfPojdLxYzn/UkqNipBCs5/ywOUvGge
	zpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DVJmgsS/Cpxedh3Fkej6mSNaa3PbF9+V8Dqv71HrUU4=;
	b=Q/CBxCsJr5Mt0RUksy1D/MVVTqf2g2GP/YXESVJUP3MVRkYmy3HvlEktx+M6Rd4G34
	thGYzM/InnA3bjjc4TGY5fWST/O7sl7zT4QJPCPzvWycZ+rfcdH86cKMB49MM883So63
	YehKtbE0P0cvaY/+GMGGP/mgVUVTuzQbK1ZrmmlOYXnrwcft/m5oGrv34bwYe9U2FmFL
	cyDY0953nwkWUVpd+Yb8NEKllosYXUp3C8bXDJJyFd789pdFpBfAX1VTDi9v0ke7ElAN
	2B5rKuVjd1TQanLG1GRVEUGj23vAjsN47vTmFSs9/VwAkMwZDha/YT6OWV96P2BOoAzx
	WHgg==
X-Gm-Message-State: APjAAAXW5l6ouS7q3soENKm7mct5lmuyWRw3uerMOsdjsYmRvbuFKPVv
	4rbib3xOrTDK+HkmTZdtMDl5KPRV
X-Google-Smtp-Source: APXvYqySXJkqynciEPdC18/cU0MRlT9i1gZJIPBP0Rr6KzEnEAOC7VldeGu8WcYTDchRB+c12zfPHQ==
X-Received: by 2002:a05:6512:407:: with SMTP id
	u7mr7800119lfk.146.1580130248535; 
	Mon, 27 Jan 2020 05:04:08 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	126sm8197000lfm.38.2020.01.27.05.04.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 05:04:07 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<20200127112451.165555-4-richard.leitner@skidata.com>
	<c5c24b0d8f7b6c1dca8e55d4acb6a050984e9716.camel@andred.net>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <31b0f3c6-eeca-23c4-7282-61521c2db87b@gmail.com>
Date: Mon, 27 Jan 2020 14:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c5c24b0d8f7b6c1dca8e55d4acb6a050984e9716.camel@andred.net>
Subject: Re: [meta-java][PATCH 3/4] openjre-8: fix debuginfo fixup in do_install
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
X-List-Received-Date: Mon, 27 Jan 2020 13:04:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/27/20 12:37 PM, André Draszik wrote:
> Hi,
> 
> On Mon, 2020-01-27 at 12:24 +0100, Richard Leitner wrote:
>> Based on a patch sent by Jacob Kroon.
>>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> Cc: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>   recipes-core/openjdk/openjre-8_242.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-core/openjdk/openjre-8_242.bb b/recipes-core/openjdk/openjre-8_242.bb
>> index 4ed2e6b..2c8a6a5 100644
>> --- a/recipes-core/openjdk/openjre-8_242.bb
>> +++ b/recipes-core/openjdk/openjre-8_242.bb
>> @@ -11,7 +11,7 @@ do_install() {
>>       cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
>>       chown -R root:root ${D}${JRE_HOME}
>>       install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
>> -    find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
>> +    [ -d ${D}${JDK_HOME} ] && find ${D}${JDK_HOME} -name "*.debuginfo" -exec rm {} \;
> 
> Does this line make sense? The JRE build should not produce any files in the JDK_HOME
> directory, I think?
> 
> So the only 'fix' this is doing is to silence 'find' to not print a warning about a
> directory it can't find?
> 

It wasn't a warning - the build fails.

> Shouldn't the line be dropped completely instead?
> 
> Should we worry if the JRE build (sometimes?) places files into JDK_HOME?
> 

Right, I'm all for removing the line completely if this is the case.

Cheers,
Jacob

