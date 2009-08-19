Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1MdfOS-0000RE-CT
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 09:15:44 +0200
Received: by fxm12 with SMTP id 12so3328019fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=boQvvwrVvmznIrXY4iwKsIMFc9A40owuO9dN/qteVEg=;
	b=gg6LXtZw7kCfnjttJlP/rUEjVo+jskjv7T/alP9RPnffheRMF3bwsoFBO+idHS6tS9
	WYvhBSReANJUMC1KS/2ze4Mmy/c4+3oFVuKNmrEvUf56x/p3Y3G7NQxu9EwV/8EgAHKg
	RMGeNEOmYTKuVgFpLGu7zyd2AcHACOqiba+44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=O/1lovzNvsIqESH6S7P6OStG2Qu185dd85zjQqHL2v4ibmitcC2+MGndu2XrzX0EeU
	Nh+aSflb1MhjHOOqe7W4YKYib3dwJJFZXDoxyxkXU9cwDUeiMcqBMmrYLvi2RqZSPMR/
	SGVV4aYKx0O4jwZW7ZAeF+d+pdoZl50IyCrQE=
MIME-Version: 1.0
Received: by 10.216.47.204 with SMTP id t54mr1479839web.75.1250665105625; Tue, 
	18 Aug 2009 23:58:25 -0700 (PDT)
In-Reply-To: <h6ed6d$r1l$2@ger.gmane.org>
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
	<h6ed6d$r1l$2@ger.gmane.org>
Date: Wed, 19 Aug 2009 08:58:25 +0200
Message-ID: <6978a1740908182358l69cf380awefdf8d966f75678a@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Wed, 19 Aug 2009 07:15:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Aug 18, 2009 at 4:17 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

>
> 1) never ever install something into $HOME
> 2) fakeroot do_install() {}
>
> regards,
>
> Koen



1) Is there possibly something written why not to do that? (Someone on irc
already warned me not to do that, but he didn't remember the reason) and I
couldn't find anything on list / manual or wiki about it. (And I couldn't
find another way to add my public ssh key to an image, working with
dropbear.)

2) Should that make it possible to create a dir with 700 permissions? (When
I test it in this recipe, It doesn't change the result: workdir becomes 700,
but ipk content and rootfs becom 775.)


Siebren

