Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PmuMM-0004q4-OZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 21:40:26 +0100
Received: by qwi2 with SMTP id 2so4442011qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 12:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=0IwgKaJgqAs34MM3kGycPAUi3NDFOHdCvg1DBaAY+Do=;
	b=oedJII0icuKdmsaO3cV52LXvjufHe6pNa8LihapU04w++2lBu1jlTRfgny8G37dboM
	dHq2lwrqgrI22ZI2T6wcrrZhJ3TihLfAfq9QsW4jqMJ5vKyacDolwmZEs0Bppl+hxmX1
	H338hGju3hbLuhevXpchAFT8xJ8hpsJJbb0F0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rRaEOqxSDVFXbfBrt6k7fOmD3TfFhm/DaSibeNVAK/uxfXZT7r3G0H075jpCgop9d9
	TvY4j7ilrrRlQx7Rl2vISK/rMThfI/tl3JAFRG26TVMyKtnoiE1nQ0csjivN3Or6r2pw
	jnj4bQfuh8riB4eBcqO7lYQQfq8oFFD3Ul0H8=
MIME-Version: 1.0
Received: by 10.229.91.147 with SMTP id n19mr14144220qcm.153.1297197563727;
	Tue, 08 Feb 2011 12:39:23 -0800 (PST)
Received: by 10.229.68.100 with HTTP; Tue, 8 Feb 2011 12:39:22 -0800 (PST)
In-Reply-To: <iis1mg$tj9$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D517D6C.3070604@mentor.com> <iis1mg$tj9$1@dough.gmane.org>
Date: Tue, 8 Feb 2011 21:39:22 +0100
Message-ID: <AANLkTim7EfHHu1wCmZOwEtG7uvtURM=fmpjGT9k790Jo@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 20:40:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

> On 08-02-11 18:29, Tom Rini wrote:
> Yeah, this patch is wrong, since task-base is supposed to drag in bt and
> wifi when it's available which includes usb, pci, serial, etc.

Shouldn't these optional devices be handled by packages from feed
rather than the bootstrap image?

bye,
Filip Zyzniewski


