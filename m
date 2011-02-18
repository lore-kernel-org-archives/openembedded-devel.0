Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqOMj-0007AZ-55
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 12:19:13 +0100
Received: (qmail 8831 invoked by uid 503); 18 Feb 2011 10:55:44 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 10:55:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 13:18:01 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 13:18:00 +0200
Message-ID: <4D5E5568.5020308@eukrea.com>
Date: Fri, 18 Feb 2011 12:18:00 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201102170226.53460.schnitzeltony@gmx.de>	<AANLkTinefnq9o6Ygep829mGNOjeXqVMsn1hO_c8zXcRk@mail.gmail.com>	<201102171342.16551.schnitzeltony@gmx.de>
	<201102171808.51219.schnitzeltony@gmx.de>
In-Reply-To: <201102171808.51219.schnitzeltony@gmx.de>
X-Ovh-Tracer-Id: 6154168892085480777
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: QA RPATH error for c++ packages?
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
X-List-Received-Date: Fri, 18 Feb 2011 11:19:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/02/2011 18:08, Andreas Mueller wrote:
> @Khem forget the last mail - sorry
>
> My guess is still that the QA RPATH error is caused by some generic problem with
> c++ sources / libstdc++ - independent of clutter-box2d or other recipes
> meantioned before. Hints on this are
>
> 1.  ALL packages which have sysroot path for 'libstdc++.la' in '.libs/*.lai
> have a QA RPATH error!
>
> 2. In '/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.la' I find
>
> | # Directory that this library needs to be installed in:
> | libdir=/home/Superandi/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>
> 3. So (don't kill me) I modified  '/sysroots/armv7a-angstrom-linux-
> gnueabi/usr/lib/libstdc++.la' to
>
> | # Directory that this library needs to be installed in:
> | libdir=/usr/lib
>
> And rebuild some of the QA RPATH candidates mentioned before
>
> clutter-box2d
> aspell
> enchant
>
> WITHOUT QA ERRORS!!
>
> To me it seems as matter of gcc ( in my case 4.3.3 )
>
> | TARGET_ARCH       = "arm"
> | TARGET_OS         = "linux-gnueabi"
> | MACHINE           = "overo"
> | DISTRO            = "angstrom"
> | DISTRO_VERSION    = "2010.7-test-20110217"
>
> What do you think?
>
I confirm this also works for angstrom 2008.1 where I met a qa problem in 
gnutlsxx.

Eric


