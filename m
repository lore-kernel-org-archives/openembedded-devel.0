Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oiiok-0003o0-C9
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 09:00:11 +0200
Received: by iwn38 with SMTP id 38so4108104iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Ak2MkTHW8LpgvWwYuElti2bEASXlyLvtmgoQ+NTiF5k=;
	b=QY++WA3N7DUsZp48bPV7Npw0thE6N4a7+ADdmOF2/nQbrXlhuvMdg8ZANCc4yLqTj3
	bldXKc8WW9a2Tw3K0Yji+EHEVY/pQ/yVpAl3sNDhUpotD33CwxajHSOOcEOlKij5A7KG
	9eJqIW1Mcq4T2BhOl47f4Xn7It7uFeCPnVhB0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sXHIwLuPS6ZvleSDtQw1t3lGlJKJ+a6EsLbeS6SNjdzr/B4otvOFrT7zoDQNzEsZig
	yC43MmA2Xwt48cQRDWUvU3rItIFTsNGKi6315virvy95lxV8HYdplQdE8UMb8ZcB2o72
	s9cuXLQAynXiODFo2IyyfCQ2KAM/IV7HL47/I=
MIME-Version: 1.0
Received: by 10.231.36.77 with SMTP id s13mr11630171ibd.190.1281423601190; 
	Tue, 10 Aug 2010 00:00:01 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 10 Aug 2010 00:00:00 -0700 (PDT)
In-Reply-To: <AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E82@deimsg40.de.net.world>
	<AANLkTinK5O3F25QJ40B8+rt5M57BKwWVOYytUEZqvP-D@mail.gmail.com>
	<AANLkTikjcrh78MDsSbdALEWbZGHU7nwrk14FQFiU=ynA@mail.gmail.com>
	<AANLkTimbjUYY22nf59gPAw-Xm05mMLNdDA61Ydc63DFs@mail.gmail.com>
Date: Tue, 10 Aug 2010 09:00:00 +0200
Message-ID: <AANLkTin83G-uHv8oC1P0eQSxwddzAx406wjYV5jSqoZG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Tue, 10 Aug 2010 07:00:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/10 Graham Gower <graham.gower@gmail.com>:
> On 10 August 2010 04:31, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> 2010/8/9 Chris Larson <clarson@kergoth.com>:
>>> On Mon, Aug 9, 2010 at 6:26 AM, Hauser, Wolfgang (external) <
>>> Wolfgang.Hauser.external@eads.com> wrote:

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

Yeah.
Didn't really think about that one, but if distro's want to change and
adhere to it, that would be the simplest solution
Machines that pin something should probably also use weak binding.
Conceptually it is probably marginally less desirable than a solution
where local.conf has *always* control.

What do the distro's think about this?

Frans


