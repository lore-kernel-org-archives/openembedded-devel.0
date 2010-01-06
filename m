Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NSXlt-0008Q1-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 16:26:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o06FJu0e027107 for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jan 2010 15:19:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qgayiazsFbwG
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2010 15:19:56 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o06FJqc9027096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jan 2010 15:19:54 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001060507.31754.holger+oe@freyther.de>
References: <201001060507.31754.holger+oe@freyther.de>
Date: Wed, 06 Jan 2010 15:26:41 +0000
Message-Id: <1262791601.32622.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 15:26:08 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2010-01-06 at 05:07 +0100, Holger Hans Peter Freyther wrote:
> 	*) Koen reported that dependency loop reporting is not working anymore..
>             anyone cares to invest thes five minutes to fix that?

In bitbake?

> 	*) Sometimes we have pretty embarassing issues like some images switching
>             from mdev back to udev and we don't notice for months(!!!)
>             It would totally rock if one could change the rootfs.bbclass (or
>             such) class and count the size of the image on the first run, store 
>             it in the temp directory and report the diff's back to the 
>             tinderbox and then we could have a view on the tinderbox?
> 
>             Inside the build summary we should see the new size of the image
>             and the growth compared to the first built?
> 
>             The idea would be to have people look at the waterfall and go OMG 
>             why did "minimal-image" grow by 2MB?

I started packagehistory.bbclass in Poky with ideas like this in mind.
It stores data in a filesystem layout and checked package versions don't
go backwards. Adding transports to send and receive data from a database
server would be a nice improvement.

>           *) The next step would be to transfer packet sizes as well

package sizes? Again this was a goal for packagehistory.bbclass


Cheers,

Richard



