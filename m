Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SLBv5-0001DV-FM
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 13:22:31 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E3471F8124B; Fri, 20 Apr 2012 05:13:02 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 185DDF81249;
	Fri, 20 Apr 2012 05:13:02 -0600 (MDT)
Message-ID: <4F9144BE.1070508@mlbassoc.com>
Date: Fri, 20 Apr 2012 05:13:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com>
In-Reply-To: <4F90B056.5020209@gmail.com>
Subject: Re: [oe-core] ld segfault cant figure it out
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
X-List-Received-Date: Fri, 20 Apr 2012 11:22:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-19 18:39, j wrote:
> On 04/18/2012 11:24 PM, Khem Raj wrote:
>> On Wed, Apr 18, 2012 at 8:32 PM, j<vwyodapink@gmail.com> wrote:
>>>> on ubuntu edit /etc/security/limits.conf on build host and then add
>>>> * soft core unlimited
>>
>> btw. reboot your machine after this change is made
>>
>>>> that should generate core files. After this search for core* files in
>>>> build tree
>>>> and see if there are any then debug them with gdb to diagnose it further
>>>>
>>>> Now I am not sure if those segfaults directly relate to malfunction of
>>>> image
>>>> if thats the case but its likely. You should also try to explore the
>>>> reasons why
>>>> the image fails to behave as expected.
>>> I will do as suggested as well as do a full image build again and see if I
>>> can find out all that is not working. Thank you for the extra debugging info
>>> and suggestions. Are there any keywords to search through all the files for
>>> including the normal log files, it may help me track down things even
>>> further.
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> did the reboot went through the build but yet did not produce any core files. But I noticed ulimit was still 0 so changed it to unlimited now and building again, hopefully that
> will get some core dumps. Will post back once I have more info and will separate anything by which machine as even the 2nd borrowed machine segfaults in the same way.

Is your borrowed machine also running ArchLinux?  If so, have
you tried anything else - Ubuntu, Fedora, etc?  As far as I can
tell, you're the only one suffering these problems and also you
seem to be the only one using ArchLinux.

Note: I tried to duplicate your problems here, but I've never used
ArchLinux and it's so primitive and hard to use (compared to what
I use everyday) that I simply don't have the time to mess with it
any more.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


