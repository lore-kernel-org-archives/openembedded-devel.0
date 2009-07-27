Received: from [209.85.220.228] (helo=mail-fx0-f228.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <derkling@gmail.com>) id 1MVM4Z-0001TG-1C
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 11:00:43 +0200
Received: by fxm28 with SMTP id 28so2576435fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=c69iHRGubtH5NP6/B4vkSshAvLHSQYswzJEWdV3vAuo=;
	b=dRWNqGsnhq2vG7mZLAfgXPqv05grjttdsE7FlDQ0SSWjCOhdKRbNa+IU2dNl42+zQl
	SwvFRSNms/NgLufRCLbkDQo6bC1iYEy0k00XRCLD8RRpcFkNBmugYWeO99YRSfGZnKzH
	3XMXlyyQta3265z2E4XiBDXXnFoqPEHSJsIJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JEkqzwS6cVjIsbvgfocdbW1yD9ty4qoUhT2HCZHIlM//69BO4IRhzSheTypfXTPRwk
	rWDXc3Z2JP4XN4tn00odZAQ8xWp7zX4pa4DxHIb5aL7kqtKYtE3EgUFzsgG0sdlNRfv0
	7ZXTu5vKjlHqGPl89hUMYrpiFuTbwOEzMEZVg=
MIME-Version: 1.0
Received: by 10.223.127.8 with SMTP id e8mr2289731fas.81.1248684361284; Mon, 
	27 Jul 2009 01:46:01 -0700 (PDT)
In-Reply-To: <4A6D5C5A.2010003@gmail.com>
References: <4A6D5C5A.2010003@gmail.com>
Date: Mon, 27 Jul 2009 10:46:01 +0200
Message-ID: <aa8983610907270146n6c3f6fe8ucc2f63b3ff32aa@mail.gmail.com>
From: Patrick Bellasi <derkling@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: linux recipe selected despite ASSUME_PROVIDED += "virtual/kernel"
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
X-List-Received-Date: Mon, 27 Jul 2009 09:00:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Jul 27, 2009 at 09:50, Graham Gower<graham.gower@gmail.com> wrote:
> Hi,
> I wish to build an Angstrom based console-image for mipsel from the
> org.openembedded.dev branch. I maintain a kernel for the device but am
> not yet ready to integrate this into an OE recipe. The default
> linux_2.6.30.bb
> fails to build for me, thus I wish to not build the kernel at this point
> in time.
>
> My local.conf contains the following lines,
> STAGING_KERNEL_DIR = "/home/grg/jz/linux"
> ASSUME_PROVIDED += "virtual/kernel"

I guess that a kernel is required to build an image: in instance to
compile libc which relay on some kernel headers.

> However, when i run 'bitbake console-image the default linux_2.6.30.bb
> recipe
> is still selected and the build procedes to fail.
>
> Is this the correct procedure to avoid building a kernel? If so, what else
> could I be doing wrongly?
So: if you ASSUME_PROVIDED a kernel, at least you should provide a
reference to you kernel tree... but the main poin is: is it possible
to reference a kernel outside OE?

>
> -Graham

Patrick

-- 
#include <best/regards.h>

DERKLING
LRU 338214 (http://counter.li.org)

<---------------------------------------------------------------------------------------------------------->
   Patrick Bellasi <bellasi at elet dot polimi dot it>
   PhD student at Politecnico di Milano

   Contacts:
    - ICQ         344672588
    - MSN       derkling at yahoo dot it
    - Skype     derkling

   Personal Sites:
    - Bookmarks
           http://del.icio.us/derkling
    - Bibliography
           http://www.bibsonomy.org/user/derkling

   Privacy:
    - GnuPG     0x72ABC1EE (keyserver.linux.it)
       pub      1024D/72ABC1EE 2003-12-04
       Key fingerprint = 3958 7B5F 36EC D1F8 C752
                                9589 C3B7 FD49 72AB C1EE
<---------------------------------------------------------------------------------------------------------->


