Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mateusz.kijowski@gmail.com>) id 1MD5BT-0000Pd-Fp
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 01:20:20 +0200
Received: by bwz19 with SMTP id 19so2281263bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jun 2009 16:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mYxEx8kf+/mpZjrnB8npmnAljd14Qo9uw6oZi44C5IU=;
	b=cfA1A8W6i9pFTYDk0ANkqhxT6efAGYFqq3wdkaB1JFqgfT2AoBwNwmeowkv647gFBp
	3sPTAGpRTiPxdNxuPxQgQyR4VVHhvFJK+Xo0oZUZmrNBdFfprNbbVMXeLFrzRjOqQ3Sk
	5WR9isYSlITCKePr7q/hqsLTtUYi95hJW10p8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hpmnoHUi+GlcO332e8BVAI+KrjmHtsUoIoYq2WVTIZUJRKgjjSUWvrPhPjXI1ab6Ji
	URi4yukRJ+KhceQwZDBMXuCbfbwMoCwUa4ImcB0A27/rw3en8bvus1oJmdQ6LtOnEjAG
	W345Y+07bk9nC6GlTIrbXgf+uo+tYJw7lLT40=
MIME-Version: 1.0
Received: by 10.223.119.198 with SMTP id a6mr2898147far.42.1244329858668; Sat, 
	06 Jun 2009 16:10:58 -0700 (PDT)
In-Reply-To: <20090606212856.GM26065@smtp.west.cox.net>
References: <921557650906061408x129a09c6j53d0e0a971a5eac8@mail.gmail.com>
	<20090606212856.GM26065@smtp.west.cox.net>
Date: Sun, 7 Jun 2009 01:10:55 +0200
Message-ID: <921557650906061610l26165cb7odab17b271ce7ee13@mail.gmail.com>
From: Mateusz Kijowski <mateusz.kijowski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] netvista 8363/N2200 machine support
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
X-List-Received-Date: Sat, 06 Jun 2009 23:20:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/6/6 Tom Rini <trini@embeddedalley.com>:
> On Sat, Jun 06, 2009 at 11:08:09PM +0200, Mateusz Kijowski wrote:
>
>> This is my first patch for OpenEmbedded, but I've been lurking this
>> list for quite a while. I suppose I could merge linux-netvista8363 recipe
>> to linux recipe but I am not sure if it's a better apporach when the latest
>> bootable kernel version is not recent (2.6.24.7). Please be gentle :-)
>
> Yes, similar to how the other machines, this should append a patch and
> set DEFAULT_PREFERENCE_machname = "1"

All right, defconfig and patching is pretty easy, I suppose I can
write my do_hack_image() hook function similar to do_compulab_image(),
but I'm not sure how would I override do_deploy() and do_install()
only for this machine.

Perhaps this is a wrong approach - I am overriding those because I
want to put the kernel in an unusual place (/) under an unusual name
(kernel.2x00). This is necessary for this machine to boot. do_deploy()
is an obvious candidate to be merged with do_hack_image()

Any insight and suggestions is welcome.
--
Mateusz


