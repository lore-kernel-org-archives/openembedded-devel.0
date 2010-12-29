Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PY5MV-00005n-Ht
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 00:23:20 +0100
Received: (qmail 6771 invoked by uid 503); 29 Dec 2010 23:05:40 -0000
Received: from b6.ovh.net (HELO mail32.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 29 Dec 2010 23:05:40 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 01:23:04 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Dec 2010 01:23:04 +0200
Message-ID: <4D1BC2D8.9050308@eukrea.com>
Date: Thu, 30 Dec 2010 00:23:04 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293644563.4238.7.camel@mattotaupa>	<1293645497-22323-1-git-send-email-Martin.Jansa@gmail.com>	<AANLkTimF8brtuRiXYU-kNRQQdur8FpM9=Xo4cGdJxyAG@mail.gmail.com>	<4D1B8FA8.2040400@eukrea.com>
	<4D1BBFBA.9050300@opendreambox.org>
In-Reply-To: <4D1BBFBA.9050300@opendreambox.org>
X-Ovh-Tracer-Id: 14039971839029456201
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 1/2] glib-2.0, dbus: drop dbus's dependency on glib and add dbus dependency to glib-2.0_2.26.1
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
X-List-Received-Date: Wed, 29 Dec 2010 23:23:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 30/12/2010 00:09, Andreas Oberritter wrote:
> On 12/29/2010 08:44 PM, Eric Bénard wrote:
>> PKG_CONFIG_PATH contains both native
>> and non native directories.
>
> Is this a bug or expected behavior? If expected, why is it needed at all?
>
this is an expected behavior as PKG_CONFIG_PATH is set in bitbake.conf
Kergoth told me on IRC it's for compiling sources which needs to compile 
something which runs on the host to generate the code for the target.

Eric


