Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OaxpV-0005fT-CA
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jul 2010 23:24:54 +0200
Received: by gxk3 with SMTP id 3so2148593gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 14:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=gs0XYQyJMWVCSLuqnf3VT/wcxVkJwKKVWpFsv4c/tw4=;
	b=iQ9gefgkD4dKP/ji9nZXXepyjaysnzt1u0809211z2ypMg6p/6uikXZeB3Zndvt0xb
	iBHSu+/JGsknqxC4Er3ikY28VvLOM1KvEUASXgoE5e7uuUmoDgtSyz0a2yCfe3pnShUH
	tjMDjFffCI7N5CU4F/FZd/kw/c3QFZiPDRUcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=QwEIM7UL4k+U7ruq+6YzJEFDhWC0ymeU575YzC5CJNkyTsiuWaNcc+uZ3qN8F4D7E/
	rhasPdDNjay0V+np0rUe3ctl2yc7LjMfjqG8wSgDE8f++PGVg1XkzdVBKl2a1NMHurbw
	cRFs1Ph5eIm0ckn7zRLJIgQjji4ZnWkEXCVMM=
Received: by 10.151.93.11 with SMTP id v11mr5176802ybl.372.1279574683535; Mon, 
	19 Jul 2010 14:24:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Mon, 19 Jul 2010 14:24:23 -0700 (PDT)
In-Reply-To: <AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>
References: <1279290319.10837.1747.camel@rex> <4C44BAB3.8010703@mentor.com> 
	<AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 19 Jul 2010 14:24:23 -0700
X-Google-Sender-Auth: 3EIzJrWtkQHKXWFQkhrP5v-5F9Q
Message-ID: <AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Mon, 19 Jul 2010 21:24:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 19, 2010 at 2:22 PM, Chris Larson <clarson@kergoth.com> wrote:

>
>
> On Mon, Jul 19, 2010 at 1:50 PM, Tom Rini <tom_rini@mentor.com> wrote:
>
>> Richard Purdie wrote:
>>
>>> Whilst our layers mechanism, is great it does have a drawback which has
>>> bugged me for a while. If you have a recipe like pointercal which has
>>> machine specific information in it and you have your new machine code in
>>> a layer, how do you add a pointercal file for your machine?
>>>
>>> Answer is you copy the whole pointercal recipe and files into your
>>> layer, then add the single file for your machine. To me this is ugly,
>>> ugly, ugly. We hate code duplication and as soon as you create two
>>> copies of the same information, we've failed.
>>>
>>> So how could we do this better? Somehow we need to say that a given
>>> directory X has some information which should be merged with the
>>> original recipe. I've thought through several different ways of doing
>>> this and the best solution I found was "bbappend".
>>>
>>> The idea is that if bitbake finds any X.bbappend files, when it loads
>>> X.bb, it will also include these files after it parses the base .bb file
>>> (but before finalise and the anonymous methods run). This means that
>>> the .bbappend file can poke around and do whatever it might want to the
>>> recipe to customise it.
>>>
>>> I went ahead and tried it out as its quite simple to code this in
>>> bitbake. I liked the result enough I've already merged this into Poky:
>>>
>>>
>>> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=63e6ba85677b8aa9f4cf9942a1fccbb8a8c72660
>>>
>>> I'm proposing to push it to bitbake master if there are no serious
>>> objections.
>>>
>>> As an example use case, for the pointercal case above in another later
>>> you could add a pointercal_0.0.bbappend file which contained something
>>> like:
>>>
>>> FILESPATH := "${FILESPATH}:${@os.path.dirname(bb.data.getVar('FILE', d,
>>> True))}"
>>>
>>> which would then cause the directory containing the bbappend file to be
>>> searched for pointercal files.
>>>
>>> There are of course many other uses this could be put to for creating
>>> customised layers, its totally generic.
>>>
>>> For the specific case of paths, I have wondered if there would be a way
>>> to leverage help from bitbake in creating a sane set of search paths but
>>> I'm still thinking about that. This extension is good enough in its own
>>> right in my opinion to be worthwhile.
>>>
>>
>> I must be missing something.  How is this better than amend.inc where
>> today you would just do:
>> # Just to make sure PR does change, could actually be omitted for this
>> # example
>> $ echo 'PR .= ".1"' > mymachine/recipes/pointercal/amend.inc
>> $ cp /tmp/mycal mymachine/recipes/pointercal/whatever_it_is_called
>>
>> ?  Or did you just give too trivial of an example here, and as there are
>> indeed places where amend.inc falls down today, this does work?
>
>
> It's the opposite.  amend.inc is a bit more flexible than bbappend, not
> vice versa, but bbappend has fewer performance implications, and is
> supported directly by bitbake itself (and ensures that anonymous python
> functions will work fine in appended metadata).  Aside: I also suspect that
> BBCLASSEXTEND alterations will work correctly from a bbappend, which does
> not work correctly today from an amend.inc.
>
> You'd have to be careful to lock down your appended versions when using
> bbappend, since bitbake could easily pick a newer version without the append
> out from under you, which is not an issue with amend.inc.
>

Although, I suppose you could set DEFAULT_PREFERENCE in the bbappend, so
whenever you include that collection, it gets preferred.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

