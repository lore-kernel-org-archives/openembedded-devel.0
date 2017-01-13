Return-Path: <ygl@iot.bzh>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 78F4471D82
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:45:26 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id k86so39251634lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mEprzuPLColGkXJtQEAWGc6WgG7XpyjntM2Wvi4zpVE=;
	b=tGjLlJDJPrLlTbV95IvZL7iLvQphc9LNCXN9XgXcr1lIxMyFm0AgSqlLUEkIdv+Q+L
	drjgW95SzF6I54PlnGJbbnzx6XtXy8XQQgKMNVc/A6eRNbjILqhnzCcJ+wtK1hmA2BfU
	07Z1uTuW59a4zCfhRAQ4infzFrQrDut7f1xJELdeQDlRY3gH48cJYk2yiYIfZsv7sGjt
	eLqqQeuODL8+wHZxpw6GgRM1XFmjcc/2Y25DTDikjO27UZbh/kSFWfpVe4K+PAoQNSGR
	Q53Hf/381vnRBcpN0SGjk0f4iRQYc1xuoNVnpRkJBDMsOVg1eDYr6qPvuGtUyOnvcESa
	Eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mEprzuPLColGkXJtQEAWGc6WgG7XpyjntM2Wvi4zpVE=;
	b=CMES9w7ZQzFpHzrUpaSrThmmv04ZGevnwTH0SkiQlji/OxGNk6kg16+bD5nTcWJlpp
	4figNhwafMTPIZ0UJB6LIX9kyE10sTtq/01yPJkd7yDvJJ+tH/r0Em6PqhZbtemohaAd
	0juinqToJqnSNSqaZsYohaf497afZvopL0/7uk5bm2ddolHKcoZpsC/yL6rvz2vd4pb0
	JCnAvgNHDRVhXgvbUmZLZV7CxqtV2GtBOe5Qhq5L+i5ZuCO5x39E7VJZjJWR33x3I51h
	TjGhp1GAcMJQX0T5ULY51Lq7H6daHrJDCj+okQ4wCk2dU2uGeIbK4x992LN5M+oyQrMt
	Bm/Q==
X-Gm-Message-State: AIkVDXI7r/J8Nqf3ok1eIjXY7GOc4d6qmplus34HacSHQz7Tmd0X4QGKlG1hwJxiY8Ii+YckZn7Hcmizk1jGQA==
X-Received: by 10.25.22.96 with SMTP id m93mr8204241lfi.101.1484318726381;
	Fri, 13 Jan 2017 06:45:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.89.208 with HTTP; Fri, 13 Jan 2017 06:45:25 -0800 (PST)
X-Originating-IP: [82.253.123.24]
In-Reply-To: <CA+chaQc_Hu4-hDwx5Z2xdjvDOgNwyo+SHnOjyajV+AJdQQ+SOg@mail.gmail.com>
References: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
	<CA+chaQc_Hu4-hDwx5Z2xdjvDOgNwyo+SHnOjyajV+AJdQQ+SOg@mail.gmail.com>
From: Yannick GICQUEL <yannick.gicquel@iot.bzh>
Date: Fri, 13 Jan 2017 15:45:25 +0100
Message-ID: <CAMZwcMApLaJrGSpN5beRoKREOO5p9K3ELBuKzUy0c5ki3uG-Tw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] ccache: enable max size setup for ccache dir
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
X-List-Received-Date: Fri, 13 Jan 2017 14:45:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Sorry for pollution, my mistake. I posted them on the right list.

Thanks,
Yannick

2017-01-13 15:33 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> Patches for oe-core needs to go to openembedded-core ML.
>
> On Fri, Jan 13, 2017 at 3:00 PM, Yannick Gicquel <yannick.gicquel@iot.bzh>
> wrote:
>
>> ccache directories are limited to 1G by default.
>> This patch enables the configuration of their limits, and as default
>> location is TMPDIR, it proposes a size limit to "0" (unlimited).
>>
>> The setup can be overloaded in local.conf by setting
>> CCACHE_MAX_SIZE to a custom value if needed.
>>
>> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
>> ---
>>  meta/classes/ccache.bbclass | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
>> index 93fcaca..8a80040 100644
>> --- a/meta/classes/ccache.bbclass
>> +++ b/meta/classes/ccache.bbclass
>> @@ -1,6 +1,21 @@
>>  CCACHE = "${@bb.utils.which(d.getVar('PATH'), 'ccache') and 'ccache '}"
>>  export CCACHE_DIR ?= "${TMPDIR}/ccache/${MULTIMACH_HOST_SYS}/${PN}"
>>  CCACHE_DISABLE[unexport] = "1"
>> +CCACHE_MAX_SIZE ?= "0"
>>
>>  do_configure[dirs] =+ "${CCACHE_DIR}"
>>  do_kernel_configme[dirs] =+ "${CCACHE_DIR}"
>> +
>> +def init_ccache():
>> +    # dummy python version
>> +    return
>> +
>> +init_ccache() {
>> +    if [ -n "${CCACHE}" ]; then
>> +        ${CCACHE} -M ${CCACHE_MAX_SIZE}
>> +    fi
>> +}
>> +
>> +do_compile_prepend() {
>> +    init_ccache
>> +}
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

