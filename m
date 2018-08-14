Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C560078F5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:09:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h14-v6so16532853wrw.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=yajfi09wolKxzWRF3lagAc7wzHAY8wQMIFCPCECHrQY=;
	b=vYikrvkggKQcKY3EyIA/djzufRV/JT88lK0HqYnE4AW47TRTAPUem792RAYvB1k/+V
	aT9rFXcK9b1DNVFL2VqpHwgql8XPP7ZKwYo+ZagMnho0HHfrWLbYP6mX2L0gyjll6i7/
	g5yzqdSa9t42WRW3EW2YNLXoMcxxXX8utncLDQZJF33FzKPC3n8jRL4TpZrpC/BotPUD
	GLOvkQmvZe0kDR1YaZOHzC05TyXTKbMt7joWBRDQUB3PpylkKKlCwreM09xHwJPZFNBp
	ePMd5w75fdoV9/6UFgV0k3a/sa4a3d/IlgNqpxVvkf46ETnVWX+TNhv04SM/kysAxG62
	znZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yajfi09wolKxzWRF3lagAc7wzHAY8wQMIFCPCECHrQY=;
	b=OtOoAyBQ14EBfvEhiYPWqy/x4o1zbLrmW8s6B24P7mhsK7AkdTmhTNMarHaJRaoaP2
	ypT5B222HmDRiWiP9sxtMJmvI2y6PS+gcTO8eiMVe0YdtmUOOVpNgaEJEXQ9NhGFza1/
	cjCUAb5BurbryRGm90iqpggkhFZzMk9delpSLySpCA4FKt/wf+mr9m6C9sQPAd6gxWth
	Nsxz+/wKY+diDoMnxsogCpgL77rLh9ljgxzQi90/l0XQATzazP0kqavzEGrqv3iSUuY3
	QKl5mu5Ds+SYxFjAeeK7jtLSvuraAgUjOur07RZHunWamVIQ/FJvwrf51ZoYxuYOqJ2+
	FCeA==
X-Gm-Message-State: AOUpUlFiD65Ru0dn+T8u7bwy8VLVfk8BnwP3yyuNFX/hUYmI/yuviPNW
	wVJihAr5ZYY0T8anJ1Br0Wvgq7ACXk8=
X-Google-Smtp-Source: AA+uWPwWl5l+MUG/lZBdXP6VMuoFM2s6ssbHEoBsNzJNgXmvxSYxfl4AM+e3Bj+le1xuX7qQCz/83w==
X-Received: by 2002:adf:dc4c:: with SMTP id
	m12-v6mr13722852wrj.84.1534237759099; 
	Tue, 14 Aug 2018 02:09:19 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm23631963wrq.45.2018.08.14.02.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 02:09:18 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>,
	openembedded-devel@lists.openembedded.org
References: <1534178993-13146-1-git-send-email-yevgenyp@pointgrab.com>
	<35140665-b22c-5dbf-4667-34f3fd3e3a06@skidata.com>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <7f00259f-da02-17c0-54cb-344f804e2240@pointgrab.com>
Date: Tue, 14 Aug 2018 12:09:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <35140665-b22c-5dbf-4667-34f3fd3e3a06@skidata.com>
Subject: Re: [meta-java][PATCH] dbus-java: Do not build any documentation
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
X-List-Received-Date: Tue, 14 Aug 2018 09:09:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

Thank you, please find my answers below.
If you are going to accept this, can you consider also applying to sumo?


On 08/14/2018 09:56 AM, Richard Leitner wrote:
> Hi Yevgeny,
> thank you for your patch.
> 
> Please find my comments below.
> 
> On 8/13/18 6:49 PM, Yevgeny Popovych wrote:
>> Support for respective docbook tools has been removed in pyro release.
> 
> Do you have any reference for that?
> It would be great if you could include it here.

Yes, it was removed by commit 4814d93646f6b86aaffbd3fca1af29c8c577db5b
in openembedded-core, which is included since pyro release.

> 
> Is there no alternative to removing the manpages?

Nothing I can think of.. and it's probably not a huge loss.
For instance, before removing SGML stack Alexander Kanavin 
removed man pages for iputils (58ac4da13cf32e1c8484d1a6ac51f0f439a6932c).

> 
>>
>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>> Cc: Henning Heinold <henning@itconsulting-heinold.de>
>> Cc: Maxin John <maxin.john@intel.com>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> Cc: Richard Leitner <richard.leitner@skidata.com>
>> ---
>>  recipes-extended/dbus/dbus-java_2.7.bb | 22 ++--------------------
>>  1 file changed, 2 insertions(+), 20 deletions(-)
>>
>> diff --git a/recipes-extended/dbus/dbus-java_2.7.bb b/recipes-extended/dbus/dbus-java_2.7.bb
>> index 4964cf8..0b093a0 100644
>> --- a/recipes-extended/dbus/dbus-java_2.7.bb
>> +++ b/recipes-extended/dbus/dbus-java_2.7.bb
>> @@ -6,7 +6,7 @@ HOMEPAGE = "http://dbus.freedesktop.org/doc/dbus-java"
>>  SECTION = "libs"
>>  LICENSE = "LGPL-2.1 & AFL-2.1"
>>  
>> -DEPENDS = "libmatthew docbook-utils-native docbook-sgml-dtd-4.1-native fastjar-native"
>> +DEPENDS = "libmatthew gettext-native fastjar-native"
>>  RDEPENDS_${PN}-viewer = "java2-runtime libunixsocket-java ${PN}-bin libmatthew-debug-java ${JPN}"
>>  RDEPENDS_${PN}-bin = "java2-runtime libunixsocket-java libmatthew-debug-java ${JPN}"
>>  RSUGGESTS_${JPN} = "libunixsocket-java"
>> @@ -49,15 +49,6 @@ do_compile () {
>>  		JAVAUNIXJARDIR=${datadir_java} \
>>  		JAVAUNIXLIBDIR=${libdir_jni} \
>>  		bin
>> -
>> -	# Generate man pages.
>> -	oe_runmake \
>> -		JAVAC="oefatal \"No Java compilation expected here.\"" \
>> -		JAR="oefatal \"No jar invocation expected here.\"" \
>> -		JARPREFIX=${datadir_java} \
>> -		JAVAUNIXJARDIR=${datadir_java} \
>> -		JAVAUNIXLIBDIR=${libdir_jni} \
>> -		man
>>  }
>>  
>>  JARFILENAME = "${JPN}-${PV}.jar"
>> @@ -73,20 +64,11 @@ do_install () {
>>    install bin/CreateInterface ${D}${bindir}
>>    install bin/ListDBus ${D}${bindir}
>>    install bin/DBusDaemon ${D}${bindir}
>> -
>> -	oe_runmake \
>> -		JAVAC="oefatal \"No Java compilation expected here.\"" \
>> -		JAR="oefatal \"No jar invocation expected here.\"" \
>> -		MANPREFIX=${D}${mandir} \
>> -		DOCPREFIX=${D}${docdir}/${JPN} \
>> -		install-man
>>  }
>>  
>>  # ${JPN} must be last otherwise it would pick up dbus-viewer*.jar
>>  # and dbus-bin*.jar
>> -PACKAGES = "${PN}-viewer ${PN}-viewer-doc ${PN}-bin ${PN}-bin-doc ${JPN}"
>> +PACKAGES = "${PN}-viewer ${PN}-bin ${JPN}"
>>  
>>  FILES_${PN}-viewer = "${datadir}/java/dbus-java-viewer*.jar ${bindir}/DBusViewer"
>> -FILES_${PN}-viewer-doc = "${mandir}/DBusViewer*"
>>  FILES_${PN}-bin = "${datadir}/java/dbus-java-bin*.jar ${bindir}"
>> -FILES_${PN}-bin-doc = "${mandir} ${docdir}/${JPN}"
>>
> 
> regards;Richard.L
> 

--
Sincerely,
Yevgeny Popovych

