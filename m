Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NDIs2-0007zd-3e
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 15:29:29 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAPEOaLS000462 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:24:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id k-cfemQVYfFr
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:24:36 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAPEOQWY000434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 14:24:27 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hejb07$qpm$1@ger.gmane.org>
References: <4B0D2724.3070709@SSpaeth.de>  <hejb07$qpm$1@ger.gmane.org>
Date: Wed, 25 Nov 2009 14:27:59 +0000
Message-Id: <1259159279.10321.204.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: pkgconfig bbclass: also sed out bogus includes
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
X-List-Received-Date: Wed, 25 Nov 2009 14:29:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-25 at 14:21 +0100, Koen Kooi wrote:
> On 25-11-09 13:46, Sebastian Spaeth wrote:
> >> author	Koen Kooi<koen@openembedded.org>
> >> commit	2c8134baa56ad047f5c37069379c0e560dd6477e
> >>
> >> RP says: In theory the recipes themselves should be patched to stop
> >> this nonesense getting in there in the first place but that is
> >> appropriate for pkgconfig.bbclass
> >
> > Nice one. Should we add a warning when we find such a bogus include so
> > recipes can be fixed up over time?
> 
> Before this commit insane.bbclass aborted the build during 
> do_qa_staging, so I don't think there are a lot of such recipes around :)
> 
> Feel free to add such a warning to this class.
> 
> I ran into this issue with eet.pc when trying to build a newer e-wm.

Now is probably a good time to discuss some ideas. In Poky I split
pkgconfig.bbclass into two, with pkgconfig.bbclass just adding
pkgconfig-native into DEPENDS.

How about we just require pkgconfig-native as part of the default
DEPENDS and start removing pkgconfig.bbclass everywhere we can?

Ifs its needed anywhere there is a bug in the application's use of .pc
files.

Cheers,

Richard



