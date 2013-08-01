Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.200])
	by mail.openembedded.org (Postfix) with ESMTP id 40C5A61883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 13:53:33 +0000 (UTC)
Received: from [216.82.241.196:31953] by server-8.bemta-8.messagelabs.com id
	6C/FC-09975-D586AF15; Thu, 01 Aug 2013 13:53:33 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-12.tower-46.messagelabs.com!1375365212!35111407!2
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.9.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26706 invoked from network); 1 Aug 2013 13:53:33 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-12.tower-46.messagelabs.com with RC4-SHA encrypted SMTP;
	1 Aug 2013 13:53:33 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Thu, 1 Aug 2013 08:53:41 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.123.3;
	Thu, 1 Aug 2013 08:53:32 -0500
Received: from [10.101.1.79] (10.101.1.79) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.298.1;
	Thu, 1 Aug 2013 15:53:30 +0200
Message-ID: <51FA6846.1070006@digi.com>
Date: Thu, 1 Aug 2013 15:53:10 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1375364341-35086-1-git-send-email-javier.viguera@digi.com>
	<20130801134749.GP3280@jama>
In-Reply-To: <20130801134749.GP3280@jama>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][dylan][PATCH] vsftpd: fix compile-time dependence
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
X-List-Received-Date: Thu, 01 Aug 2013 13:53:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

I just subscribed to the list so I didn't know it was already fixed.

Anyway:

# git branch -a --contains 46354a697c18a64c5836159adf8dbd92e6547e85

shows that it's only fixed on *master*.

I was bitten by this using stable dylan branches, that's why my patch 
was sent to apply on dylan.

Could this fix be backported to dylan?

-
Regards,

Javier Viguera


On 01/08/13 15:47, Martin Jansa wrote:
> On Thu, Aug 01, 2013 at 03:39:01PM +0200, Javier Viguera wrote:
>> vsftpd links with openssl libraries (libssl and libcrypto) so there is a
>> compile-time dependence on openssl package.
>>
>> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>> ---
>>   meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>> index c02ee9c..f146910 100644
>> --- a/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>> +++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_2.3.5.bb
>> @@ -4,7 +4,7 @@ SECTION = "network"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
>>
>> -DEPENDS = "libcap"
>> +DEPENDS = "libcap openssl"
>>
>
> It was fixed a month ago:
>
> commit 46354a697c18a64c5836159adf8dbd92e6547e85
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Tue Jul 2 20:31:56 2013 +0200
>
>      vsftpd: add missing dependency on openssl
>
> And current vsftpd is 3.0.0:
>
> commit 441502b68d03a4ce7796436a53c5e95399724ad2
> Author: Roy.Li <rongqing.li@windriver.com>
> Date:   Fri Jul 19 10:19:25 2013 +0800
>
>      Upgrade vsftpd to 3.0.0
>
>
>>   SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
>>              file://makefile-destdir.patch \
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


