Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1IQC-0007Iz-4j for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 14:11:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1IOS-00079I-P8 for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 14:10:04 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 14:10:04 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Mar 2011 14:10:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 20 Mar 2011 14:05:40 +0100
Message-ID: <im4u35$so3$2@dough.gmane.org>
References: <1293311973.4089.26.camel@mattotaupa>	<1300451882.3830.54.camel@mattotaupa>	<20110318151435.GA31039@mail.familie-heinold.de>
	<1300486726.3759.9.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300486726.3759.9.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] xbmc: add `libass` to `DEPENDS`
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
X-List-Received-Date: Sun, 20 Mar 2011 13:11:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-03-11 23:18, Paul Menzel wrote:
> Dear Henning,
> 
> 
> Am Freitag, den 18.03.2011, 16:14 +0100 schrieb Henning Heinold:
>> Hi Paul,
>>
>> the problem is this
>>
>> do_configure() {
>>         if [ -e bootstrap.angstrom ] ; then
>>                 sh bootstrap.angstrom
>>         else
>>                 sh bootstrap
>>         fi
>>         oe_runconf
>> }
>>
>>
>> which prevents the autoreconf run and so the regenerating of libtool stuff, which results
>> in that the configure option --with-sysrootdir is not available. I cannt see how
>> your patch is fixing that.
> 
> I think the following goes on. XBMC’s configure script detects that the
> external libass is available and just uses that. XBMC ships all used
> libraries with it, so it is buildable without downloading additional
> stuff (which is of course bad for maintainability reasons). So
> beforehand the configure script set up compilation of the internal
> libass which failed for the reason you pointed out above.
> 
> I build tested this, so it should be fine?

The proper fix is to overhaul the recipe with some help from Tobias, but
till then:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNhfukMkyGM64RGpERArNGAJwM47lNVoTT5k0Eor639NlvV2CPtwCfakPW
jdmocV9ZzfpYCnn8pzVhDiI=
=CIjD
-----END PGP SIGNATURE-----



