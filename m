Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1Oia4M-0006O7-Hd
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 23:39:44 +0200
Received: by qwg8 with SMTP id 8so7877137qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=WO1eLIy5xlKkRcNrpjOW7307YwfyD2U4jtoyCU+7zQw=;
	b=KHBypKudYTIt0A66ggAhBKKHr2i32EwihzeMzlc/shmBfNIOXgheypKH/y35QJnX2R
	pV5zgjkW4moDesD879OYEtkII8+0+2LR55rmVndpkDn79Txda91PxeZlfWsmtH7tBPzd
	7THoDqAzPvmbuwqqCKVwVk7owKAVKsUdxTLNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IVH8fLMABvp4nv+hgIQqXW1jCZigZS1vPWNI63dpHoQ/Prw9FDebSHRc+OpPxfLuk0
	5i4vBGMavph0paLf37iIFdbRFCGH8Gi1YUpNrCtdzr5AIcOYJTuAngh3UgZ0KEQItlxl
	sfmZem7f8KjFepDG7MlM1aPr2dKUB/hR4qOso=
MIME-Version: 1.0
Received: by 10.224.54.13 with SMTP id o13mr9067661qag.228.1281389971671; Mon, 
	09 Aug 2010 14:39:31 -0700 (PDT)
Received: by 10.229.67.90 with HTTP; Mon, 9 Aug 2010 14:39:31 -0700 (PDT)
In-Reply-To: <AANLkTi=3rK8j32QEbR4ZZk_Tp_hwL3k9KOXDDWWywjFN@mail.gmail.com>
References: <AANLkTinZJSeh++976L9WwTHGR=TrJA4=46kKKgyPiCyz@mail.gmail.com>
	<AANLkTi=3rK8j32QEbR4ZZk_Tp_hwL3k9KOXDDWWywjFN@mail.gmail.com>
Date: Mon, 9 Aug 2010 16:39:31 -0500
Message-ID: <AANLkTi=KQzRGtOGs3t2j_ta=_sDopowmaB2MdCx2_6E2@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: glibc-initial do_install failure
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
X-List-Received-Date: Mon, 09 Aug 2010 21:39:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

Log with -v option at http://pastebin.com/5mB7CvHm

Thanks

On Mon, Aug 9, 2010 at 4:06 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 9, 2010 at 1:39 PM, Adrian Alonso <aalonso00@gmail.com> wrote:
> > Hi,
> >
> > I'm trying to build glibc-initial_2.3.6 for Microblaze arch
> > and it fails in do_install function at final stage when linking
> > libc.so; Error log attached
> >
> > I notice that this always happends when invoking gcc with
> > "-shared" flag it always returns the same error:
> >
> > /tmp/ccvUy8ol.o: could not read symbols: File format not recognized
> > | collect2: ld returned 1 exit status
> > | ERROR: Function do_install failed
> >
> > The combination of tools that trying to build
> >
> > binutils: 2.20.1
> > gcc:      4.5 Microblaze svn branch
> > glibc:    2.3.6 from petalogix know working port for microblaze
> > Computer host: Fedora 13
> >
> > Can any one give me some advise on how to root cause and solve this
> problem?
> >
>
> The problem is that its not using the right assembler AFAICT
> the log you attached does not help. Can you try that same command
> individually with -v added to it please.
>
> Thx
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

