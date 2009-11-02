Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N4ybD-0003Ic-31
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 16:13:44 +0100
Received: by gxk27 with SMTP id 27so1325550gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 07:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8pAi94PjNe8EKV79LFGpD/ri0381VewCVdQ1jsP27TA=;
	b=Ai4sXYsyQSpUvbEDmtDOOEtkMjwIlpRTn6mJJVMRZSyixJe1+f6csRfMBxWKImH+jK
	70tpms19XEqbTTrVU7D0vED9eE8flE56i66qKRlFna2In43IXTR3hNyDu2G/Y1WpUcvo
	VMivAhGM+a3jQATJI1qHo98Hkcm7gz4KcxUYU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BkgCPm0xnkIC5O47jQduPui/BRJrRzZac19zXv52Xo9ZN2qpX0c3qNxJ8vd5+KGKGW
	B7/SxDamT+K8bznu0Vt8j8br+nVH85KK+qiEjAUai9ZjKVwIABFn4T55TOtkavW/PM/D
	DMbPYeEmPfqdD3pM6RuC3bJ6juHTAtDpl5MWU=
MIME-Version: 1.0
Received: by 10.101.25.19 with SMTP id c19mr2714878anj.84.1257174744170; Mon, 
	02 Nov 2009 07:12:24 -0800 (PST)
In-Reply-To: <hcmqcv$5n4$1@ger.gmane.org>
References: <1257169407.11338.71.camel@dax.rpnet.com>
	<hcmqcv$5n4$1@ger.gmane.org>
Date: Mon, 2 Nov 2009 16:12:24 +0100
Message-ID: <ac9c93b10911020712r1adc5157jb1d0acc9563870b2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Staging - time to end the current mess?
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
X-List-Received-Date: Mon, 02 Nov 2009 15:13:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/2 Koen Kooi <k.kooi@student.utwente.nl>:
> On 02-11-09 14:43, Richard Purdie wrote:
>>
>> At OEDEM two years ago I proposed radically altering the way staging
>> worked. For those that don't remember the bad old days, the staging
>> directory layout didn't match that of the target file system meaning
>> every recipe needed a custom do_stage and things were a mess.
>>
>> We changed the layout allowing the use of the gcc/binutils sysroot
>> options and also started widespread use of autotools_stage_all and I'd
>> say things look much improved compared to how they were.
>>
>> Anyone who has looked at the packaged-staging code will probably agree
>> there is still a way to go though - its horrendously complicated. We
>> also do a lot of duplication. I'd like to propose a new simple way of
>> doing things. We'd have the following work flow:
>>
>>
>> [...]
>> do_compile - up to here all as usual
>> do_install - Everything installs into a DESTDIR (including -native)
>> do_package - Takes a copy of the DESTDIR, applies any .la/.pc mangling
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0then splits into packages as usual
>> do_populate_staging - Takes a copy of the DESTDIR, mangles, installs
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0into staging and creates staging packages fro=
m this
>>
>> Firstly, does any disagree with this approach or can we all agree its a
>> nice objective?
>
> Can we make the mangling a seperate tasks? I tend to do the mangling in
> do_compile_append to be able to do builds *on* the target as well.
>
>> Pros:
>>
>> * Only one "make install"
>> * We can start to work out the differences between do_install and
>> =A0 do_stage and minimise them (there should be none bar .la mangling)
>> * Cleaner and simpler do_stage step
>> * Packaged-Staging becomes much simpler
>> * Builds should be faster as staging timestamp snapshots are not
>> =A0 required and staging lock taking should be minimal.
>>
>> Cons:
>>
>> * Very different to what we have now - how to get there?
>> * Likely to be some breakage in any transition
>
> And
>
> * 'make install' doesn't actually work properly for lots of packages (you
> know, the ones with handcrafted makefiles)
>
> But we can solve that by putting the custom do_stage() methods for those =
in
> do_install(), right?

I'm in favour of the proposal.
If not breaking things is important maybe we can call the stage
differently and transfer packages from the old to the new.
Perhaps not too desirable as this gives a transition period that
probably never ends.

Wrt the packages were make install does not properly work:
I would expect for packages where it mostly matters (libs etc) the
install to be proper.

And if make install does not work properly the desired solution is
(imho) not to repair it in do_stage or do_install, but instead come up
with a patch for the Makefile (and preferably submit it to the package
to get it repaired more permanently.

Frans.

>
>
>> I really like the idea in principle, in practise its hard to get there
>> incrementally without breaking things. I'm trying to come up with some
>> code which does that and I'm hoping to have something for OEDEM.
>>
>> For now I'd like to ask if there is agreement we need to do this and
>> support to make this happen?
>
> You have my agreement.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


