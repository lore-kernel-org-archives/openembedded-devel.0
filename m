Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6528D60017
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 01:47:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w761ltq1008213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Aug 2018 18:47:55 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 5 Aug 2018 18:47:54 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1533290805-13421-1-git-send-email-Qi.Chen@windriver.com>
	<CAMKF1sqRfR-JDwt+HiWJ8qDsAFnK92iKbNAJf2uF7Qxj-DZFDQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2f98543d-8bd7-8204-4786-e60dbe85f7a4@windriver.com>
Date: Mon, 6 Aug 2018 09:52:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqRfR-JDwt+HiWJ8qDsAFnK92iKbNAJf2uF7Qxj-DZFDQ@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] rsyslog: fix configuration file for logrotate
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
X-List-Received-Date: Mon, 06 Aug 2018 01:47:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2018 12:33 AM, Khem Raj wrote:
> is this patch any different from last posted patch ?
>
> https://patchwork.openembedded.org/patch/153125/

There's is no difference.
I sent it out again because the second patch also modifies the 
do_install function and I thought if I send them out together, it will 
be more convenient.

Best Regards,
Chen Qi

> If not then there is no need to resend, if yes then please describe
> the change and mark
> patch as v2, v3 and so on. Save some time for reviewers
> On Fri, Aug 3, 2018 at 3:02 AM <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> The logrotate.rsyslog file uses 'cat /var/run/rsyslogd.pid' to
>> determine the pid of rsyslogd daemon. This is incorrect, because
>> rsyslogd may start in a way that does not create rsyslog.pid file.
>>
>> Failing to send HUP signal to rsyslogd daemon will result in
>> unexpected behaviour. e.g. rsyslogd is writing to /var/log/messages-xxxx
>> instead of /var/log/messages.
>>
>> We should really use pkill to send HUP signal to rsyslogd to ensure
>> correct behaviour.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 4 ++--
>>   meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb         | 1 +
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
>> index 94ec517..5f8568f 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
>> @@ -9,7 +9,7 @@
>>           delaycompress
>>           compress
>>           postrotate
>> -               /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
>> +               @BINDIR@/pkill -HUP rsyslogd 2> /dev/null || true
>>           endscript
>>   }
>>
>> @@ -34,6 +34,6 @@
>>           delaycompress
>>           sharedscripts
>>           postrotate
>> -               /bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
>> +               @BINDIR@/pkill -HUP rsyslogd 2> /dev/null || true
>>           endscript
>>   }
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
>> index 9737892..d90695a 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
>> @@ -125,6 +125,7 @@ do_install_append() {
>>       install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
>>       install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>>       install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
>> +    sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
>>   }
>>
>>   FILES_${PN} += "${bindir}"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



