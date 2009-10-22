Received: from [213.186.62.213] (helo=30.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1N14Iv-00072Z-Cu
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 22:30:40 +0200
Received: (qmail 9895 invoked by uid 503); 22 Oct 2009 20:29:38 -0000
Received: from b9.ovh.net (HELO mail173.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 22 Oct 2009 20:29:38 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Oct 2009 20:53:20 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 22 Oct 2009 20:53:19 -0000
Message-ID: <4AE0C0AE.20305@eukrea.com>
Date: Thu, 22 Oct 2009 22:29:34 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE0BEFA.4020905@mlbassoc.com>
In-Reply-To: <4AE0BEFA.4020905@mlbassoc.com>
X-Ovh-Tracer-Id: 14285136544286092617
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Thu, 22 Oct 2009 20:30:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Gary,

Gary Thomas wrote :
> I tried to build the QTE SDK using
>   git://git.openembedded.org/openembedded
>   9e54aa00b3de07933fabf5f6193a4f40af3b54f9
> 
> When I try the example
>   (http://docs.openembedded.org/usermanual/html/ch05s08.html),
> I get:
> 
> init.c:(.text+0x2c): undefined reference to `__libc_csu_fini'
> init.c:(.text+0x34): undefined reference to `__libc_csu_init'
> collect2: ld returned 1 exit status
> make: *** [qte-example] Error 1
> 
> Any ideas what I need to do to fix this?
> 
same thing here. Following an advice on IRC, I tried to switch to eglibc 
without success (eglibc didn' build) and still haven't found a solution 
to generate a working QT SDK for a Cortex A8.

Eric


