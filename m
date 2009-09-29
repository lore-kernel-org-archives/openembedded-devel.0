Received: from [91.121.27.207] (helo=16.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Msd3F-0006v1-I2
	for openembedded-devel@openembedded.org; Tue, 29 Sep 2009 15:47:36 +0200
Received: (qmail 28211 invoked by uid 503); 29 Sep 2009 13:11:33 -0000
Received: from 27.mail-out.ovh.net (91.121.30.210)
	by 16.mail-out.ovh.net with SMTP; 29 Sep 2009 13:11:32 -0000
Received: (qmail 31290 invoked by uid 503); 29 Sep 2009 15:06:55 -0000
Received: from b9.ovh.net (HELO mail425.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 29 Sep 2009 15:06:55 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Sep 2009 12:48:44 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Sep 2009 12:48:42 -0000
Message-ID: <4AC2020F.4030501@eukrea.com>
Date: Tue, 29 Sep 2009 14:48:15 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200909291522.29707.anarsoul@gmail.com>
In-Reply-To: <200909291522.29707.anarsoul@gmail.com>
X-Ovh-Tracer-Id: 155937138634501449
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.207
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: tslib-1.0 is broken on rx1950
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
X-List-Received-Date: Tue, 29 Sep 2009 13:47:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Vasily Khoruzhick a écrit :
> Hi, it seems that tslib-1.0 is broken for rx1950 machine, after calibrating 
> process, opie doesn't respond on touchscreen events. However, tslib-svn works 
> flawlessly.
> 
> Any suggestions? :)
> 
may you please try with this patch which should solve the problem with 
tslib 1.0 & qt embedded :
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=dfcc18bf49b37bea6d31162cc2eb5835a822bf83

Eric


