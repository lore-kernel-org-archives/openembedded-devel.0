Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7501D7C6F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:45:31 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id m2so6982033pgl.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 17:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XpgsTCcdlRM9E31FHrUZeh011djLDxw30HdKctpE9JQ=;
	b=iSi7CP5ZjTubNF49MUKCx5nGEn/535NoLlPmEdJ+O/mZZwV1nR5hgOC7XTGV23u/jm
	GrUb6XSUtk8exxhN9f+Z3WMn7x7luLD1LtD/3IVlXXdXHnRrvjDuoja1gKKIJUHCVEzg
	J9rwhVilsnvLNjSkG01ZmfO+6OBeSXmuG0tp9VK+8BM97A1kcowj02tR2RGfenM9So62
	jWokd4qovHmrjVt45Wbs0h+ujJSuEaImApSmP7gHuLAiTJlOD8EDvkmvfSfFfaUECZr+
	P9NPzIf3N+8b94MAgYK/Ifyr1WHttiXnglPSw2EXMAbVHxt9ceK9TQhko1Fah9JT5sim
	qYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=XpgsTCcdlRM9E31FHrUZeh011djLDxw30HdKctpE9JQ=;
	b=FUMX+i1+03YdvcYu1PRqg+J9zrQTLt2kyjxr5gRFj7S1GCVpYnNLlhLwNnK2sh+1qG
	5KybcnDW+kgqLX1R+wm9QJA2RfUbf214RiPnNAWxoJUbVM+6bqAbmQuMSv51JkZzCc1n
	BF0urHfSN2G8DSzJ7yg7Z2qi5lXN5xmjN/bzu2MHjNHfzfEIUWiNBJIof0ClHXsPcXSD
	5ARQtuFe5ZLOzg3Ty3cLeka9QtH6G8a16vzo0j5rMbZAggqu/ygz8e4cTAtYAp5jf1xI
	eAWGtraMPp2l2JB6xDEgqmJAvehnGCn8NvK3aKO5Cho2CVkngYqCYwGjt59DXYOjz3gR
	KnUA==
X-Gm-Message-State: APjAAAXfnNOJRU8/B7YqA/1FgNH/cvSzsdxkom1YC+3dBZEKCjm/BC7y
	UqZk3MM7W2+Zne7F2WJOvVRJ0m/k
X-Google-Smtp-Source: APXvYqz7dQEvQ+cNvnrHiy83Ktsus4rv4nHOrXCDsrmLQ/+3hfSELA7gOO65lVVji/CJ9SDvaJmKVQ==
X-Received: by 2002:a17:902:b60c:: with SMTP id
	b12mr4256816pls.261.1551836726840; 
	Tue, 05 Mar 2019 17:45:26 -0800 (PST)
Received: from hermes.local ([2601:646:8500:6bc6:e91a:c092:698a:a99])
	by smtp.gmail.com with ESMTPSA id
	q207sm229772pgq.88.2019.03.05.17.45.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 17:45:26 -0800 (PST)
To: Kang Kai <Kai.Kang@windriver.com>,
	"Slater, Joseph" <joe.slater@windriver.com>
References: <20190304235132.188006-1-joe.slater@windriver.com>
	<CAMKF1sprjLL91SRCRZTueo5WY6f1+qwJwyn_x8Y53oW0sgU_Vg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F37689AF@ALA-MBD.corp.ad.wrs.com>
	<c488c266-004e-c1af-a842-b7a3729a8411@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <08732a65-f24b-dde5-2ce5-5e5ee2ffb15f@gmail.com>
Date: Tue, 5 Mar 2019 17:45:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0)
	Gecko/20100101 Thunderbird/65.0
MIME-Version: 1.0
In-Reply-To: <c488c266-004e-c1af-a842-b7a3729a8411@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
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
X-List-Received-Date: Wed, 06 Mar 2019 01:45:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/5/19 5:35 PM, Kang Kai wrote:
> On 2019/3/6 上午9:22, Slater, Joseph wrote:
>> Yes, it only fails for multilib.  An unaupported instruction 
>> ("sync").  Kai Kang is sending a different patch, that is, I assume it 
>> is different.
> 
> It caused by default tune 'mips' which doesn't append option 
> '-march=mips32' to CXX. Compare to default tune 'mips32r2' of qemumips, 
> it appends '-march=mips32r2' to CXX.
> I'll send the patch for review.
> 

This is a problem in selection of base tunes for multilib then, your 
patch should check for mips to be DEFAULTTUNE and ignore it instead if 
ignoring it for mipsarcho32

> Regards,
> Kai
> 
> 
>>
>> Joe
>> ________________________________________
>> From: Khem Raj [raj.khem@gmail.com]
>> Sent: Monday, March 04, 2019 6:36 PM
>> To: Slater, Joseph
>> Cc: openembeded-devel
>> Subject: Re: [oe] [meta-oe][PATCH 1/1] leveldb: restrict building for 
>> mips64
>>
>> On Mon, Mar 4, 2019 at 3:51 PM Joe Slater <joe.slater@windriver.com> 
>> wrote:
>>> Do not try to build lib32-leveldb.  libn32-leveldb will build.
>>>
>>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> ---
>>>   meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb 
>>> b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>>> index 8fec89c..908ad3e 100644
>>> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>>> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
>>> @@ -35,3 +35,7 @@ do_install() {
>>>
>>>   PACKAGES =+ "${PN}-ptest"
>>>   FILES_${PN}-ptest = "${bindir}"
>>> +
>>> +# Do not try to build lib32-leveldb for mips64, but allow 
>>> libn32-leveldb.
>>> +#
>>> +COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb = "null"
>> does it fail just in multilib situation ?
>>
>>> -- 
>>> 2.7.4
>>>
>>> -- 
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

