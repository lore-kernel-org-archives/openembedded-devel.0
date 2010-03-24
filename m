Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1NuKLA-00058f-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 07:45:22 +0100
Received: from [192.168.1.12] (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 5247A304B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 02:42:08 -0400 (EDT)
Message-ID: <4BA9B440.2050608@zenlinux.com>
Date: Tue, 23 Mar 2010 23:42:08 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B99791E.1020102@zenlinux.com> <4BA981A5.5030609@zenlinux.com>
	<19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
In-Reply-To: <19c1b8a91003232245y3409bca3p4b74ab5562424b5c@mail.gmail.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 5247A304B8.3DE53
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND sdk vs. nativesdk
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
X-List-Received-Date: Wed, 24 Mar 2010 06:45:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2010 10:45 PM, Khem Raj wrote:
>> It seems to me the correct course of action is to use nativesdk in
>> BBCLASSEXTEND and rename the dependencies on other recipes, yes?
>
> you should rename the dependencies on zlib-sdk to zlib-nativesdk
> wherever they exist.

Khem: Thanks for the confirmation.

I am running into some problems now trying to get zlib-nativesdk to 
build. If I change the recipe to use sdk, it builds fine, so I have 
something useful to compare things to.

When I build using nativesdk, configure dies pretty quickly when testing 
the compiler. It's trying to run i686-linux-gcc.

Sure enough, if I compare the BitBake environments using the -e option, 
I see that CC is being set to "gcc" when I use sdk but "i686-linux-gcc" 
when I use nativesdk.

If I create the needed symlink to gcc, the compilation gets further but 
still fails, wanting i686-linux-ar, etc. So I have a basic understanding 
of what the problem is, but I'm sure the solution is not to go symlink 
crazy with my native compiler environment.

So I took a look at sdk.bbclass and nativesdk.bbclass. They both set up 
a number of architecture-specific variables, but neither of them 
explicitly set CC. Where I should look next?

It turns out there is only one package currently in OE that uses 
BBCLASSEXTEND with nativesdk (gettext_0.17). So perhaps it is the case 
that nativesdk.bbclass needs additional work. I did test copying over 
Poky's nativesdk.bbclass (which has just a few differences), but I still 
get the same results.

Thanks,

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


