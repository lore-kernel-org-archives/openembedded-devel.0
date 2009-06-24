Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MJSMv-0007D8-1D
	for openembedded-devel@openembedded.org; Wed, 24 Jun 2009 15:18:29 +0200
Received: (qmail 11430 invoked by uid 107); 24 Jun 2009 13:07:13 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 24 Jun 2009 15:07:14 +0200
Message-ID: <4A422501.9070504@epfl.ch>
Date: Wed, 24 Jun 2009 15:07:13 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1245344715-22415-1-git-send-email-valentin.longchamp@epfl.ch>
	<4A41BA29.3000007@tait.co.nz>
In-Reply-To: <4A41BA29.3000007@tait.co.nz>
Subject: Re: [PATCH] render cmake search path stricter
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
X-List-Received-Date: Wed, 24 Jun 2009 13:18:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Douglas Royds wrote:
> Any particular reason not to include CMAKE_FIND_ROOT_PATH_MODE_PACKAGE?

Simply because I did not know about it as I based myself on the this 
doc: http://www.cmake.org/Wiki/CMake_Cross_Compiling and they never talk 
about this variable. I do not see a lot of references to that variable 
so I don't think we should set it here.

> 
> Normally this won't have any effect, as CMake will look in the CMake 
> installation for FindSomething.cmake ("module" mode). But if a package 
> installs a SomethingConfig.cmake in /usr/share/cmake (the "config" mode 
> of find_package) we should be looking only in staging, not trawling 
> around on the host PC.

I agree with you, we should be looking only in staging. But the problem 
is that with the below proposed option 
DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY, the OE buids do not work well. 
You certainly need a few tools from the host PC. That's why I now have 
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM=BOTH. But the default behaviour with 
cmake is that the directories listed in CMAKE_FIND_ROOT_PATH are 
searched for, which is what we want.

Val

> 
> Douglas.
> 
> 
> Valentin Longchamp wrote:
>> The search is only done in the STAGING directy: all the needed tools
>> should be there (already built) and all the libs and header are there
>> too. With this, we are sure that we do not mix with the host libs,
>> headers or tools.
>>
>> Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
>> ---
>>  classes/cmake.bbclass |    3 +++
>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
>> index b5b7b86..af8f3a9 100644
>> --- a/classes/cmake.bbclass
>> +++ b/classes/cmake.bbclass
>> @@ -21,6 +21,9 @@ cmake_do_configure() {
>>    cmake ${OECMAKE_SOURCEPATH} \
>>      -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>>      -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
>> +    -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY \
>> +    -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
>> +    -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
>>      ${EXTRA_OECMAKE} \
>>      -Wno-dev
>>  }
>>   
-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


