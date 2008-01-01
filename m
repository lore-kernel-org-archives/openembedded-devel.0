Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J9n4G-0001Kr-7g
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 20:46:28 +0100
Received: by fg-out-1718.google.com with SMTP id 22so2627610fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jan 2008 11:40:09 -0800 (PST)
Received: by 10.86.73.17 with SMTP id v17mr13656633fga.74.1199216407131;
	Tue, 01 Jan 2008 11:40:07 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id p38sm19150917fke.13.2008.01.01.11.40.05
	(version=SSLv3 cipher=OTHER); Tue, 01 Jan 2008 11:40:05 -0800 (PST)
Date: Tue, 1 Jan 2008 21:42:25 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <202073967.20080101214225@gmail.com>
To: Matthias Hentges <oe@hentges.net>
In-Reply-To: <1199213397.8062.62.camel@localhost.localdomain>
References: <E1J9k05-00006v-OV@linuxtogo.org>
	<1067194706.20080101190354@gmail.com>
	<1199213397.8062.62.camel@localhost.localdomain>
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
X-List-Received-Date: Tue, 01 Jan 2008 19:46:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Matthias,

Tuesday, January 1, 2008, 8:49:57 PM, you wrote:

> Hey there. 

> Am Dienstag, den 01.01.2008, 19:03 +0200 schrieb Paul Sokolovsky:
>> Hello,
>> 
>>       Working default configuration should go to ${PN}-conf or
>> something, like most of OE does, and few remaining uncomplying packages are
>> being converted. This helps with build, QA, and release management. Thanks.
>> 

> could you please point me to a sample package with acceptable
> integration of -conf? I'd rather _not_ do this a third time.

  mplayer & mplayer-common by you are good examples. mplayer-common so
far is not machine-specific, but if we'll *really* find it beneficial
to make it so, we're all set for that. keylaunch & keylaunch-conf are
another recent refactor, by me, with keylaunch-conf being actually
per-machine.

  I see where current problem lies with the code you committed - in
snippet like this:

+# gpsd This shell script starts and stops gpsd.
[]
+       if test -e /home/root/gllin/gllin
+       then
+               /home/root/gllin/gllin >/var/log/gllin.log 2>&1 &
+       else
+               echo -e "\n\ngllin GPS driver for Neo1973 not found,"
+               echo "please install the gllin package from"
+               echo "http://3rdparty.downloads.openmoko.org/gllin/"
+               echo ""
+               exit 1
+       fi

  So, one thing is device-specific conf, another way is generic gpsd's
device-specific service init. But that's why it would be nice if we
adopted soft vs soft-conf split as consistent best practice - then
snippets like above would seem to us as anomaly right away, and we'd
think how to solve it.

  The issue here that /etc/init.d/gpsd tries to init both gpsd and
gps hardware. Why not separate them. Say, have /etc/init.d/gllin with
that snippet. But wait, there're different GPS hardware exists, why
don't we make it polymorphic? So, we'd have /etc/init.d/gps-hardware,
and that's for should would be device-specific. Then, /etc/init.d/gpsd
could do sth like:

[ -x /etc/init.d/gps-hardware ] && /etc/init.d/gps-hardware start

to make sure that it ups entire GPS system.

  How does that sound?



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



