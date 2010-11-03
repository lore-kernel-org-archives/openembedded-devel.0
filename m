Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDkKz-0005qJ-Ck
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 21:53:42 +0100
Received: by ywo7 with SMTP id 7so304431ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+rKdyKggdeJkNKMX/538maYiJX12pz0gPIAVVerZBmc=;
	b=NsCzl8ctO0XonFG1Y826AbATL8maAyTCyF0RCmiL6Wr1rxp9YH7yXHPnRR3Fg+QLOd
	tE3jmBF0geCBZF+DJOYDP6WiJjmu8eCEgfwFJ4o6RAPOM1BJSSVK9tG9jHGE5LAlJTJH
	c3cKx1IuOuhi/Uwp8PLewZXmTV7vbDVAEt0s8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YOeHKMOQ+8rxXLPFzh/vJrPJV33JpGCWs9/5ze8+lWxq7yobG0rXBmgyNRWc1knsZr
	tdFME0Q3/R5PPzrAXvoJgtYYCpFAW7uk0lh/8lqBYC9aAB9B6Bl6DBeWP8ew51CbdCsk
	GZSyBJlKF9oPoMA6GyOELP7eTJ1Vnc+d2V2zw=
Received: by 10.91.11.6 with SMTP id o6mr47113agi.91.1288817568508; Wed, 03
	Nov 2010 13:52:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 13:52:26 -0700 (PDT)
In-Reply-To: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
References: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 13:52:26 -0700
Message-ID: <AANLkTimCw3pVkVjsLUX92zm797Y1RYONGtGRxUDfAggK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/2] Update tzcode and tzdata to latest versions
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
X-List-Received-Date: Wed, 03 Nov 2010 20:53:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 5:17 AM, Antonio Ospite <ospite@studenti.unina.it> w=
rote:
> Hi,
>
> here are some tzdata/tzcode updates.
>
> Side Note: I played with "git format-patch -M" to detect renames and I ki=
nd of
> like the result, this way reviewing the changes is easier and from git po=
int
> of view the end result is equivalent to a delete/add when applying the
> patches.
>
> I am going to push the changes in a few hours if nobody objects.

looks good.

all patches in series

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> Thanks,
> =C2=A0 Antonio
>
> Antonio Ospite (2):
> =C2=A0tzdata: bump version to 2010o
> =C2=A0tzcode-native: bump version to 2010n
>
> =C2=A0...code-native_2010m.bb =3D> tzcode-native_2010n.bb} | =C2=A0 10 ++=
+++-----
> =C2=A0.../tzdata/{tzdata_2010m.bb =3D> tzdata_2010o.bb} =C2=A0 =C2=A0| =
=C2=A0 =C2=A04 ++--
> =C2=A02 files changed, 7 insertions(+), 7 deletions(-)
> =C2=A0rename recipes/tzcode/{tzcode-native_2010m.bb =3D> tzcode-native_20=
10n.bb} (51%)
> =C2=A0rename recipes/tzdata/{tzdata_2010m.bb =3D> tzdata_2010o.bb} (62%)
>
> --
> Antonio Ospite
> http://ao2.it
>
> PGP public key ID: 0x4553B001
>
> A: Because it messes up the order in which people normally read text.
> =C2=A0 See http://en.wikipedia.org/wiki/Posting_style
> Q: Why is top-posting such a bad thing?
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


