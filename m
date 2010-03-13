Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NqSOe-0001M5-F1
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 15:33:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 87B4FA5093
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 14:29:57 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id LjQrLa4bflNU
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 14:29:56 +0000 (GMT)
Received: from xora-eee.xora.org.uk (188-220-38-49.zone11.bethere.co.uk
	[188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 4CCC7A508E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 14:29:56 +0000 (GMT)
Received: by xora-eee.xora.org.uk (Postfix, from userid 500)
	id AA373219E3; Sat, 13 Mar 2010 14:30:08 +0000 (GMT)
Date: Sat, 13 Mar 2010 14:30:08 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100313143008.GC13080@xora-eee.xora.org.uk>
References: <BAY127-W193ABA8169925C266555F8D8300@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BAY127-W193ABA8169925C266555F8D8300@phx.gbl>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: permission error
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
X-List-Received-Date: Sat, 13 Mar 2010 14:33:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 13, 2010 at 07:17:07PM +0500, saleh usman wrote:
> 
> When I try to bitbake any recipe I get an error of Permission denied while owner of directory is that  user which is loged in.
> How to fix this error .
> Log follows.
> 
You seem to have mixed up running as root and running as user, never run
bitbake as root and make sure all your files are owned by your user.

Graeme

> [Saleh@localhost root]$ bitbake x-11-image
> Traceback (most recent call last):
>   File "/sdr/bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/sdr/bitbake/bin/bitbake", line 123, in main
>     cooker.parseConfiguration()
>   File "/sdr/bitbake/lib/bb/cooker.py", line 68, in parseConfiguration
>     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>   File "/sdr/bitbake/lib/bb/cooker.py", line 402, in parseConfigurationFile
>     bb.fetch.fetcher_init(self.configuration.data)
>   File "/sdr/bitbake/lib/bb/fetch/__init__.py", line 93, in fetcher_init
>     pd = persist_data.PersistData(d)
>   File "/sdr/bitbake/lib/bb/persist_data.py", line 52, in __init__
>     bb.mkdirhier(self.cachedir)
>   File "/sdr/bitbake/lib/bb/__init__.py", line 138, in mkdirhier
>     if e.errno != 17: raise e
> OSError: [Errno 13] Permission denied: '/home/saleh'
> 
>  		 	   		  
> _________________________________________________________________
> Hotmail: Free, trusted and rich email service.
> https://signup.live.com/signup.aspx?id=60969
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


