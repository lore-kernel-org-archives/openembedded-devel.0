Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id C04F66B3A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:51:35 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id g10so210106pdj.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=izb+871BgnOebMfi1yv5MdVDutVlzIld4z6K2ABfifw=;
	b=RdpinzDSFo5+RYKzReSCdqHw6q78byl+XO4WbKNfqTKo0uBYsrejoHlAFGdAAgqksJ
	9AHUzGdYD1VNPf8I5yhhQZqBKEfZgdysqW6g9XyEk+iHd5LYtAurnUJRl721XlZ5FqqO
	3wY7XpkV3eACkI2yU3v28MwB+LJ2lq+qkW968OXOpyY9g376tvRK1/+tcgdOi2t5J9VR
	s7kSa8loUxaYPyJlLoybAP1birq/btewqGQgeF+ECUjdOr14QuGfjmUw9BedGpJfMAHK
	JWRKg00bho46c7XAloKOL/dBnACbmys4zjWrou1DvqOUIGTWet5kLAltgj/RMwIRNmpJ
	5+Eg==
X-Gm-Message-State: ALoCoQnDrD8jQrvrb2ypvrHRxs6jJxJbVudicO2yA+qEaNUlA8eLumKtCFpIAfCbam1rMpooJOwQ
X-Received: by 10.68.201.226 with SMTP id kd2mr68984544pbc.157.1401925895703; 
	Wed, 04 Jun 2014 16:51:35 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	sv10sm15003063pbc.74.2014.06.04.16.51.34 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Jun 2014 16:51:35 -0700 (PDT)
Message-ID: <538FB105.4040607@mvista.com>
Date: Wed, 04 Jun 2014 16:51:33 -0700
From: "akuster@mvista" <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
References: <1401923502-22673-1-git-send-email-akuster@mvista.com>
	<CAP9ODKqPZu_wOQgg05KX_PXWFP68_1J-7PPKu=X4MxL77DFM1g@mail.gmail.com>
In-Reply-To: <CAP9ODKqPZu_wOQgg05KX_PXWFP68_1J-7PPKu=X4MxL77DFM1g@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] radvd: fix install issue for S!=B
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
X-List-Received-Date: Wed, 04 Jun 2014 23:51:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 06/04/2014 04:36 PM, Otavio Salvador wrote:
> On Wed, Jun 4, 2014 at 8:11 PM, Armin Kuster <akuster@mvista.com> wrote:
>> Some files are in "S" that are needed for install.
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   meta-networking/recipes-daemons/radvd/radvd.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
>> index 9e19401..b7353fc 100644
>> --- a/meta-networking/recipes-daemons/radvd/radvd.inc
>> +++ b/meta-networking/recipes-daemons/radvd/radvd.inc
>> @@ -33,6 +33,7 @@ do_install_append () {
>>
>>       install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
>>       # Documentation
>> +    cd ${S}
> Don't 'cd'...
ok.
>
>>       for i in radvd.conf.example README; do \
>>           install -m 0644 $i ${D}${docdir}/radvd; \
>>       done
> Please use:
>
> install -m 0644 ${S}/$i ${D}${docdir}/radvd; \

thanks.

I will sent out V2 shortly.

- Armin
>
>


