Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9CPZ-0006SM-MN
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 09:19:22 +0200
Received: (qmail 25207 invoked by uid 503); 4 May 2010 07:12:30 -0000
Received: from b6.ovh.net (HELO mail639.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 4 May 2010 07:12:30 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 May 2010 07:15:55 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 May 2010 07:15:52 -0000
Message-ID: <4BDFC996.5060606@eukrea.com>
Date: Tue, 04 May 2010 09:15:34 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com>
	<hr3im2$gf6$1@dough.gmane.org>	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>	<hr4t3j$tds$1@dough.gmane.org>	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>	<4BD84B08.4000300@eukrea.com>
	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
In-Reply-To: <g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>
X-Ovh-Tracer-Id: 14530864197811219785
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Tue, 04 May 2010 07:19:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/05/2010 09:02, Abhishek Sharma a écrit :
> I am finished making the image which has a qtehelloworld program "installed"
> in it. But the moment I run<qtehelloworld -qws>  in the qemu machine i get
> the error
> QFontDatabase: Cannot find font directory /usr/lib/fonts.
>
> I googled the error and in most of the cases it was shown that while
> "configuring" qte the prefix variable was not properly set. What step should
> i take next?? Do i need to change any recipe of qt embedded or is this some
> different problem.
>
add "qt4-embedded-fonts" to your IMAGE_INSTALL

Eric


