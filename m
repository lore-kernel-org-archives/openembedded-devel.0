Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hy7kG-0008PP-PI
	for openembedded-devel@openembedded.org; Tue, 12 Jun 2007 16:53:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5CEoLLr009824 for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 16:50:21 +0200
Message-ID: <466EB2BD.5040506@dominion.kabel.utwente.nl>
Date: Tue, 12 Jun 2007 16:50:37 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <bdb0025f0706111249n4b28df89p9cbaffa43de7ee06@mail.gmail.com>	<1181645855.5628.4.camel@localhost.localdomain>	<bdb0025f0706120718r1f90eadfoc5fccadb3d7263ed@mail.gmail.com>
	<1181659316.5628.29.camel@localhost.localdomain>
In-Reply-To: <1181659316.5628.29.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: strange error when coding a bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2007 14:53:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2007-06-12 at 11:18 -0300, Rodrigo Vivi wrote:
>> On 6/12/07, Richard Purdie <rpurdie@rpsys.net> wrote:
>>> On Mon, 2007-06-11 at 16:49 -0300, Rodrigo Vivi wrote:
>>>
>>> addtask inserts a dependency so if you add
>>>
>>> addtask blah before do_configure
>>>
>>> You are saying that say "patch" must run, followed by "blah" followed by
>>> "configure". Bitbake will check the task dependencies and build them if
>>> they're missing. If a subsequent task has a timestamp older than its
>>> dependencies it will rerun them too (just on a per recipe basis at
>>> present). There have been requests to extend that so if you rebuild gtk
>>> +, all the gtk apps will rebuild and we will probably optionally allow
>>> that in due course (it should be easy with the new bitbake core).
>> I've noticed that and it makes sense. What I really cannot understand
>> is how a very simple function that does anything but a print can break
>> that packages?
> 
> Try "bitbake busybox", then "bitbake busybox -c package -f". You will
> find that either it will fail outright or the busybox packages will
> become corrupt (empty). This is because install must always be (re)run
> before package. I suspect you're seeing side-affects from that area of
> breakage (and you're not the only one)...

Didn't we have a proposed fix for that?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGbrK9MkyGM64RGpERArsWAJ9kzDEf40iSGyluf7raNCd6WyhrFwCcCX35
REpnV17dX84nK0I54R57T6A=
=vjME
-----END PGP SIGNATURE-----


