Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NPdRm-0005Av-Ou
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 15:53:21 +0100
Received: by fxm4 with SMTP id 4so9566787fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 06:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=zFcgQSusm49TBkYjY8SAjaGGgUgurbyyLtns9dh0lyk=;
	b=YtIo5GHBYbYbVPL/XPsoLKjAWAF4NXFXrcQXH1F7H3nqnQBAJx80WVpMepp+q02blc
	PCKHDjOx4IMytbrhSzS3kifIbrc1kdCTfWQljPdalXnsd0fvzZZMnAcuNee6B2E0tU7L
	OE+hMDDM5BADIAEQkaEXv0/iT5wmEFqSUGkSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UE6xB0eQnTWfJl0O/40KE2NPV7qL321i7KCuiaX30xCv86COJ0m/r/aJPsGwjwGkUO
	p2jyMw3mVCPFk5kcviFcoeqiHA4sTye4jAt6yo46oJ6tJPve9+D6vZFo9BXoz2dF7YMc
	zMJ3zflkooQ3WPUpOC5yENk3YKvrAitKWgAos=
MIME-Version: 1.0
Received: by 10.239.193.74 with SMTP id h10mr451796hbi.163.1262098280594; Tue, 
	29 Dec 2009 06:51:20 -0800 (PST)
In-Reply-To: <hhcg4o$ubd$1@ger.gmane.org>
References: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>
	<hhcg4o$ubd$1@ger.gmane.org>
Date: Tue, 29 Dec 2009 15:51:20 +0100
Message-ID: <c384c5ea0912290651i1d3370bdk509d6f04f54a8d1a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: helloworld image
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
X-List-Received-Date: Tue, 29 Dec 2009 14:53:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Tue, Dec 29, 2009 at 9:54 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 28-12-09 23:19, Leon Woestenberg wrote:
>> I would like to start with nothing and then configure the system for
>> what I need.
>>
>> Should I start another more-minimal distro or can we change the
>> minimal distro to be truely minimalistic?
>
> You're confusing image and distro again. With angstrom I'm using a 80KiB
> big image that has an fbdev based gui, so it looks your image recipe is
> doing something wrong.
>
I think I am not confusing them again, I think other people are.

This is what happened:

Changes to the distro have made the image bigger (80 kB to 4MB).

Apparently, the image does not define what goes in the image, but the
distro now specifies a minimum amount of packages that goes in.

Also, we seem to be moving to the point where people must both disable
default packages to go in, and enable packages to go in.

Why not simply go back to the idea where the images defines what goes
in?  I think it's more user friendly.

Regards,
-- 
Leon


