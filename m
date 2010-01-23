Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Na6oS-0006Rk-Mq
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jan 2010 13:16:03 +0100
Received: by fxm4 with SMTP id 4so5758082fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 04:13:39 -0800 (PST)
Received: by 10.223.143.68 with SMTP id t4mr9876318fau.98.1264594418959;
	Wed, 27 Jan 2010 04:13:38 -0800 (PST)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id g28sm9409244fkg.38.2010.01.27.04.13.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Jan 2010 04:13:37 -0800 (PST)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id 4F7E3472FF; Sat, 23 Jan 2010 12:39:57 +0000 (GMT)
Date: Sat, 23 Jan 2010 12:39:57 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100123123957.GA2545@xora-build.xora.org.uk>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<1263888546.2678.17.camel@ubuntu-desktop>
	<4B55FC07.3080504@paulwilsonconsulting.com>
	<C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
MIME-Version: 1.0
In-Reply-To: <C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Wed, 27 Jan 2010 12:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 23, 2010 at 03:16:04PM +0400, Elvis Dowson wrote:
> Hi,
>                   I get the following error when attempting to build overo on Fedora 12 x86 64-bit version. 
> 
> Can you tell me how you can resolve this?
> 
> bitbake omap3-console-image
> 
> Traceback (most recent call last):
>   File "/tool/overo-oe/bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/tool/overo-oe/bitbake/bin/bitbake", line 123, in main
>     cooker.parseConfiguration()
>   File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 68, in parseConfiguration
>     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>   File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 404, in parseConfigurationFile
>     bb.event.fire(bb.event.ConfigParsed(self.configuration.data))
>   File "/tool/overo-oe/bitbake/lib/bb/event.py", line 67, in fire
>     if tmpHandler(event) == Handled:
>   File "tmpHandler(e)", line 4, in tmpHandler
>   File "<bb>", line 18, in check_sanity
> NameError: global name 'os' is not defined
> 

That is almost certainly caused by not using the latest bitbake.

Graeme



