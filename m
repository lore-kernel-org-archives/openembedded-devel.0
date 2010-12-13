Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSEdk-0002eL-IJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 21:04:58 +0100
Received: by yxd5 with SMTP id 5so3570310yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 12:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YjxEhyZLze/9czl3B8i5YhuzHPY/tj/PbqpEp/bK0yQ=;
	b=dO20jp/sL4sK1H/bWJxjsaWCaNmaX7+l0xBkBRZQo9ngPL8XPuLtkAbOt3czk2vEwH
	a7nzoco/aIPW6zHmuaFXNPnQDZBRifybiFqg2/nmxWppeiQvfTlbcNLodpJS3GfMgEJJ
	QCDyXQVoQyI4EEBLvrLrgELMl1MIWtKwCCJvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ZQNkwFf6KGuFWktto64DyoWSyZr8kTFRTLU9pHfVh7IctrTW3+HMvnGbrS8sie5kfc
	tJrZPcLIoaOwKqfvh+zpD33VSr9fgFSjde/F2y+v99nSyyxLXDmsXD9IcRMXOiKcQi0k
	UdrB0ES0q542vVlCHngRjOVIJxKriAiLokG/E=
Received: by 10.90.80.18 with SMTP id d18mr5605560agb.31.1292270597823; Mon,
	13 Dec 2010 12:03:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 13 Dec 2010 12:02:56 -0800 (PST)
In-Reply-To: <1292269885.4146.79.camel@mattotaupa>
References: <1292269885.4146.79.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Dec 2010 12:02:56 -0800
Message-ID: <AANLkTi=e4vnw3=z39fmwXvFmkMOrB+Qaw7PCe+wOXmh0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: binutils_2.21.bb: fails with Minimal: `ERROR: Task 1266 (/oe/openembedded/recipes/binutils/binutils-cross_2.21.bb, do_patch) failed with 256`
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
X-List-Received-Date: Mon, 13 Dec 2010 20:04:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2010 at 11:51 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> searched for `libtool-update.patch`
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ git grep libtool-update.patch
> =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes/binutils/binutils_2.20.1.bb: =C2=A0 =
=C2=A0 ${@['file://libtool-update.patch','file://libtool-2.4-update.patch']=
[bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=3D 'yes']} \
>
> So I am quite confused why the task `patch` wants to apply something
> from a different recipe.
>

It should not. It was an oversight libtool-update.patch is not needed for 2=
.21


