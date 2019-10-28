Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 421EC7FA9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 13:05:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9SD56d0009449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Oct 2019 06:05:06 -0700 (PDT)
Received: from [128.224.56.205] (128.224.56.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 28 Oct 2019 06:05:05 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20191011151148.39463-1-Trevor.Gamblin@windriver.com>
	<CAMKF1spHtQ0JQd3FUP7y_OrwAacMxZhbPzxkj2KMRCwQUhZQZA@mail.gmail.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <09dcb9d0-0d65-22c9-e98e-ca29a781b7ed@windriver.com>
Date: Mon, 28 Oct 2019 09:05:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spHtQ0JQd3FUP7y_OrwAacMxZhbPzxkj2KMRCwQUhZQZA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rsyslog: upgrade from 8.1908.0 to 8.1910.0
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
X-List-Received-Date: Mon, 28 Oct 2019 13:05:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/25/19 5:36 PM, Khem Raj wrote:

> Failed to build for musl here
>
> https://errors.yoctoproject.org/Errors/Details/274648/
>
> On Fri, Oct 11, 2019 at 4:12 PM Trevor Gamblin
> <Trevor.Gamblin@windriver.com> wrote:
>> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Upgrade to latest version for CVE-2019-17040 fix plus
>> other upstream bug fixes.
>>
>> [GitHub Issue] -- https://github.com/rsyslog/rsyslog/pull/3875
>>
>> CVE: CVE-2019-17040
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>   .../rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}      | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (98%)
>>
>> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
>> similarity index 98%
>> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
>> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
>> index bbb4b119a..f50f9a34b 100644
>> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
>> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
>> @@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
>>       file://0001-Include-sys-time-h.patch \
>>   "
>>
>> -SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
>> -SRC_URI[sha256sum] = "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
>> +SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
>> +SRC_URI[sha256sum] = "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
>>
>>   UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>> --
>> 2.18.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
Just testing a v2 now. Sorry for the delay.

