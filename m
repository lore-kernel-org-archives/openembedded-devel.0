Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id B86CD6098F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:13:47 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id b10so1680712vea.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2013 17:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=CAHja7TcwXG+6Br7dfvb/HghDfLT7o0suIXqmbIUDW0=;
	b=FWsvoRukApp4h8ZvYvKbPJQOUlOtvnb+xqqUzs3tuuqZT+J20MxaSTrX4KPkjm9iMS
	05WKKjX+y3GyWL+bRboXKynnPtuBfMmkJ0Vg/4Bo7tU23L8pSRKDBzTCn+lri0r49SRC
	FtlUPSI840BYC9sdMMRzhdPZINqTfamhpsnxV/E9Rp72KYUrZQucEe38vM2C/EDncGK5
	NkRC4Kvt8SNGR2VFzanbZ+Y9jKb0fk7EhfyjUle4f+Ve0D6BYtfIwu71ezOvkgXo038I
	rFSgxGO7XvjX/xLWPVWJaEUntzTe93wWO2NFrp8Nf28vTTSrFDC2rL08DwZr5kPX+PRd
	mF+A==
X-Received: by 10.58.164.101 with SMTP id yp5mr3742043veb.0.1371428028099;
	Sun, 16 Jun 2013 17:13:48 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Sun, 16 Jun 2013 17:13:08 -0700 (PDT)
In-Reply-To: <1371112052-24223-1-git-send-email-raj.khem@gmail.com>
References: <1371112052-24223-1-git-send-email-raj.khem@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 17 Jun 2013 01:13:08 +0100
X-Google-Sender-Auth: 8d7dB-n5FHNao0jjuct1rB2AR-I
Message-ID: <CANyK_8eaRBQTrqPoakvwkVn3Oj7Uoftgmi7_VK3nRshDDn72WA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] packagekit: Fix build with new glib-2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Jun 2013 00:13:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 13 June 2013 09:27, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes errors like
>
> | pk-main.c:223: error: undefined reference to 'g_thread_supported'
> | collect2: error: ld returned 1 exit status
> | make[3]: *** [packagekitd] Error 1
>
> This version is dead upstream so this patch is local
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

You seem to have picked up a couple of .o files by accident in this one.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

