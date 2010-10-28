Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1PBSNq-0007iu-1u
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 15:19:11 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 28 Oct 2010 15:18:25 +0200
X-TM-IMSS-Message-ID: <16b18fec000070f5@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 16b18fec000070f5 for
	<jaap.dejong@nedap.com>; Thu, 28 Oct 2010 15:18:26 +0100
Message-ID: <4CC97820.5090808@nedap.com>
Date: Thu, 28 Oct 2010 15:18:24 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 28 Oct 2010 13:18:25.0784 (UTC)
	FILETIME=[9A6D8780:01CB76A2]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake error?
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
X-List-Received-Date: Thu, 28 Oct 2010 13:19:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm probably totally stupid...
What am doing wrong?
(I'm working on a fresh unstable branch)
When I bitbake I get:

MACHINE=at91sam9263ek  bitbake u-boot
Traceback (most recent call last):
   File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 143, in 
<module>
     main()
   File "/media/OpenEmbedded/unstable/bitbake/bin/bitbake", line 123, in 
main
     cooker.parseConfiguration()
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line 
68, in parseConfiguration
     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/cooker.py", line 
402, in parseConfigurationFile
     bb.fetch.fetcher_init(self.configuration.data)
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/fetch/__init__.py", 
line 93, in fetcher_init
     pd = persist_data.PersistData(d)
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/persist_data.py", 
line 52, in __init__
     bb.mkdirhier(self.cachedir)
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", line 
133, in mkdirhier
     debug(3, "mkdirhier(%s)" % dir)
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/__init__.py", line 
103, in debug
     bb.msg.debug(lvl, None, ''.join(args))
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/msg.py", line 100, 
in debug
     bb.event.fire(MsgDebug(msg, None))
   File "/media/OpenEmbedded/unstable/bitbake/lib/bb/event.py", line 67, 
in fire
     if tmpHandler(event) == Handled:
   File "tmpHandler(e)", line 8, in tmpHandler
NameError: global name 'msg' is not defined



