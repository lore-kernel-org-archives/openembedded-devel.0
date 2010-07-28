Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeCRf-0002Ux-CU for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 21:37:42 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeCRL-0000mz-OW for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 21:37:19 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 21:37:19 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 21:37:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 28 Jul 2010 21:37:03 +0200
Message-ID: <i2q0sv$5tc$1@dough.gmane.org>
References: <20100716213929.GI23169@mx.loc>	<1280337265-25582-1-git-send-email-rep.dot.nop@gmail.com>	<i2pokl$7iu$1@dough.gmane.org>
	<20100728173945.GD19135@mx.loc>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <20100728173945.GD19135@mx.loc>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v3] gcc-cross: fix PV and make it compile
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
X-List-Received-Date: Wed, 28 Jul 2010 19:37:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021641.html

On 28-07-10 19:39, Bernhard Reutner-Fischer wrote:
> On Wed, Jul 28, 2010 at 07:16:05PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 28-07-10 19:14, Bernhard Reutner-Fischer wrote:
>>
>>> -PV = "4.6+svnr${SRCPV}"
>>> +PR = "4.6+svnr${SRCPV}"
>>
>> NAK, PV = "4.6+svnr${SRCPV}" is the right thing to do
> 
> ok what should i do then?
> I want to use the svn version of gcc regardless of it being called
> "1.2.3-svn" or "5.0.0-svn" so i put this into my local.conf:
> 
> #PREFERRED_GCC_VERSION = "4.4.4"
> PREFERRED_GCC_VERSION = "svn"
> 
> But that obviously doesn't work with a PV of "4.6+svnr${SRCPV}" like
> current git has.
> I made up that "svn" intuitively, with the following reasoning:
> i'm using the subversion version (_version_, hence PV)
> with an arbitrary revision as Package Release that will sort correctly
> iff a 4.6.0 release would be made.
> 
> Now how am i supposed to pick "svn" if not by using "svn"?
> 
> thanks for clarification,

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUIbfMkyGM64RGpERAoPYAJ9rxqMp47aGQnPjE6R7GTIMx7CQpgCgmuIa
7su2ka+K0cQBaopKy11SRtk=
=1Jf8
-----END PGP SIGNATURE-----



