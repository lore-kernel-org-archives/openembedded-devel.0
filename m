Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH1jz-0004Ep-Qc
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 01:09:36 +0200
Received: by pzk33 with SMTP id 33so8342098pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2011 16:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=GFHOgw6kGW/NrDPOE/Wl60G8z3Ftjtvp31BtrMp5+pw=;
	b=PfWPeIGvm+wbBCpt8RIcA273oK0m1CVZMx2EX6FymIYln/I3Ov6Jb8b9+ShOVTt/KT
	rLTOe5IQ13NMKdp0BSWseHk8z5/WL43tRqc6W/qiwHSYo932nepFqjzB7CDGCk5Pc+4H
	Z7ISwPO2eVRI6AexNiJ2h3bH3ZJf43nx4BJo8=
Received: by 10.68.20.226 with SMTP id q2mr22799468pbe.115.1319151822201; Thu,
	20 Oct 2011 16:03:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 16:03:12 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4013CA51@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013CA51@post.tritech.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 16:03:12 -0700
Message-ID: <CAMKF1spVn68V-BjrbY0RNYZb3k=8YnK9KM7Vsb1VBUKfqTx8uQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Bad checksums in binutils-cross-sdk_2.18.bb
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
X-List-Received-Date: Thu, 20 Oct 2011 23:09:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 5:19 AM, Mats K=C3=A4rrman <Mats.Karrman@tritech.se=
> wrote:
> Hi,
>
> I'm using OE-classic "2011.03-maintenance" branch.
>
> According to commit bc8ddbf7944f82383936d88379619aa46c3954a2<http://git.o=
penembedded.org/openembedded/commit/recipes/binutils/binutils_2.18.bb?h=3D2=
011.03-maintenance&id=3Dbc8ddbf7944f82383936d88379619aa46c3954a2> the check=
sums of the binutils 2.18 tarball has changed (verified, works fine).
>
> However, the binutils-cross-sdk_2.18.bb recipe "require"s the binutils_2.=
18.bb recipe but still overrides the checksums with the old values causing =
SDK build to fail.

thanks for report that seems like a bug. Can you submit a patch to
delete those checksums from  binutils-cross-sdk_2.18.bb


