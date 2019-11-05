Return-Path: <prvs=2054d270f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8872F7E21C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1572943379; x=1604479379;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=APsiW6VQEdNLNxxFLLeUvoYqjQMXrfiLQs4HDNkvcyE=;
	b=IR0h1zvZyhTmWTutdaXB6KXTDJfIA9wKowwj40p37QFBTOFLuNHfNPE5
	WxqFcNIU5nlyCyi5pIEn4Hlqoup73cwmIva9XFr8NPhGS9YYekjUqCn0U
	6rv2I0jq5CM3cQXolzNAt1rlnwCEsrWkFkLZ79prjvd84R4QnuBeHniyU
	S3RmSYGMd7T6lgf8bpMD9o6e4Zc82CduMjJ8UgRkj8chxeOqLxAie1QGI
	Kcewchr9qTdVjuUH1L+nGTkJUHCS8SWmbWKXxjWddJHlFuGmAxuX1PjBr
	SYGaCJWmjHs7hM6jn6sUWYgkDvsPsIgq9Sc6P7HyUleYB95hq2mWaFHnU w==;
IronPort-SDR: uppA7lKiZT+2Aind+9p9NKXC8mZhRH1HniVH6VNcqY+QAyYpi0NJ9tu1fEE8UV1ElCPBxrBJjA
	RTG9/33QfmRUnViyqJjSjcJI0fuHvtT3x+bmcXIfifMHGMsyaiSnDcX1+afi7lWgSSVD85K+dV
	JQ8VHBGvY7BLv75vsLgNBfPzszXaAsCfw1S3qS6rk2b1yspJegd7aZ1+aiNQNIvtnA5IFajqTn
	naatd5QZqJiWV9VvS9Ecy5bqz96Occd0ddluoAlAB36D+cqimU4XTMgrJhSy6J65P44JPVO7Cd
	qtI=
X-IronPort-AV: E=Sophos;i="5.68,270,1569276000"; d="scan'208";a="20694675"
To: Vincent Prince <vincent.prince.fr@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
References: <20191011212120.11453-1-alistair.francis@wdc.com>
	<CAB2nKc8MA7uLUxbJrzh-a48AHe66XoghYaGLxF0PRH7y45RiWQ@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <e3824981-20c0-b5e2-752b-e63ad6df771b@skidata.com>
Date: Tue, 5 Nov 2019 09:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAB2nKc8MA7uLUxbJrzh-a48AHe66XoghYaGLxF0PRH7y45RiWQ@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Otavio Salvador <otavio.salvador@gmail.com>
Subject: Re: [meta-java][PATCH] layer.conf: Mark as compatible with zeus
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
X-List-Received-Date: Tue, 05 Nov 2019 08:42:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,
sorry for the delay.

The patch was applied to master-next and master-next will be merged to 
master after some tests.
Then also a zeus branch will be created.

Any testing, feedback and help in maintaining this layer is highly welcome!

regards;Richard.L

On 01/11/2019 11:44, Vincent Prince wrote:
> Hi Team,
> 
> Would it be possible to create Zeus branch for meta-java?
> By the way, master branch didn't move since April, any issue
> maintaining this layer?
> 
> Kind regards,
> Vincent
> 
> Le ven. 11 oct. 2019 à 23:26, Alistair Francis
> <alistair.francis@wdc.com> a écrit :
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>> Also, can the master-next branch be pushed to master?
>>
>>   conf/layer.conf | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index 90236be..cdba2cd 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
>>   BBFILE_COLLECTIONS += "meta-java"
>>   BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
>>   BBFILE_PRIORITY_meta-java = "10"
>> -LAYERSERIES_COMPAT_meta-java = "thud warrior"
>> +LAYERSERIES_COMPAT_meta-java = "thud warrior zeus"
>>
>>   LICENSE_PATH += "${LAYERDIR}/licenses"
>>
>> --
>> 2.23.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

