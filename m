Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8Ihj-0004u4-7B
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 20:45:55 +0200
Received: by bwz19 with SMTP id 19so2683609bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 11:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BmYcuezeUheap48ZcQ1tv/1RkG+7GwJ4Ap9x7/OmAxQ=;
	b=MVjdxPvXjgAv6kSrEOGdpuHmQSGGcCWJLcHfYbU9H54HfRZIO30s/kijYSiU/eHOQa
	BF/nDdwrXo9+HV7jyaOOCmCCVVKipBuCuM+mwhMcyyyoIxv5qBmj0AH1hR4QZhXn0DYG
	+iFGfCuMu6ExE15cjF3aZbMHyxzSREqgVnABM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vPfn6V7sfR+7mZvdAUMyPF8w6wrWRtvTbgcXz1/D0+/QxV2N3IGeNAq+HW5YGD449r
	KeuAZXgwfydBH+msaZZhAatgJ3ALhOgCQXYCg3d/urNAKVzAsKygECsBz0FaBvuNTdy1
	Mi/R2hzL1TW6v6AycnyfFeNJQrboiHqG8Oa80=
MIME-Version: 1.0
Received: by 10.103.169.18 with SMTP id w18mr3199470muo.101.1243190273689; 
	Sun, 24 May 2009 11:37:53 -0700 (PDT)
In-Reply-To: <1242920910.9080.332.camel@mill.internal.reciva.com>
References: <1242912094-26435-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1242920823.9080.330.camel@mill.internal.reciva.com>
	<1242920910.9080.332.camel@mill.internal.reciva.com>
Date: Sun, 24 May 2009 21:37:53 +0300
Message-ID: <fce2a370905241137s75e9e58ds6ab8a12f36389549@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins: fixed pattern for meta package dependencies.
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
X-List-Received-Date: Sun, 24 May 2009 18:46:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2009 at 6:48 PM, Phil Blundell <pb@reciva.com> wrote:
> On Thu, 2009-05-21 at 16:47 +0100, Phil Blundell wrote:
>> This kind of matching on the package name is a bit unwholesome in
>> general. =C2=A0It would be better to handle these excluded packages by
>> maintaining them in the blacklist at the point where they're actually
>> created, rather than trying to recreate that information again after the
>> fact.
>
> Or, actually, in this specific case, just maintain a positive list of
> the plugin packages that you _do_ want the metapackage to depend on, and
> make it depend on those packages alone rather than starting from
> ${PACKAGES} and filtering things out.

I think -meta package should depend on *all* the plugins. That's what
-meta is made for. I think it's not very efficient to test every new
gst-plugins-* release if there are any new or obsolete plugins there.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


