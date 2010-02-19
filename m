Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NiGmT-0004a7-3m
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Feb 2010 01:31:44 +0100
Received: by iwn10 with SMTP id 10so288079iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 16:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZfQ0X2WzDtXdBd1aFRbiM3zVKU3H7p/ZJd1XoD4kwY4=;
	b=co/cRLjWzd0o1pMQUaV6q7txTDjgFyd4Usxp9sNbfN0hcX6l/VhSU3/LPHaKSjYPn1
	iUlF/IjRA2DNWWbZ8wqYo/LYRxI8EwwqmBmVVhbg7RpYkU4ZqMR+tGXQVXtusYK5/v0O
	1/ExRgxbkEPsUHbfnyeZe4392PkUuryA3IyGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=k+iRX++r24SC1rhKT4icpsZlTQssOmGjoMfRzsqSEYEkOqw/G02q4J+WrjFvGjZUUl
	AtE/qGRq9eLZ+2I6tw3XgKw1vB+zlxQjZ9/KldKRREP3yjGNHnVABQlrVLohJFh8haa7
	ItLVSePwz3VS5gKpEqdvLj9bO8Z2iE1HgMm9c=
MIME-Version: 1.0
Received: by 10.231.79.136 with SMTP id p8mr818731ibk.4.1266539337354; Thu, 18 
	Feb 2010 16:28:57 -0800 (PST)
In-Reply-To: <hl9u05$48d$1@ger.gmane.org>
References: <1265979953-4327-1-git-send-email-ml@vdm-design.de>
	<4B787A24.9010200@kernelconcepts.de> <hl9u05$48d$1@ger.gmane.org>
Date: Thu, 18 Feb 2010 16:28:57 -0800
Message-ID: <19c1b8a91002181628w7a30333an148bc00cb687ca36@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] eglibc:
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
X-List-Received-Date: Fri, 19 Feb 2010 00:31:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 14, 2010 at 2:37 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-02-10 23:33, Florian Boor wrote:
>> Hi,
>>
>> Thomas Zimmermann schrieb:
>>> * ldd has shebang #!/bin/bash: so add bash RDEPNDS
>>
>> last time I checked it worked with the Busybox built-in shell as well. I wonder
>> if it would be a good idea to verify this and patch ldd for our purposes.
>
> like this:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/glibc/glibc-2.4/ldd-unbash.patch
> ?

or patch posted in http://sourceware.org/bugzilla/show_bug.cgi?id=832
it lets it work as it is if shell is bash.

Thx

-Khem


