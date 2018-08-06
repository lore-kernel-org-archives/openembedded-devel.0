Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD293749F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 01:54:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w761sQst008352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Aug 2018 18:54:26 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 5 Aug 2018 18:54:25 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1533290805-13421-1-git-send-email-Qi.Chen@windriver.com>
	<1533290805-13421-2-git-send-email-Qi.Chen@windriver.com>
	<CAMKF1sotDb82cMwYO5xEyHu38-3zA0RBRTVOcyi+yMy4WSKcZA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <52611dd8-41c9-ac81-43ba-6619e7202722@windriver.com>
Date: Mon, 6 Aug 2018 09:58:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sotDb82cMwYO5xEyHu38-3zA0RBRTVOcyi+yMy4WSKcZA@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] rsyslog: add PACKAGECONFIG for imjournal
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
X-List-Received-Date: Mon, 06 Aug 2018 01:54:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2018 12:27 AM, Khem Raj wrote:
> On Fri, Aug 3, 2018 at 3:03 AM <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add PACKAGECONFIG for imjournal, and add corresponding configuration
>> to /etc/rsyslog.conf when it's enabled. Default to disable it.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
>> index d90695a..1bcbde1 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
>> @@ -67,6 +67,7 @@ PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
>>   PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
>>   PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
>>   PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
>> +PACKAGECONFIG[imjournal] = "--enable-imjournal,--disable-imjournal,"
>>   PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
>>   PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
>>   PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
>> @@ -126,6 +127,10 @@ do_install_append() {
>>       install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>>       install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
>>       sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'imjournal', 'true', 'false', d)}; then
>> +        echo '$ModLoad imjournal' >> ${D}${sysconfdir}/rsyslog.conf
>> +    fi
> perhaps its time to add something like
>
> $IncludeConfig /etc/rsyslog.d/*.conf
>
> in main etc/rsyslog.conf and then such fragments can be places as
> individual config
> files inside that directory

I agree. I'll send out V2.

Best Regards,
Chen Qi

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



