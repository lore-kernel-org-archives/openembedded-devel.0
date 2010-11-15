Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PHtBf-00049F-I3
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 08:09:15 +0100
Received: (qmail 8822 invoked by uid 503); 15 Nov 2010 07:39:13 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 15 Nov 2010 07:39:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Nov 2010 09:08:09 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 15 Nov 2010 09:08:08 +0200
Message-ID: <4CE0DC54.1060906@eukrea.com>
Date: Mon, 15 Nov 2010 08:08:04 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinbpJJnbj38dV1P7tN1aHobq4XOmQe16kR7-bkW@mail.gmail.com>
In-Reply-To: <AANLkTinbpJJnbj38dV1P7tN1aHobq4XOmQe16kR7-bkW@mail.gmail.com>
X-Ovh-Tracer-Id: 15877440487262104905
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4-embedded and plugins - bitbaking qt4-embedded in a useful way
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
X-List-Received-Date: Mon, 15 Nov 2010 07:09:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/11/2010 02:36, Alessandro Sappia wrote:
> hi all, I wrote a small qt application and I want to run it on top of a
> mini2440 board (7"). I was able to build a working image with qt4-embedded
> and my app but then I'm stuck to the point that my app needs sqlite and
> qt4-embedded don't provide it (almost from what I've read).
>
> the git repository I've used is git://repo.or.cz/openembedded/mini2440.git
>
> the image boots and on prompt I write
>
> qMyApp -qws
>
> this stats qt-embedded right, and after I read that there is no sql driver
> plugin available.
>
> from what I've found (1) classes/qt4e.bbclass says just "network" plugin
> and no "sql" plugin; (2) qt4-embedded.bb include qt4.inc that has
> --no-sql-sqlite in it.
>
> now I'm stuck: change that to what I need ? I've tried to overlay the
> qt4-embedded.bb recipe, but I didn't get anything useful from it (maybe I'm
> doing overlaying wrong)
>
> Does anyone knows how to solve this ?
>
By using the openembedded master branch, you will get the sqlite plugins :
qt4-embedded-plugin-sqldriver-sqlite2_4.7.0-r25.1.9_armv5te.ipk
qt4-embedded-plugin-sqldriver-sqlite_4.7.0-r25.1.9_armv5te.ipk

So maybe the right thing to do is to rebase this mini2440 tree onto master 
(and then to send patches to integrate the differences).

Eric
Eric


