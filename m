Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LYzo3-0007Cq-HK
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 10:30:28 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LYzmF-000OMI-PP
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 12:28:35 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Feb 2009 12:28:26 +0300
User-Agent: KMail/1.9.9
References: <200902140035.13820.khimov@altell.ru>
	<20090215211330.GB11815@smtp.west.cox.net>
	<87hc2vi3wy.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <87hc2vi3wy.fsf@neumann.lab.ossystems.com.br>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200902161228.26942.khimov@altell.ru>
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Mon, 16 Feb 2009 09:30:29 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Otavio Salvador:
> Basically we could suggest following workflow for regular users:
>
>  - when going to make any change at OE, start a personal branch
>
>    $: git checkout -b local master

Here is when the problem starts. Currently we have overlay setup, so I'm 
extracting everything I'm pushing now from overlay (which itself is managed 
in git, but that's another story since at least one thing is not managed at 
all in overlay - checksums).

>    $: git format-patch master..
>
>  - mail them to ml

And this is another thing I'm not sure about, there might be a lot 
of 'intermediate' commits leading to nice-upstream-acceptable package, 
pushing them all in series is kinda wrong, IMHO.

There is of course some git kung fu that might help doing one patch for one 
thing regardless of the number of intermediate results. But then again 
there is reviewing process that leads to more changes and more git kung fu 
to make single patch for single package again.

Does it make any sense? Currently I'm trying to push new things in 'one 
package - one patch' model, extracting package patch from overlay as `git 
diff some_commit..` plus adding checksums to local OE tree and doing `git 
diff` there (not commiting it at all). Then after new package is in, I'm 
able to pull from main OE and remove things from overlay.


