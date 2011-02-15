Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gdalex@gmail.com>) id 1PpUfe-00023C-WE
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 00:51:04 +0100
Received: by bwz10 with SMTP id 10so1013959bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 15:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=/JWwU/rQG9TEJSDAq/mdZlKXjSk92jp1TUfqAPwtqrE=;
	b=MvrtAU+MEKXPR267o1ugWuuwcpY/aRwFWrfPutE6aHqAEaQhHmHXxSrY5rdBH7ml0O
	rMSfLL5mr9O2NMrx6Ez1mcWjoz4KHTxYYXmo/NRGbRgic0JnmBmYOUe2NQ0oNw4Rn5Lo
	ZnAvJk7PwYQw67ABVlUFlEnB9i5t6dkZMTND8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=P3E3M3CzC6qYYSQvyedLpt7xFs9IxmAbv3VdAJeYarqaDu676JBKA4nTPtMg1bqUSk
	xC85Bfb1RueFD1iu92QZ+nE68WG0ydvkIPrTyjQ3T91mznOwAYKE0t9a8KQmyg1/BSoN
	gn15qSssVJ38Fa0u9cFrCCB+9izSBwHwnWIwA=
MIME-Version: 1.0
Received: by 10.204.152.22 with SMTP id e22mr9415bkw.103.1297813792270; Tue,
	15 Feb 2011 15:49:52 -0800 (PST)
Received: by 10.204.120.133 with HTTP; Tue, 15 Feb 2011 15:49:52 -0800 (PST)
In-Reply-To: <4D5A8AD3.2050901@mentor.com>
References: <AANLkTimE1MUCjZx+dRSna8+38OHy+cZ0GdQDL+EN+it7@mail.gmail.com>
	<4D5A8AD3.2050901@mentor.com>
Date: Tue, 15 Feb 2011 18:49:52 -0500
Message-ID: <AANLkTi=hEZq-Ow8DVi16tZtEzDy3cHC4gqgPbrcPpd57@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Feb 2011 23:51:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Here it is http://pastebin.com/YGbdjX1Q

Thank you
George A. Dorobantu


On Tue, Feb 15, 2011 at 9:16 AM, Tom Rini <tom_rini@mentor.com> wrote:

> On 02/15/2011 04:20 AM, George Alexandru Dorobantu wrote:
>
>> Hello guys,
>>
>> I've just started a new building and I got this error:
>>
>> g@g-home:/media/500GB/oe/openembedded$ bitbake qt4e-base-image
>> NOTE: Handling BitBake files: - (7318/7318) [100 %]
>> Parsing of 7318 .bb files complete (6892 cached, 426 parsed). 7596
>> targets,
>> 357 skipped, 0 masked, 0 errors.
>>
>> Build Configuration:
>> BB_VERSION        = "1.10.2"
>> METADATA_BRANCH   = "org.openembedded.dev"
>> METADATA_REVISION = "b4a8a11"
>> TARGET_ARCH       = "arm"
>> TARGET_OS         = "linux-gnueabi"
>> MACHINE           = "qemuarm"
>> DISTRO            = "angstrom"
>> DISTRO_VERSION    = "v20110215"
>> TARGET_FPU        = "soft"
>>
>> NOTE: Resolving any missing task queue dependencies
>> FATAL: Task /media/500GB/oe/openembedded/recipes/linux-libc-headers/
>> linux-libc-headers_2.6.32.bb (do_package) has circular dependency on
>> /media/500GB/oe/openembedded/recipes/eglibc/eglibc_2.12.bb (do_package)
>>
>>
>> Can anyone help me with this?
>>
>
> Can you please put your local.conf into pastebin.com and give us a link?
>  We don't usually see this kind of problem, thanks!
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

