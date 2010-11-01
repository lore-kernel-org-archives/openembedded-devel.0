Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PCww1-0006XK-Fc
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 17:08:40 +0100
Received: by ewy2 with SMTP id 2so2721330ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=y/NJvtyggAZYdBSo7r+6K9BbriNdRHGs78LYLL9X7Ns=;
	b=R87L7GNN6l6ak86qaLRxba8pFiIJ/4ySpfIL3BZyzMlzOo1cXFDvhIL1YoCZbYooiE
	MCZUMIAXtiBIGYBUTfAXolIEniydtmt35xUwK/F+Tjc+Pjbytnal3VY8HLQw5Fo5wzQa
	Y0VsVtYne105QAW7Ru6eSh+G3E9VJM99IHGUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Yg6Tg9OknulT/LIs/BMbEHdh4MvsSpbBwY8SKhRsx7odsdXGsC4KKUIc5fII76woeZ
	bPwebl0TVhCaRX50XVd4sfQgO57mcBmzfXWWN/IHPKzn1xeAuR8b0Bc2TxeHcATupuJk
	fKKx4hyfSJHcQ1tap8g3d5+lDUDsLfTuu+QpQ=
MIME-Version: 1.0
Received: by 10.216.53.4 with SMTP id f4mr958216wec.4.1288627664904; Mon, 01
	Nov 2010 09:07:44 -0700 (PDT)
Received: by 10.216.235.214 with HTTP; Mon, 1 Nov 2010 09:07:44 -0700 (PDT)
In-Reply-To: <AANLkTin2CFC04W7jirzz9Tr7jv9w+mpQqpYRTs=4LLG=@mail.gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTinfxX_E3L30uK_nvm2hO5f0h-tDOu21mdXC2VGG@mail.gmail.com>
	<AANLkTin2CFC04W7jirzz9Tr7jv9w+mpQqpYRTs=4LLG=@mail.gmail.com>
Date: Mon, 1 Nov 2010 12:07:44 -0400
Message-ID: <AANLkTi=jydktHJ2pemeLAC=vZm=akr0kWFHdA-3TEh0L@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 16:08:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 1, 2010 at 3:57 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
>> Second question - is there any sense to clean/restore $TMPDIR between
>> building of different images (x11-image/opie-image) but same machine &
>> distro?
>
> Not really. This has been discussed on the list and it was felt ok
> build different testing recipes/images for the same machine/distro
> without cleaning.
> Inbetween cleaning will not help too much and takes quite some time.
> it seems a good plan to mention that you did not clean inbetween (e.g.
> by saying in same target-image cell that you did x11-image and
> opie-image)

Agreed, I think it is most important to start clean with every cycle,
but I do not think it is necessary to remove TMPDIR between building
combinations.  As Koen mentioned, doing an incremental build before
cleaning and building is a good idea.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


