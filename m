Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N7v2n-0000rR-9n
	for openembedded-devel@openembedded.org; Tue, 10 Nov 2009 19:02:20 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAAHvvsB027838
	for <openembedded-devel@openembedded.org>; Tue, 10 Nov 2009 17:57:57 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9P9ui-KSsL9u for <openembedded-devel@openembedded.org>;
	Tue, 10 Nov 2009 17:57:57 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAAHvohQ027823
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>; Tue, 10 Nov 2009 17:57:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b10911100946i6da3eaect50b93beefeda4dbc@mail.gmail.com>
References: <ac9c93b10911071237p63d19210m619afcaa914189f3@mail.gmail.com>
	<ac9c93b10911100946i6da3eaect50b93beefeda4dbc@mail.gmail.com>
Date: Tue, 10 Nov 2009 17:57:28 +0000
Message-Id: <1257875848.29038.265.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: perl/cpan issue (cpan.bbclass, perl/config.sh)
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
X-List-Received-Date: Tue, 10 Nov 2009 18:02:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-10 at 18:46 +0100, Frans Meulenbroeks wrote:
> I had a fresh stab on this.
> perl/config.sh gives the install dir.
> 
> config.sh is provided by the perl package but the perl recipe
> substitutes the destination directory @DESTDIR@ with ${D}
> 
> So basically we can either:
> a) put all packages that require perl/config.sh within recipes/perl
> b) use an environment var in perl/config.sh (something that can be
> replaced with ${D} during package build
> c) have a config.sh with @DATADIR@ in it and let cpan.class replace it
> wtih ${D} and write to a temp.sh and execute that one (or have a sed
> script that replaces the vars) Note sure if that is ok, others
> probably also use  perl/config.sh

I'd suggest c) is most in keeping with OE and likely to work with
packaged-staging and so on.

Cheers,

Richard



