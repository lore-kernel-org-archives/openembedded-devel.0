Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MiqSy-0006hS-L5
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 16:05:40 +0200
Received: by fg-out-1718.google.com with SMTP id d23so367739fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2009 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=+xJr4SYn/ehbkIEtsIBiydcVKgimqhpjqFFG4aoaAvU=;
	b=q9bKlqvDjnCIeSmlvZEWj68bmhDelbuM91SjERzuQcHpWGRVF3Fo1PiauosjDByxsA
	WX7Wvt1rIHzd9p1rbX5lDdICcVFywqx7QFurQNXZ4PMw0X+cpxQjYgWHpUxpvjhlEz0g
	vewhMdRaxRhA0anpd9NCHck4VA5Jrf5b4Yp6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=llqO1NW+9g4qYYBYdymYq9xriTaseJVbcV1bovtECqbfcHlR46mGUYjjNg5RGK0DrE
	UH4C6trYcQkAU0ImrgVLx3Gg2c3Rn2qCRfMkBelfpUHLwXhZkTdLEVGZKYLXtNMKppzW
	L5VCUpb44SQQ/ib9N8nRhywIVmzWBA2uilbpI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.142.145 with SMTP id g17mr768359hba.55.1251899216707; Wed, 
	02 Sep 2009 06:46:56 -0700 (PDT)
In-Reply-To: <a63ecaf0909020542u62f8b8d7i5a0419d99424c2a0@mail.gmail.com>
References: <a63ecaf0909020542u62f8b8d7i5a0419d99424c2a0@mail.gmail.com>
Date: Wed, 2 Sep 2009 10:46:56 -0300
X-Google-Sender-Auth: 8d3ff4d5f3751b52
Message-ID: <be7a9f3d0909020646k67c10eddw71fe5cc547e7b0@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: xf86Version.h and others in xserver-xorg 1.6.1
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
X-List-Received-Date: Wed, 02 Sep 2009 14:05:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

For 1.6.1 you need few of them updated.

On Wed, Sep 2, 2009 at 9:42 AM, Sushi Sensei<sinestado@gmail.com> wrote:
> I'm compiled xserver-xorg 1.6.1 and some drivers compiles
> (xf86-video-cirrus, xf86-video-fbdev, xf86-video-sis, xf86-video-vmware) but
> some other no.
>
> xf86-video-s3 breaks with:
> | s3_driver.c:46:25: error: xf86Version.h: No such file or directory
>
> xf86-video-intel breaks with:
> vi830.h:73:20: error: xf86mm.h: No such file or directory

2.6.3 fixes it.

> xf86-video-trident breaks with:
> | trident_driver.c:177: error: expected '=', ',', ';', 'asm' or
> '__attribute__' before 'TRIDENTISAchipsets'
> | trident_driver.c: In function 'TRIDENTProbe':
> | trident_driver.c:980: error: 'TRIDENTISAchipsets' undeclared (first use in
> this function)
> | trident_driver.c:980: error: (Each undeclared identifier is reported only
> once
> | trident_driver.c:980: error: for each function it appears in.)
> | trident_driver.c:990: warning: assignment makes pointer from integer
> without a cast
>
>
> I have this files in:
>
> tmp/work/i586-kaeilos-linux/xserver-xorg-2_1.5.3-r12.0/xorg-server-1.5.3/hw/xfree86/common/xf86Version.h
>
> but in:
>
> tmp/work/i586-kaeilos-linux/xserver-xorg-2_1.6.1-r12.0/
>
> I don't have any directory called common (and any xf86Version.h inside!)
>
> For the others errors I don't have notice
> --
> ------------------------------------------------------
> --- Timeo Danaos et dona ferentes ---
> ------------------------------------------------------
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


