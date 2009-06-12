Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MFDTT-0000gh-4W
	for openembedded-devel@openembedded.org; Fri, 12 Jun 2009 22:35:43 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5CKPTTB017111 for <openembedded-devel@openembedded.org>;
	Fri, 12 Jun 2009 21:25:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2xqwAC4Bil7r for <openembedded-devel@openembedded.org>;
	Fri, 12 Jun 2009 21:25:29 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5CKPNJw017102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Fri, 12 Jun 2009 21:25:25 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
Date: Fri, 12 Jun 2009 21:24:23 +0100
Message-Id: <1244838263.5958.34.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove	spurious	assignments
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
X-List-Received-Date: Fri, 12 Jun 2009 20:35:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-12 at 20:55 +0100, Phil Blundell wrote:
> I'd like to propose changing the bitbake.conf default for
> BUILD_OPTIMIZATION from "-O2" to "-O2 -g".  There seems no harm in
> building debuggable binaries for host-side utilities and it makes life
> somewhat easier when things go wrong.
> 
> Also, while investigating why assignments to this variable from
> local.conf didn't do what I was expecting, I discovered that a whole lot
> of files inside conf/, notably all of the sane-toolchain-*.inc files,
> contain their own assignments to BUILD_OPTIMIZATION for no good reason
> that I can see.  I would also propose to delete the assignments from
> those files.  (There are a few other assignments in files that are
> either DISTRO or MACHINE specific but I intend to leave those alone.)

Acked-by: Richard Purdie <rpurdie@linux.intel.com>

Poky actually uses -ggdb now which makes the -dbg packages useful (if
huge).

Cheers,

Richard



