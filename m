Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PHLXm-0007wT-Ab
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 20:13:50 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1PHLWl-0007Mq-CX from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 11:12:43 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sat, 13 Nov 2010 11:12:43 -0800
Received: from [172.30.80.225] ([172.30.80.225]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 13 Nov 2010 12:12:42 -0700
Message-ID: <4CDEE328.6060307@mentor.com>
Date: Sat, 13 Nov 2010 12:12:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEC95F.1000807@opendreambox.org>	<1288016445-30478-1-git-send-email-obi@opendreambox.org>
	<4CDEBCC5.7050401@opendreambox.org>
In-Reply-To: <4CDEBCC5.7050401@opendreambox.org>
X-OriginalArrivalTime: 13 Nov 2010 19:12:42.0243 (UTC)
	FILETIME=[BEDFC530:01CB8366]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lib_package.bbclass: fix packaging of static libs, inherit binconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Nov 2010 19:13:50 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2010 09:28 AM, Andreas Oberritter wrote:
> Ping
>
> On 10/25/2010 04:20 PM, Andreas Oberritter wrote:
>> * Package ${libdir}/*.a and /lib/*.a into ${PN}-static instead of ${PN}-dev

Where is the FILES_${PN}-static line below?

>> * Although it packaged ${bindir}/*-config into FILES_${PN}-dev, it did
>>    not include the required mangling applied by binconfig.bbclass.

Not sure here.  Not all lib packages need binconfig mangling so it's up 
to the recipe to say "I need this", usually at least.

>>
>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>> ---
>>   classes/lib_package.bbclass |   17 +++++++++--------
>>   1 files changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/classes/lib_package.bbclass b/classes/lib_package.bbclass
>> index 82c9370..7e72dc8 100644
>> --- a/classes/lib_package.bbclass
>> +++ b/classes/lib_package.bbclass
>> @@ -1,10 +1,11 @@
>> +inherit binconfig
>> +
>>   PACKAGES += "${PN}-bin"
>>
>> -FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
>> -	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>> -	    ${base_libdir}/*${SOLIBS} \
>> -	    ${datadir}/${PN} ${libdir}/${PN}"
>> -FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
>> -		${libdir}/*.a ${libdir}/pkgconfig /lib/*.a /lib/*.o \
>> -		${datadir}/aclocal ${bindir}/*-config"
>> -FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
>> +FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>> +            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>> +            ${base_libdir}/*${SOLIBS} \
>> +            ${datadir}/${PN} ${libdir}/${PN}/*"
>> +
>> +FILES_${PN}-bin = "${bindir}/* ${sbindir}/* \
>> +                ${base_bindir}/* ${base_sbindir}/*"
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Tom Rini
Mentor Graphics Corporation


