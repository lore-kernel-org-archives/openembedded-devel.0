Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1972972886
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 19:57:50 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id z10so14716967pdj.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KuaELkupHML/zFBxzxiCA/22e5mI08Gn9GGoMkUsUKs=;
	b=jTb5frcGb0lAmSu4OslDnqCPhESUuA+shQR4HLBXNhYIdM/QsBm4ft/BkMWcLuFmit
	WxoWnq4MjnUUJUz06up02jadMV6xklJJYiCeI9ZuUWoyxhm3RHxq/4cNB3UC8JWS4biV
	OAdqgu2Myun2v8MVjcE0Auq5qETkUO/qbxgv/Qi53AmPCJNuMVdo68i86lzmrrTZinbs
	PAxYAdXsAp6L63oeHLfjg/Mt1A0f9gSgVfY+7ZIn+7jgI3iyWo5ta/BKlhGDG3OYT7v7
	s+rtoS3rFoVlqIxQ0YTLMQGJZw1ZtWeCppvinQZtooCJQ/kcwuic1UNGq0ICkgjpqKY0
	6MdA==
X-Received: by 10.68.129.6 with SMTP id ns6mr76575019pbb.137.1419710271559;
	Sat, 27 Dec 2014 11:57:51 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:fc52:df7d:daef:c441?
	([2601:c:a700:272f:fc52:df7d:daef:c441])
	by mx.google.com with ESMTPSA id
	kb16sm31493428pbb.34.2014.12.27.11.57.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Dec 2014 11:57:50 -0800 (PST)
Message-ID: <549F0F3B.4010901@gmail.com>
Date: Sat, 27 Dec 2014 11:57:47 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1419700394.git.akuster808@gmail.com>	<c46d487b35f71ff4a9ecbc02ab17fde4ddd0a506.1419700394.git.akuster808@gmail.com>
	<CAP9ODKpBgYNd7+=D6+9LwP1ndYQ9w4cga2QVLxLfVJG74dSFEw@mail.gmail.com>
In-Reply-To: <CAP9ODKpBgYNd7+=D6+9LwP1ndYQ9w4cga2QVLxLfVJG74dSFEw@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 11/27] lvm2: add lvm.con to CONFFILES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Dec 2014 19:57:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hmm, I got it that way from Master.

do we really fix that ?

- armin

On 12/27/2014 11:27 AM, Otavio Salvador wrote:
> There is a typo in the short log. *conf*.
>
> On Sat, Dec 27, 2014 at 3:21 PM, Armin Kuster <akuster808@gmail.com> wrote:
>> From: Liu Jian <jian.liu@windriver.com>
>>
>> * Files will be over written when updating using rpm.
>>
>> * If there is no %config micro before the file in the spec file,
>>    this file will be over-written after updating this package
>>    using rpm. This will make our settings lost.
>>
>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-oe/recipes-support/lvm2/lvm2.inc | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
>> index 1bbb158..42f6e3a 100644
>> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> @@ -48,3 +48,5 @@ FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
>>   FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
>>
>>   RDEPENDS_${PN} = "bash"
>> +
>> +CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
>> --
>> 1.9.1
>>
>
>
>

