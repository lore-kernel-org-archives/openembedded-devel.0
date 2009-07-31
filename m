Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MWn7E-00042g-Tr
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 10:05:24 +0200
Received: by ey-out-1920.google.com with SMTP id 3so465621eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2009 00:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=e8cVkvNonb10cIR4KldAgE/k3M6QX9o+Hrfp3qa+4wo=;
	b=Yt3gdCNCcg8DM9vu4FcZmRTNpK8+jaAObJOVKLFn36GsUsvg0ImdXqIFNA0ynB4tp7
	s6E1j18qdWhGKsQVX/CF9zwdw5QnVOqrn1GpH1BejkmKeu6vGl3Tu5FhaAzgn6t9ts7V
	cbEh1Dhhp9cGvV0Bb+dNk7mlxTS01YoGNZXr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qQ8bFEPCvFgn3gLpoUa0O3b123nyyNRfFhGVA5VRXNZNpvMNeAYKIqBGMpQhPfS88n
	dKJbnDJlEfXfLRLpw4Pl9vt1ajmD9Rn6K139cQGey5UqAsoSm40C3TK752eEcyoe6x+E
	0SjKMICbOtSp14ORj8os+I4aK9duTXGqcQIhs=
MIME-Version: 1.0
Received: by 10.216.24.206 with SMTP id x56mr450407wex.39.1249026619350; Fri, 
	31 Jul 2009 00:50:19 -0700 (PDT)
In-Reply-To: <4A729943.4060200@xora.org.uk>
References: <4A6FD077.1060001@gmail.com> <h4ou1e$s42$1@ger.gmane.org>
	<4A700A74.7040507@xora.org.uk>
	<200907291131.04967.marcin@juszkiewicz.com.pl>
	<6ec4247d0907292211w6afc1f60s9fcf21bc7b2d56d3@mail.gmail.com>
	<20090730053353.GF25691@smtp.west.cox.net>
	<6ec4247d0907292249k42c582ddid3d53e847c5f835d@mail.gmail.com>
	<4A7160F2.8030000@xora.org.uk> <4A7255D3.9020703@gmail.com>
	<4A729943.4060200@xora.org.uk>
Date: Fri, 31 Jul 2009 09:50:19 +0200
Message-ID: <d1b08f940907310050s59fa5675ud222f117a7a49468@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] remove duplicated code from linux.inc
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
X-List-Received-Date: Fri, 31 Jul 2009 08:05:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> Graeme Gregory wrote:
> Looks good to me, do you fancy moving that do_compile_append into
> kernel.bbclass? You can then have the added kudos of fixing OE core files

Graeme, do you remember "[oe] [PATCH] Automate uboot entry/load
addresses detection" [*] from Ihar (booxter) ?
Perhaps Graham could try it.

I tested it but had strange results...

Regards

Andrea


[*] http://thread.gmane.org/gmane.comp.handhelds.openembedded/20843/focus=25154


