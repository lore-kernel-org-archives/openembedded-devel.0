Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV59B-0003QM-1v for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:28:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV56w-000642-QX
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:26:18 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 16:26:18 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 16:26:18 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 16:25:50 +0100
Message-ID: <hikolt$aul$1@ger.gmane.org>
References: <490981633.1263366609.160668084.15032@mcgi30.rambler.ru>
	<4B4DE2A2.2030800@zafena.se>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <4B4DE2A2.2030800@zafena.se>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Correct way continue build after error
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
X-List-Received-Date: Wed, 13 Jan 2010 15:28:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-01-10 16:11, Xerxes Rånby wrote:
> Perepelica Alexander wrote:
>> Hello!
>> I look in docs but didn't find answer for subj. Problem is if build is
>> failed then I change receipt or configs and then what must I do to
>> continue?
>> If I must recompile last stage (with configuring and/or unpacking) are
>> some ways to do that?

> Hi, if you have changed the .bb recipe for the package named "foo" to
> fix the error, then recompile the package from scratch using:
> 
> bitbake -c clean foo
> bitbake foo

or just add:

INHERIT += "failure-cleanup"

to your local.conf.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTeX+MkyGM64RGpERAhDtAJ9H83zpQHxD6A2ARfwBoY7mUsfsTgCcC4PG
i19vKTXNxwhvnJOyOa1gMWo=
=/s3L
-----END PGP SIGNATURE-----



