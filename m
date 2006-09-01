Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GJ9uc-000081-Ge
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Sep 2006 16:22:27 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id BAA46AE3B2;
	Sat,  2 Sep 2006 00:20:03 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04817-02; Sat, 2 Sep 2006 00:20:02 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 02D7E82B6A;
	Sat,  2 Sep 2006 00:20:02 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id EA7E0FCCFD2; Sat,  2 Sep 2006 00:20:01 +1000 (EST)
Date: Sat, 2 Sep 2006 00:20:01 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Alain2210 <alain2210@free.fr>
Message-ID: <20060901142001.GA13118@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Alain2210 <alain2210@free.fr>,
	openembedded-devel@lists.openembedded.org
References: <1156967236.44f5eb4411b36@imp5-g19.free.fr>
	<20060901013235.GA12885@twibble.org>
	<1157104905.44f80509b9320@imp8-g19.free.fr>
Mime-Version: 1.0
In-Reply-To: <1157104905.44f80509b9320@imp8-g19.free.fr>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gd package and cross compile badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2006 14:22:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 01, 2006 at 12:01:45PM +0200, Alain2210 wrote:
[...]
> > I suspect you have one of those distro's that include the X header in
> > /usr/include only and not in /usr/X11R6/include and so it's the
> > search for the X headers that is the issue.
> 
> I have forgotten to say that I was using familiar-unstable.

Ah, that's not actually what I meant ;). In this case I was talking
about your "host distro" not the OE distro you were building for.

The check for host systems headers complains if something tries to
use headers from /usr/include but it doesn't complain if something
tries to use headers from /usr/X11R6/include. Most host distro's have
the X headers in /usr/X11R6/include - I have Fedora Core 4 x86_64 and
that's where it puts the X headers. But some disto's (whatever host
distro your using for example) have the X headers in /usr/include/X11
only. The configure scripts appear to check for /usr/X11R6/include
before /usr/include/X11/.

So most OE developers don't actually see any of the problems that are
related to the use of the X headers, so you may run into a few of
those.

The solution for the X headers that usually works is to pass
appropriate options to config. That's either:

 --without-x

if X isn't needed, or:

 --x-libraries=${STAGING_LIBDIR} --x-includes=${STAGING_INCDIR}

if X is needed.

[...]
> I get an analogous problem in tetex. And will try to solve it with the same

Yeah, tetex is looking for the X libs and headers as well:

 [nynaeve][12:09AM]%> grep /usr/.\*/include /data/oe/build/wrap-glibc/tmp/work/tetex-native-3.0-r1/temp/log.do_configure.18267
 checking for X... libraries /usr/X11R6/lib64, headers /usr/X11R6/include

On your system it'll be finding th headers in /usr/include/X11, so
the fix should be the same.

You should probably add entries in the bugtracker for each one of
these you find and fix as well.

-- 
 Jamie Lenehan <lenehan@twibble.org>


