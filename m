Received: from smtp-out13.alice.it ([85.33.2.18])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NBj0y-00047q-3C
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 07:00:11 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out13.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 21 Nov 2009 06:57:39 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 21 Nov 2009 06:55:59 +0100
Received: from [192.168.1.116] ([80.117.39.202]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 21 Nov 2009 06:55:58 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Nov 2009 06:55:56 +0100
Message-Id: <1258782956.5424.17.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 21 Nov 2009 05:55:58.0523 (UTC)
	FILETIME=[4C2A38B0:01CA6A6F]
X-SA-Exim-Connect-IP: 85.33.2.18
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: wrong checksum for libsdl-mixer-1.2.9
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
X-List-Received-Date: Sat, 21 Nov 2009 06:00:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, I've a bad checksum for SDL_mixer-1.2.9.tar.gz
I've tried to download it a second time and the bad checksum persist:
NOTE: Handling BitBake files: / (7861/7861) [100 %]
NOTE: Parsing finished. 7056 cached, 461 parsed, 344 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 885 of 1396 (ID:
209, /home/embedded/oe/org.openembedded.dev/recipes/libsdl/libsdl-mixer_1.2.9.bb, do_fetch)
NOTE: fetch http://build.shr-project.org/sources/SDL_mixer-1.2.9.tar.gz
--2009-11-21 06:37:49--
http://build.shr-project.org/sources/SDL_mixer-1.2.9.tar.gz
Resolving build.shr-project.org... 78.40.125.6
Connecting to build.shr-project.org|78.40.125.6|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2009-11-21 06:37:50 ERROR 404: Not Found.

NOTE: fetch
http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
--2009-11-21 06:37:50--
http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
Resolving www.libsdl.org... 69.163.143.10
Connecting to www.libsdl.org|69.163.143.10|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2690766 (2.6M) [application/x-tar]
Saving to: `/home/embedded/sources/SDL_mixer-1.2.9.tar.gz'

100%[====[...]=====================>] 2,690,766    746K/s   in 4.5s    

2009-11-21 06:38:00 (588 KB/s) -
`/home/embedded/sources/SDL_mixer-1.2.9.tar.gz' saved [2690766/2690766]

NOTE: The MD5Sums did not match. Wanted:
'a9eb8750e920829ff41dbe7555850156' and Got:
'09eb4585f46d3527fe7fce8af8f9e591'
NOTE: Task failed: Checksum of
'http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz' failed
ERROR: TaskFailed event exception, aborting
ERROR: Build
of /home/embedded/oe/org.openembedded.dev/recipes/libsdl/libsdl-mixer_1.2.9.bb do_fetch failed
ERROR: Task 209
(/home/embedded/oe/org.openembedded.dev/recipes/libsdl/libsdl-mixer_1.2.9.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 884 tasks of which 884 didn't need to be
rerun and 1 failed.
ERROR:
'/home/embedded/oe/org.openembedded.dev/recipes/libsdl/libsdl-mixer_1.2.9.bb' failed

I bet we should do like the last time in [oe] what to do with wrong
checksum
that is to say: mirror the old source(which I don't have obviously) in a
distro's mirror

Denis.




