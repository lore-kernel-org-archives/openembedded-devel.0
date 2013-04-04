Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UNrv7-0002R7-24
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 23:42:09 +0200
Received: by mail-ve0-f171.google.com with SMTP id b10so3112654vea.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2013 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=IRSXuy8kNl7tHGARZtlifwnK1x8lCs1fto7T2vbeILY=;
	b=TEFALyLMeB2Mia61rE1z3r2wZhBTO3rLcK0qStIrC+kkfIwI9DpOUOx6w/RoMdXl6m
	QfyTonKu2XPveq5oxvaPiFMp03Y2+mXDMe6MqlNJAgHhXYXaCVc/x5lK27GJxeZ9iYUG
	zoqRcoY1Eo2XUx8c5Z1B5bn69M2/lGrOkr6oGgFR+MlgTnw+4YJktRw9pXjLQNv0TbXB
	J4xr4CvSVfrgNQSlopjLU8W4ivbN2temeLRg2J5XshhOWErMpJIUzawe5dSIAnpogUIs
	i7NwPz5NjuROCVg5XN4jcRyQD8fPwDn/CAW4/NeyWLliFtTRXI6pxgk87h0Tc5IJjv8g
	gw8Q==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr5332568vds.27.1365110695477;
	Thu, 04 Apr 2013 14:24:55 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Thu, 4 Apr 2013 14:24:55 -0700 (PDT)
In-Reply-To: <1365081933.6526.107.camel@ted>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
	<1365081933.6526.107.camel@ted>
Date: Thu, 4 Apr 2013 23:24:55 +0200
Message-ID: <CALbNGRTFEYeKFKL9s8raLTLoGwc-D9cS6k1Ax-HJF155HV-SYQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] experiences with images based on current layer heads
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
X-List-Received-Date: Thu, 04 Apr 2013 21:42:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2013 at 3:25 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-04-03 at 16:02 +0200, Andreas M=C3=BCller wrote:
>> Hi,
>>
>> when migration of systemd to oe-core turned to unbuildable I decided
>> to freeze my images and stopped further tests. Now that many issues
>> were fixed and we are close to another release I built my standard
>> xfce-based image based on latest layer HEADs. With this I face some
>> issues which I would like to share:
>>
>> 1. X sessions crash with OOM. This is reproducible by opening
>> google-maps with midori and changing to satellite view. In
>> Xorg.0.log.old I see only
>>
>> | (EE)
>> | (EE) Backtrace:
>> | (EE)
>> | (EE) Segmentation fault at address 0x9
>> | (EE) BUG: triggered 'if (inSignalContext)'
>> | (EE) BUG: log.c:502 in LogVMessageVerb()
>> | (EE) Warning: attempting to log data in a signal unsafe manner while
>> in signal context.
>> | Please update to check inSignalContext and/or use
>> LogMessageVerbSigSafe() or ErrorFSigSafe().
>> | The offending log format message is:
>> |
>> | Fatal server error:
>> |
>> | (EE)
>> | (EE) Backtrace:
>> | (EE)
>>
>> With old images only the process causing OOM were stopped. I did not
>> fully cross check but I have the feeling that OOM appears much much
>> more often than with old images. Sometimes x- session is closed
>> without opening an additional application.
>>
>> 2. Something with udisks/gvfs/thunar-volman seems broken. When
>> auto-mounting, the partitions cannot be mounted by label-name. On
>> plugging a memory stick I see in kernel log
>>
>> | VFS: could not find a valid V7 on sda.
>>
>> Same kernel works properly with old images.
>>
>> 3. dhclient.service does not start (this has never worked):
>>
>> root@overo:~# systemctl status dhclient.service
>> dhclient.service - Dynamic Host Configuration Protocol (DHCP)
>>           Loaded: loaded (/lib/systemd/system/dhclient.service; enabled)
>>           Active: failed (Result: resources) since Sat 2000-01-01
>> 00:58:02 UTC; 7min ago
>>          Process: 177 ExecStart=3D/sbin/dhclient -cf
>> /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases
>> $INTERFACES (code=3Dexited, status=3D0/SUCCESS)
>>
>> Jan 01 00:58:01 overo systemd[1]: Starting Dynamic Host Configuration
>> Protocol (DHCP)...
>> Jan 01 00:58:02 overo systemd[1]: PID file /var/run/dhclient.pid not
>> readable (yet?) after start.
>>
>> I wonder what happens to networkmanager once this autostart will work...

>>
>> will test further...
>
Update on this one: I am updating networkmanager(-applet) to latest
stable version. During tests I found same behaviour for
NetworkManager-wait-online.service. Investigations showed that both
NetworkManager-wait-online.service and dhclient.service fail in case
no network cable is connected during startup. Will investigate
further...

Andreas


