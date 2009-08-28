Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhA9o-0008Al-UF
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 00:42:59 +0200
Received: by qw-out-1920.google.com with SMTP id 4so576225qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 15:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Xr0H6dOf1ICuf6kbJwx1H5WliP/4pjukcrwezFfeeW4=;
	b=vD8FSaaOw6C2n8MSDX7eexhz2reyofAehkDXz5XSdd8zYKQjVrQbnHekzcADQLybbg
	mx8OR2nW5p7RdXJWzxOgXLx/cBHR+iLCNQ1iCk68lcOrsQhtsVbU2+WGNJEfqJvN7LXl
	+mddua/0uLgsluZ4jrOb8LoHnZZmzmP5E9wnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nebsIzQK2TB6ajAhL940bKzXPhJORnWe+eXy7Yi4StnSCNbjT2oEE7F1KVzWGusyb4
	BKvWCyLxkXhpRVVIbqsutwR5dVUWppLudYhHM9wYicrAo3aP1hVR06WeLMDjdjr/YYrd
	0g9KKsh2GEm6G+V4BXrKJeMvyCQbAyDkzQkWs=
MIME-Version: 1.0
Received: by 10.229.27.19 with SMTP id g19mr1043496qcc.11.1251498283967; Fri, 
	28 Aug 2009 15:24:43 -0700 (PDT)
In-Reply-To: <a63ecaf0908281452x12ab1a84w9df0b4a9e0f98163@mail.gmail.com>
References: <a63ecaf0908281452x12ab1a84w9df0b4a9e0f98163@mail.gmail.com>
Date: Fri, 28 Aug 2009 15:24:43 -0700
Message-ID: <19c1b8a90908281524m6c00b34eg7eb8fca9652a74f@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Error with xterm_207.bb in Fedora
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
X-List-Received-Date: Fri, 28 Aug 2009 22:43:08 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2009 at 2:52 PM, Sushi Sensei<sinestado@gmail.com> wrote:
> There are an error when try to select the mode for install:
> A patch for sinstall.sh will be added
> For example, changing line 120:
>
> PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g'
> -e 's/--[sxt]/1/g'`
>
> for:
>
> PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g'
> -e 's/--[sxt]/1/g'|tr -d '.'`
>
>
> I don't know to who send this "patch"


git-format it nicely and send it to very same list.

http://wiki.openembedded.net/index.php/User_contributions


Thx

-Khem


