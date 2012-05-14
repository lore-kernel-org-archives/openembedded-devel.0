Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1STzGr-0005jn-Aa
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 19:41:21 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 May 2012 10:30:16 -0700
Received: by lbbgh12 with SMTP id gh12so3119066lbb.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 10:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=PFDbO4vPEqu9xqooKwRiOQjWZVI185WBnQcUBiXeyMk=;
	b=LHJuYLs1VRSxX69+ir4yq9o6Ac1ahHG4PnnUlJ5nXAvM3PwLzkZuQjxAc+ctt+kOsT
	YY5e1MjuQCnmUhv+I0q51wDthPU0VvAaRyqRJ62UPP8aP/TqV3GtCTpQ+m63B3Wyl6ur
	r1MQ/Okosbwx6/1B5IqMHDZkMsS2OWWFknSC5rNBMcKn/vKj2URCUXNk1wkeQQRgCyjg
	GgGH1ktT775MgVv9e/M1cLEh87/I2aRr72yy0Q8gwdFgztksh1ok7CEDiV+tRQqZ3vO+
	aUAcWI+mRd/hqntlDSo3OFxO/iNDCxvwRHj+8Tn6kaIIjDMByh3GJsrtGj+Tdt3fnpQO
	yE0w==
MIME-Version: 1.0
Received: by 10.112.28.230 with SMTP id e6mr4172861lbh.34.1337016614096; Mon,
	14 May 2012 10:30:14 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Mon, 14 May 2012 10:30:14 -0700 (PDT)
In-Reply-To: <1337011834-24879-13-git-send-email-Chase.Maupin@ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
	<1337011834-24879-13-git-send-email-Chase.Maupin@ti.com>
Date: Mon, 14 May 2012 10:30:14 -0700
Message-ID: <CAPhnLPDYGfet15Wek+2yRpiJK1+FwLi5+HyZv63khU5v9WCrcw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkkBn9evwZjL1XkhScgrQHadIVdLCDCmpw6iWGDuPctohww0iIm9kNk5/yox4iM1QJVAxU9
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 12/69] atk: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 17:41:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 9:09 AM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> * Update LICENSE field version from generic LGPL to GPLv2+ and
> =A0LGPLv2+ to reflect the real license version.
> * This change was based on setting in oe-core as well as code
> =A0inspection.
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> =A0recipes/atk/atk_1.30.0.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/atk/atk_1.30.0.bb b/recipes/atk/atk_1.30.0.bb
> index b3505bf..23c6685 100644
> --- a/recipes/atk/atk_1.30.0.bb
> +++ b/recipes/atk/atk_1.30.0.bb
> @@ -1,9 +1,9 @@
> =A0DESCRIPTION =3D "An accessibility toolkit for GNOME."
> =A0SECTION =3D "x11/libs"
> =A0PRIORITY =3D "optional"
> -LICENSE =3D "LGPL"
> +LICENSE =3D "GPLv2+ LGPLv2+"

This should be:

LICENSE =3D "GPLv2+ & LGPLv2+"

or whatever the operator is (Most likely & or |)

The license field needs to be ast parsable in order for the license
system to work.

-b

>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0inherit gnome
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


