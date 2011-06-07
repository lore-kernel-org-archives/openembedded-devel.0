Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QTwLh-00075n-8q
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 15:29:52 +0200
Received: by wye20 with SMTP id 20so4066642wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=Vz62VaMdFnFEHLU96H6G3h9h6azXvSleV2DG8iy5z3Y=;
	b=fy1C2h1aDUvoAfmLekMBbFq7MqH/VUhAlqhOFyeQZUce0OHh3an8yMz4kUrt2VzEUl
	rBWCeu4McQYEwFvQV6su0vIt/gCC2uCXc0gmbghgmTcBYj18u3gZZ8wj0/Z4a2V3Eiqx
	TTE3pzt885+JUdBqPj/9/a6aFqK4wZOxIKSb4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=LOETyAoDfUVRZivRp0v2+rj4v9YRxM8ajYef7w2j1Lx8nzJ1TmiaQ92615+eufeRhe
	NnRs/MBCXRDkh7HkKBs71oFH0IVHFSv366Zx+b2uOX/VC434VGquZP73RcQTP3LHTe12
	z9MgFIi37LYvwwgWdiF1xNaCBNylXjyguYPxo=
Received: by 10.217.7.72 with SMTP id z50mr5917012wes.60.1307453039568;
	Tue, 07 Jun 2011 06:23:59 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id w58sm2866725weq.25.2011.06.07.06.23.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:23:59 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Tue, 7 Jun 2011 15:23:54 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110607152354.7ff67c49@guibc>
In-Reply-To: <20110607124151.GA23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: martin.jansa@gmail.com
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
X-List-Received-Date: Tue, 07 Jun 2011 13:29:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Sorry, I missed your other comments.
See below for my answers.

> > --git a/recipes/linphone/linphone-common_3.4.3.inc
> > b/recipes/linphone/linphone-common_3.4.3.inc new file mode 100644
> > index 0000000..5865ab0 --- /dev/null
> > +++ b/recipes/linphone/linphone-common_3.4.3.inc
> > @@ -0,0 +1,11 @@
> > +
> > +SRC_URI =
> > "${SAVANNAH_MIRROR}/releases/linphone/3.4.x/sources/linphone-3.4.3.tar.gz
> > \
> > +	file://cif10fps.patch"
> where is this file?

It is a mistake, this patch should not be added.



> > +require linphone-common.inc
> > diff --git a/recipes/linphone/linphone_3.4.3+nogtk.bb
> > b/recipes/linphone/linphone_3.4.3+nogtk.bb new file mode 100644
> > index 0000000..9bec7b1
> > --- /dev/null
> > +++ b/recipes/linphone/linphone_3.4.3+nogtk.bb
>
> what does +nogtk mean in version?

It is possible to compile linphone with or without gtk GUI.

I wrote another recipe for linphone 3.4.3 with gtk GUI.
It will be sent for review later.


> > @@ -0,0 +1,9 @@
> > +DESCRIPTION = "Audio/video SIP-based IP phone (console edition)"
> > +HOMEPAGE = "http://www.linphone.org/?lang=us"
> > +LICENSE = "GPLv2"
> > +PR="r6"
> > +
> > +DEFAULT_PREFERENCE = "2"
> 
> why D_P = "2" when all other recipes have default D_P = "1" and this
> has highest PV?

Ok, I will correct it.


> 
> > +OVERRIDES_append = ":video:console"
> 
> This looks like someone trying to implement USE flags in OE :). But
> I'm not sure it's right way and I haven't noticed this used in any
> other recipe. So it would be better to discuss first.

I am new to openembedded and thus may have missed something in the
documentations. Can you point me to some elegant way to implement
recipe flavours?


Thanks,

Guillaume


