Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QTxFc-0008PX-QE
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 16:27:24 +0200
Received: by wwb17 with SMTP id 17so4191445wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=AuUrx/ht83Iph7FVEb+p6iX/bTOnTogN2fVF774W1J0=;
	b=obe7buHMAMuo/tgD9Ra1YuBhBpZl1Oooc68zv2e1sPsRnqLGJFMpCnaJ23t1E5KMcn
	BcpKFodBDLvWKq6jAUBPl8h64yKS0WW+NnBosiBv9/1PAl9ssWrB2rbw53sx7UMArpMW
	FfIH8cSsSEfvbkYv+Pfrng3BSYOk4IX8NCW5g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=wxWaZNGsM30003G5RVwOksDsaDU66bzCg0lw7CTQgkn+6VqRBmXyCQocDXS7wKeDkk
	Uc7rJh5jMLYz22fhVUVTZyoKP464p+q42POy+YzRfCxr2maHL29ImLJUGmGiZ66Gq97C
	4a4+8qKkc/nqdWOA2DUHX17Y2FU/o9LJvGnjs=
Received: by 10.227.58.15 with SMTP id e15mr6348541wbh.28.1307456642779;
	Tue, 07 Jun 2011 07:24:02 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id p21sm3595286wbh.23.2011.06.07.07.24.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 07:24:02 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Tue, 7 Jun 2011 16:23:58 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20110607162358.44a38bcf@guibc>
In-Reply-To: <20110607133310.GC23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
	<20110607152354.7ff67c49@guibc>
	<20110607133310.GC23137@jama.jama.net>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 14:27:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Martin,

> > > what does +nogtk mean in version?
> > 
> > It is possible to compile linphone with or without gtk GUI.
> 
> then I think it's better as part of package name
> linphone-nogtk_3.4.3
> 
> otherwise you risk user getting upgrade on target
> from linphone-3.4.3+nogtk to linphone-3.4.4+gtk

Ok, I will change this.


> > > > +OVERRIDES_append = ":video:console"
> > > 
> > > This looks like someone trying to implement USE flags in OE :).
> > > But I'm not sure it's right way and I haven't noticed this used
> > > in any other recipe. So it would be better to discuss first.
> > 
> > I am new to openembedded and thus may have missed something in the
> > documentations. Can you point me to some elegant way to implement
> > recipe flavours?
> 
> I don't think TSC agreed on some sort of USE-flag solution or policy
> yet, but keeping shared EXTRA_OECONF in linphone-3.4.3.inc and then
> EXTRA_OECONF_append with nogtk specific options in separate files like
> linphone-nogtk_3.4.3.bb would be easier to understand (at least to
> me), even when not so "elegant" as your OVERRIDES solution.

There is also some conditionnals with the DEPENDS.
What is the use of all the "DEPENDS_some-package-name" directives?
Isn't it identical to only use the global "DEPENDS"?

I removed all the RDEPENDS stuff. Can you confirm it was unnecessary?

Regards,

Guillaume


