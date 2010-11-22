Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKbM3-0003m4-9Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 19:43:07 +0100
Received: (qmail 17052 invoked by uid 503); 22 Nov 2010 19:05:20 -0000
Received: from 63.mail-out.ovh.net (91.121.185.56)
	by 68.mail-out.ovh.net with SMTP; 22 Nov 2010 19:05:20 -0000
Received: (qmail 12522 invoked by uid 503); 22 Nov 2010 19:13:54 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 22 Nov 2010 19:13:54 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Nov 2010 20:41:54 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 22 Nov 2010 20:41:53 +0200
Message-ID: <4CEAB970.1070007@eukrea.com>
Date: Mon, 22 Nov 2010 19:41:52 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de>	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>	<4CE7D1F2.7010305@sensortherm.de>	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>	<4CEA2BFF.5090707@sensortherm.de>	<AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>	<4CEA88D0.7070100@sensortherm.de>	<AANLkTinRPF12o0qhpPq=qohG9E6tXRYTd58uB0itKEQ1@mail.gmail.com>	<4CEAA907.4080808@eukrea.com>
	<AANLkTik7cBF59uNh=RCPNkN09jGEC8QFYTXB43DPFxEm@mail.gmail.com>
In-Reply-To: <AANLkTik7cBF59uNh=RCPNkN09jGEC8QFYTXB43DPFxEm@mail.gmail.com>
X-Ovh-Tracer-Id: 13362461571332353353
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Ovh-Tracer-Id: 13758496862734036297
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 18:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2010 19:21, Frans Meulenbroeks wrote:
> After discussing things with Philip (the maintainer of update-rc.d) I
> already pushed the change to have the update-rc.d file local (with his
> ack).
fine, this is a better fix.

> We can try with other recipes.
>
> One other question: can I have two mirrors? I already have our local
> mirror in my list.
>
this should be possible by adding your own my-mirrors.bbclass in your overlay 
and filling :
PREMIRRORS_append () { or MIRRORS_append () {
as in several classes/*mirrors*

Eric


