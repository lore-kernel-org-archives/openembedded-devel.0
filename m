Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBjHL-00031a-TN
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 07:17:07 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBjFw-0005fN-7W for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 01:15:36 -0500
Date: Sat, 21 Nov 2009 01:15:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258782956.5424.17.camel@gnutoo-desktop>
Message-ID: <alpine.LFD.2.00.0911210112500.25956@localhost>
References: <1258782956.5424.17.camel@gnutoo-desktop>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 06:17:07 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 21 Nov 2009, GNUtoo wrote:

> hi, I've a bad checksum for SDL_mixer-1.2.9.tar.gz
> I've tried to download it a second time and the bad checksum persist:
> NOTE: Handling BitBake files: / (7861/7861) [100 %]
> NOTE: Parsing finished. 7056 cached, 461 parsed, 344 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 885 of 1396 (ID:
> 209, /home/embedded/oe/org.openembedded.dev/recipes/libsdl/libsdl-mixer_1.2.9.bb, do_fetch)
> NOTE: fetch http://build.shr-project.org/sources/SDL_mixer-1.2.9.tar.gz
> --2009-11-21 06:37:49--
> http://build.shr-project.org/sources/SDL_mixer-1.2.9.tar.gz
> Resolving build.shr-project.org... 78.40.125.6
> Connecting to build.shr-project.org|78.40.125.6|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2009-11-21 06:37:50 ERROR 404: Not Found.
>
> NOTE: fetch
> http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
> --2009-11-21 06:37:50--
> http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
> Resolving www.libsdl.org... 69.163.143.10
> Connecting to www.libsdl.org|69.163.143.10|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 2690766 (2.6M) [application/x-tar]
> Saving to: `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz'
>
> 100%[====[...]=====================>] 2,690,766    746K/s   in 4.5s
>
> 2009-11-21 06:38:00 (588 KB/s) -
> `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766]
>
> NOTE: The MD5Sums did not match. Wanted:
> 'a9eb8750e920829ff41dbe7555850156' and Got:
> '09eb4585f46d3527fe7fce8af8f9e591'

  that second checksum is, in fact, the correct one for that tarball.
and the sha256sum in conf/checksums.ini also doesn't match the one for
that tarball.  if that used to be correct, does that mean someone has
replaced a tarball with a different but identically-named one?

rday

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


