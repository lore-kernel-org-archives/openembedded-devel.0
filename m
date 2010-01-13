Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NV4G5-0003by-UV for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 15:31:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NV4Dx-0003iG-Tc
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 15:29:29 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 15:29:29 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 15:29:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 Jan 2010 15:29:08 +0100
Message-ID: <hiklbj$uu2$1@ger.gmane.org>
References: <alpine.LFD.2.00.1001130657110.487@localhost>	<hikjqr$ohr$1@ger.gmane.org>
	<alpine.LFD.2.00.1001130915570.18493@localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <alpine.LFD.2.00.1001130915570.18493@localhost>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dev branch, bitbake of "mplayer" fails
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
X-List-Received-Date: Wed, 13 Jan 2010 14:31:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-01-10 15:16, Robert P. J. Day wrote:
> On Wed, 13 Jan 2010, Koen Kooi wrote:
> 
>> I suspect the build will work if you happen to have ffmpeg already staged.
>>
>> This should solve the issue:
>>
>> http://lists.mplayerhq.hu/pipermail/mplayer-cvslog/2010-January/038178.html
>>
>> testing now to see if that works.
> 
>   so you're saying that if i bitbake ffmpeg first, then the bitbake of
> mplayer should work?  i can test that quickly enough.

That's the only thing I can think of that would get rid of the mismatch
between mplayer configure and their svn-external'ed ffmpeg copy.
Anyway, my patch seems to be working and I shall be pushing it soon.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTdi0MkyGM64RGpERAmipAJwM8veEAzvPo97ka9WMjMJ5mJ78yQCfWB6/
X2004XWNf4xEM0BcZC2tMq4=
=cnQe
-----END PGP SIGNATURE-----



