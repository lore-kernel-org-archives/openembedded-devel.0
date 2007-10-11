Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.67) (envelope-from <phy@linux.it>)
	id 1IfljZ-00015H-IT
	for openembedded-devel@openembedded.org; Thu, 11 Oct 2007 02:17:01 +0200
Received: (qmail 32197 invoked by uid 64017); 11 Oct 2007 00:05:47 -0000
Received: from 82.56.154.194 (filippo@zirak.it@82.56.154.194) by www-zirak-new
	(envelope-from <phy@linux.it>, uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(82.56.154.194):. 
	Processed in 0.011752 secs); 11 Oct 2007 00:05:47 -0000
Received: from unknown (HELO ?192.168.1.3?) (filippo@zirak.it@82.56.154.194)
	by www-zirak-new.zirak.it with SMTP; 11 Oct 2007 00:05:47 -0000
Message-ID: <470D6A2C.1000909@linux.it>
Date: Thu, 11 Oct 2007 02:11:24 +0200
From: Filippo Basso <phy@linux.it>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
CC: openembedded-devel@lists.openembedded.org
References: <470B9D9D.5080501@linux.it>
In-Reply-To: <470B9D9D.5080501@linux.it>
Subject: Re: different hosts, different OE images
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
X-List-Received-Date: Thu, 11 Oct 2007 00:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit


> I understood that the results should be highly independent from host
> system, so I begun debugging a bit.
>   
Hi everybody,
    my investigation is going ahead...
The main point is: an image should be highly independent from the host
system, but seems that I've some problem in this regards... maybe my
mistake, but should be understood.

Another machine (Ubuntu) gave even another different runtime result... :-(

Now I've debugged differences in the log.do_compile files, and have
these "strange" results:
* the order of gcc arguments is not always fixed, depends on the machine
(es: ipkg, perl)
* in many packages the make[n] is make[n+1], sometimes there is a
duplicated chdir, or there is a duplicated message like "OE: Not
hardcoding..."
* in many packages on lenny is present in the options for "ccache
i586-angstrom-linux-gcc" a -L/usr/lib (isn't that potentially dangerous???)


Not OE-related, more .bb recipy-related:
* minimo is using gcc (and not i586-angstrom-linux-gcc), so is failing
on etch and working on lenny (I've to investigate more if this can work,
imagine if I want to use an ARM, hehehe!)
* and a strange behaviour in coreutils-native (this I've to investigate
more, about openat.c and getcwd.c, maybe not a OE issue)


To be sure that the versions are the same, the OE tree is the same (mtn
status: 1c938b19625a9b636c77145c8a420c71768f0595), bitbake is the same,
I've double checked everything.

Now it's  late night, I'll investigate ubuntu problems (X11 restarting
continuously) with same image compiling on lenny, not compiling on etch...

some suggestions?
thank you 10000!
    phy




