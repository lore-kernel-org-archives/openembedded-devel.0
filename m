Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (unknown [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id C9AE265D5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 19:56:36 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 516EFF8119A; Tue, 20 May 2014 13:56:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5D7B2F81199;
	Tue, 20 May 2014 13:56:35 -0600 (MDT)
Message-ID: <537BB387.6090507@mlbassoc.com>
Date: Tue, 20 May 2014 13:56:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20140520190315.GA32657@windriver.com>
	<CAMKF1soVNe6OpNDX3C74awa1=vzP=wQpvcGYZ9y3=8FJVbzM3Q@mail.gmail.com>
In-Reply-To: <CAMKF1soVNe6OpNDX3C74awa1=vzP=wQpvcGYZ9y3=8FJVbzM3Q@mail.gmail.com>
Subject: Re: [meta-oe] [PATCH] nodejs needs python-native
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
X-List-Received-Date: Tue, 20 May 2014 19:56:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-20 13:28, Khem Raj wrote:
> On Tue, May 20, 2014 at 12:03 PM, Amy Fong <amy.fong@windriver.com> wrote:
>> -DEPENDS = "openssl"
>> +DEPENDS = "openssl python-native"
>>
>
> may be it should inherit pythonnative
>
>>   SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
>>              file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
>> @@ -28,6 +28,7 @@ do_configure () {
>>
>>   do_compile () {
>>       export LD="${CXX}"
>> +    export PATH=${STAGING_BINDIR_NATIVE}/python-native:$PATH

If you inherit pythonnative, this 'export PATH...' is also not necessary

>>       make BUILDTYPE=Release
>>   }
>>
>> @@ -40,3 +41,5 @@ RDEPENDS_${PN}_class-native = ""
>>
>>   FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
>>   BBCLASSEXTEND = "native"
>> +
>> +FILES_${PN} += "/usr/lib/*"
>
> make it ${libdir}/* here
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

