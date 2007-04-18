Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1He63q-0001sw-7w
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2007 11:02:50 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id B1C2ABB7BC;
	Wed, 18 Apr 2007 19:02:37 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17560-07; Wed, 18 Apr 2007 19:02:36 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 332F79CF34;
	Wed, 18 Apr 2007 19:02:36 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 27664B70248; Wed, 18 Apr 2007 19:02:36 +1000 (EST)
Date: Wed, 18 Apr 2007 19:02:36 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070418090235.GA21841@twibble.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Making /var/lib persistent
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2007 09:02:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 17, 2007 at 12:02:03AM +0200, Koen Kooi wrote:
> Hi,
> 
> Marcel Holtmann just pointed me to the fact that OE mount /var as tmpfs for
> almost all machines, which wipes /var/lib at boot, which will break bluez and
> dpkg.
> 
> What would be the best way to preserve /var/lib (and maybe others) across boots?

This has been brought up a few times and no one has really had a good
answer for it. I think /var/lib at a minimum needs to be made
persistent.

After thinking about it a bit I've got the following proposal:

 - make /var a standard directory (no tmpfs)

 - make /var/volatile a tmpfs filesystems (or /var/tmpfs)

 - symlink things that are to be made volatile from /var into
   /var/volatile

So the default /var would end up looking like this:

 /var/volatile       tmpfs mount
 /var/volatile/lock  *
 /var/volatile/run   *
 /var/volatile/tmp   *
 /var/volatile/cache *
 /var/volatile/log   *
 /var/backups
 /var/lib
 /var/lock           symlink to /var/volatile/lock
 /var/run            symlink to /var/volatile/run
 /var/tmp            symlink to /var/volatile/tmp
 /var/cache          symlink to /var/volatile/cache
 /var/local
 /var/log            symlink to /var/volatile/log
 /var/spool
 /var/www

* == created by the existing volatiles system

(According to the FHS /var/tmp should also persist over reboots.)

This also has an advantage in the situation where I want to make
something persistent I just have to break the symlink. So for the
logs for example I could just have "rm /var/log && mv
/var/volatile/log /var/log" and from then on the logs would remain.

-- 
 Jamie Lenehan <lenehan@twibble.org>


