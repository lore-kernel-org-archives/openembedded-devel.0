Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCXcK-00063n-0O
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 13:02:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANBvJuN010458 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 11:57:19 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wNDsuWLCf-bn
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 11:57:19 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANBvGPN010446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 11:57:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091123114228.GF3349@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <20091122190547.GC3349@jama>
	<hedfru$gol$1@ger.gmane.org> <20091123085259.GD3349@jama>
	<hedqm4$gon$1@ger.gmane.org>  <20091123114228.GF3349@jama>
Date: Mon, 23 Nov 2009 12:00:32 +0000
Message-Id: <1258977632.10321.65.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 12:02:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 12:42 +0100, Martin Jansa wrote:
> RP or someone else:
> 
> What do you think about proposed implementation?
> 
> Another table with localcount for every revision built, not only for last
> one.
> 
> And table with last revisions with branch and machine in key?

Keeping history is actually quite pointless. The only thing you can use
it for is to make PV go backwards which is exactly what we're trying to
avoid.

The machine specific part is a massive nightmare and my advise is simple
- don't use different revisions for different machines, this is simply
not designed to work. Worst case you create a locked down version for
one of the machines.

> Then script for persistent cache upgrade or upgrade it while building if
> new table with localname will have have new name and if not found there,
> bitbake will try in oldtable and safe result to new one.

This is getting way too complicated for a set of hypothetical situations
nobody is likely to use. Lets try and keep this simple.

The core problem is that nobody has created a way to share the persist
data between build machines. The agreed workaround was to add a way for
the revisions to be locked down though configuration and we're on our
way to do this.

Cheers,

Richard



