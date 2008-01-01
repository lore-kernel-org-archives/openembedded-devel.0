Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J9o5k-00070u-Pm
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 21:52:04 +0100
Received: by fg-out-1718.google.com with SMTP id 22so2642395fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jan 2008 12:45:45 -0800 (PST)
Received: by 10.86.89.4 with SMTP id m4mr13714984fgb.45.1199220345769;
	Tue, 01 Jan 2008 12:45:45 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id 31sm19173071fkt.14.2008.01.01.12.45.43
	(version=SSLv3 cipher=OTHER); Tue, 01 Jan 2008 12:45:43 -0800 (PST)
Date: Tue, 1 Jan 2008 22:48:03 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <911770997.20080101224803@gmail.com>
To: Matthias Hentges <oe@hentges.net>
In-Reply-To: <1199218165.8062.77.camel@localhost.localdomain>
References: <E1J9k05-00006v-OV@linuxtogo.org>
	<1067194706.20080101190354@gmail.com>
	<1199213397.8062.62.camel@localhost.localdomain>
	<202073967.20080101214225@gmail.com>
	<1199218165.8062.77.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev gpsd: Provide working default configuration and init-script for fic-gta01. This makes gpsd device-specific for gta01, please check the feeds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jan 2008 20:52:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Matthias,

Tuesday, January 1, 2008, 10:09:25 PM, you wrote:

[]

>>   The issue here that /etc/init.d/gpsd tries to init both gpsd and
>> gps hardware. Why not separate them. Say, have /etc/init.d/gllin with
>> that snippet. 

> Difficult. /e/i/gllin should, if at all, be provided by the gllin
> package. It is a hand-crafted ipkg containing a binary-only driver. It
> will be an interesting task to find someone at OM willing to change it.
> Maybe if I annoy mickey enough... ;)

  Well, I don't call to create a real package for gllin, it would
still contain just that notice - "go url, clickthru, download". Well,
that clickthru license and download could be moved into such package,
but that still rather be done by core OM people, keeping a connection
with FIC's legal dept ;-).

>> But wait, there're different GPS hardware exists, why
>> don't we make it polymorphic? So, we'd have /etc/init.d/gps-hardware,
>> and that's for should would be device-specific. Then, /etc/init.d/gpsd
>> could do sth like:
>> 
>> [ -x /etc/init.d/gps-hardware ] && /etc/init.d/gps-hardware start
>> 
>> to make sure that it ups entire GPS system.
>> 
>>   How does that sound?

> That sounds like a very good idea, I like the generic approach better
> than a hard-coded init-script. I will try to get the gllin ipk changed,
> but that may take a few days.

  Great! I think, we should do similar for BT. Note that there's
currently no flexible way to deal with BT *hardware* in OE. blue-probe
just records static external properties of BT hardware. But how that
HW is inited? The current way us to have BT drivers kernel-builtin, or
auto-loaded per machine config. That has its issues - memory is taken
regardless if BT is actually used, plus for some devices that may
course BT HW to be always active, draining power.

> What do you think about installing /etc/default/gpsd via
> update-alternatives so a driver could install proper defaults w/o
> resorting to a -conf at all?

> Not that many drivers are going to do this. Neo1973 is probably a very
> special case in this regard.

  Well, there're other devices with GPS builtin (few HTC phones),
that's why I raised the question. Plus, we could have gpsd-conf-usb
and gpsd-conf-bt. Taking the above, update-alternatives management
would be quite helpful. But how they are structured package wise is up to
different alternatives, e.g.:

1. One big package with few conf's inside, managed by update-alt.
2. pkg and pkf-conf, with the latter containing confs, managed by
update-alt.
3. Bunch of conf packages, managed by update-alt.

   I'd err on fine-grained packaging, but I understand that it makes
no sense to put every 20-byte file into own package. I'd still prefer
2, as with it, updating configs does *not* require: 1) devels to
rebuild whole source; 2) release managers to upload more bytes to
feeds; 3) users download those bytes, times many.

  Anyway, I don't have strong opinion here. All 3 choices are valid, as
called by specific case. As long as we agree on the general plan to
deal with this, it can be changed to another method if practical need
arises.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



