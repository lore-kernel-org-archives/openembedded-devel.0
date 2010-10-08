Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4Lu5-0002oD-CC
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 00:59:07 +0200
Received: by iwn7 with SMTP id 7so213664iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 15:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=GumHxULJ+wOJ9CuUBeD/n9MRSYISLZzTPjgBv32IpSQ=;
	b=ZK5MPrhKUKyrWIjPxKxI82nqNFZdYVb8/JzGLmBtmmsyALCAn0e1mH+gBpVUEGb6s2
	2Ay4O/o83tc57POF8ZBRrRSnuqWseDDOy7b74yTYvR+Zn5j4NidAzVVSu3p51MbA71mo
	vLR4aTlP69GBsHoI722urBtlMoVt/5J3lzpOs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=SJTlyGcUAk6V8fwTzlWbYoxAuBtDjtyAEyUX0KnzKbeWkMz3lGeG7iyYbFc2jFULFh
	e9/+jBCvw07zQiKeWafZ+I/uiWqx6LJGdpRgQZMpb6hgCd3W7T9OQ7U16FDjO1GxrfwK
	V/F6V/mkDu35hP9Nd8XGvqOkR1+Jn8bNWkkaE=
Received: by 10.231.33.129 with SMTP id h1mr2285377ibd.140.1286578721239; Fri,
	08 Oct 2010 15:58:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Fri, 8 Oct 2010 15:58:21 -0700 (PDT)
In-Reply-To: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
References: <AANLkTin=ucR4=4zJQg=thwRbqehhCzRa-DE6NwCGb76R@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Oct 2010 15:58:21 -0700
Message-ID: <AANLkTi=eg==2A_jTuUcqYtbvE1B6mBtqi28qKetGH9B-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: recipy_sanity experiment
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
X-List-Received-Date: Fri, 08 Oct 2010 22:59:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 8, 2010 at 1:23 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Dear all,
>
> as a test I decided to run recipe_sanity on our tree, and here are the re=
sults
> There are 1801 warnings:


interesting data

>
> =C2=A0 =C2=A0954 candidate for removal of S
> =C2=A0 =C2=A0373 LICENSE should be defined to something other than defaul=
t (unknown)

this should be fixed first.

> =C2=A0 =C2=A0181 RDEPENDS should be RDEPENDS_${PN}
> =C2=A0 =C2=A0 91 candidate for removal of FILESDIR
> =C2=A0 =C2=A0 74 candidate for removal of PV
> =C2=A0 =C2=A0 49 native or cross recipe with non-empty PACKAGES
> =C2=A0 =C2=A0 11 RRECOMMENDS should be RRECOMMENDS_${PN}
> =C2=A0 =C2=A0 =C2=A06 candidate for removal of FILESPATH
> =C2=A0 =C2=A0 =C2=A04 LICENSE should be set
> =C2=A0 =C2=A0 =C2=A01 DESCRIPTION should be set
>
> Rest are for overwrites of a variable like:
> =C2=A0 =C2=A0 =C2=A04 rename of variable 'FILES_${PN}' to 'FILES_orinoco-=
modules'
> overwrote existing value '/lib/modules/' with '/etc /lib/modules'.
> There are about 25 different lines of this (total about 50 lines)
>
> Not sure exactly what should be done about it. I can fix some of them,
> but not too sure about the rename thing
> and the removal of S is often because there is an S =3D xyz_${PN} line
> in an inc file
>
> Anyway, wanted to know the results (and here they are).
> I =C2=A0can provide more detailed info if needed
>
> Have fun! Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


