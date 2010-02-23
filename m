Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Nk1GJ-0007GX-Be
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:21:46 +0100
Received: by fxm20 with SMTP id 20so3925641fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 12:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=n2gNqjPBoHjLPceJKvQS/QvLCagy7M2a+jaZeORBbBI=;
	b=SZuCb0YMfF9Hn4JJHcyFwnR0mhDcZc3wIeFJ5psEF5WaqgIPZLRv1KM2zgzrKy5Emn
	nkYnIHgrVtE+AmNeSPmSwFtyZif9CSN+uk02cDDRzP6Y13xS9+B8uawmYdCS1kHpAhj7
	OdzSUrjjKVJiOEyQHt0I7wk+4My33ubhhFxpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=RL9MlJk6X2nKoy22WU1Sjlx4kMUICrUg04Yi4seAAVPuomhK1MzVe8IlwIQ8cXu9aU
	c0nJz8LrDZr6wBridhWKzVKJQLgJw/r8AbvlofgqAWX6gdAFa3OouvD8yC9CgpRIjmBh
	uiildHaBe7nZuGbs6T/wde4VLVzQqsTCrN/IA=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.180.19 with SMTP id f19mr11416hbg.35.1266956338371; Tue, 
	23 Feb 2010 12:18:58 -0800 (PST)
In-Reply-To: <1266955969.18176.59.camel@trini-m4400>
References: <be7a9f3d1002231055n5783b939j7d7d75081efdaa2a@mail.gmail.com>
	<1266953000.18176.52.camel@trini-m4400>
	<be7a9f3d1002231141y2fde23afn787781d354f5ead@mail.gmail.com>
	<1266955969.18176.59.camel@trini-m4400>
Date: Tue, 23 Feb 2010 17:18:58 -0300
X-Google-Sender-Auth: db29e5463c957c76
Message-ID: <be7a9f3d1002231218g19c58eefiad8260dd9551e559@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Kernel image stagging [was Re: [PATCH] kernel.bbclass: Stage the raw zImage and modules tarball for inclusion in pstage
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
X-List-Received-Date: Tue, 23 Feb 2010 20:21:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Feb 23, 2010 at 5:12 PM, Tom Rini <tom_rini@mentor.com> wrote:

> As a use case, I configure for beagleboard.  I bitbake console-image.  I
> stick console-image.tar.bz2 onto partition 2 of my SD card.  I grab my
> kernel from where? and stick it onto partition 1 so that I can put it
> into the beagleboard and mmc init;run loaduimage;run mmcboot.
>

I see your point and I'm not saying we shouldn't have the kernel available
somewhere. We need it somewhere.

However I disable when it is copied to deploy; in my opinion it ought to be
done at rootfs creation so it will _always_ have a {z,bz,u}Image available
in deploy dir.

Just try:

bitbake console-image (works)
rm $DEPLOY_DIR
bitbake console-image (fails)

and this is wrong IMO.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

