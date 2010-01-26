Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NZtIk-0004f8-AE
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 22:50:25 +0100
Received: by gxk7 with SMTP id 7so6217059gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2010 13:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FRkgqWig+S32ozWmI/j64uHnXxpUKjGQiiCXhnZO6V0=;
	b=orhzXcLf9jJ0COBj/25XVhnrbvp0P5kGL1P+AkBGNpu4y4aUSLXBG1x9IRMiCvZXJd
	uhNpj6RgcF2enTKHVx3vhLBpiPWM4XU1CIudac//6FibCo6+2P9C1H+VOC/ccUmpXCae
	37wOwvyqmXmFMbgnUVALOS6ytp5zPVypMiPmQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=U6U6lPZNlrH4FXs8TOP1G1Gn0SXaMkFnYtUBexmLpt/321iVhYTFhKhDYyew3vJB0Z
	UiJ0qqsyD35KZKrIYLyiUIQjfMa1VhDZvqK2UxY7HJWJz4EJzzNkRpKazPPvHWXPS/G2
	m4AU8OSItUuq4iYJM37BcLgNFxlY/pCk+FjXo=
MIME-Version: 1.0
Received: by 10.100.244.21 with SMTP id r21mr10856375anh.92.1264542479940; 
	Tue, 26 Jan 2010 13:47:59 -0800 (PST)
In-Reply-To: <d1b08f941001230513j5c017493s19838533588f33bc@mail.gmail.com>
References: <ac9c93b11001230431s6a9dc637y370ad9999d82c83@mail.gmail.com>
	<d1b08f941001230513j5c017493s19838533588f33bc@mail.gmail.com>
Date: Tue, 26 Jan 2010 22:47:59 +0100
Message-ID: <ac9c93b11001261347x7a5f5bc3h9651448f9e9b0b49@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging fails in do_deploy for kernel
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
X-List-Received-Date: Tue, 26 Jan 2010 21:50:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/23 Andrea Adami <andrea.adami@gmail.com>:
>> I set the DEPLOY_DIR_PSTAGE to outside tmp. (packaged-staging is
>> already inherited by default in Angstrom).
> Then you incurr in that infamous issue:
> http://blog.denix.org/2008/09/getting-even-more-dangerous-with-pstage.htm=
l

This seems like a good patch to me.
Any particular reason why it is not applied?

>
>
>> Not really an idea how to fix this. Any expert with an opinion?
> See above link.
>
>> =A0* Package staging-strace-armv7a-angstrom-linux-gnueabi version
>> 4.5.14-r9 has no architecture specified, defaulting to i686-linux.
>> which also seem odd to me.
> Yes, this leads to subsequent failures during rebuild from pstage.
> See e.g. udev and machine-specific staging-packages have wrong arch too.

Yes, but how to get rid of it?
>
>> That is where I gave up. Suggestions are welcome!
> The good news are that RP, kergoth and Tartarus are aware of the issue :)
> Still, it seems this is a low-priority task...
>
> Regards
>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


