Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGPhf-0001hT-DF for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 08:32:39 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGPby-0008An-QA for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 08:26:46 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 08:26:46 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 08:26:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 19 Oct 2011 08:26:33 +0200
Message-ID: <j7lqiq$b6p$1@dough.gmane.org>
References: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
	<c4b964c5a17f463645b3e9cb7a8351bbe62eef9a.1318946821.git.Martin.Jansa@gmail.com>
	<1318949469.3538.34.camel@mattotaupa>
	<20111018162433.GJ20678@jama.jama.net>
	<j7ka5s$ioi$1@dough.gmane.org>
	<20111018165107.GA17242@jama.jama.net>
	<j7kb44$pmd$1@dough.gmane.org> <20111018173948.GA556@jama.jama.net>
	<j7kjjv$ud8$1@dough.gmane.org>
	<20111019000459.GA3522@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <20111019000459.GA3522@jama.jama.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl 3/3] lightmediascanner: Add version 0.4.4 (initial recipe)
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
X-List-Received-Date: Wed, 19 Oct 2011 06:32:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-10-11 02:04, Martin Jansa schreef:
> On Tue, Oct 18, 2011 at 09:21:35PM +0200, Koen Kooi wrote: Op 18-10-11
> 19:39, Martin Jansa schreef:
>>>> On Tue, Oct 18, 2011 at 06:56:36PM +0200, Koen Kooi wrote:
>>>>>> because of eglibc or uclibc?
>>>>> 
>>>>> uclibc, the 'libc-glibc' override is true for both (e)glibc.
>>>> 
>>>> Ah OK,
>>>> 
>>>> -RDEPENDS_${PN}-test = "glibc-gconv-utf-16" 
>>>> +RDEPENDS_${PN}-test_append_libc-glibc = "glibc-gconv-utf-16"
> 
> The branch has a space after the first quote, right?
> 
>> Not yet, but I'll add it.. but now it works without fine Depends:
>> liblightmediascanner0 (>= 0.4.4), libsqlite3-0 (>= 3.7.7.1),
>> glibc-gconv-utf-16, libc6 (>= 2.14)
> 
>>>> 
>>>> tested on nokia900 and done in branch

Applied, thanks! (fontconfig went into oe-core)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnm2ZMkyGM64RGpERAsILAJ92BtAi/cdxtztTCRKgYvJlaQ42SgCdEqji
Wu20of+7MZcL7WEQ2R5Rw6k=
=TTKB
-----END PGP SIGNATURE-----



