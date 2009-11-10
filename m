Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7uAi-0000Ao-KI
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 18:06:27 +0100
Received: by bwz9 with SMTP id 9so221887bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 09:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=hQsTqq+1zUwfVWrKaRg69y4xLRNOiXz206STQFnh9U8=;
	b=vN40nHxdkXTezg6uD24L8fZu6G5fxG/LodJHVM00twtoc3FnKjAnXfRIAGIj1rgrxI
	ahuPiVt1a7hkYPWb/b7HdL1MYtCA4qCjk2qlaUBLu6o2xEtHodZ+6bLf37kTFQB1uh92
	/43chADbyDneFfQ+WFiK0oKVmi3dHY7yfXLik=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=jP+UK3YW83B7l6SVWuD35Vkj/FIexfyOA9x5soSSrrLt/87pZ+clnhgmpwoopvF7D6
	SS4YPoaOpADSwEZIKzUx/JYjBRfXV9omCXTMk46yFDmhMJhC3ASTj9yahW8swG/5uaOp
	ZIZYvooO5pKM0FzYhnTUpqfw475oH25gnXhko=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.184.144 with SMTP id y16mr32748hbg.188.1257872706725; Tue, 
	10 Nov 2009 09:05:06 -0800 (PST)
In-Reply-To: <c384c5ea0911100806r7b163600l9adb62a23f1877a4@mail.gmail.com>
References: <4AF353C8.80904@cs.put.poznan.pl>
	<c384c5ea0911100806r7b163600l9adb62a23f1877a4@mail.gmail.com>
Date: Tue, 10 Nov 2009 15:05:06 -0200
X-Google-Sender-Auth: c98bdb0cee3e41aa
Message-ID: <be7a9f3d0911100905i791157e1lfd73c3cdb7f58f51@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: menuconfig task for kernels
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
X-List-Received-Date: Tue, 10 Nov 2009 17:06:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Nov 10, 2009 at 2:06 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Look in classes/kernel.bbclass, line ~221:
>
> addtask menuconfig after do_patch
>
> change it to:
>
> addtask menuconfig after do_configure
>
>
> and see if that helps.
>
> I wonder if this can go upstream.

After menuconfig the .config might be copied back to the recipe?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


