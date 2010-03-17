Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1NrtaW-0000uE-JS
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 14:47:09 +0100
Received: (qmail 21765 invoked by uid 503); 17 Mar 2010 13:40:36 -0000
Received: from b9.ovh.net (HELO mail629.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 17 Mar 2010 13:40:36 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Mar 2010 13:37:35 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Mar 2010 13:37:34 -0000
Message-ID: <4BA0DB15.1030904@eukrea.com>
Date: Wed, 17 Mar 2010 14:37:25 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.8) Gecko/20100227 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Tracer-Id: 15789057344495988041
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: root login over serial port using shadow
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
X-List-Received-Date: Wed, 17 Mar 2010 13:47:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

for the followinf, the distro in Angstrom.

When using shadow as the IMAGE_LOGIN_MANAGER, login doesn't work as root 
over the serial port if a password is set for root and whatever the 
setting done under securretty or /etc/security or /etc/login.defs

The problem is the following :
inittab says :
S:2345:respawn:/sbin/getty 115200 ttyS0

getty is using /bin/login as a default. But /bin/login is a link to 
busybox thus when login on the serial port, busybox's login will be used 
and not shadow's login which is at /usr/bin/login

changing inittab to :
S:2345:respawn:/sbin/getty 115200 ttyS0 -l /usr/bin/login
solves the problem.

Now the question : what is the right way to tell the shadow package to 
replace /bin/login of busybox by its proper /usr/bin/login when it's 
installed ?

Many thanks
Eric


