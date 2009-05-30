Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MAX1B-0003JI-PO
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 00:27:10 +0200
Received: by an-out-0708.google.com with SMTP id b6so3724961ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 15:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=l08Ctz8+32vLnEUVY4Bz77IB75gqYG7I7tcLk1252EI=;
	b=PUjshJU/hN17wrv8+aBlyLNvD0dtTXwtcsaSC6K3ZpK2jJfEm1q6fcEph3aM5oNG1A
	PCtvWRBUqN0aKXFjB5OLsmyRp68SAPy72qLbyPQH+uXVUpKrPuxxW2qBC8JVOaXQjDgw
	JQwO8sORZzV2EeVC37kVfAXKt3p+TCUJZhFf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=CVhNZVQxxFvjXvKZRi4Lh7mcfvq4VDLJRBx0jSkVMZeKMmg+iDpqNuSn3+y68cUJTo
	JS1soxOaItU57u1u54p/ekMlHWj+6PZuObhz+AedAhz/30jMx7H2nuTgmtTWjPLIu/U5
	9AgHcY4FJjGMmEmF6bJDbu3RXaqvDxJDOhQFQ=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.125.14 with SMTP id x14mr5369989anc.136.1243721915713; 
	Sat, 30 May 2009 15:18:35 -0700 (PDT)
In-Reply-To: <20090530215243.GS23842@smtp.west.cox.net>
References: <20090530215243.GS23842@smtp.west.cox.net>
Date: Sat, 30 May 2009 19:18:35 -0300
X-Google-Sender-Auth: dc83369dfb77d001
Message-ID: <be7a9f3d0905301518g48862da6s9b51fe38dc0ee1e9@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: (e)glibc.inc: add minimal sane kernel versions
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
X-List-Received-Date: Sat, 30 May 2009 22:27:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Tom,

On Sat, May 30, 2009 at 6:52 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Tue, May 19, 2009 at 12:52:07AM -0000, Roman Khimov wrote:
>
>> (e)glibc is configured for OLDEST_KERNEL, certain target architectures have
>> specific requirements for kernel versions, if that are not satisfied (e)glibc
>> reconfigures itself with what it think more appropriate and warns user that
>> there is misconfiguration on his side.
>>
>> Add minimal sane kernel versions for architectures requiring that.
>
> Sorry for the late reply, I'd make one last request however, move
> OLDEST_KERNEL from bitbake.conf to these files as well.

Fully agreed; it is not distro dependant and neither is suppose to be
adjusted very ofthen and then this ought to be set in the class files
to make it clear where it is used.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


