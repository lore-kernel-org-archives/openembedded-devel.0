Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jcm8i-0008M1-EP
	for openembedded-devel@openembedded.org; Fri, 21 Mar 2008 19:38:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2LIcqhD024168
	for <openembedded-devel@openembedded.org>; Fri, 21 Mar 2008 18:38:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24069-02 for <openembedded-devel@openembedded.org>;
	Fri, 21 Mar 2008 18:38:44 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2LIcc8n024132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 21 Mar 2008 18:38:39 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <F4CE5C74-22A4-4616-BE98-DD104EF609AC@student.utwente.nl>
References: <F4CE5C74-22A4-4616-BE98-DD104EF609AC@student.utwente.nl>
Date: Fri, 21 Mar 2008 18:38:37 +0000
Message-Id: <1206124717.4538.3.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Kernel developers strike again - aka "why wpa is broken"	aka "why I have 2 kernels installed"
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
X-List-Received-Date: Fri, 21 Mar 2008 18:38:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2008-03-21 at 10:38 +0100, Koen Kooi wrote:
> In their supreme genius the kernel people have renamed the aes crypto  
> module in 2.6.24, which leads to a lot of problems for people using  
> feeds. The old modules doesn't get replaced by the new one (different  
> name), so task-base will pull in the old aes-module and hence the old  
> kernel. It doesn't pull in the new aes module, so your crypto is broken.
> 
> A good solution would be for task-base to check the kernel version and  
> adjust RRECOMMENDS accordingly.

This isn't a good solution since we have no way of handling package A
requires to know which version of package B was built.

Yes, the kernel can write a file to staging which task-base then reads
but this will only work with very precise ordering and I'm not keen on
promoting that.

How about we set:

RREPLACES_kernel-module-new-name = "kernel-module-old-name"
RCONFLICTS_kernel-module-new-name = "kernel-module-old-name"
RPROVIDES_kernel-module-new-name = "kernel-module-old-name"

in kernel.bbclass? The above probably isn't quite right but you get the
idea...

Cheers,

Richard



