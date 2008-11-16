Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L1qQA-0000We-Qw
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Nov 2008 23:48:47 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 984E124093; Mon, 17 Nov 2008 09:46:27 +1100 (EST)
Date: Mon, 17 Nov 2008 08:39:28 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081117083928.ea23524c.raster@rasterman.com>
In-Reply-To: <gfpe06$6vm$3@ger.gmane.org>
References: <gfnf5u$r3j$1@ger.gmane.org>
	<20081116145911.GB14299@dodger.lab.datenfreihafen.org>
	<20081117021309.1e431de0.raster@rasterman.com>
	<gfpe06$6vm$3@ger.gmane.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: e-wm broken after yesterdays upgrade
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
X-List-Received-Date: Sun, 16 Nov 2008 22:48:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Nov 2008 16:24:54 +0100 Koen Kooi <k.kooi@student.utwente.nl>
babbled:

> On 16-11-08 16:13, Carsten Haitzler (The Rasterman) wrote:
> > On Sun, 16 Nov 2008 15:59:11 +0100 Stefan Schmidt<stefan@datenfreihafen.org>
> > babbled:
> >
> > same. i have done a lot of changes to e packaging to keep up with upstream
> > changes - and i tested newly build and flashed images (thats how i always do
> > it) and of course it all works. i find it hard to think eina would have been
> > dropped somewhere there as u'd get much bigger problems (you wouldn't even
> > get e to start and get that far). are there loaders in the loaders dir
> > (dirs with arch dirs and module.so's in them?).
> 
> root@omap3evm:~# find /usr/lib/evas/modules/loaders/
> /usr/lib/evas/modules/loaders/
> /usr/lib/evas/modules/loaders/png
> /usr/lib/evas/modules/loaders/png/linux-gnueabi-arm
> /usr/lib/evas/modules/loaders/png/linux-gnueabi-arm/module.so
> /usr/lib/evas/modules/loaders/jpeg
> /usr/lib/evas/modules/loaders/jpeg/linux-gnueabi-arm
> /usr/lib/evas/modules/loaders/jpeg/linux-gnueabi-arm/module.so
> /usr/lib/evas/modules/loaders/eet
> /usr/lib/evas/modules/loaders/eet/linux-gnueabi-arm
> /usr/lib/evas/modules/loaders/eet/linux-gnueabi-arm/module.so

ok. thats most peculiar.

/usr/share/enlightenment/data/images/test.png exits (and is non-zero - a valid
displayable png?) (this is what e does on start as loaders are a runtime
modifiable resource (you can add and remove them at will) e tests to see that
its requirements are met by trying to load that png...

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



