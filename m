Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLaB3-0007P8-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 12:39:50 +0100
Received: (qmail 23281 invoked by uid 503); 25 Nov 2010 11:42:58 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 11:42:57 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 13:38:34 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 13:38:33 +0200
Message-ID: <4CEE4AB9.8050505@eukrea.com>
Date: Thu, 25 Nov 2010 12:38:33 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>	<4CEE336E.9070306@eukrea.com>	<AANLkTiktUcmsYsQh-VFJtWTgpyzbQVmLgg7WuxEJkipW@mail.gmail.com>	<4CEE37DC.5040503@eukrea.com>
	<AANLkTinr=RQ068ABqe8XVsrPpn+iyV9ecFT4n1VuiQTm@mail.gmail.com>
In-Reply-To: <AANLkTinr=RQ068ABqe8XVsrPpn+iyV9ecFT4n1VuiQTm@mail.gmail.com>
X-Ovh-Tracer-Id: 5384334829684174153
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
Subject: Re: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 11:39:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 25/11/2010 12:12, Sylvain Paré wrote:
> I can't find any obj/ directory in
> SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/
> but I have an
> SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj${QT_LIBINFIX}/
>
here is your problem.
QT_LIBINFIX should be "" in your case.

Eric


