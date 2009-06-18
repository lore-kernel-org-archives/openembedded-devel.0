Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHCgX-0005vV-Km
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 10:09:26 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLF00FLQCU0GP10@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Thu,
	18 Jun 2009 00:58:52 -0700 (PDT)
Message-id: <AEFB95E8-1AB2-4434-B951-376EB891D132@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245310791.29153.146.camel@lenovo.internal.reciva.com>
Date: Thu, 18 Jun 2009 11:58:36 +0400
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
	<4A396EBD.2010207@gmx.net>
	<E701E0BB-B8EC-482B-8808-47449E0FD322@mac.com>
	<1245310791.29153.146.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Thu, 18 Jun 2009 08:09:31 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Phil,
		You're right there is a jamvm-native_1.5.3 recipe. However, there is  
no jamvm_1.5.3.bb recipe. I misread Robert's suggestion and didn't  
realize that he was refering to jamvm-native_1.5.3.

I've been at this problem since Sunday!! :-)

I think there is an order required to do this.

01. build classpath-initial_0.93

02. build classpath-native_0.97.2

and then

03. build classpath-0.98

The system is still building, so I'll know in a couple of minutes. :-)

What definitely doesn't work is classpath-native-0.98, and it's left  
in the oe-repository with a default preference of -1. So, whoever  
submitted that classpath-native-0.98 recipe should not have without  
ensuring that it works!! :-)

I tried enabling classpath-native-0.98 and using classpath-0.98 since  
that would be a matched pair, and that was quite misleading and wasted  
4 days so far !! :-)

Elvis


On Jun 18, 2009, at 11:39 AM, Phil Blundell wrote:

> I think you must be looking at either the wrong repository or an old
> checkout.  The org.openembedded.dev tree does indeed contain
> jamvm-native 1.5.3, see:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/jamvm
>
> You can download the file from the web interface there if you want.
>
> p.
>
>>
>>
>>> If so I am wondering why you are not seeing a recipe for jamvm- 
>>> native
>>> 1.5.3. Such a recipe should be there and work just fine.
>>
>> Both these repositories don't have a jamvm_1.5.3.bb recipe.
>>


