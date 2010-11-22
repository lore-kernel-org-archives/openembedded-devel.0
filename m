Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKXmj-0001Co-O5
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 15:54:26 +0100
Received: (qmail 28959 invoked by uid 503); 22 Nov 2010 14:57:41 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 22 Nov 2010 14:57:41 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Nov 2010 16:53:15 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 22 Nov 2010 16:53:14 +0200
Message-ID: <4CEA83D9.1070109@eukrea.com>
Date: Mon, 22 Nov 2010 15:53:13 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=5Ypor=R4EXQV7D7gkQHFtPu+WukVMz1p57d3N@mail.gmail.com>
In-Reply-To: <AANLkTi=5Ypor=R4EXQV7D7gkQHFtPu+WukVMz1p57d3N@mail.gmail.com>
X-Ovh-Tracer-Id: 9500906364746444105
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ipkg-utils
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
X-List-Received-Date: Mon, 22 Nov 2010 14:54:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frans,

On 22/11/2010 15:36, Frans Meulenbroeks wrote:
> ipkg-utils has two issues:
>
> - the fetch from handhelds.org failed, so we need an update of the SRC_URI
> - the recipe is misnamed. It is ipkg-utils_1.6+cvs20050404.bb but it
> says SRCDATE = "20050930"
>
> I can fix the latter, but not the former.
> We need to resolve the handhelds.org references before the release!
>
I'm testing a patch which adds PREMIRROR to oe's mirrors which workaround the 
handhelds CVS fetching problem and should be enough for the release.
I hope to send it tonight or tomorrow.

Eric


