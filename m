Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NrCut-0001eh-AM for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 17:13:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NrCrx-00073w-1f for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 17:10:17 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 17:10:17 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 17:10:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Mar 2010 17:10:02 +0100
Message-ID: <hnlm4r$ngu$1@dough.gmane.org>
References: <hnl0m8$3al$1@dough.gmane.org>
	<b6ebd0a51003150721x4378f839raf86d53e82d3b891@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <b6ebd0a51003150721x4378f839raf86d53e82d3b891@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make autotools.bbclass warn and fixup for "needs newer autoconf" breakage
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
X-List-Received-Date: Mon, 15 Mar 2010 16:13:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-03-10 15:21, Chris Larson wrote:
> On Mon, Mar 15, 2010 at 3:03 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Every now and then the world moves to a more recent autoconf (2.64 is
>> popular nowadays) and distros in OE have to to through a lengthy
>> test-fix-bump cycle to keep up. The workaround for such a problem
>> usually is:
>>
>> do_configure() {
>>        gnu-configize
>>        oe_runconf
>> }
>>
>> That gets us the config.guess for exotic targets (e.g. avr32) and runs
>> the in-tree configure script. What are your opinions on adding something
>> like this to autotools.bbclass:
>>
>> if ((needed autoconf > installed autoconf) && configure exists)
>>        BIG FAT WARNING
>>        skip libtoolize + reconf
>>
>> The biggest problem with that is that is "silently" degrades when using
>> the "wrong autoconf" and the possibility for mismatched
>> do_configure_prepend/append  methods.
>>
> 
> It doesn't *necessarily* have to degrade silently -- you could do a check
> from python, either in the task or in the taskstarted event handler for
> do_configure.  (Aside: now that bitbake master can split into client/server,
> bbnote/bberror/etc scripts that actually output stuff via bitbake rather
> than in the logs should be a real possibility for that branch..)
> 
> Do the benefits (not littering recipes with global shortcuts) outweigh
>> the downsides?
> 
> 
> On the one hand, I like the idea, particularly if we can arrange some sort
> of warning (or, alternatively, add a message to a sanity check task, so its
> explicit).  The only minor concern I have with this is the fact that minimum
> autoconf versions actually rarely reflect real dependency by upstream.  Most
> commonly, they just injected the version number they use, not the one they
> actually require.. of course, trying to catch those is a bit of a pain in
> the ass, so it may be that this is best.  *shrug*
> 
> On a related note, I too dislike the recipe 'litter', and think that we need
> a way to toggle non-autoreconf behavior from the recipe easily.  In the
> autotools branch I started on but never completed, I pushed the common
> autoconf bits into autotools_base.bbclass, and inheriting that rather than
> autotools resulted in gnu-config update + oe_runconf, but an alternative
> would be to just add a variable for it.  Thoughts on that?

I was about to create a class that did only gnu-config update +
oe_runconf but was too lazy this morning :)

But the more I think of it, the more I want autotools*.bbclass to
degrade to oe_runconf when encountering too new autoconf requirements.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnlvaMkyGM64RGpERAiB4AJ9KTfM3rI7cygmG+PgxdTYOJRAdyQCdGtb8
j9TqonSN8vabkm06QQcviA4=
=3u0i
-----END PGP SIGNATURE-----



