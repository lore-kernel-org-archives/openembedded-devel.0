Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PSmYZ-0002cl-GL for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 09:17:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PSmX2-0006Jr-Da for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 09:16:16 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 09:16:16 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 09:16:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Dec 2010 09:16:04 +0100
Message-ID: <ie9tg4$9t0$1@dough.gmane.org>
References: <E1PR45K-0000jK-SU@melo.openembedded.org>	<01EE9A12-BE87-4EF6-9F0B-EAA20A1DBAAE@vanille-media.de>	<4D077186.2050708@balister.org>
	<20101214133729.GE6662@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <20101214133729.GE6662@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Philip Balister : i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
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
X-List-Received-Date: Wed, 15 Dec 2010 08:17:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-12-10 14:37, Martin Jansa wrote:
> On Tue, Dec 14, 2010 at 08:30:46AM -0500, Philip Balister wrote:
>> On 12/14/2010 07:06 AM, Dr. Michael Lauer wrote:
>>> Am 10.12.2010 um 15:36 schrieb git version control:
>>>
>>>> Module: openembedded.git
>>>> Branch: org.openembedded.dev
>>>> Commit: 48e6a063370a38a35f31a28efd8f6ce6ebf00840
>>>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=48e6a063370a38a35f31a28efd8f6ce6ebf00840
>>>>
>>>> Author: Philip Balister<philip@balister.org>
>>>> Date:   Fri Dec 10 09:31:01 2010 -0500
>>>>
>>>> i2c-tools : Stage i2c-dev.h header as i2c-dev-user.h.
>>>>
>>>> Thanks to John Faith for suggesting this approach on the ML. The problem is
>>>> i2c-tools overwrites the header staged by the kernel. This breaks programs
>>>> that depend on the kernel header.
>>>
>>> I don't think this a good solution. Now all programs break which expect
>>> this very i2c-dev.h as being staged by i2c-tools. Interestingly, the
>>> desktop distros don't bother about staging it differently, so why
>>> can't we do the same? Besides, the i2c-dev.h as staged by i2c-tools
>>> is supposed to be a superset. If it isn't we should complain with the
>>> i2c-tools developers.
>>>
>>> What can we do in the meantime?
>>
>> Can we get a survey of how other distros handle the situation?
> 
> Gentoo
> i2c-tools-3.0.[012] (all versions)
> src_install() {
>     emake install prefix="${D}"/usr || die
>     rm -rf "${D}"/usr/include # part of linux-headers
> ...
> }
> 
> so it's not part of i2c-tools package (gentoo doesn't have concept of
> -dev packages as it's always usefull to have all -dev stuff on source
> based distribution).

What are other distributions based on? Pixie dust?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNCHlEMkyGM64RGpERAjhiAJ0ZSOL1sTzWT1vz9B5BR4bW4wqwqwCgj2Zh
BHqHQqhZva9Zh3MekrMNk7I=
=632I
-----END PGP SIGNATURE-----



