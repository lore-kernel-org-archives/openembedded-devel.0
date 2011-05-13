Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QKucY-0008Ts-J1
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 17:49:42 +0200
Received: (qmail 4696 invoked by uid 503); 13 May 2011 16:40:19 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 13 May 2011 16:40:19 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 May 2011 17:46:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 May 2011 17:46:54 +0200
Message-ID: <4DCD526E.2080706@eukrea.com>
Date: Fri, 13 May 2011 17:46:54 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105131210.17952.sgh@sgh.dk>
	<f8a3ce78c529edc295cc9d15986d55bd.squirrel@webmail.infeline.org>
In-Reply-To: <f8a3ce78c529edc295cc9d15986d55bd.squirrel@webmail.infeline.org>
X-Ovh-Tracer-Id: 5939684958893354313
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Fri, 13 May 2011 15:49:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/05/2011 16:28, Eivind Kvedalen wrote:
> I get the same problem here when trying to compile qt4-embedded_4.7.2.bb.
>
> Build Configuration:
> BB_VERSION        = "1.10.2"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "54ab33e"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2011.05"
> TARGET_FPU        = "hard"
>
interesting here that works fine for 4.7.3 (build host is a Ubuntu 10.04.2 LTS 
x86 without qmake2 installed) :
Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "69bb6a7"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "eukrea-cpuimx25"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.05"
TARGET_FPU        = "soft"

.../...
NOTE: package qt4-x11-free-4.7.3-r25.0: task do_build: Succeeded

I'll post an update to the translation patch, can you try them on top of 4.7.3 
update ?

Thanks,
Eric


