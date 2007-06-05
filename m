Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1HveiE-00067J-1x
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2007 21:29:02 +0200
Received: from pd953b096.dip0.t-ipconnect.de ([217.83.176.150]
	helo=olympus.klever.net)
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1HveTa-0006VM-Kg for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2007 21:13:54 +0200
Message-ID: <4665B5F5.6020202@klever.net>
Date: Tue, 05 Jun 2007 21:13:57 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.0 (X11/20070527)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>	<73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>	<ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>	<4663C0AC.7020804@dominion.kabel.utwente.nl>	<ae36f8040706040555s79d65114r57f7f514c6c746d5@mail.gmail.com>	<46641153.2050207@dominion.kabel.utwente.nl>	<ae36f8040706051004j24debcd0g397143693f2f1285@mail.gmail.com>
	<ae36f8040706051136h36f72d93wd6c4df2845018c8a@mail.gmail.com>
In-Reply-To: <ae36f8040706051136h36f72d93wd6c4df2845018c8a@mail.gmail.com>
X-Enigmail-Version: 0.95.0
Subject: Re: problems doing bitbake task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2007 19:29:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

My guess is that you want to upgrade to bitbake 1.8 or search ml for a
patch for 1.6.

Love,
H

Luís Cargnini wrote:
> I have achieved the following error messages, after task-base:
> 
> ERROR: Can not check RPATH, scanelf (part of pax-utils-native) not found
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.20.bb
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.20.bb
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.20.bb
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> ERROR: Error in executing:
> /home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.20.bb
> ERROR: Exception:exceptions.SystemExit Message:1
> ERROR: Printing the environment of the function
> 
> 
> On 6/5/07, Luís Cargnini <lvcargnini@gmail.com> wrote:
>> ok commented, cleaned the tmp using rm -rf and doing bitbake task-base
>> righ now
>>
>> On 6/4/07, Koen Kooi < koen@dominion.kabel.utwente.nl> wrote:
> Luís Cargnini schreef:
>>>>> maybe because of this configuration lines:
>>>>> #ASSUME_PROVIDED += "/opt/eldk/usr/bin"
>>>>> ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
>>>>> ASSUME_PROVIDED += " virtual/glibc "
>>>>> # Select between multiple alternative providers, if more than one is
>>>>> eligible.
>>>>> PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
>>>>> PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
>>>>> PREFERRED_PROVIDERS += "
>>>>> virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
>>>>> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
>>>>> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
> Yes, remove all of those.
>>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
>> --
>>
>> ------------------------------------------------------------------------------
>> Thanks && Regards
>> Msc. Bsc. Luís Vitório Cargnini
>> IEEE Member
>> Electrical Engineer Faculty @ PUCRS
>> Ipiranga Avenue, 6681 – Building 30
>> P.O. Box: 90619-900 – Porto Alegre/RS
>> Phone: +55 51 3320 3500  extension: 7696
>> ---------------------------------------------------------------------------------
>>
>>



