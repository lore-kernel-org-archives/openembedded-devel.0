Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oivmi-0003w1-68 for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 22:51:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OivmU-00015O-Qf for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 22:50:42 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 22:50:42 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 22:50:42 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 10 Aug 2010 22:50:31 +0200
Message-ID: <i3se2n$gj7$1@dough.gmane.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why PREFERRED_VERSION setting of <distro>.conf overrules local.conf setting ?
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
X-List-Received-Date: Tue, 10 Aug 2010 20:51:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-08-10 01:15, Graham Gower wrote:
> On 10 August 2010 04:31, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> 2010/8/9 Chris Larson <clarson@kergoth.com>:
>>> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
>>> Wolfgang.Hauser.external@eads.com> wrote:
>>>
>>>> Hello,
>>>>
>>>> I want to change some used versions of packages, so I added a
>>>> PREFERRED_VERSION_<package>="xxx" for the packages I want to have a
>>>> special(newer) version to be used.
>>>>
>>>> But e. g. for busybox the version defined in the used <distro>.conf is
>>>> used instead of my setting in local.conf.
>>>>
>>>> Should local.conf not overrule <distro/machine>.conf ??
>>>
>>>
>>> Conceptually, local should override everything, as it's the "most specific"
>>> information available, but from a technical standpoint, we can't parse the
>>> machine and distro configs until local.conf is parsed, as that's usually
>>> where the MACHINE and DISTRO are set.  You can use a 'local' override to get
>>> around it, or you can ask the distro/machine maintainer to use ?=
>>> assignments (set only if unset).
>>>
>>> PREFERRED_VERSION_<package>_local = "xxx" is how you use the override.
>>
>> The real solution woud be to either temporary store the
>> PREFERRED_VERSION and apply it later on.
>> Alternately we could parse local.conf twice, the first time ignoring
>> the PREFERRED lines, and the 2nd time only looking at these.
>> Yet another solution could be to split local.conf into two pieces, one
>> with settings like MACHINE and DISTRO, the other one with the
>> overrides.
> 
> Wouldn't it be far simpler to fix the distro conf file(s)? E.g. apply
> something like this:
> s/^PREFERRED_VERSION_\([a-z]*\) =/PREFERRED_VERSION_\1 ?=/

What's the point of setting a preferred version at all if you make it a
weak assignment?
The distro nearly always knows better and if you want to use a different
version, sending a patch to change that version for review isn't exactly
rocket science.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMYbuWMkyGM64RGpERArMuAKCmQ+N+ZFpZv9/s24LYacKaPMLUJwCfaUGs
JSGK2aDWhxS1Ii6uVkUGoIQ=
=jBaa
-----END PGP SIGNATURE-----



