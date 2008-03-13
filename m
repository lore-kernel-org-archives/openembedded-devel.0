Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZmPg-0004mB-Hu
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 13:20:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DCHqeF008628
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 12:17:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08180-10 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 12:17:47 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DCHh37008617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 12:17:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30803130427t16a2ac03r37732dcc08d4d443@mail.gmail.com>
References: <47D71B8F.1030108@balister.org> <fraqbd$k6k$2@ger.gmane.org>
	<74d0deb30803130427t16a2ac03r37732dcc08d4d443@mail.gmail.com>
Date: Thu, 13 Mar 2008 12:17:42 +0000
Message-Id: <1205410662.4547.43.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 12:20:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-13 at 12:27 +0100, pHilipp Zabel wrote:
> Unrelated to the SCM discussion, do we need those empty directories at all?

I wondered this, probably not...

> ./packages/kismet/kismet-2007-10-R1

A missing patch I have locally, now committed, oops :)

> ./packages/xhost
> ./packages/xmodmap
> ./packages/xproto
> ./packages/xrandr
> ./packages/xrdb
> ./packages/xprop
> ./packages/xset
> ./packages/xfonts

Don't exist in OE.dev, try running "mtn list unknown".

> ./packages/dbus/dbus-python
> ./packages/linux/linux-openmoko-devel
> ./packages/gcc/gcc-4.1.0
> ./packages/tslib/tslib-1.0
> ./packages/sqlite/sqlite3-3.4.1
> ./packages/sqlite/sqlite3-3.3.17
> ./packages/netbase/netbase/ghi270

Removed as not needed.

> ./packages/netbase/netbase/if-up.d
> ./packages/netbase/netbase/if-pre-up.d
> ./packages/netbase/netbase/if-post-down.d
> ./packages/netbase/netbase/if-down.d

So these are the only remaining problem and changing the recipe slightly
can solve that.

In my previous mail I mentioned issues with .svn, just for clarity in
that case its not empty directories that cause problems but the .svn
directory itself being copied around by do_unpack. Both this and
the .dummy problem suggest we need a way of ignoring files in do_unpack
though.

Cheers,

Richard



