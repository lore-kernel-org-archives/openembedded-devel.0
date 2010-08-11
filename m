Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oj1Hn-0007pZ-KB
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 04:43:24 +0200
Received: by bwz8 with SMTP id 8so2433652bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 19:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BMsCssIaYgxHTKLmgEIyEp7I9NVmLX+eyKmBB9GRuDQ=;
	b=B2I+QfwzR0VeNJKU8oWP28cPC36y5nH+ZT10hb5exK2x41WSQsQTISUVZdPjX7q8kP
	zSoJNVEQnVPRTs88mIK4tMF8LBhdb4WA/RYcuM8db/IOI3/SObS+kvAnYX7gkCp+RdIB
	DIBOCm//j6JIlFaJuhMo58Tt8DIAltzJjyHLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gtHMXYcrh2cU/gWuN6rKjOjx3erL5gHz8eSOw404hq/mtVVGK/1486AlX1WSS7mMLp
	mUAaihCBXf0Yav6e4wULwDkQqDr9vH+bc/TolaI4AJOrgApX2PjkR99ilRNNFNhyQkig
	1g32JR8ZC7x7hQe0zsQOCqN1dv2Mc97DryRe4=
MIME-Version: 1.0
Received: by 10.204.51.77 with SMTP id c13mr4795043bkg.98.1281494588684; Tue, 
	10 Aug 2010 19:43:08 -0700 (PDT)
Received: by 10.204.152.212 with HTTP; Tue, 10 Aug 2010 19:43:08 -0700 (PDT)
In-Reply-To: <20100811014245.GF7189@denix.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
	<i3se2n$gj7$1@dough.gmane.org>
	<AANLkTikUdG4hRo1wJmObU1g5fomeuViCirSBsVFCEYYZ@mail.gmail.com>
	<AANLkTinkuGZVYFHL7N6GwM5BftTr-+L4BP7-jwsRZzqL@mail.gmail.com>
	<20100811014245.GF7189@denix.org>
Date: Wed, 11 Aug 2010 12:13:08 +0930
Message-ID: <AANLkTik64PqPOV4cjfzy4sOzgmr5Q4HDWsnBf=pZcdsQ@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
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
X-List-Received-Date: Wed, 11 Aug 2010 02:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11 August 2010 11:12, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Aug 11, 2010 at 09:14:41AM +0930, Graham Gower wrote:
>> On 11 August 2010 06:26, Chris Larson <clarson@kergoth.com> wrote:
>> > On Tue, Aug 10, 2010 at 1:50 PM, Koen Kooi <k.kooi@student.utwente.nl>=
wrote:
>> >> What's the point of setting a preferred version at all if you make it=
 a
>> >> weak assignment?
>> >> The distro nearly always knows better and if you want to use a differ=
ent
>> >> version, sending a patch to change that version for review isn't exac=
tly
>> >> rocket science.
>> >
>> >
>> > How about having decent usability? =A0The user asking for something an=
d not
>> > getting it is completely unintuitive. =A0If the user doesn't know what=
 they
>> > want, they won't request a specific version. =A0If they do request it,=
 they
>> > should get it, anything else is an OE usability issue.
>>
>> Precisely. The user shouldn't have to understand the details of
>> parsing order, weak assignments, etc. in order to write a local.conf
>> which works for them.
>
> Yeah, and then distro maintainers are blamed for the breakage when users =
unpin
> and change specific dependency for a package.
>
> It's not just the parsing order problem. It's not clear for users that if=
 they
> change anything in local.conf, it can break. I.e. you break it - you fix =
it.


Ok, I'm not so passionate about this change... But I'd like to
highlight why this is not particularly intuitive.
My experience has been that only certain image targets will build
without overrides in a local.conf.

E.g.
In order to get gpe-image to build, i needed to set
PREFERRED_VERSION_gpsd =3D "2.39", because prismstumbler doesn't work
with the API of newer gpsd versions and prismstumbler is included in
the gpe-image.

Since no gpsd version was pinned in the distro i was using, this
override worked.

But then i determined that udev 151 didn't like my old kernel, so I
set  PREFERRED_VERSION_udev =3D "141". Only this doesn't work because
the (angstrom) distro pins it and the 151 version is silently picked
up. I now understand why, but I didn't at the time.

So PREFERRED_VERSION_foo=3D"123" might work, or it might not. And the
same goes for PREFERRED_PROVIDER_foo, which is actually less
consistent because some use a weak assignment in the conf files and
others don't.

Oh, and where is the ?=3D operator documented? I would have expected to
find it here: http://bitbake.berlios.de/manual/ch02.html

-Graham


