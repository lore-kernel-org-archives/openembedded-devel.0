Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JfApG-000804-GC
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 10:24:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9Ogta008775
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:24:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08752-01 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 09:24:38 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2S9OYtx008769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 28 Mar 2008 09:24:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080328011211.7c66e00b@zaurus>
References: <20080328011211.7c66e00b@zaurus>
Date: Fri, 28 Mar 2008 09:24:34 +0000
Message-Id: <1206696274.5029.14.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Fri, 28 Mar 2008 09:24:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-03-28 at 01:12 +0100, Stanislav Brabec wrote:
> I just debugged libgnomecups failing with QA in oe.dev. It seems, that
> mangling magic in the binconfig.bblass is now obsolete and should be
> removed, as it makes things worse:
> Package a installs a-config.
> Bitbake mangles it for staging.
> Package b creates b.pc and includes mangled values from a-config.
> QA of b fails.
>
> After the fix, maybe binconfig files could be moved to the
> standard staging directory (it must be in build path then).
> 
> Could anybody with deeper insight confirm it or do this change?

We still need that mangling unfortunately. The problem is that package b
should not be injecting the results from binconfig directly into a .pc
file, it should be using things like -L${libdir}/foo, not
-L/some/hardcoded/path.

I'll have a look at that package and see if I can fix it.

Cheers,

Richard



