Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1ULE83-0007UE-Iq
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 15:48:37 +0100
Received: by mail-oa0-f41.google.com with SMTP id f4so7607073oah.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=dbRORa1m6dVNrdMBd5PHgPeCt4FEzosV8tKpkr+x9AQ=;
	b=f2kllrHZi0zl5wpvWQNGd332A4d4aiRgPoOrqcD3yWCsI7LBSOz7z1i2rBS/Rx8Pj1
	cQ67yZV1DKcPeD7FQy7rk7PWNlrK++78OUUQyrYc8fy/wEr8Xy7Jx3k1M5UFamBRBSox
	kX/JXCs1j7hJktcnqeiBhDA8Cjf5jJYZ8f9MmuqTn+4UJ++Na5AmbaCtG2JrzqoBF/vA
	2rcTyaZsURnxsKxdQlwUWOzE+rhVhF9Vtp9sV201AjxgEGHfua9/lUC6uqHPgGDHBf+V
	nBaI8kNh80wsRRXnUN65tRxEmHSJyYWEbtSP78q5gyYMAA9YYcV+Z12oMzffmjTxf5ct
	qWZg==
MIME-Version: 1.0
X-Received: by 10.60.28.37 with SMTP id y5mr6390915oeg.134.1364481092537; Thu,
	28 Mar 2013 07:31:32 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.154.4 with HTTP; Thu, 28 Mar 2013 07:31:32 -0700 (PDT)
In-Reply-To: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
References: <1364469742-37652-1-git-send-email-paul@paulbarker.me.uk>
Date: Thu, 28 Mar 2013 14:31:32 +0000
X-Google-Sender-Auth: 1qbeDkbqRIr2sbpjJsPDgUqkRNQ
Message-ID: <CANyK_8fVd0yFf4fKryeytmvXm8hRCub9=oCmZA0hhrUaFyeoLg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] live555: Update to latest version
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
X-List-Received-Date: Thu, 28 Mar 2013 14:48:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 March 2013 11:22, Paul Barker <paul@paulbarker.me.uk> wrote:
> The upstream source for live555 does not keep tarballs of old releases so the
> live555 recipe in meta-oe no longer builds. The version number has been updated
> to 20130323 which is currently available.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>

This may need to be delayed, the latest live555 builds fine but vlc
1.1.11 has errors compiling the source file
"modules/demux/live555.cpp". I'm happy to look at updating the VLC
recipe but it may take some time to build and test as it's a much
larger program. Has anyone else looked at building a more recent VLC?

There is a mirror of the version of live.2011.03.14.tar.gz at
http://ftp.riken.jp/pub/FreeBSD/ports/local-distfiles/nork/ which may
solve my build issue in the meantime.

Thanks


