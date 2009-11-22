Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCIuT-0005dC-Gp
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 21:19:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAMKF6Bu008237 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2009 20:15:06 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oVPRkZor-zD5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2009 20:15:05 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAMKF00E008230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2009 20:15:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258862880-17496-1-git-send-email-Martin.Jansa@gmail.com>
References: <1258862880-17496-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 22 Nov 2009 20:18:12 +0000
Message-Id: <1258921092.10321.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] module_strip.bbclass: look for modules in	right directory
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
X-List-Received-Date: Sun, 22 Nov 2009 20:19:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-11-22 at 05:07 +0100, Martin Jansa wrote:
> * After 29c7d3351f43678c6e93b707b301832009f64b31 modules are not in
>   install directory but in package, packages-split
> * modules*.tgz is created BEFORE this, so it contains non stripped
>   modules
> * for modules*.tgz with stripped modules see following patch
> ---
>  classes/module_strip.bbclass |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Richard Purdie <rpurdie@linux.intel.com>





