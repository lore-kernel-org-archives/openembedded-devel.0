Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6CF601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 06:50:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBT6oSGY002840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 22:50:28 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 28 Dec 2016 22:50:27 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <20161228074640.21371-1-Qi.Chen@windriver.com>
	<CAMKF1soFTQKwwz6BicXfguD722ZCq34hhad0RWqRGaDZVZYAww@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <f7e5c7e7-9266-ac46-229c-909e56d00d3c@windriver.com>
Date: Thu, 29 Dec 2016 14:51:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soFTQKwwz6BicXfguD722ZCq34hhad0RWqRGaDZVZYAww@mail.gmail.com>
X-Originating-IP: [128.224.162.184]
Subject: Re: [meta-oe][PATCH] rsyslog: use atomic builtins to avoid race issue
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
X-List-Received-Date: Thu, 29 Dec 2016 06:50:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2016 07:20 AM, Khem Raj wrote:
> On Tue, Dec 27, 2016 at 11:46 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> rsyslog uses a small program to check if compiler has atomic builtins
>> or not. This does not work when cross compiling, resulting in potential
>> race issue. In fact, when running ptest on intel-x86-64 board, we have
>> met the race problem.
>>
>> As our compiler gcc, has atomic builtins, we force ap_cv_atomic_builtins
>> to be 'yes' so that rsyslog could make use of the atomic builtins and avoid
>> the race issue.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> index 4e2c122..27162e1 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
>> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caa
>>
>>   inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
>>
>> -EXTRA_OECONF += "--disable-generate-man-pages"
>> +EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
> Does this also cover 64bit builtins ? secondly, a note for
> architectures not supporting atomics to disable this would be good.

No. When looking at the source, I think it's not critical.
When I made this patch, my criteria is:
1) ptest of rsyslog does not hang because of race issue on intel-x86-64 
board
2) rsyslog works well on qemux86, qemux86-64, qemuarm, qemumips, 
qemumips64, qemuppc

I searched the doc and the internet, I could not find related 
information on which arch gcc does not support atomic builtins.

Best Regards,
Chen Qi

>>   # first line is default yes in configure
>>   PACKAGECONFIG ??= " \
>> --
>> 2.8.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



