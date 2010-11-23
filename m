Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PKty3-0002Ca-OT for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:35:36 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PKtwr-0008OC-6D for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:34:21 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:34:21 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:34:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Nov 2010 15:34:09 +0100
Message-ID: <icgjd2$7oa$1@dough.gmane.org>
References: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <AANLkTim3cKQRr0e1VQRiLf=95jOHC5=TGPQfXbDoZCmj@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BitBake parallel parsing testing
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
X-List-Received-Date: Tue, 23 Nov 2010 14:35:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-11-10 15:29, Chris Larson wrote:
> Greetings all,
> This is a request for further testers for the parallel parsing branch
> of bitbake, as well as for review of the code.  I'm fairly certain
> that the last real issue with it was resolved yesterday, and I haven't
> gotten any reports of problems from those testing it since last week,
> so I'm opening it up to more public testing, so we can be absolutely
> certain that we can merge it to master in the near future without
> risking problems.
> 
> For code review:
> Either follow the below steps, then git log master..parallel-parsing
> or git diff master..parallel-parsing, or use the web interface at
> https://github.com/kergoth/bitbake/commits/parallel-parsing.
> 
> For testing from scratch:
> 
> git clone git://github.com/kergoth/bitbake
> cd bitbake
> git checkout -b parallel-parsing origin/parallel-parsing
> 
> From an existing bitbake repository:
> 
> git remote add kergoth git://github.com/kergoth/bitbake
> git remote update
> git checkout -b parallel-parsing kergoth/parallel-parsing
> 
> Thanks for your time, and do let me know what you think, either of the
> code, performance in general, or the new progress bar (shows an ETA),
> or anything else :)

And don't forget to play with BB_NUMBER_PARSE_THREADS, it defaults to
the number of CPUs :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM69DhMkyGM64RGpERAmxfAJ9jp1HgN3KqDzjdTaMqyuQmaarpMwCgiC9z
dj+92mj+UZJawJ1mhVJapKU=
=ZFS0
-----END PGP SIGNATURE-----



