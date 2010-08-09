Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OibZ7-0006Fs-48
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 01:16:14 +0200
Received: by iwn38 with SMTP id 38so3780045iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 16:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=67OFJfyctuBiF3AtRfTRSvlJOU6WEp6xA8Ubu6IoSAI=;
	b=DIwcVAbrn34HtJFcM7gSSxDWXXZ1isHN21XKUcZGIWc+Qw2OWSeyOVhODux/cQIpWa
	oQEXQXR7T5Lz/08O4qKv1MkAbBds6wCtQTc+UfiryaNcEQo/AxWkIa4WEaGbj98ahx43
	6PpPycSg11xUqjaGbIiV08jcUNKtCAEa6VXQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wtGn0OepVLXRMIZD6zYbsPSk86/BweX9YxKBclsvZnChrsVhwZHyev3JbCu7UuOMpA
	HZSL41IfvYKg2KnWuSDt9v+j57N/308LpBRULxAw90BTqSu98/blnXs64P/IguK4mQpX
	IveVh+Tzz1DIE5aZG9Gast+YCO3hj50TUtX64=
MIME-Version: 1.0
Received: by 10.231.146.205 with SMTP id i13mr19750471ibv.30.1281395724152; 
	Mon, 09 Aug 2010 16:15:24 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Mon, 9 Aug 2010 16:15:24 -0700 (PDT)
In-Reply-To: <AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
Date: Tue, 10 Aug 2010 08:45:24 +0930
Message-ID: <AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 09 Aug 2010 23:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10 August 2010 04:31, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> w=
rote:
> 2010/8/9 Chris Larson <clarson@kergoth.com>:
>> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
>> Wolfgang.Hauser.external@eads.com> wrote:
>>
>>> Hello,
>>>
>>> I want to change some used versions of packages, so I added a
>>> PREFERRED_VERSION_<package>=3D"xxx" for the packages I want to have a
>>> special(newer) version to be used.
>>>
>>> But e. g. for busybox the version defined in the used <distro>.conf is
>>> used instead of my setting in local.conf.
>>>
>>> Should local.conf not overrule <distro/machine>.conf ??
>>
>>
>> Conceptually, local should override everything, as it's the "most specif=
ic"
>> information available, but from a technical standpoint, we can't parse t=
he
>> machine and distro configs until local.conf is parsed, as that's usually
>> where the MACHINE and DISTRO are set. =A0You can use a 'local' override =
to get
>> around it, or you can ask the distro/machine maintainer to use ?=3D
>> assignments (set only if unset).
>>
>> PREFERRED_VERSION_<package>_local =3D "xxx" is how you use the override.
>
> The real solution woud be to either temporary store the
> PREFERRED_VERSION and apply it later on.
> Alternately we could parse local.conf twice, the first time ignoring
> the PREFERRED lines, and the 2nd time only looking at these.
> Yet another solution could be to split local.conf into two pieces, one
> with settings like MACHINE and DISTRO, the other one with the
> overrides.

Wouldn't it be far simpler to fix the distro conf file(s)? E.g. apply
something like this:
s/^PREFERRED_VERSION_\([a-z]*\) =3D/PREFERRED_VERSION_\1 ?=3D/

-Graham


