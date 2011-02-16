Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gdalex@gmail.com>) id 1PpWMh-0005Bz-3e
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 02:39:35 +0100
Received: by bwz10 with SMTP id 10so1080915bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 17:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0Gn7IuYjc9BSguhOE9+rytVWUi1K45gfogYAm9KXcGY=;
	b=o9QObdc0xysO/ngPpir/j9+8nlp1clTx9WXvhqPAYssQ13P11Y37LH8QRDDamETc7D
	PDb+J5yYrP3+4A3FmwtIl3GfepafNUyfmPsfr6GN3QhTXzfVXzQYiVSB5M5I59vvituS
	MOpmu3k8g4DPS8/d4mMNs8TLU0/eMOX+20Bls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=g0vRnFH3mhB9tylgPs5nXKaf9Stnp5vahaZCS4o5nXLJJnZhgrEj6p1KkiA8VAeGRF
	idazNJ7ULjgmBAv1ZR65WcXmrCdB9kgDNDBwJAhGSs0+9e2UbhmFH2D73pBbW4OjU/+0
	rUzGHwh6CMCv+DPD6/naz2XRNu6jmNZe2K00s=
MIME-Version: 1.0
Received: by 10.204.69.73 with SMTP id y9mr81816bki.76.1297820303576; Tue, 15
	Feb 2011 17:38:23 -0800 (PST)
Received: by 10.204.120.133 with HTTP; Tue, 15 Feb 2011 17:38:23 -0800 (PST)
In-Reply-To: <4D5B2586.5070105@mentor.com>
References: <AANLkTimE1MUCjZx+dRSna8+38OHy+cZ0GdQDL+EN+it7@mail.gmail.com>
	<4D5A8AD3.2050901@mentor.com>
	<AANLkTi=hEZq-Ow8DVi16tZtEzDy3cHC4gqgPbrcPpd57@mail.gmail.com>
	<4D5B2586.5070105@mentor.com>
Date: Tue, 15 Feb 2011 20:38:23 -0500
Message-ID: <AANLkTikBifZRV6Q5hf1DNK0tE8eyynMvuwMGTpD8SzeD@mail.gmail.com>
From: George Alexandru Dorobantu <gdalex@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: linux-libc-headers and eglibc having circular dependency
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
X-List-Received-Date: Wed, 16 Feb 2011 01:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes, you're right, I saw that message
I believe it was gcc complaining about the missing gettext

it's working now

Thank you
George A. Dorobantu

On Tue, Feb 15, 2011 at 8:16 PM, Tom Rini <tom_rini@mentor.com> wrote:

> On 02/15/2011 04:49 PM, George Alexandru Dorobantu wrote:
>
>  Here it is http://pastebin.com/YGbdjX1Q
>>
>
> Ah ha!  INHERIT += "gettext" doesn't belong in there.  If it's brought in
> globally, you get circular deps as you've found.  I assume you saw a message
> about missing inherit gettext in your build previously and thought this
> would fix it, yes?  I think that means we need to clarify the message a
> bit...
>
>
>
>> Thank you
>> George A. Dorobantu
>>
>>
>> On Tue, Feb 15, 2011 at 9:16 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>>
>>  On 02/15/2011 04:20 AM, George Alexandru Dorobantu wrote:
>>>
>>>  Hello guys,
>>>>
>>>> I've just started a new building and I got this error:
>>>>
>>>> g@g-home:/media/500GB/oe/openembedded$ bitbake qt4e-base-image
>>>> NOTE: Handling BitBake files: - (7318/7318) [100 %]
>>>> Parsing of 7318 .bb files complete (6892 cached, 426 parsed). 7596
>>>> targets,
>>>> 357 skipped, 0 masked, 0 errors.
>>>>
>>>> Build Configuration:
>>>> BB_VERSION        = "1.10.2"
>>>> METADATA_BRANCH   = "org.openembedded.dev"
>>>> METADATA_REVISION = "b4a8a11"
>>>> TARGET_ARCH       = "arm"
>>>> TARGET_OS         = "linux-gnueabi"
>>>> MACHINE           = "qemuarm"
>>>> DISTRO            = "angstrom"
>>>> DISTRO_VERSION    = "v20110215"
>>>> TARGET_FPU        = "soft"
>>>>
>>>> NOTE: Resolving any missing task queue dependencies
>>>> FATAL: Task /media/500GB/oe/openembedded/recipes/linux-libc-headers/
>>>> linux-libc-headers_2.6.32.bb (do_package) has circular dependency on
>>>> /media/500GB/oe/openembedded/recipes/eglibc/eglibc_2.12.bb (do_package)
>>>>
>>>>
>>>> Can anyone help me with this?
>>>>
>>>>
>>> Can you please put your local.conf into pastebin.com and give us a link?
>>>  We don't usually see this kind of problem, thanks!
>>>
>>> --
>>> Tom Rini
>>> Mentor Graphics Corporation
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>  _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

