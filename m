Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 41E9D60017;
	Mon,  2 Feb 2015 18:33:37 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so85457994pab.5;
	Mon, 02 Feb 2015 10:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GivLn0cFX8myKpTiyttXcgweEEyy7mLSkJnyrKKxzic=;
	b=b03Ih1JgqbyMWkMgUOGccP+7Al63eY/eofn7W4PSXc212PSrTGvvC9rmfl7KEw5bt6
	zxPUllb9x8PNdfh3iBL3u4uN29hwXZHQa9zkNcE+6fJREDtSEUQFulzweBlx4OU8xzsl
	h7jeMiJamSGwf2/gEUISn4NyPZ6miPunWLCLW8xjI4aUbxFXYEp3GsMYOSkgtg2gROFW
	ukEuaNUDFVaNWDu1q6wCsTcaJrbb1e4oZfDmLSJetNcj9fmZB/1e1S1xW+BCQFmPRWbQ
	j1BRuJP4gOP/qRLCu12DBDcEe+0nHt+hQAzBv8OMhEG5y0NLt2wVoxkyrvBmZeexjETI
	MlBw==
X-Received: by 10.68.69.5 with SMTP id a5mr31620547pbu.57.1422902019091;
	Mon, 02 Feb 2015 10:33:39 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:55be:bb2b:a02a:e844?
	([2601:9:3580:84c:55be:bb2b:a02a:e844])
	by mx.google.com with ESMTPSA id po4sm4859158pdb.85.2015.02.02.10.33.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Feb 2015 10:33:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
Date: Mon, 2 Feb 2015 10:33:37 -0800
Message-Id: <80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 18:33:39 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Feb 2, 2015, at 9:50 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 2 February 2015 at 17:40, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Yeah, you must be using a weirdly compiled gcc on your host which is =
defaulting to -std  < c99 and hence the problem. I have fix for that =
issue already locally.
>=20
> $ gcc --version
> gcc (Debian 4.7.2-5) 4.7.2
>=20
> This is the default gcc in current Debian stable.

Yeah, I am on archlinux (the other end of spectrum). Nevertheless, I =
have updated the contrib tree which fixes cross-localedef-native compile =
time issue. So you should be good
to go now.

>=20
> Ross


