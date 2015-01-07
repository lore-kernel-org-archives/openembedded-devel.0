Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEB67201A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 01:42:48 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so1360437pdb.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 17:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=h9tv+V1w8XDuFDQTZk68eSwL28aMsqazRLWLsn6XctI=;
	b=sqVAC4/yfaNRpzKNZZ5OatfUtfvWnuBCagQhoCsUWT08UnbPtGWNTGATLzc4SM+aNS
	NUbjblqfQZmwAeBPn2zdRKwPx0d30I/u7lAQNx1A1GhqYq/UegcniuTknO23egM0YJaM
	jLYz/RmJxLlENKxIpi+9vlvFZtGimhf+8UgerHLoyKE62qsu29cXeEiP828pj6YA3Svg
	6eKrRxKr7Qjrku9hgz6i+4FsD0tmLDX8dNR6uzxuCmYE3Q44Dg4aN+7rMmbPby8gwZgR
	sYLXqPW861FqgXbcMUIj4SN3wL66+KBIW1yvXUnlsj1/vjm2IBFLh7fs/3O1qlFtdrIh
	srQw==
X-Received: by 10.70.44.66 with SMTP id c2mr536845pdm.51.1420594968183;
	Tue, 06 Jan 2015 17:42:48 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id b16sm106887pdj.76.2015.01.06.17.42.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 17:42:47 -0800 (PST)
Message-ID: <54AC8F15.4050800@gmail.com>
Date: Tue, 06 Jan 2015 17:42:45 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1420560067-8617-1-git-send-email-akuster808@gmail.com>
	<20150106162809.GB12498@jama>
In-Reply-To: <20150106162809.GB12498@jama>
Subject: Re: [meta-oe][PATCH 1/2] log4c: fix expat rdepends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 01:42:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/06/2015 08:28 AM, Martin Jansa wrote:
> On Tue, Jan 06, 2015 at 08:01:06AM -0800, Armin Kuster wrote:
>> add --without-expat
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
>> index 43e0746..0e58db7 100644
>> --- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
>> +++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
>> @@ -12,5 +12,7 @@ S = "${WORKDIR}/${PN}-${PV}"
>>
>>   EXTRA_OECONF = "--prefix=/usr"
>>
>> -inherit autotools
>> +PACKAGECONFIG ??=""
>> +PACKAGECONFIG[expat] = ", --without-expat, expat, expat"
>
> Is explicit expat runtime dependency needed when enabled?

This package actual failed to build for me. RDEPENDS by itself did not 
fix the issue, adding DEPENDS did. or at least this is what I remember.. 
wouldn't bet on it thou.

>
> It was detected by dependency test so I don't think so (so it's
> correctly added by shlibs providers when enabled/detected).
>

I will double check.

- armin

>> +inherit autotools
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

