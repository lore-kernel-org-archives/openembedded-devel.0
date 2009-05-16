Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M5Rh7-0002Q6-Ml
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 23:45:25 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1466657yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 May 2009 14:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/rjU5gF32uZr9K9CIlfPDuFzlJyqbucBHXvSv2RSFTM=;
	b=OJWf1f52HXWh4/ctXJ/78SF3Ndra13yLSVq9iKfaFvPA3v4elp0yitcDwKNZ2UdY51
	NHFt/li9C7vvkBBZVfy1OzX80S3vsymEYhZcZrVOCguKbgVnEliztoJJiS/yzIYPrRki
	rADawyFG62oYgE2nljj7zV3DlYeMu2IDZGrsc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rK9PcitPbbt6UzNl0Z6S853EcLmlNpqlkDlc7T3kPUBfT5AShFk2FBwaqze1xvigL5
	cEHHCsTx/mCAjfUJ06MGbVmoKLDnKP1nUO9UNg7H63BW/GwgHHSrLaHlcBM0HLvltxwB
	Px1BdpLPJmma1e4Z3n8n3mf2ktxdI0d5e7a3E=
MIME-Version: 1.0
Received: by 10.151.124.4 with SMTP id b4mr9008854ybn.244.1242509900316; Sat, 
	16 May 2009 14:38:20 -0700 (PDT)
In-Reply-To: <200905161121.55689.g.eismann@gmx.net>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<200905160931.25224.marcin@juszkiewicz.com.pl>
	<200905161121.55689.g.eismann@gmx.net>
Date: Sat, 16 May 2009 17:38:20 -0400
Message-ID: <f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel modules
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
X-List-Received-Date: Sat, 16 May 2009 21:45:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Sat, May 16, 2009 at 5:21 AM, G. Eismann <g.eismann@gmx.net> wrote:

> BTW, is there any way to install the modules but not the kernel image?
> I have the kernel in a separate partition, so I don't need it into the rootfs.

One way is to put the following in the kernel recipe:

FILES_kernel-image_<machine_name> = ""

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


