Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Oe3JS-0003Yn-Dr
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 11:52:43 +0200
Received: by fxm12 with SMTP id 12so1133994fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=f3l1aNQOh2ehu7DXPC/CtZhPOM/nOz2Gx27rrJLTTDg=;
	b=gsgRRtkuXQt+LqRibMPo/Dd79VtMhkCBGwS5EbyzwMRf/42ZMEsZ4uLPjnHMfImZf9
	6OpPf8+6aw5SWNObb7J7bE0f0/VwC11k2GXNCk0uoHugvApiHtaQE+eMQqQB4301SgY+
	iiPrnm4FetMeZCK0uMMUEfJpr+nflTBt5Ne6s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V1tD2DKFrUY9iyV7Tf9K43aGJ32zfCDzmj/UKp8OKezctdVt22MhhEgPumpCTXm/sC
	Vn+dJ7MXocEPn2X46792jEhMkN45zy2+Pl6dYSJFAUeYJXHZHKclxcKcn3eQPJC8HCt6
	gUEmMTvQW7MBBHkhlSzReSP8aVfxqkQY5k4sk=
MIME-Version: 1.0
Received: by 10.103.172.3 with SMTP id z3mr1293243muo.25.1280310736293; Wed, 
	28 Jul 2010 02:52:16 -0700 (PDT)
Received: by 10.102.59.17 with HTTP; Wed, 28 Jul 2010 02:52:16 -0700 (PDT)
In-Reply-To: <1280309434.7083.8.camel@utx.lan>
References: <1280309434.7083.8.camel@utx.lan>
Date: Wed, 28 Jul 2010 11:52:16 +0200
Message-ID: <AANLkTi=pKyh+Ex8_gc2-9j0k_gO1Xm+-nof5UpCY7WGP@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)
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
X-List-Received-Date: Wed, 28 Jul 2010 09:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Stanislav,

we were discussing in irc about lzma and xz.
I'd add that it seems bitbake.conf is not yet xz aware while
base.bbclass seems lzma-unaware

Regards

Andrea


P.S.
> On Wed, Jul 28, 2010 at 11:30 AM, Stanislav Brabec <utx@penguin.cz> wrote:
> I just built an angstrom image and thinks failed.
> I have bitbake-1.8.18.

FWIW last night I could build 3 images (and the cpio.lzma) with bitbake 1.10


