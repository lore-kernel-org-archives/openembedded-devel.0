Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Pwbhq-0004p5-Cj
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 15:46:47 +0100
Received: (qmail 31588 invoked by uid 1003); 7 Mar 2011 14:38:27 -0000
Received: from unknown (HELO ?192.168.128.17?)
	(philip@opensdr.com@70.56.61.235)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	7 Mar 2011 14:38:27 -0000
Message-ID: <4D74EDD8.8080709@balister.org>
Date: Mon, 07 Mar 2011 07:38:16 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W1192DA5D5640002E5C3260D8DE0@phx.gbl>	,
	<BAY127-W206420CDF3284BCE4FAF0CD8C10@phx.gbl>	<BAY127-W1827E1EE86FC2D2EC65922D8C40@phx.gbl>
	<1299424825.28285.20.camel@mattotaupa>
In-Reply-To: <1299424825.28285.20.camel@mattotaupa>
Subject: Re: Linux-libc-headers do_fetch Failed due to cheksum mismatch
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
X-List-Received-Date: Mon, 07 Mar 2011 14:46:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/06/2011 08:20 AM, Paul Menzel wrote:
> Dear Saleh,
>
>
> Am Sonntag, den 06.03.2011, 19:49 +0500 schrieb saleh usman:
>
> […]
>
> please do not insert empty lines at the beginning of messages.
>
>> I am building console-image
>
> What machine do you use?
>
>> and having problem while fetching liunx-libc-headers. do_fetch task is
>> failed due to checksum mismatch. Kindly guide me how to resolve this
>> issue.console log follows
>>
>> NOTE: Running task 16 of 4329 (ID: 678, virtual:native:/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb, do_fetch)
>> NOTE: package linux-libc-headers-native-2.6.31-r6: task do_fetch: Started
>> FATAL: linux-libc-headers-native-2.6.31: http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.tar.bz2 cannot check archive integrity
>> ERROR: Error in executing python function in: /oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
>> ERROR: Exception:<type 'exceptions.SystemExit'>  Message:1
>> ERROR: Printing the environment of the function
>> ERROR: Function base_do_fetch failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of virtual:native:/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb do_fetch failed
>> NOTE: The checksums for '/oe/openembedded/sources/linux-2.6.31.tar.bz2' did not match.
>> Expected MD5: '84c077a37684e4cbfa67b18154390d8a' and Got: '9244b699b966804dfc2e243c89b3ead4'
>> Expected SHA256: '0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c851660e3512' and Got: 'c522e06dc9639473f9962ed49b038ef5577e5d10cd2f4d9e4c62cdf3223de089'
>> NOTE: Your checksums:
>> SRC_URI[md5sum] = "9244b699b966804dfc2e243c89b3ead4"
>> SRC_URI[sha256sum] = "c522e06dc9639473f9962ed49b038ef5577e5d10cd2f4d9e4c62cdf3223de089"
>>
>> FATAL: linux-libc-headers-native-2.6.31: http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.tar.bz2 cannot check archive integrity
>
> As you can see in the recipe [1] and read in the user manual each
> downloaded file has a checksum to check the validity. The file you got
> seems to be corrupt, since the checksums in the recipes [1] are also the
> ones I got.
>
>          $ wget http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.tar.bz2
>          --2011-03-06 16:09:49--  http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.tar.bz2
>          Auflösen des Hostnamen kernel.org... 130.239.17.4, 149.20.4.69, 149.20.20.133, ...
>          Verbindungsaufbau zu kernel.org|130.239.17.4|:80... verbunden.
>          HTTP-Anforderung gesendet, warte auf Antwort... 200 OK
>          Länge: 61494822 (59M) [application/x-bzip2]
>          In »linux-2.6.31.tar.bz2« speichern.
>
>          100%[======================================>] 61.494.822  1,29M/s   in 46s
>
>          2011-03-06 16:10:35 (1,28 MB/s) - »linux-2.6.31.tar.bz2« gespeichert [61494822/61494822]
>
>          $ md5sum linux-2.6.31.tar.bz2
>          84c077a37684e4cbfa67b18154390d8a  linux-2.6.31.tar.bz2
>          $ sha256sum linux-2.6.31.tar.bz2
>          0acd83f7b85db7ee18c2b0b7505e1ba6fd722c36f49a8870a831c851660e3512  linux-2.6.31.tar.bz2
>
> So something has gone wrong when the file was downloaded to your system.
> I suggest to delete `linux-2.6.31.tar.bz2` from your download directory
> and try again.

Don't forget to delete the linux-2.6.31.tar.bz2.md5sum file from the 
same directory. (I think I have the extension right)

Philip

>
>
> Thanks,
>
> Paul
>
>
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb?id=9f1368c60dcef32eb965c0f9ecb81c4adc4f49c5#n27
> [2] http://docs.openembedded.org/usermanual/usermanual.html#src_uri_variable
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


