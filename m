Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NVD92-0002mG-CS
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 01:01:03 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0DNscZ9011561 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 23:54:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Jj9dsYThefFy
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 23:54:38 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0DNsYiq011554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 23:54:36 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263426466.457.286.camel@lenovo.internal.reciva.com>
References: <hill5g$ll0$1@ger.gmane.org>
	<1263426466.457.286.camel@lenovo.internal.reciva.com>
Date: Wed, 13 Jan 2010 23:58:43 +0000
Message-Id: <1263427123.15954.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 00:01:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2010-01-13 at 23:47 +0000, Phil Blundell wrote:
> On Thu, 2010-01-14 at 00:31 +0100, Rolf Leggewie wrote:
> > the variable SPLASH is currently defined and not defined in a variety of
> > places leading to undesired results.  I think it should be set OE-wide
> > to a sane default. 
> 
> Is this variable really so important that it needs to be part of the
> global configuration?  Which packages actually care about its value?

So the answer is likely that images or task .bb files use this thing.
The logical approach would therefore be a weak default variable in
image.bbclass or a package-groups.bbclass included by task-*.bb files...

Cheers,

Richard



