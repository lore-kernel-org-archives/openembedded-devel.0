Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1Lff9p-0004BZ-Qe
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 19:52:30 +0100
Received: by rv-out-0708.google.com with SMTP id b17so583113rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2009 10:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:reply-to:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YYupSogmpjVl7p3veqD9ANbbNT9o+mKfPGtTJxMxEsI=;
	b=khGpnx//pbCptM9wIC4E6Z/T0h4bOIl7CecxvELl3BUEMDVqG2Y1dzmpa5WjdWEWpD
	BE4vdBNNgg3V4Gapa5nVCCYooSNy6OAgjLZEmI4+5OwR1JGk9r8cFypMEHhq9ot7icQk
	LldJ9+WtvvT60q41BSHu4gAHq1cgAINtRcswM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:reply-to:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	b=pSMKhrv663EaCKn5tIYkPnUMz1bDQDORihMLgwqCHZA6cqVltCzle5xIbUrNqD18Qn
	vJPjt2frUdfHomCvWho1mLo8eNp5Xu4zOxRoWyNj4pXQ/G7JmuMlsJo3qfB36WFdSXOh
	08aDyOAic3uIO9toAqgM5T/KfalXZ+oli/Nq4=
MIME-Version: 1.0
Received: by 10.141.116.17 with SMTP id t17mr1410447rvm.239.1236365278714; 
	Fri, 06 Mar 2009 10:47:58 -0800 (PST)
In-Reply-To: <a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
	<49A7BD17.2080407@dresearch.de>
	<432beae0902271228w2150a17fo79e5a76c8eb71b42@mail.gmail.com>
	<49AAA599.5070507@dresearch.de>
	<a7f8874a0903020942y65f55a90rec06b1bc87ac8702@mail.gmail.com>
Date: Fri, 6 Mar 2009 10:47:58 -0800
Message-ID: <432beae0903061047p33bb6052o28e3d9b73847f1bd@mail.gmail.com>
From: Justin Patrin <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Fri, 06 Mar 2009 18:52:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 3/2/09, Hans Henry von Tresckow <hvontres@gmail.com> wrote:
> On Sun, Mar 1, 2009 at 7:11 AM, Steffen Sledz <sledz@dresearch.de> wrote:
>  > Justin Patrin schrieb:
>  >> Are the machines you're building on exactly the same? Do they perhaps
>  >> have different architectures or distributions? Have you tried updating
>  >> the systems?
>  >
>  > The machines are different.
>  >
>  > The one that works fine:
>  >  Ubuntu 8.10
>  >  Linux bfg9000 2.6.27-11-generic #1 SMP Thu Jan 29 19:28:32 UTC 2009 x86_64 GNU/Linux
>  >
>  > The one with the problem:
>  >  openSUSE 11.1
>  >  Linux recycler 2.6.27.19-3.2-default #1 SMP 2009-02-25 15:40:44 +0100 i686 athlon i386 GNU/Linux
>  >
>  >> This looks like a qemu failure to me.
>  >
>  > I agree. But i can't believe, that the different OS my be involved in that. Both are up-to-date. And i thought that all the tools needed to cross-build the packages are build by OE itself.
>  >
>  > Steffen
>  >
>
>
> I don't kow about openSuse, but I remember that Fedora used to have
>  some kernel patches that did not play well with QEMU. But that was
>  back on Ferora 7, since then I switched to ubuntu. I don't even
>  rmember exactly what patch caused the problems, but IIRC it was
>  security related.
>
>

Hmmm, good point it could be SELinux. Could you try disabling that, if
you have it enabled?

-- 
Justin Patrin


