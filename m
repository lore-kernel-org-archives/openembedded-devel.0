Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MCZcY-0003E2-Jq
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 15:38:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7A6214D21DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2009 09:29:00 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13215-01 for <openembedded-devel@lists.openembedded.org>; 
	Fri,  5 Jun 2009 09:29:00 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 53E304D1E2A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2009 09:29:00 -0400 (EDT)
Message-ID: <4A291D9C.7040900@cbnco.com>
Date: Fri, 05 Jun 2009 09:29:00 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1243308909-9724-1-git-send-email-msmith@cbnco.com>
	<1244207469.2611.163.camel@mill.internal.reciva.com>
In-Reply-To: <1244207469.2611.163.camel@mill.internal.reciva.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] busybox: allow building when prefix is "", not "/usr".
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
X-List-Received-Date: Fri, 05 Jun 2009 13:38:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Mon, 2009-05-25 at 23:35 -0400, Michael Smith wrote:
>> For insane backwards compatibility reasons (my own fault) I would like
>> to be able to create packages with no /usr and /sbin == /bin. Most
>> autoconf packages are happy about this; busybox just needs a little
> 
> I found one more issuette: busybox udhcpc still expects to find its
> scripts in /usr/share/udhcpc irrespective of where ${datadir} actually
> points to (/share in my case).  Can I persuade you to take a look at
> that?

This is in the defconfig (CONFIG_UDHCPC_DEFAULT_SCRIPT). We might be 
able to get around it by passing 
-DCONFIG_UDHCPC_DEFAULT_SCRIPT=${datadir}/udhcpc/default.script as a CFLAG.

It would make it a bit harder for someone to change the script name for 
their distro. Should just leave it up to distros to fix the script name, 
or should I force it as a CFLAG? (BTW, in my distro I pass a flag to 
udhcpc to use an entirely different script path.)

I've also found it makes life easier to have symlinks for /usr pointing 
to ., and /sbin pointing to /bin. It means if I miss a hardcoded path in 
a binary like this, the package still works. But I have to chase down 
any packages that actually install files to /usr or /sbin -- otherwise 
when they're upgraded, dpkg removes the symlink and creates a /usr/bin 
or /sbin with one file in it :)

Mike


