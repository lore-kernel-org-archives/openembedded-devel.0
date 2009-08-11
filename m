Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MaqSN-0007Og-1K
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 14:27:59 +0200
Received: by yxe31 with SMTP id 31so4756685yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HwQ87GjU8EQioZenkOFZEwID8BUkyMYJjFpDAiQcZ2E=;
	b=eg6JKC+gy5vMVxXDjB+1OfVgcWlfRVF1RTFFUFhy8GSX5wneaU96V45Jn6TLS2WUSA
	ofYpBb/PqL227hdrA6DmbOyaiMmV7rClgqItF59g8IoWXzPEujDyRK+U66ku4cV1wuB6
	Yb4cDtAOx+yRDY+ENVwpRi/Ol96Zjj97xrO8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WYr/Y9d4ZeHxRyFAQ9CiYQNojQTG9Abl32vz8B9jR87qDflehBoE0Cu3AUN0UD1b7z
	aImITnpFOkQhe129WAnwA0CZlXPGbnSi7N2E6FAkp3hyqIhUpoHfGKW2RR6A1nwp4aHj
	CZvwOTCM/XkN5Zwrhu8iJqMJTvfj4+JKQO23k=
MIME-Version: 1.0
Received: by 10.150.215.16 with SMTP id n16mr10533329ybg.279.1249992699058; 
	Tue, 11 Aug 2009 05:11:39 -0700 (PDT)
In-Reply-To: <4A805BF0.8050805@gmail.com>
References: <4A805BF0.8050805@gmail.com>
Date: Tue, 11 Aug 2009 08:11:39 -0400
Message-ID: <f96d234e0908110511u891cf8fmc43b11e4a29d5fbe@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Building OE for LPC3250
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
X-List-Received-Date: Tue, 11 Aug 2009 12:27:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2009 at 1:42 PM, Dmitry Vinokurov<d.vinokuroff@gmail.com> wrote:
> Hello,
>
> I work with ARM9 Phytec LPC3250 RDK now and decided to try using OE as
> building system for my project (hard real-time, industrial). Have anybody
> among OE developers worked with this board earlier?

Generally, adding support for a new board consists of the following if
you have a working kernel:

1) create a machine file:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/machine
2) create a kernel recipe:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux

Modifying the linux_2.6.XX.bb recipes are prefered rather than
creating a new recipe specific to the machine.

Let us know if you have any questions.

Cliff

=================
http://bec-systems.com


