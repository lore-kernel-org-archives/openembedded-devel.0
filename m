Received: from smtpauth23.prod.mesa1.secureserver.net ([64.202.165.47])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NN6RE-00044i-0i
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Dec 2009 16:14:20 +0100
Received: (qmail 9372 invoked from network); 22 Dec 2009 15:05:42 -0000
Received: from unknown (209.242.7.187)
	by smtpauth23.prod.mesa1.secureserver.net (64.202.165.47) with ESMTP;
	22 Dec 2009 15:05:42 -0000
Message-ID: <4B30E03B.1040500@mwester.net>
Date: Tue, 22 Dec 2009 09:05:31 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u5b0cczimn1qzu@guohr-laptop-ubuntu>
X-SA-Exim-Connect-IP: 64.202.165.47
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why rootfs directory in temp is empty
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
X-List-Received-Date: Tue, 22 Dec 2009 15:14:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Guo Hongruan wrote:
> Hi guys,
>   Today, I build an base-image using OE. And I want to check the content
> of rootfs, but I found the directory rootfs in building directory is
> empty. I remember there was the ontent of the target root filesystem.
> Why have to remove them? Does it means the rootfs directory is unuseful?
> 
> Thanks a lot!
> 

Add IMAGE_KEEPROOTFS = "1" to your local.conf file.
I'm not sure why the change was made to clean it out every build, though.

-Mike (mwester)


