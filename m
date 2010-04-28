Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O78di-0007q3-Qt
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 16:53:27 +0200
Received: (qmail 22643 invoked by uid 503); 28 Apr 2010 14:55:47 -0000
Received: from b6.ovh.net (HELO mail606.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 28 Apr 2010 14:55:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Apr 2010 14:49:47 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.7?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 28 Apr 2010 14:49:45 -0000
Message-ID: <4BD84B08.4000300@eukrea.com>
Date: Wed, 28 Apr 2010 16:49:44 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com>	<hr3im2$gf6$1@dough.gmane.org>	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>	<hr4t3j$tds$1@dough.gmane.org>
	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
In-Reply-To: <k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>
X-Ovh-Tracer-Id: 5406852828968693065
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Wed, 28 Apr 2010 14:53:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 28/04/2010 16:42, Abhishek Sharma a écrit :
> It was silly of me to put INIT_SCRIPTS = "" without actually knowing about them.
> Now I have changed the image file and it looks like:
> require base-image.bb
> IMAGE_INSTALL = "qtehelloworld"

you need += here, else you replace the content of IMAGE_INSTALL 
inherited from base-image by only your app !

Eric


