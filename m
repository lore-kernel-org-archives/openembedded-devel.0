Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1L9HP2-00041P-Ij
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Dec 2008 12:02:20 +0100
Received: by fk-out-0910.google.com with SMTP id 19so785002fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 02:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=jXp61aJ8rQo9hbiYf+yaJNPDQuz51xY0vIxmR9jyJIY=;
	b=HF59UN8ELXuT4hXZHjFll2CLUpozhPLwIHh25n6GnfhaZrWuNctwDtaBYrLPqG7aEZ
	rszRw61XviXhF9eSmMEfXesmNfqPvZMcDxxJJedaxTD/zPPDVvw8aQXHmHxU71xaL9MO
	KpUGncOXZP7q4XET+E+1NGckefjJvZJInabqM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=EMiYl41G88F8PFVYSwiGOgCgiaXaeF18AfFXVCNOk7zLGKCxqEGG8eCKGrgHaoTN+i
	XUkcs7m2qj0YFcwLUa1CHmr855MKMcrSVoGZeW0XNvXMwcL0qxpPOLJMyXb0a0XSAI2B
	rmqYcu91jsbB5MYaQxPIqbAo4KPqAhQfZEJ98=
Received: by 10.181.51.14 with SMTP id d14mr784795bkk.63.1228647513344;
	Sun, 07 Dec 2008 02:58:33 -0800 (PST)
Received: by 10.181.52.8 with HTTP; Sun, 7 Dec 2008 02:58:33 -0800 (PST)
Message-ID: <d1b08f940812070258l25a1b54cg91b2b00a5fbafcaf@mail.gmail.com>
Date: Sun, 7 Dec 2008 11:58:33 +0100
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0812061551j27c4e7eagb10e01f64d9e8668@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0812061551j27c4e7eagb10e01f64d9e8668@mail.gmail.com>
Subject: Re: BUG? Some files in the build end up without read permission (mostly in .pc/)
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
X-List-Received-Date: Sun, 07 Dec 2008 11:02:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Leon,

yes, I noticed this trying to copy the whole tmp/angstrom dir.

permission denied   /input/keyboard/sharpsl_rc.c
...input/touchscreen/tsc2101_ts.c
.../arm/mach-pxa/poodle_pm.c
...asm-arm/arch-pxa/hx2750.h

The whole list here:

http://www.pastebin.ca/1278657

I suspect this in not intended...

Andrea


