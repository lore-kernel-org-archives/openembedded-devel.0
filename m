Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PUxPz-0001yg-Il
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 09:17:59 +0100
Received: (qmail 19340 invoked by uid 503); 21 Dec 2010 08:53:27 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Dec 2010 08:53:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Dec 2010 10:17:53 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Dec 2010 10:17:51 +0200
Message-ID: <4D1062AF.1080609@eukrea.com>
Date: Tue, 21 Dec 2010 09:17:51 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: bitbake-dev@lists.berlios.de
X-Ovh-Tracer-Id: 7110902337355099523
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: openembedded-devel@lists.openembedded.org
Subject: Problem with bitbake master & OE master during fetch
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
X-List-Received-Date: Tue, 21 Dec 2010 08:17:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while testing bitbake -c fetch on recipes in a script to fix SRC_URI, I meet 
the following error on (and found it to be reproducable at least with both 
following recipes) :
bitbake -b openembedded/recipes/adobe-flash/flash-plugin_10.0.22.87.bb -c fetch
bitbake -b openembedded/recipes/alsa/alsa-driver_0.9.6-hh4c.bb -c fetch

NOTE: Executing runqueue
ERROR: Running idle function
Traceback (most recent call last):
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/server/process.py", line 124, in 
idle_commands
     retval = function(self, data, False)
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/cooker.py", line 655, in 
buildFileIdle
     retval = rq.execute_runqueue()
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/runqueue.py", line 875, in 
execute_runqueue
     self.rqexe = RunQueueExecuteTasks(self)
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/runqueue.py", line 1036, in __init__
     event.fire(bb.event.StampUpdate(self.rqdata.target_pairs, 
self.rqdata.dataCache.stamp), self.cfgData)
AttributeError: RunQueueData instance has no attribute 'target_pairs'

=> 1st & 2nd Control C leads to :

Keyboard Interrupt, closing down...

ERROR: Running idle function
Traceback (most recent call last):
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/server/process.py", line 124, in 
idle_commands
     retval = function(self, data, False)
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/cooker.py", line 652, in 
buildFileIdle
     rq.finish_runqueue(False)
   File "/home/ebenard/OEUKREA/bitbake/lib/bb/runqueue.py", line 907, in 
finish_runqueue
     self.rqexe.finish()
AttributeError: RunQueue instance has no attribute 'rqexe'

=> 3rd Control C exit as expected.

I still haven't investigated the reason of the error.

Eric


