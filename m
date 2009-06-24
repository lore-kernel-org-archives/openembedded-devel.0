Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1MJbCR-0002k4-Kf
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 00:44:16 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id C8029468E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 10:33:00 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id E4AC24685Afor 
	<openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2009 10:04:19 
	+1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KLR00201H2N5100@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Thu,25 Jun 2009 10:04:19 +1200 (NZST)
Received: from [172.25.114.21] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KLR003D6JZ43V00@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Thu,25 Jun 2009 10:04:18 
	+1200 (NZST)
Date: Thu, 25 Jun 2009 10:05:49 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <4A422501.9070504@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A42A33D.5060907@tait.co.nz>
MIME-version: 1.0
References: <1245344715-22415-1-git-send-email-valentin.longchamp@epfl.ch><"
	4 A41BA29.3000007"@tait.co.nz> <4A422501.9070504@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
X-imss-version: 2.054
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
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
X-List-Received-Date: Wed, 24 Jun 2009 22:44:16 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Valentin Longchamp wrote:
> Douglas Royds wrote:
>> Any particular reason not to include CMAKE_FIND_ROOT_PATH_MODE_PACKAGE?
>
> Simply because I did not know about it as I based myself on the this 
> doc: http://www.cmake.org/Wiki/CMake_Cross_Compiling and they never 
> talk about this variable. I do not see a lot of references to that 
> variable so I don't think we should set it here.

It's documented at the bottom of the find_package() section of the CMake 
documentation, along with the documentation of CMAKE_FIND_ROOT_PATH:

    http://www.cmake.org/cmake/help/cmake2.6docs.html#command:find_package

I think we should set this one, so long as it doesn't break any existing 
packages. I haven't tested this.

>> Normally this won't have any effect, as CMake will look in the CMake 
>> installation for FindSomething.cmake ("module" mode). But if a 
>> package installs a SomethingConfig.cmake in /usr/share/cmake (the 
>> "config" mode of find_package) we should be looking only in staging, 
>> not trawling around on the host PC.
>
> I agree with you, we should be looking only in staging. But the 
> problem is that with the below proposed option 
> DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY, the OE buids do not work 
> well. You certainly need a few tools from the host PC. That's why I 
> now have CMAKE_FIND_ROOT_PATH_MODE_PROGRAM=BOTH. But the default 
> behaviour with cmake is that the directories listed in 
> CMAKE_FIND_ROOT_PATH are searched for, which is what we want.

True. I suggest that we remove CMAKE_FIND_ROOT_PATH_MODE_PROGRAM from 
your patch below.

>> Valentin Longchamp wrote:
>>> The search is only done in the STAGING directy: all the needed tools
>>> should be there (already built) and all the libs and header are there
>>> too. With this, we are sure that we do not mix with the host libs,
>>> headers or tools.
>>>
>>> Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
>>> ---
>>>  classes/cmake.bbclass |    3 +++
>>>  1 files changed, 3 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
>>> index b5b7b86..af8f3a9 100644
>>> --- a/classes/cmake.bbclass
>>> +++ b/classes/cmake.bbclass
>>> @@ -21,6 +21,9 @@ cmake_do_configure() {
>>>    cmake ${OECMAKE_SOURCEPATH} \
>>>      -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>>>      -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
>>> +    -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=ONLY \
>>> +    -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
>>> +    -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
>>>      ${EXTRA_OECMAKE} \
>>>      -Wno-dev
>>>  }
>>>   


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



