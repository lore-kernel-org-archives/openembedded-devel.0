Received: from [213.186.62.213] (helo=30.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1MlGzy-0008Iv-Co
	for openembedded-devel@openembedded.org; Wed, 09 Sep 2009 08:49:49 +0200
Received: (qmail 9179 invoked by uid 503); 9 Sep 2009 06:49:31 -0000
Received: from b7.ovh.net (HELO mail97.ha.ovh.net) (213.186.33.57)
	by 30.mail-out.ovh.net with SMTP; 9 Sep 2009 06:49:31 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2009 06:51:51 -0000
Received: from tal33-2-82-228-175-43.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.228.175.43)
	by ns0.ovh.net with SMTP; 9 Sep 2009 06:51:49 -0000
Message-ID: <4AA74FEE.8060809@eukrea.com>
Date: Wed, 09 Sep 2009 08:49:18 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AA3ABA8.304@eukrea.com>	<200909061703.48206.holger+oe@freyther.de>
	<4AA3EE5E.70409@eukrea.com> <4AA43612.8070808@4d-electronics.co.nz>
In-Reply-To: <4AA43612.8070808@4d-electronics.co.nz>
X-Ovh-Tracer-Id: 5802043696185650505
X-Ovh-Remote: 82.228.175.43 (tal33-2-82-228-175-43.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qt4-embedded & tslib
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
X-List-Received-Date: Wed, 09 Sep 2009 06:49:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Matthew,

Matthew Dombroski a écrit :
> Actually, the problem is that tslib is linked incorrectly.
> The pthres, linear, etc. modules are not linked to libts so theyre 
> missing symbols when an attempt is made to load them.

ts_calibrate & ts_test are working fine : doesn't is mean the modules 
are properly linked ?

> To confirm, do
> 
> LD_PRELOAD=/usr/lib/libts-1.0.so.0 <args>
> 
> tslib modules will resolve symbols properly so tslib will work.
> 
I'll try this and tell you the result.

Thanks
Eric


