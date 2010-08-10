Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1Oitrf-0007f8-CJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 20:49:00 +0200
Received: by qyk32 with SMTP id 32so10671630qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=z4IJPYLYHLGV6EBdCCe9X4oLG8Gbh7RF7lVJIUcwwok=;
	b=C01kVGXgeHiLCbKuzjgaa5koxvplY5mW+7AwjREwzRe+0d6e5+xTNdbQbTiK4mqBGf
	Ai7hPaDHoFysutKAMELTdILW0MArHy9vZYB3L0Zkzu8MK0rldNQcK7FLktyctIEeVdJF
	UNqeMKmjCdpFifj0ErAihP2TVAnU8FGZaetKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=AyCfyHTx8zD5eONMoXFU7txHt8ZHmKfvhvp/yD70NoNB01g3FHclUtDNXlC92sekb7
	lg4pIG3RoCLXOar5ebW6XE44ejCTyAxnwbSp3JigTckr5kcj59VlRpWyXydB+SWmk6lM
	HtsSICDEhlws4ULoBRYOBDyVpbmWJhIFOK0hU=
Received: by 10.224.2.147 with SMTP id 19mr9787849qaj.57.1281466061420; Tue, 
	10 Aug 2010 11:47:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.89.20 with HTTP; Tue, 10 Aug 2010 11:47:20 -0700 (PDT)
In-Reply-To: <201008082148.56554.roman@khimov.ru>
References: <AANLkTikqC4jZ2YrjVUiibof1vCOMUhr4=uq4UWFGtdo0@mail.gmail.com> 
	<201008082148.56554.roman@khimov.ru>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 10 Aug 2010 11:47:20 -0700
Message-ID: <AANLkTi=0DY_=ozCP60XM4XkeufB4ziPsUa9TaxT53st0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pkgconfig.bbclass: Remove spurious rpaths and -isystem includes from pkgconfig files.
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
X-List-Received-Date: Tue, 10 Aug 2010 18:49:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 8, 2010 at 10:48 AM, Roman I Khimov <roman@khimov.ru> wrote:
> I have "-isystem..." change in my own patch queue and rpath-link should be
> fine also. I'm not so sure about incdir or libdir change though.
>
Okay---cool.

The libdir & incdir stuff would be for such a case:
To compile against libfoo, you need to include a non-standard path
such as -I/usr/include/libfoo/bar/. Normally pkgconfig just adds this
flag but the path (pre-pkgconfig.bbclass) is gross (<staging
path>/usr/include/libfoo/bar/); the pkgconfig.bbclass strips this down
to a floating 'libfoo/bar' in the flags line when it should be
'-I/usr/include/libfoo/bar'.

I think the patch as I submitted it doesn't fix this properly for all
cases.  Also relies on ${prefix} to be correctly set for
pkgconfig---is this a safe assumption?

Should I split out the -rpath-link and -isystem into a separate patch?

Thanks,
Ash


