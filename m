Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZDqF-00055N-9d
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 00:25:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BNN70Z026416
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 23:23:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26315-02 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 23:23:03 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BNN2UE026410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 11 Mar 2008 23:23:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803111746.59194.geoffrey@pager.net>
References: <200803111746.59194.geoffrey@pager.net>
Date: Tue, 11 Mar 2008 23:23:04 +0000
Message-Id: <1205277784.16531.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stuck with AVR32 segfaults in init
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
X-List-Received-Date: Tue, 11 Mar 2008 23:25:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2008-03-11 at 17:46 -0500, Geoffrey Wossum wrote:
> Since both sysvinit and busybox both segfault with about the same error, I'm 
> thinking it might be related to runtime linking.  I tried configuring uClibc 
> to with SUPPORT_LD_DEBUG and SUPPORT_LD_DEBUG_EARLY, and then passing 
> LD_DEBUG=all on the kernel command line to get it to the init environment.  
> Nothing was printed out, so either I didn't do the LD debug properly, or 
> something is really wrong.
> 
> I've never had an issue building a kernel that boots, but I haven't been able 
> to get past whatever the init process is segfaulting.
> 
> Does anyone have an ideas?

If you take an OE binary and run it within a working filesystem from
whereever, what happens? If it segfaults there you may be able to debug
it. If it doesn't, try copying libs from OE into that system until it
breaks? That should at least tell you where the problem is.

Cheers,

Richard



