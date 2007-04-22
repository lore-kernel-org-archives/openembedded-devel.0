Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HfcU1-0001ap-Oa
	for openembedded-devel@openembedded.org; Sun, 22 Apr 2007 15:52:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3MDUNld015290
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Apr 2007 14:30:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15079-05 for <openembedded-devel@openembedded.org>;
	Sun, 22 Apr 2007 14:30:20 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3MDUHb4015283
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Apr 2007 14:30:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <462B4FB2.5090107@laposte.net>
References: <462B14AF.50903@gmail.com> <462B3637.7080604@laposte.net>
	<462B4FB2.5090107@laposte.net>
Date: Sun, 22 Apr 2007 14:30:16 +0100
Message-Id: <1177248616.5830.13.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: linux-libc-headers build problem for tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Apr 2007 13:52:06 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2007-04-22 at 14:06 +0200, cyril Romain wrote:
> cyril Romain wrote:
> > Junqian Gordon Xu wrote:
> >> Angstrom bug report: http://bugs.openembedded.org/show_bug.cgi?id=2128
> >> OZ-3.5.5 bug report: http://bugs.openembedded.org/show_bug.cgi?id=2132
> >
> > You need to install scanelf. It is indeed required by the Quality 
> > Assurance tests performed in OE.
>    
> To overcome the issue, I installed pax-utils in my host Linux system. 
> But I admit now that it was not really necessary:
> In fact OE already provides the pax-utils-native package, automatically 
> built by OE if insane.bbclass is included (angstrom actually includes 
> insane.bbclass).
> Maybe is there a missing dependency that would force bitbake to build 
> pax-utils-native prior to any task that require scanelf (?)
> 
> Any thought from bitbake/oe hackers ?

The dependency is present and works correctly in the versions of bitbake
I've tested. Which version of bitbake was the problem seen with?

Cheers,

Richard




