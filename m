Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id CEA32731D7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 16:38:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f144so10040550pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 09:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=OK1qPP2SpUAJCVHOBqcN9aijP3kLfOIgDsApc1M9v/w=;
	b=S8qqTqTMUvlDpNhSC4KUiNDGnul++G24uVZZhGhFAOMPnBtoAfPPD52GCHHZ8VM2JW
	jOCWmLjfHFd36cHtheM5pw4YwLoLAjyGbgAB40RbelEwvVQcQudjPcnYE7fp8u8Raa9z
	H3ulxxQ2IEeqddV9lUkhsRLuxDg5pzNqvAkBWY0/63ZnwO2UVjv77bWl0uEwE02yabju
	1TrtnE1dSEsuRZVbtQ3fh8Y8oN4qMOatzubRIvMiwHbWkCCAjfvMPglwvpcCoruLOjVe
	Y+NbuB8JCUSjR3pf/GQFqCY+tjseGPl3YzwPsCkhHvIWC8qPhEFGsdEb/qiU69fAWr6k
	0KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=OK1qPP2SpUAJCVHOBqcN9aijP3kLfOIgDsApc1M9v/w=;
	b=kazBI3eEIZ6loB150NaLmC1mU5tSE3TvOnREkYghedb2bgA1rOcK9Gtu6g5YHZr5d9
	Qts0zY5PAHAioVGiDguQ1QFy6I3mMNPmXyRfr3DNBrLagvWTB5aRkO3s1ZEZr6xAomy0
	H9wMZoR4WwloTKorj4Rekb5mNNo+9Tjz5MXM3YsUbAtjEt8ZE+8HFhDKN0dI1ACZcfYS
	3xBS8x3Mhq3cHECtUDO9Bdt0nG5sWGFZcdKkXJq7ATnVWK5veMYUARqfGyJdGExGds8S
	KUQXAxWPE5mGbMhp4yE5v1AlTrrmIJB0HLd1QGAIghl30h+5PtY/onUFlv96YfduWztR
	ZmTA==
X-Gm-Message-State: ALyK8tIUOlTsK9QpbBCTzKT1BKoDHcJ7fZESYv4B+10aXMsHOWuc5gqm3t0Ij7xa2Br1jA==
X-Received: by 10.98.89.207 with SMTP id k76mr32320750pfj.166.1464453511773;
	Sat, 28 May 2016 09:38:31 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	tn7sm36336501pac.29.2016.05.28.09.38.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2016 09:38:30 -0700 (PDT)
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1464359669-14962-1-git-send-email-akuster808@gmail.com>
	<nibk7a$fm1$1@ger.gmane.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5749C97D.6050809@gmail.com>
Date: Sat, 28 May 2016 09:38:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <nibk7a$fm1$1@ger.gmane.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][master][krogoth][PATCH] dvd-apps: Fix several QA WARNINGS
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
X-List-Received-Date: Sat, 28 May 2016 16:38:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 05/28/2016 01:17 AM, Koen Kooi wrote:
> Op 27-05-16 om 16:34 schreef Armin Kuster:
>> Example: WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: 
>> /usr/bin/dvbdate contained in package dvbdate requires libucsi.so, but
>> no providers found in RDEPENDS_dvbdate? [file-rdeps] WARNING: 
>> dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbtraffic contained 
>> in package dvbtraffic requires libdvbapi.so, but no providers found in 
>> RDEPENDS_dvbtraffic? [file-rdeps] WARNING: dvb-apps-1.1.1-r0 
>> do_package_qa: QA Issue: /usr/bin/dvbscan contained in package dvb-scan 
>> requires libdvbapi.so, but no providers found in RDEPENDS_dvb-scan? 
>> [file-rdeps] WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: 
>> /usr/bin/gotox contained in package dvb-apps requires libdvbapi.so, but 
>> no providers found in RDEPENDS_dvb-apps? [file-rdeps] WARNING: 
>> dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/femon contained in 
>> package dvb-femon requires libdvbapi.so, but no providers found in 
>> RDEPENDS_dvb-femon? [file-rdeps] WARNING: dvb-apps-1.1.1-r0 
>> do_package_qa: QA Issue: /usr/bin/dvbnet contained in package dvbnet 
>> requires libdvbapi.so, but no providers found in RDEPENDS_dvbnet? 
>> [file-rdeps]
>>
>> and WARNING: dvb-apps-1.1.1-r0 do_package_qa: QA Issue: /usr/bin/dvbscan 
>> contained in package dvb-scan requires libdvbcfg.so, but no providers 
>> found in RDEPENDS_dvb-scan? [file-rdeps] WARNING: dvb-apps-1.1.1-r0 
>> do_package_qa: QA Issue: /usr/bin/gotox contained in package dvb-apps 
>> requires libdvbapi.so, but no providers found in RDEPENDS_dvb-apps? 
>> [file-rdeps]
> 
> This shows that OE adds RDEPENDS automagically but can't find the matching
> RPROVIDERS, so ....
> 
> 
>> Signed-off-by: Armin Kuster <akuster808@gmail.com> --- 
>> meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb | 10 ++++++++++ 1 
>> file changed, 10 insertions(+)
>>
>> diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb 
>> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb index 
>> 1c0d686..d6465d7 100644 --- 
>> a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb +++ 
>> b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb @@ -63,6 +63,9 
>> @@ PACKAGES =+ "dvb-evtest dvb-evtest-dbg \ dvb-femon dvb-femon-dbg \ 
>> dvb-zap-data"
>>
>> +# Expose the packages from the above spitting +PACKAGES =+ "libdvbapi 
>> libdvbcfg libdvben50221 \ +             libesg libucsi libdvbsec"
> 
> ... this would fix that, but ..
> 
>> FILES_${PN} = "${bindir} ${datadir}/dvb" FILES_${PN}-doc = "" @@ -104,3 
>> +107,10 @@ FILES_dvb-femon = "${bindir}/femon" FILES_dvb-femon-dbg = 
>> "${bindir}/.debug/femon"
>>
>> FILES_dvb-zap-data = "${docdir}/dvb-apps/szap" + +RDEPENDS_dvbdate =+ 
>> "libdvbapi libucsi" +RDEPENDS_dvbtraffic =+ "libdvbapi" 
>> +RDEPENDS_dvb-scan =+ "libdvbapi libdvbcfg libdvbsec" +RDEPENDS_dvb-apps 
>> =+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi" 
>> +RDEPENDS_dvb-femon =+ "libdvbapi" +RDEPENDS_dvbnet =+ "libdvbapi"
> 
> ... this part isn't needed since the QA issue above wouldn't have triggered
> otherwise.

Remove the above RDEPENDS and warnings came back. I must be
misunderstanding something.

- armin
> 
> regards,
> 
> Koen
> 
> 

