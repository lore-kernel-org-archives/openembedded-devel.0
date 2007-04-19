Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1HeLmU-0000Er-HS
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Apr 2007 03:49:55 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 2DD021094CB;
	Thu, 19 Apr 2007 11:49:52 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11922-10; Thu, 19 Apr 2007 11:49:50 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 88851EF19B;
	Thu, 19 Apr 2007 11:49:50 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 53093B70248; Thu, 19 Apr 2007 11:49:50 +1000 (EST)
Date: Thu, 19 Apr 2007 11:49:50 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070419014949.GA6540@twibble.org>
References: <1176760923.4623f25b913f9@dominion.kabel.utwente.nl>
	<20070418090235.GA21841@twibble.org>
	<46262A0F.1050805@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <46262A0F.1050805@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
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
X-List-Received-Date: Thu, 19 Apr 2007 01:49:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 18, 2007 at 07:24:15AM -0700, Koen Kooi wrote:
[...]
> Sound like a good idea, do you have a patch for this?

Try this out:

  http://twibble.org/dist/oe/var-volatiles-1.patch

I've tested it locally both with and without tmpfs mounted on
/var/volatile and all seems to work as expected.

I modified the base-files recipe to create the /var/volatile
directory and the various subdirectories in it and to create symlinks
from /var for those directories. This means that even if your not
using tmpfs these will still point into the volatile directory. It
was rather difficult to make it wotk without doing this.

So on the target I end up with this:

  root@titan:/$ find /var -exec ls -ld {} \;
  drwxr-xr-x    7 root     root          288 Apr 19  2007 /var
  drwxr-xr-x    4 root     root           96 Apr 19  2007 /var/lib
  drwxr-xr-x    2 root     root          168 Apr 19  2007 /var/lib/ipkg
  -rw-r--r--    1 root     root       196192 Apr 19  2007 /var/lib/ipkg/nynaeve-titan
  -rw-r--r--    1 root     root        14408 Apr 19  2007 /var/lib/ipkg/nynaeve-all
  -rw-r--r--    1 root     root      2670761 Apr 19  2007 /var/lib/ipkg/nynaeve-sh4
  drwxr-xr-x    2 root     root           48 Apr 19  2007 /var/lib/misc
  lrwxrwxrwx    1 root     root           12 Apr 19  2007 /var/log -> volatile/log
  lrwxrwxrwx    1 root     root           12 Apr 19  2007 /var/run -> volatile/run
  lrwxrwxrwx    1 root     root           17 Apr 19  2007 /var/tmp -> volatile/tmp
  lrwxrwxrwx    1 root     root           13 Apr 19  2007 /var/lock -> volatile/lock
  lrwxrwxrwx    1 root     root           14 Apr 19  2007 /var/cache -> volatile/cache
  drwxr-sr-x    2 root     root           48 Apr 19  2007 /var/local
  drwxr-xr-x    2 root     root           48 Apr 19  2007 /var/spool
  drwxr-xr-x    2 root     root           48 Apr 19  2007 /var/backups
  drwxr-xr-x    7 root     root          140 Jan  1 00:32 /var/volatile
  drwxrwxrwt    2 root     root           40 Jan  1 00:32 /var/volatile/tmp
  drwxr-xr-x    2 root     root           60 Jan  1 00:32 /var/volatile/run
  -rw-rw-r--    1 root     root            0 Jan  1 00:33 /var/volatile/run/utmp
  drwxr-xr-x    2 root     root           60 Jan  1 00:32 /var/volatile/log
  -rw-rw-r--    1 root     root            0 Jan  1 00:33 /var/volatile/log/wtmp
  drwxrwxrwt    3 root     root           60 Jan  1 00:32 /var/volatile/lock
  drwxr-xr-x    2 root     root           40 Jan  1 00:32 /var/volatile/lock/subsys
  drwxr-xr-x    2 root     root           40 Jan  1 00:32 /var/volatile/cache
  root@titan:/$ mount | grep var
  tmpfs on /var/volatile type tmpfs (rw)
  root@titan:/$ 

-- 
 Jamie Lenehan <lenehan@twibble.org>


