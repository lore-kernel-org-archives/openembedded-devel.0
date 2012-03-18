Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1S9PzO-0003iC-MR
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 00:58:18 +0100
Received: (qmail 17129 invoked by uid 1003); 18 Mar 2012 23:49:26 -0000
Received: from unknown (HELO ?184.48.57.244?)
	(philip@opensdr.com@184.48.57.244)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	18 Mar 2012 23:49:25 -0000
Message-ID: <4F66747E.504@balister.org>
Date: Sun, 18 Mar 2012 17:49:18 -0600
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <018b01cd0557$8bbd8740$a33895c0$@slingshot.co.nz>
In-Reply-To: <018b01cd0557$8bbd8740$a33895c0$@slingshot.co.nz>
X-Enigmail-Version: 1.1.2
Subject: Re: BSP advice
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
X-List-Received-Date: Sun, 18 Mar 2012 23:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/18/2012 04:36 PM, R U Local wrote:
> Dear List,
> 
> Is it possible to build an Angstrom rootfs without building x-load, u-boot
> and kernel image?
> 
> We have a new development that uses an AM3517 based unit.
> 
> The SDK comes with pre-patched source code for x-load, u-boot and kernel.
> There are also compiled binary images.
> 
> To get things working quickly I'd like to build a rootfs with our software
> and dependent packages and use the supplied binaries during installation.
> 
>  
> 
> Would setting ASSUME_PROVIDED in the machine BSP achieve this? 

How are you going to handle the kernel modules?

Build something close and ignore the packages you do not need :)

Philip


