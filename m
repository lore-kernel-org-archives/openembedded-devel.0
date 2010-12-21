Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PUzpg-0000UC-8K
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 11:52:40 +0100
Received: (qmail 10064 invoked by uid 503); 21 Dec 2010 11:28:04 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Dec 2010 11:28:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Dec 2010 12:52:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Dec 2010 12:52:27 +0200
Message-ID: <4D1086EB.8020405@eukrea.com>
Date: Tue, 21 Dec 2010 11:52:27 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D1062AF.1080609@eukrea.com>
In-Reply-To: <4D1062AF.1080609@eukrea.com>
X-Ovh-Tracer-Id: 9721864221799132489
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Problem with bitbake master & OE master during fetch
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
X-List-Received-Date: Tue, 21 Dec 2010 10:52:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/12/2010 09:17, Eric Bénard wrote:
> I still haven't investigated the reason of the error.
>
OK the reason of the error is that the machine I'm fetching for is an arm and 
these recipes have either COMPATIBLE_MACHINE = "(h3600|h3900)"
or COMPATIBLE_HOST = "i.86.*-linux"
Same thing occur with recipes/apache/apache_2.0.54.bb which has :
python () {
     # Don't build apache unless we are building nativly
     target = bb.data.getVar("TARGET_ARCH", d, 1)
     build = bb.data.getVar("BUILD_ARCH", d, 1)
     if target != build:
         raise bb.parse.SkipPackage("Apache will only build nativly 
(TARGET_ARCH == BUILD_ARCH)")
}

Also, the problem is only present when doing bitbake -b the_recipe.bb.
Doing bitbake the_recipe exit fine with the following message : "NoProvider: 
adobe-flash".

If would be great if bitbake -b the_recipe.bb could exit properly instead of 
looping on these errors.

Eric


