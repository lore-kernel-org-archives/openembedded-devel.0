Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Mvrwl-0003fA-Kt
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 14:18:18 +0200
Received: by fxm3 with SMTP id 3so6197163fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2009 05:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Wc08OJv00ZHX713v/mb/0Armg8rRN3DBIfOdK6s3/7o=;
	b=tfxrNNIiJtVOti097u5ZT4Rhi5ft+a+MPBtVFz3Fru4Cb3VDbNjyR+Ps7Qiynv06Dx
	ScgxMzdQxgHCludlY+BoHzrVkz1Bl3CWimjDjxuSjRVVyt5mgIGPqGFTGpdcGmPGtZyn
	PT9cbjqoYLm+IEW/ly0NMEcsjmRfMZrnByIRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=T5e5gpWynqs54kQ8E+rj3c7fKGtERgGFWEqd5zAKRPNkMST6fvW+b02XfVeRwdGG2E
	ah1e/QMHoXmnEoGjp9IdHFrPCUkAK3XR4Ayt+7vW8OJRAP+u3ygSzIvRJv0opX/H0V1Q
	grzLnff7Z09DBktToBUEFkxbzixa94qFeVZVM=
MIME-Version: 1.0
Received: by 10.223.2.196 with SMTP id 4mr336453fak.3.1255004245513; Thu, 08 
	Oct 2009 05:17:25 -0700 (PDT)
In-Reply-To: <be7a9f3d0910071746s21cfaa25i158219e4641ec1ae@mail.gmail.com>
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<1254770821.9214.105.camel@lenovo.internal.reciva.com>
	<1254774335.3947.12.camel@leeloo.somedomain>
	<be7a9f3d0910051559v21ab3a2et766095a124dfb537@mail.gmail.com>
	<1254820563.6107.4.camel@leeloo.somedomain>
	<be7a9f3d0910071746s21cfaa25i158219e4641ec1ae@mail.gmail.com>
Date: Thu, 8 Oct 2009 14:17:25 +0200
Message-ID: <fca63bcf0910080517k13dae822j7821bf72ea458da4@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Thu, 08 Oct 2009 12:18:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/10/8 Otavio Salvador <otavio@ossystems.com.br>:
> In meanwhile it looks to have been fixed in current master; would be
> nice if you could test it and provide a updated patch if still needed.

I actually tested the build today. Unfortunatelly there is still an
issue remaining.
The patch fixed the automatically loaded modules, but missed that
there are still two modules loaded on startup in the config that is
shipped. These modules are module-access and module-accesslog.
(Actually I missed them when I wrote the patch, sorry for that.)

 Since the config states that these modules "should" be loaded, it has
to be decided whether OE goes with this recommendation and adds the
additional two modules as runtime dep., OR just strips/uncomments the
specific sections in the config.

Regards,
Michael


