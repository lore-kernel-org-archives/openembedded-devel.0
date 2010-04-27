Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6q6B-000768-Ci for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 21:05:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6q2c-0004cf-Nv for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 21:01:54 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 21:01:54 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 21:01:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Apr 2010 21:01:46 +0200
Message-ID: <hr7caq$cpp$1@dough.gmane.org>
References: <hr6deb$dc1$1@dough.gmane.org>
	<1272392511.3865.574.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272392511.3865.574.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] scsi headers, in glibc-dev or linux-libc-headers-dev?
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
X-List-Received-Date: Tue, 27 Apr 2010 19:05:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-04-10 20:21, Tom Rini wrote:
> On Tue, 2010-04-27 at 12:14 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Currently conflicting headers are both in glibc-dev and
>> linux-libc-headers-dev, which isn't a good thing. According to the
>> interwebs we should use the linux-libc-headers version.
>>
>> Anyone opposed to removing the scsi headers from glibc? It would
>> basically involve reverting
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b8bb2a62b3916470c752bd79d31322b4358fc676
>> and
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=83f41716ab6a2a9d83d4ff044dcef00595ecfeb2
> 
> So, I did both of those after checking the interwebs and poking some
> kernel folks (see comments in
> http://bugs.openembedded.org/show_bug.cgi?id=4262 ).  The question is,
> did the kernel folks change their mind again

I would guess so, since l-l-h 2.6.32 still has the headers....

> and we need to either drop
> older linux-libc-headers (which I'll just assume is a no-go) or go back
> to removing them in new enough linux-libc-headers.

I have no real preference, but removing them from l-l-h would be the
easiest option. My immediate problem is that I need to be able to
install both glibc-dev and l-l-h-dev on the target to show off native
qt4 compilation.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1zSaMkyGM64RGpERAnFdAJ40UWtXamdRU8oTLd9ILE1BdeApuwCeJo3M
4Cg9iYa3MeFktzS1H4hP+A0=
=x1El
-----END PGP SIGNATURE-----



