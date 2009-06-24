Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MJRch-00062g-0Q
	for openembedded-devel@openembedded.org; Wed, 24 Jun 2009 14:30:43 +0200
Received: (qmail 32716 invoked by uid 107); 24 Jun 2009 12:19:21 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 24 Jun 2009 14:19:21 +0200
Message-ID: <4A4219C9.2090306@epfl.ch>
Date: Wed, 24 Jun 2009 14:19:21 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4A3BB88C.5010504@epfl.ch> <4A41BE26.3040102@tait.co.nz>
In-Reply-To: <4A41BE26.3040102@tait.co.nz>
Subject: Re: [RFC] cmake cross-compilation paths
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
X-List-Received-Date: Wed, 24 Jun 2009 12:30:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Douglas Royds wrote:
> Perhaps you need:
> 
>     -DCMAKE_FIND_ROOT_PATH="${STAGING_DIR_HOST};${STAGING_DIR_NATIVE}" 

Thank you for your input, I had come to the same value. I think this 
should be the default behaviour for cmake, and this should be pushed to 
cmake.bbclass.

It still does not work for the FindQt4 module, but this is due to the 
fact that the PATHS qmake searches for libraries and headers in are 
define at COMPILE time and cannot be changed with this value.

Val

> 
> Douglas.
> 
> 
> Valentin Longchamp wrote:
>> Hello,
>>
>> I am trying to build cmake based programs that use QT with 
>> Openembedded. The actual support for cmake in OE worked until now that 
>> I only had "simple" dependencies. Now with QT as as dependency, I use 
>> the cmake FindQt4 Module that strongly relies on qmake to find the 
>> different QT cmake variables (try to run ${STAGINGBINDIR}/qmake4 -query).
>>
>> The problem is that FindQt4 does not find the qmake4 (as I have 
>> proposed to rename it like that in my patch from yesterday) since the 
>> CMAKE_FIND_ROOT_PATH given to the cmake cmd in the 
>> classes/cmake.bbclass only is set to
>>
>> -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST}
>>
>> that does not include ${STAGING_BIN_DIR}. Setting it to
>>
>> -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR}
>>
>> makes configure fail (it cannot find the needed header files); and with
>>
>> -DCMAKE_FIND_ROOT_PATH="${STAGING_DIR_HOST};${STAGING_DIR}"
>>
>> qmake4 is not found either.
>>
>> So if someone who knows cmake better than me can tell me how to give 
>> two paths to a cmd -DPATH_NAME=VALUE1 VALUE2 for cmake (and what would 
>> be the equivalent to STAGING_DIR_HOST for ${STAGING_DIR}/i686-linux in 
>> my case) that would help a lot (I am not sure it can be achieved).
>>
>> All the inputs are greatly appreciated and if you could help me for 
>> the OE var names (especially for the equivalent to ${STAGING_DIR_HOST} 
>> that would point to ${STAGING_DIR}/i686-linux, that would already be a 
>> good start)
>>
>> Thanks a lot
>>


-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


