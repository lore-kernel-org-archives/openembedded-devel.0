Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 620BA65CDB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 01:48:23 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id v10so1359078pde.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 17:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=pJBfwvWbrM9YITcI7qsTrZH/rAlTSQHG4aJ85oAflWw=;
	b=YIRb8a2C1JEh/DO0j/qKFqyfJZh7kXtLMPDhPGm1tMjsR1y8LahrCy39LWyMkOOHrK
	9HC95Fe/TnAAT5ci43XHbnjYhkQbmxe88ZKZPAoMvDFD+Ia9NmFsEbVwwSTJ/jrn/gGu
	Dw4EM7lW2Gi9ZgJ+WYITHx17veLZybKzOf8kuXRgSbQOYRCk7buqPvHkfIL17GmLcE9f
	IfEkDhOourJqWK+g+EasxZ1MuOOc48P9SvVGZ7cqk3wiBeQqeiSb9G5RHMnNyhmrdY7t
	CBWVokRjEfuqMV6uU9XhsAcBQZmhsIJoXGrXBZ6m9CI11v3qf1ZH8/9ZpGqG+GXMCCm6
	7LjA==
X-Received: by 10.66.157.67 with SMTP id wk3mr511877pab.95.1420595304293;
	Tue, 06 Jan 2015 17:48:24 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id in1sm144933pbc.19.2015.01.06.17.48.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 17:48:23 -0800 (PST)
Message-ID: <54AC9065.70108@gmail.com>
Date: Tue, 06 Jan 2015 17:48:21 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1420559960-8518-1-git-send-email-akuster808@gmail.com>	<1420559960-8518-2-git-send-email-akuster808@gmail.com>
	<20150106162610.GA12498@jama>
In-Reply-To: <20150106162610.GA12498@jama>
Subject: Re: [meta-networking][PATCH 1/2] proftpd: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 01:48:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/06/2015 08:26 AM, Martin Jansa wrote:
> On Tue, Jan 06, 2015 at 07:59:19AM -0800, Armin Kuster wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
>> index cba39e8..7d285a0 100644
>> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
>> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
>> @@ -99,4 +99,4 @@ USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --
>>
>>   FILES_${PN} += "/home/${FTPUSER}"
>>
>> -RDEPENDS_${PN} += "perl"
>> +RDEPENDS_${PN} += "perl initscripts-functions"
>
> It's not that simple.

Had to try :)
>
> The initscripts-functions is added to RDEPENDS conditionally based on
> "sysvinit" in DISTRO_FEATURES and INHIBIT_UPDATERCD_BBCLASS.
>
> Adding it explicitly here will pull it to image even for people who
> care only about systemd services (and don't want any iniscripts to
> pollute their startup sequence).

make sense.

>
> See meta/classes/update-rc.d.bbclass

thanks for the reference.
>
> I know we already have one recipe like this:
> meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb:RDEPENDS_${PN} += "initscripts-functions"
>
> but honestly silencing this warning like this does more harm then
> the warning. I think it should be fixed in bbclass, because all
> recipes which inherit it, suffer from this. Maybe by adding another
> VIRTUAL_RUNTIME which can be set to empty when sysv isn't enabled.

k.

Does the 5 second rule count ? or because I touched it I am stuck with 
it ; )

I will take a look.

thanks,
Armin
>
>
>

