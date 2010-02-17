Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NhiBb-0002O9-JD for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 12:35:22 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nhi94-0005cG-1F for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 12:32:42 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 12:32:42 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 12:32:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Feb 2010 12:32:20 +0100
Message-ID: <hlgk42$774$1@ger.gmane.org>
References: <E1Nhfko-0005L8-Mc@melo.openembedded.org>
	<20100217104816.GJ3233@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <20100217104816.GJ3233@jama>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Koen Kooi : qt4: add 4.6.2
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
X-List-Received-Date: Wed, 17 Feb 2010 11:35:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-02-10 11:48, Martin Jansa wrote:
> On Wed, Feb 17, 2010 at 08:59:30AM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: fba63ed00f92f939529bd1fd1f47a8d715f8bea8
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=fba63ed00f92f939529bd1fd1f47a8d715f8bea8
>>
>> Author: Koen Kooi <koen@openembedded.org>
>> Date:   Tue Feb 16 10:47:02 2010 +0100
>>
>> qt4: add 4.6.2
>>
>> * fix 4.6.1 references in 4.6.0 files as well
>> * make qt-config.patch work with QT_NO_CAST_{TO,FROM},ASCII strict checking
> 
> No idea if that's new issue with 4.6.2 or because of my chroot, but now
> it cannot find any headers from staging.
> 
> I found that now there is LFLAGS (not LDFLAGS) set with libdir and patched 
> configure to use that too somehow, maybe it was needed before -I -L parameters
> added to configure script itself?
> 
> Attached patch works for me.. but if it's right way, then it should be
> integrated to .inc files instead.

Your patch looks good to me, but I'd like zecke to comment on it. Holger?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLe9PEMkyGM64RGpERAhbFAKC8HifwgYdkMUpOv6TXP7D7eYIVRQCeOaNa
6By5WnmUN4jfJHWrUW0QEGA=
=xKIN
-----END PGP SIGNATURE-----



