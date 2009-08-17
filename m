Received: from [74.125.78.150] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <manuel.pietschmann@googlemail.com>)
	id 1McuvR-00069N-5D for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 07:38:33 +0200
Received: by ey-out-1920.google.com with SMTP id 3so585083eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 22:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=h5iTjH3fOsvnYRFqjYCxiv+N9a7kCXDOohuok2tonOI=;
	b=sqtQoxkJlm15WK2Ir+L6dPanVH7jZR9ZnnXwd00zzRQGNoghHnD5ijlWebqLQCYJOL
	BykOv2HNke4WB70IofksMgkIxHc8WY9BFiGiPVdnSDJm6xa3AP8hC9Am6aKxrUfsTwjP
	eKmT0F8UIm5LAwUPCOw31Y3jzPvfiO9UPOvL4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=YHHZCvEaeLqqgZzyVvFd3tvyHw7AqZwyZIRPc/qt/bpnpVOZD7ZUbHB4YQZflRRW02
	0qgopAeJswgpZGEGzvOIGLfXkRz2sGqK7Ch8t59BzGa8lgXwSP+ROWrxzySPcD01maZ6
	di+YA0q6M116qsKRmG8BnY2/NyNM5zOHhkmvE=
Received: by 10.211.167.11 with SMTP id u11mr2717714ebo.27.1250486497923;
	Sun, 16 Aug 2009 22:21:37 -0700 (PDT)
Received: from c7.cnet.net (rob.rz.htw-dresden.de [141.56.15.17])
	by mx.google.com with ESMTPS id 28sm10918378eyg.32.2009.08.16.22.21.35
	(version=SSLv3 cipher=RC4-MD5); Sun, 16 Aug 2009 22:21:36 -0700 (PDT)
Date: Mon, 17 Aug 2009 07:21:28 +0200
From: Manuel Pietschmann <manuel.pietschmann@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20090817072128.efc69473.manuel.pietschmann@googlemail.com>
In-Reply-To: <4A882DA9.10208@xora.org.uk>
References: <540809eb0908100042n74d61d41s6336bea61546dfb@mail.gmail.com>
	<4A881398.4070709@nospam.arcornews.de> <h6951i$4gi$1@ger.gmane.org>
	<h698ht$k4v$1@ger.gmane.org> <4A882DA9.10208@xora.org.uk>
X-Mailer: Sylpheed 2.6.0 (GTK+ 2.16.5; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] python-sip: update 4.7.9 -> 4.8.2
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
X-List-Received-Date: Mon, 17 Aug 2009 05:38:33 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Aug 2009 17:02:49 +0100
Graeme Gregory <dp@xora.org.uk> wrote:

> Rolf Leggewie wrote:
> > Koen Kooi wrote:
> >   
> >> On 16-08-09 16:11, Rolf Leggewie wrote:
> >>     
> >>> Hi,
> >>>
> >>> your commit 68233bb284d82040087b7d265ad3ad93c0cab475 broke "bitbake
> >>> python-pyqt" and possibly others.  See bug 5297.  Please fix or revert.
> >>>       
> >> That's not his commit if you had bothered to check:
> >>     
> >
> > Koen, if you had bothered to check instead of simply assuming, you'd
> > know that I'm well aware of who did what.  And that I contacted all the
> > appropriate people.
> >
> > So, just be quiet.
> >
> >   
> You might have addressed it better though, I was left wondering why I 
> would have broken python :-)
> 
> Graeme
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

i think moving python-pyqt from 4.4.3 to 4.5.4 will get it working again.

revert the python-sip patch wont work because the SRC_URI no longer exists (just the latest release is online)

so there are two options:
  1) revert python-sip to previous version and other SRC_URI
  2) fix python-pyqt to latest version, this seems to be more complex then you look into the bb-file

Manuel



