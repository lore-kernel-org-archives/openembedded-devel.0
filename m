Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2A32D71AE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 21:09:19 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i85so20600067pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=AsXw8AzVIBL+BIlMauIYboR9c24XN7mAEqEG0ghfvaE=;
	b=RliwqrT0yBruHtX5VJSWHFnJgJpcXK5wuYK1otbWnw9CsB5bP3wkftV0KPZjLY7JEv
	HfFdj6aQa29LXRzRIdtG7uE5KSeB+ik7sC76vRWkzHX35LwN2HlSUdGYfM/IdKFov74L
	IMMEDJSLcUVHxHtwEb5lWxD1qMicfYONReED95TrZYBqT/BE4uzjdhf5hM8HKUKvNjSs
	Nf3uahoAX+0r6VnbawE/3EAwaxuvGcMejH4Zc7QeVKRUu0rSHC+bcDF7QdMaOplafJwJ
	8qDHpP67TvXrqUJD/cdM3iFxXO8hhgYtPaHuizIY8CYG3OJrWsr2ajvPaEOtO+Boo2ba
	M2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=AsXw8AzVIBL+BIlMauIYboR9c24XN7mAEqEG0ghfvaE=;
	b=Q/JbRobCA2iLzrmOBxNW86ddr5CI6qP6OE5IWVT6vyy/gFOQiv8lkEHwU72KqlYyMa
	6MPMnfiBxjZOygDF4GhJqvrUz6iuJraxR1lyfJ/scE6hoBc11wgOpsRae4oNOxQZ7Izo
	Tbwv18hyhxcbunfGLAog5Mw7+RyjMDp3DvIhvxVrBFjFl4htLzhHSfRMuTKlBqWDc9NF
	G4fq6Qtoff5Xy2DfagUXE9YkivKlijq3LPrBshNBMWkLExS1tRzPwPBhWWAY1GufBh+y
	Wh8thqauOxztITOqw77eRcLEn/2FzKxumRXNClACPPye3DScoVtpaqMUmB21ti+HFZO0
	UsQQ==
X-Gm-Message-State: ABUngvcmH+4Fs23lqVB9FMUGlIdPtnWXefHT9Q9oNWvSbeGfVvxw05tiVh69riMI4Yva7w==
X-Received: by 10.99.1.23 with SMTP id 23mr35810230pgb.37.1477429760308;
	Tue, 25 Oct 2016 14:09:20 -0700 (PDT)
Received: from [10.22.11.115] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	xo5sm35584573pab.13.2016.10.25.14.09.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Oct 2016 14:09:19 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1476836925-14631-1-git-send-email-akuster808@gmail.com>
	<20161025133334.GE2911@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <231231d2-f2b2-448c-a9f3-0304cca5daca@gmail.com>
Date: Tue, 25 Oct 2016 14:09:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161025133334.GE2911@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] wireshark: install missing header files
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
X-List-Received-Date: Tue, 25 Oct 2016 21:09:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/25/2016 06:33 AM, Martin Jansa wrote:
> On Tue, Oct 18, 2016 at 05:28:45PM -0700, Armin Kuster wrote:
>> Wireshark does not install header files. add install_append
>> Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer needed
> There is also:
> wireshark-2.2.1: wireshark rdepends on libssh, but it isn't a build
> dependency, missing libssh in DEPENDS or PACKAGECONFIG? [build-deps]
>
> Probably not caused by this change, but one of previous 2 upgrades.

k, thanks.

Will look in this.
Armin
>
>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../recipes-support/wireshark/wireshark_2.2.1.bb   | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
>> index a5fb7f6..f7d7927 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
>> @@ -43,7 +43,23 @@ PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
>>   
>>   EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
>>   
>> -ALLOW_EMPTY_${PN} = "1"
>> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +# Currently wireshark does not install header files
>> +do_install_append () {
>>   
>> -FILES_${PN} += "${datadir}*"
>> +	install -d ${D}/${includedir}/${BPN}
>> +	install -d ${D}/${includedir}/${BPN}/epan
>> +	install -d ${D}/${includedir}/${BPN}/epan/crypt
>> +	install -d ${D}/${includedir}/${BPN}/epan/dfilter
>> +	install -d ${D}/${includedir}/${BPN}/epan/dissectors
>> +	install -d ${D}/${includedir}/${BPN}/epan/ftypes
>> +	install -d ${D}/${includedir}/${BPN}/epan/wmem
>> +
>> +	install config.h ${D}/${includedir}/${BPN}
>> +	install ${S}/register.h ${D}/${includedir}/${BPN}
>> +	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
>> +	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
>> +	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
>> +	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/dissectors
>> +	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
>> +	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
>> +}
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


