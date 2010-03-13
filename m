Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NqSIK-0006TY-6e
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 15:26:29 +0100
Received: (qmail 18383 invoked by uid 1003); 13 Mar 2010 14:23:22 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 13 Mar 2010 14:23:22 -0000
Message-ID: <4B9B9FD8.1050505@balister.org>
Date: Sat, 13 Mar 2010 09:23:20 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W193ABA8169925C266555F8D8300@phx.gbl>
In-Reply-To: <BAY127-W193ABA8169925C266555F8D8300@phx.gbl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
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
X-List-Received-Date: Sat, 13 Mar 2010 14:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2010 09:17 AM, saleh usman wrote:
>
> When I try to bitbake any recipe I get an error of Permission denied while owner of directory is that  user which is loged in.
> How to fix this error .
> Log follows.

I think you are running bitbake as one user (who can't access your home 
directory) and trying to write some files into your home directory.

Philip

>
> [Saleh@localhost root]$ bitbake x-11-image
> Traceback (most recent call last):
>    File "/sdr/bitbake/bin/bitbake", line 143, in<module>
>      main()
>    File "/sdr/bitbake/bin/bitbake", line 123, in main
>      cooker.parseConfiguration()
>    File "/sdr/bitbake/lib/bb/cooker.py", line 68, in parseConfiguration
>      self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>    File "/sdr/bitbake/lib/bb/cooker.py", line 402, in parseConfigurationFile
>      bb.fetch.fetcher_init(self.configuration.data)
>    File "/sdr/bitbake/lib/bb/fetch/__init__.py", line 93, in fetcher_init
>      pd = persist_data.PersistData(d)
>    File "/sdr/bitbake/lib/bb/persist_data.py", line 52, in __init__
>      bb.mkdirhier(self.cachedir)
>    File "/sdr/bitbake/lib/bb/__init__.py", line 138, in mkdirhier
>      if e.errno != 17: raise e
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
>


