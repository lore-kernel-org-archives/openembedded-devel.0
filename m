Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NhlOg-0000oQ-NI
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 16:01:09 +0100
Received: by ewy5 with SMTP id 5so2247055ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 06:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=r7QEo+cz6eXJ45vG2cTw6bgfcbxCnJmGfN5/BFHooWk=;
	b=oMZnhVKA2mNmjGYXGx0kHbjJIKmSXOPpo6ZS6lM6Fu4AmMXNs+oIcJuUihd9+jkVjN
	K00sIIkUR4FIs8/WECCz3JUQwW1kZpPf3aR6iz/fw+eZfNoFLPWU+6jYfNDfFzCVh+dS
	ilirtfVwITXdZBETY3mbooyJ/cKx1OZthUMhY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H0pFjnDshd3tfmEKPTO+W+XhzOn6NH5YJCLKTdDYoWhXBZE1PYSn67xKh2a062dTgz
	9Pi58NhmvZTahLQ0yRYdvSKf4y03pJaGOCg4A1HETcHgq2nMgvgMvEYkN6+h0jKBHCj+
	PEE3dxd669fvM3B3/wcWva1UaPzfI0DOM/bUs=
MIME-Version: 1.0
Received: by 10.213.75.134 with SMTP id y6mr2353862ebj.48.1266418700950; Wed, 
	17 Feb 2010 06:58:20 -0800 (PST)
In-Reply-To: <E1NhkfM-0000xh-I2@melo.openembedded.org>
References: <bug-5400-13@http.bugs.openembedded.org/>
	<E1NhkfM-0000xh-I2@melo.openembedded.org>
Date: Wed, 17 Feb 2010 15:58:20 +0100
Message-ID: <d1b08f941002170658s21fdcff5j43b0d23527b496d1@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] [Bug 5400] Make bitbake pull in zaurus-updater before initramfs-kexecboot-image on tosa
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
X-List-Received-Date: Wed, 17 Feb 2010 15:01:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

FWIW I think in stable branch zaurus-updater just need a fix like the
one in dev:

-addtask deploy before do_build after do_compile
+addtask deploy before do_populate_staging after do_compile

Andrea


