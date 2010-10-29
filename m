Received: from smtplq-out19.aruba.it ([62.149.158.39] helo=smtplq02.aruba.it)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pierluigi.passaro@phoenixsoftware.it>)
	id 1PBn0X-0006UH-RP for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 13:20:31 +0200
Received: (qmail 28875 invoked by uid 89); 29 Oct 2010 09:33:04 -0000
Received: from unknown (HELO smtp3.aruba.it) (62.149.158.223)
	by smtplq02.aruba.it with SMTP; 29 Oct 2010 09:33:04 -0000
Received: (qmail 4340 invoked by uid 89); 29 Oct 2010 09:33:00 -0000
Received: from unknown (HELO ?192.168.8.32?)
	(pierluigi.passaro@phoenixsoftware.it@78.12.130.33)
	by smtp3.ad.aruba.it with SMTP; 29 Oct 2010 09:33:00 -0000
Message-ID: <4CCA94CC.3080302@phoenixsoftware.it>
Date: Fri, 29 Oct 2010 11:33:00 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC97820.5090808@nedap.com>
	<loom.20101029T033738-284@post.gmane.org>
In-Reply-To: <loom.20101029T033738-284@post.gmane.org>
X-SA-Exim-Connect-IP: 62.149.158.39
X-SA-Exim-Mail-From: pierluigi.passaro@phoenixsoftware.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake error?
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
X-List-Received-Date: Fri, 29 Oct 2010 11:20:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Not sure this is the best solution, but I solved same issue using latest 
bitbake 1.10.1 downloaded from

http://download.berlios.de/bitbake/bitbake-1.10.1.tar.gz


James Ronald wrote:
> Jaap de Jong <jaap.dejong <at> nedap.com> writes:
>
>   
>> I'm probably totally stupid...
>> What am doing wrong?
>> (I'm working on a fresh unstable branch)
>> When I bitbake I get:
>>
>> MACHINE=at91sam9263ek  bitbake u-boot
>> Traceback (most recent call last):
>>    File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 143, in 
>> <module>
>>      main()
>>    File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 123, in 
>> main
>>      cooker.parseConfiguration()
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line 
>> 68, in parseConfiguration
>>      self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line 
>> 402, in parseConfigurationFile
>>      bb.fetch.fetcher_init(self.configuration.data)
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/fetch/__init__.py", 
>> line 93, in fetcher_init
>>      pd = persist_data.PersistData(d)
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/persist_data.py", 
>> line 52, in __init__
>>      bb.mkdirhier(self.cachedir)
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", line 
>> 133, in mkdirhier
>>      debug(3, "mkdirhier(%s)" % dir)
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", line 
>> 103, in debug
>>      bb.msg.debug(lvl, None, ''.join(args))
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/msg.py", line 100, 
>> in debug
>>      bb.event.fire(MsgDebug(msg, None))
>>    File "/media/OpenEmbedded/unstable/bitbake/lib/bb/event.py", line 67, 
>> in fire
>>      if tmpHandler(event) == Handled:
>>    File "tmpHandler(e)", line 8, in tmpHandler
>> NameError: global name 'msg' is not defined
>>
>>     
>
> I'm getting the exact same error. I'm new to OE and just going through the 
> Getting started wiki entry. Ubuntu 10.04 installing bitbake via apt-get install 
> bitbake.
>
> bitbake --version 
> BitBake Build Tool Core version 1.8.18, bitbake version 1.8.18
>   
> OE is current as of a few minutes ago.
>
> jr@ubuntu-xpc:~/oe/build$ bitbake nano
> Traceback (most recent call last):
>   File "/usr/bin/bitbake", line 143, in <module>
>     main()
>   File "/usr/bin/bitbake", line 123, in main
>     cooker.parseConfiguration()
>   File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 67, in 
> parseConfiguration
>     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>   File "/usr/lib/pymodules/python2.6/bb/cooker.py", line 401, in 
> parseConfigurationFile
>     bb.fetch.fetcher_init(self.configuration.data)
>   File "/usr/lib/pymodules/python2.6/bb/fetch/__init__.py", line 93, in 
> fetcher_init
>     pd = persist_data.PersistData(d)
>   File "/usr/lib/pymodules/python2.6/bb/persist_data.py", line 52, in __init__
>     bb.mkdirhier(self.cachedir)
>   File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 133, in mkdirhier
>     debug(3, "mkdirhier(%s)" % dir)
>   File "/usr/lib/pymodules/python2.6/bb/__init__.py", line 103, in debug
>     bb.msg.debug(lvl, None, ''.join(args))
>   File "/usr/lib/pymodules/python2.6/bb/msg.py", line 100, in debug
>     bb.event.fire(MsgDebug(msg, None))
>   File "/usr/lib/pymodules/python2.6/bb/event.py", line 67, in fire
>     if tmpHandler(event) == Handled:
>   File "tmpHandler(e)", line 8, in tmpHandler
> NameError: global name 'msg' is not defined
>
> - Jim 
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


