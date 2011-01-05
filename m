Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Paasm-0000bM-5k
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 22:27:00 +0100
Received: (qmail 27705 invoked by uid 503); 5 Jan 2011 22:03:55 -0000
Received: from b9.ovh.net (HELO mail241.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 5 Jan 2011 22:03:55 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Jan 2011 23:26:25 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 5 Jan 2011 23:26:24 +0200
Message-ID: <4D24E1FF.9040303@eukrea.com>
Date: Wed, 05 Jan 2011 22:26:23 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Tracer-Id: 16285016252761288009
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: cyclic dependencie
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
X-List-Received-Date: Wed, 05 Jan 2011 21:27:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while building minimal for an armv4 target on a freshly installed Fedora 14 
x86_64, I meet the following problem :

bitbake glib-2.0-native don't build because bitbake first tries to build 
desktop-file-utils-native which depends on glib-2.0-native and thus fails to 
configure with "No package 'glib-2.0' found" (I don't have glib-devel 
installed on the host).

desktop-file-utils-native seems to be listed as DEPENDS only in insane.bbclass.

Do you have any idea on how to fix this ?

Thanks,
Eric


