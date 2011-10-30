Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RKSqI-0008J8-VA
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 11:42:19 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CA99811000B5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 11:30:26 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id BD31211000B0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 11:30:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g229044096.adsl.alicedsl.de
	[92.229.44.96]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2011 11:30:24 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 17A0F3C490; Sun, 30 Oct 2011 11:30:22 +0100 (CET)
Date: Sun, 30 Oct 2011 11:30:22 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111030103021.GA3822@rhein.zuhause.netz>
References: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALJpqJw17ftFmyYbdBw8VZoEvdF54-tGGBj4QfHqEWKy5BqgGw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Help?
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
X-List-Received-Date: Sun, 30 Oct 2011 10:42:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2011 at 04:50:58PM -0500, David Thomas wrote:
> I can get bitbake to run as root but I don't let it continue as it is
> not advised.
> 
> As user I get this:
> 
> Traceback (most recent call last):
>   File "/home/dthomas/bitbake/bin/bitbake", line 234, in <module>
>     ret = main()
>   File "/home/dthomas/bitbake/bin/bitbake", line 197, in main
>     server = ProcessServer(server_channel, event_queue, configuration)
>   File "/home/dthomas/bitbake/lib/bb/server/process.py", line 78, in __init__
>     self.cooker = BBCooker(configuration, self.register_idle_function)
>   File "/home/dthomas/bitbake/lib/bb/cooker.py", line 77, in __init__
>     self.parseConfigurationFiles(self.configuration.file)
>   File "/home/dthomas/bitbake/lib/bb/cooker.py", line 529, in
> parseConfigurationFiles
>     bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
> IOError: [Errno 1] Operation not permitted
> 
> 
> I have tried everything. I am using Fedora 13 and have followed every

Why don't use some more up to date distribution?

> guide to the letter. It seems to be a permissions issue but where, I
> have almost given up trying. As always, there is no info on the this
> anywhere that is remotely useful
> 

Use "ls -la" and "find" to find out permissions and ownership. Hence you used
root user in the first place its likely there has something the wrong permisions.

If nothing helps start from the beginning, that is most of time easier and faster.

> Any help is appreciated?
Sure.

Bye Henning


