Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GN9s1-0002TV-Pd
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 17:08:17 +0200
Received: from [145.253.107.2] (helo=[192.168.61.154])
	by coruscant.onosendai.de with esmtpsa (TLS-1.0:RSA_ARCFOUR_SHA1:16)
	(Exim 4.60) (envelope-from <freyther@inf.fu-berlin.de>)
	id 1GN9oh-00062j-9n for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 17:04:51 +0200
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <200609121630.39520.christopher.lang@chl-informatik.de>
References: <200609121630.39520.christopher.lang@chl-informatik.de>
X-Gpgmail-State: !signed
Message-Id: <055A7B53-12FA-4B78-88F9-9F65132BE966@inf.fu-berlin.de>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Tue, 12 Sep 2006 17:03:23 +0200
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.2)
X-Broken-Reverse-DNS: no host name found for IP address 145.253.107.2
Subject: Re: relative paths in Openembedded/bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2006 15:08:17 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 12.09.2006 um 16:30 schrieb Christopher Lang:

>
>> From what I can see all paths in OE/bitbake are absolute paths.  
>> This makes it
> difficult to move an OE build directory to another location.
>
> Questions:
>
> - which paths in which files do I need to change to move an entire  
> build
> directory? (conf files of course, any other files?)
>
> - Is it possible to set up an OE build directory based on relative  
> paths?
>
> - If the 2nd question was answered with no, are there any plans to  
> enable
> OE/bitbake to be able to handle an entire build directory with  
> relative
> paths?
>


Hi,

take a look at bugs.openembedded.org as we have a bug for that  
already. Let us take a look at the first package we build:
	quilt-native
		Quilt runs autoconf and hardcodes absolute paths into its scripts.

So after building the first package you may not move your tree  
anymore.  You could symlinks and see how far you get but I think I  
remember difficulties with that.

I think we have three uses cases here:
	- Share one Build tree between multiple Operating Systems and Users
	- Move and avoid rebuilding

Both have the same issues: One is the packages we have built require  
the absolute path e.g. hardcoded filenames (like quilt), hardcoded  
rpath to the native staging libdir. And one could be BitBake  
(unlikely though).

h.





