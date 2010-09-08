Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OtPbl-0000jy-6h
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 20:42:58 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OtPb3-0005NA-Lk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 11:42:13 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 8 Sep 2010 11:42:13 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 12:42:11 -0600
Message-ID: <4C87D8FD.9050709@mentor.com>
Date: Wed, 08 Sep 2010 11:42:05 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C874458.3060101@nedap.com>
	<lytym0e69l.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lytym0e69l.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-OriginalArrivalTime: 08 Sep 2010 18:42:11.0778 (UTC)
	FILETIME=[8C917A20:01CB4F85]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cmake-native trouble making
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
X-List-Received-Date: Wed, 08 Sep 2010 18:42:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Enrico Scholz wrote:
> Jaap de Jong <jaap.dejong@nedap.com> writes:
> 
>> $ bitbake cmake-native
>> ////
>> | [ 87%] Building CXX object
>> Source/CMakeFiles/CPackLib.dir/CPack/cmCPackNSISGenerator.o
>> | /usr/bin/ld: cannot find -ltinfo
>> | collect2: ld returned 1 exit status
>> | make[2]: *** [bin/ccmake] Error 1
>> | make[1]: *** [Source/CMakeFiles/ccmake.dir/all] Error 2
>> | make[1]: *** Waiting for unfinished jobs....
>> ////
>>
>> Is cmake-native_2.8.2.bb missing this line:
>>
>>     RDEPENDS = "ncurses-terminfo"
> 
> no, 'DEPENDS = "ncurses-native"'; BUT:
> 
> * it will cause problems on (host)distributions which do not have libtinfo
>   (e.g. RHEL5) and have ncurses-native in their ASSUME_PROVIDED

Isn't the whole point of ASSUME_PROVIDED that user be aware?

> 
> * some hours ago I added a libtermcap.so compatibility symlink to
>   ncurses(-native) so that 5ea3047995421d99f7f3537cb8f9ae23f3185a9f
>   might not be needed anymore

Um, is there a reason this wasn't just done as a ln within the recipe?

-- 
Tom Rini
Mentor Graphics Corporation


