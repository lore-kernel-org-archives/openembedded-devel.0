Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Oa91E-00019y-8y
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 17:10:02 +0200
Received: by wye20 with SMTP id 20so3108951wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 08:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:received
	:in-reply-to:references:date:message-id:subject:from:to:content-type;
	bh=JjxUmcPgMoLSAUf30GmOZaibCG9wBsTvHThJLnhghSY=;
	b=BlSn6D8cAUSrMzVIgqXQJVBBq2xz5wjlNEr74v+zHFUyPMpUANthqoY9r0Hv2/zChB
	uZwLCkKHKNvJ/e6gTsJB4m6k7PzReFC9kmBds83E2pb1KdZzMdCDrsr9MSRPnD1nr7kL
	3WPl+U+/yeoyvLEj2YTCdYW8ZCga1pDQzzn70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HeSpOmi8p2UKhBLAWJN7BDNbipjzRC6EyZ0EyznudUyfkciVGpyiSMBhSQXUW5yF2v
	X31EXrruosDVyIbVWk8L+RXXt7kWOtZ5m1+4iBo5LtI9Y9ALnMEXfR73Ah+DSQ+kpMny
	w89H0v7xgmzOUxdLgh5f/3WbQ6yy5SYLELP6g=
MIME-Version: 1.0
Received: by 10.227.137.130 with SMTP id w2mr2031555wbt.135.1279379369055; 
	Sat, 17 Jul 2010 08:09:29 -0700 (PDT)
Received: by 10.216.234.17 with HTTP; Sat, 17 Jul 2010 08:09:28 -0700 (PDT)
Received: by 10.216.234.17 with HTTP; Sat, 17 Jul 2010 08:09:28 -0700 (PDT)
In-Reply-To: <1279373863.21888.10.camel@lenovo.internal.reciva.com>
References: <AANLkTikZkRU-dCiBNlVdZ6XYsdBk3MjZBksexc6JtSAT@mail.gmail.com>
	<i1qodg$i28$1@dough.gmane.org> <20100717000603.GK23169@mx.loc>
	<1279373863.21888.10.camel@lenovo.internal.reciva.com>
Date: Sat, 17 Jul 2010 17:09:28 +0200
Message-ID: <AANLkTimFuoxBKczjwGexQZAVGwEXqkHqfSbCf7xf7x90@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: busybox mdev
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
X-List-Received-Date: Sat, 17 Jul 2010 15:10:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Baking micro-base (not -image) tries to build udev for me?

On 17 Jul 2010 15:39, "Phil Blundell" <philb@gnu.org> wrote:

On Sat, 2010-07-17 at 02:06 +0200, Bernhard Reutner-Fischer wrote:
> (what's the reason micro-base u...
Er, does it?  My copy of micro-base-image.bb says:

# Include minimum init and init scripts

IMAGE_DEV_MANAGER = "busybox-mdev"
IMAGE_INIT_MANAGER = "sysvinit sysvinit-pidof"
IMAGE_INITSCRIPTS = ""

If it's using udev then that is definitely a bug.

p.




_______________________________________________
Openembedded-devel mailing list
Openembedded-deve...

