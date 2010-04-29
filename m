Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O7Zsx-00075I-Kc
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 21:59:00 +0200
Received: (qmail 22569 invoked by uid 503); 29 Apr 2010 19:52:39 -0000
Received: from b9.ovh.net (HELO mail440.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Apr 2010 19:52:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Apr 2010 19:55:19 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Apr 2010 19:55:17 -0000
Message-ID: <4BD9E424.6030304@eukrea.com>
Date: Thu, 29 Apr 2010 21:55:16 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>	<1272114888-16964-2-git-send-email-eric@eukrea.com>	<1272114888-16964-3-git-send-email-eric@eukrea.com>	<1272202763.2387.1.camel@gnutoo-desktop>	<1272205477.2387.2.camel@gnutoo-desktop>	<1272206485.2387.3.camel@gnutoo-desktop>	<1272548191.2313.0.camel@gnutoo-desktop>
	<4BD98C53.1070000@eukrea.com>	<1272553558.2313.5.camel@gnutoo-desktop>
	<4BD9A0EA.1070801@eukrea.com>
	<1272557848.2313.14.camel@gnutoo-desktop>
In-Reply-To: <1272557848.2313.14.camel@gnutoo-desktop>
X-Ovh-Tracer-Id: 16439546016274951497
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Thu, 29 Apr 2010 19:59:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denis,

Le 29/04/2010 18:17, GNUtoo a écrit :
> The problem I had was that it didn't find the libraries(the ones you see
> with ldd not dlopened libraries) so normally even in console it
> shouldn't have worked...
> Strange(unless you removed X build dependencies or maybe I had more
> packages installed and configure detected them and built support for
> them)
>
configure has the following options :
   --disable-xss            disable screensaver support via xss [autodetect]
   --enable-dga2            enable DGA 2 support [autodetect]
   --enable-dga1            enable DGA 1 support [autodetect]

none is forced in the recipe so they are autodetected.

Eric


