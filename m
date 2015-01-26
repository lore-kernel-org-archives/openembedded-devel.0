Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADC0660017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 02:48:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q2mlVS008042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 18:48:47 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 18:48:47 -0800
Message-ID: <54C5AB0E.90303@windriver.com>
Date: Mon, 26 Jan 2015 10:48:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1422236615.git.liezhi.yang@windriver.com>	<f4602e4bf5592cf3e39c5897c1ea935972614aaa.1422236615.git.liezhi.yang@windriver.com>
	<54C5A48C.5000609@gmail.com>
In-Reply-To: <54C5A48C.5000609@gmail.com>
Subject: Re: [meta-networking] [PATCH 4/5] wireshark: add PACKAGECONFIG for geoip
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
X-List-Received-Date: Mon, 26 Jan 2015 02:48:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/26/2015 10:21 AM, akuster808 wrote:
>
> Robert,
>
> thanks.
>
> I think there is a fix for this sitting in the patch queue.
>
> also there is an update pending in master-next for 1.12.3

Thanks, we can drop this patch, then.

// Robert

>
> - armin
>
> On 01/25/2015 05:45 PM, Robert Yang wrote:
>> Fixed:
>> epan/dissectors/packet-ip.c:56:19: fatal error: GeoIP.h: No such file or
>> directory
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-support/wireshark/wireshark_1.12.2.bb  |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
>> b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
>> index 5740730..4fd519e 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
>> @@ -36,6 +36,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>>   PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>>   PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>>   PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
>> +PACKAGECONFIG[geoip] = "--with-geoip, --without-geoip, geoip"
>>
>>   EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark
>> --with-c-ares=no"
>>
>>

