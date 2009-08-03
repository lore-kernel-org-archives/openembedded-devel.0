Received: from [17.148.16.95] (helo=asmtpout020.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MY38e-0007Hq-2l
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Aug 2009 21:24:04 +0200
MIME-version: 1.0
Received: from [87.201.169.28] by asmtp020.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KNT008QWEHU50Q0@asmtp020.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	03 Aug 2009 12:08:30 -0700 (PDT)
Message-id: <B223B8BA-6476-4546-B5CD-B268582BA7EA@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
In-reply-to: <h574q8$s8u$1@ger.gmane.org>
Date: Mon, 03 Aug 2009 23:07:37 +0400
References: <B7AB64EE-A236-4ABD-A033-A737F5663F09@mac.com>
	<h574q8$s8u$1@ger.gmane.org>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Deleting target specific folders from tmp directory
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
X-List-Received-Date: Mon, 03 Aug 2009 19:24:04 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Koen,

On Aug 3, 2009, at 8:55 PM, Koen Kooi wrote:

> Yes, you made the kernel version go backwards, which is a VERY bad  
> thing to do in the OE world where we use package management for  
> nearly everything image related.
> The only safe route here is a complete rebuild from scratch.

Before I switch kernel versions, I execute a

bitbake -c clean linux-omap3-2.6.31

and then start working on linux-omap3-2.6.29

Shouldn't that remove all the older linux kernel version artifacts.  
For a build system, you should be able to go back and forward with  
respect to versions, not only keep moving forward.

In this particular scenario, the reason I have to switch between  
kernel versions is omap-pm and dss2. I'm trying to get a proper power  
management infrastructure working with linux-omap3-2.6.29, modified to  
work with android. There is not much active development on pm for  
v2.6.29.

v2.6.31 has integrated pm and dss2 support, but I have issues with  
DSS2 not working for some reason with android-2.6.31. Hence, I keep  
having to shuttle back and forth trying new patches, testing a few  
things out.

The release that I make to my customer is v2.6.29, however, my  
experiments take me to v2.6.31.

Elvis




