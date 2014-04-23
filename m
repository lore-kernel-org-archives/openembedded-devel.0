Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02E5860782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 08:31:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3N8VhRo020287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Apr 2014 01:31:43 -0700 (PDT)
Received: from [128.224.162.142] (128.224.162.142) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 23 Apr 2014 01:31:42 -0700
Message-ID: <53577A6C.9050006@windriver.com>
Date: Wed, 23 Apr 2014 16:31:40 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1398058983.git.wenzong.fan@windriver.com>	<751e6bee2f8bcfd9c78ad2b03a9f8b007abe028a.1398058983.git.wenzong.fan@windriver.com>
	<20140421075832.GV2486@jama>
In-Reply-To: <20140421075832.GV2486@jama>
Subject: Re: [meta-networking][PATCH 1/2] vsftpd: fix install warning - [withdrawn]
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
X-List-Received-Date: Wed, 23 Apr 2014 08:31:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2014 03:58 PM, Martin Jansa wrote:
> On Mon, Apr 21, 2014 at 01:53:27AM -0400, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> WARNING: QA Issue: vsftpd: Files/directories were installed but not shipped
>>    /run
>>    /run/vsftpd
>>    /run/vsftpd/empty
>
> I'm glad to see fix for QA, but I don't think that everybody is using
> populate-volatile.sh for volatiles (e.g. images with systemd).

Good point, while I searching the thread I found there's another patch 
tried to process this issue but still not merged:

[oe] [meta-networking][PATCH] vsftpd: install volatiles file based on 
init system

I withdraw my patch and waiting for the upstream fixes:)

Thanks
Wenzong

>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |    9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>> index 0698a63..2cf9ac3 100644
>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
>> @@ -70,7 +70,6 @@ do_install() {
>>           sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
>>           sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
>>       fi
>> -    install -d ${D}${localstatedir}/run/vsftpd/empty
>>   }
>>
>>   INITSCRIPT_PACKAGES = "${PN}"
>> @@ -82,3 +81,11 @@ USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp
>>                          --shell /bin/false ftp "
>>   GROUPADD_PARAM_${PN} = "-r ftp"
>>
>> +pkg_postinst_${PN}() {
>> +	if [ -n "$D" ]; then
>> +		exit 0
>> +	fi
>> +	if [ -e /etc/init.d/populate-volatile.sh ]; then
>> +		/etc/init.d/populate-volatile.sh update
>> +	fi
>> +}
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

