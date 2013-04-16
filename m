Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1US4Ub-0003Md-Te
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:56:18 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so279996vcb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=c+LtrwwUv2DWvVG+3m4r1+TMKt9ahaLH0MBypljx70c=;
	b=W+ZI+Ls0s9gtctAK24/YbpYJ/knWsdVf4Lmi+A55FO/1qso4Yo8I4eBu/Q4mH/erMk
	h53wQjV3+SQcCYta94BwHkkj3pIGn33JSnZo+TwZR6jXpukaYPq/XWBWPHKko33/G+qG
	Wr9W1+W6A5QPQcIDI7+sMILJcKgow9z4vuQN1BLRHo4EsewPtoz6HnwRdeESR0PxWDT7
	97ID2ne+eFZb8N9ohPy7h0MCXaBsOEi1TH8mD2aIPThvhHlSoP14ew8fRK2OFDDzLQ02
	jISL8Q/jE4s0EIu2gzwjqNDmNcEFqYUvkebBkWbzvzyXqjgr7jQ1wK85cX6BemP6Mec4
	6AkQ==
MIME-Version: 1.0
X-Received: by 10.220.167.9 with SMTP id o9mr1220470vcy.25.1366112319433; Tue,
	16 Apr 2013 04:38:39 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Tue, 16 Apr 2013 04:38:39 -0700 (PDT)
In-Reply-To: <20130416111424.GJ10628@jama.dyndns-home.com>
References: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
	<20130416111424.GJ10628@jama.dyndns-home.com>
Date: Tue, 16 Apr 2013 12:38:39 +0100
X-Google-Sender-Auth: z7PerX9Q6Og_XEA2WD3acQNkToE
Message-ID: <CANyK_8cWf21+4CgXwJLE4-nxYGZwhXdpkQEW4MtfaQ5t=QdXMA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] vim 7.3
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
X-List-Received-Date: Tue, 16 Apr 2013 11:56:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 16 April 2013 12:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Apr 16, 2013 at 10:53:44AM +0100, Paul Barker wrote:
>> I've also found that just installing vim doesn't give me everything I
>> expect, I also need vim-syntax, vim-help, vim-tutor, vim-vimrc and
>> vim-data. I think for most applications where people want to install
>> vim over using plain vi they probably want these extra runtime files.
>> Is it worth creating a package group to install all these together
>> and/or setting RRECOMMENDS for vim?
>
> RRECOMMENDS seems enough to me
>

I'll put together a patch to do this for the current version of vim.

I'm also getting the following warnings:

    WARNING: File '/usr/bin/vim' from vim was already stripped, this
will prevent future debugging!
    WARNING: File '/usr/bin/xxd' from vim was already stripped, this
will prevent future debugging!

Passing 'STRIP=/bin/true' to configure is recommended in the vim
Makefile to disable stripping. I'll also send a patch to do this so
that the non-stripped binaries can be placed in a -dbg package
properly.

Both changes are to vim.inc so should carry over to the new version.

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


