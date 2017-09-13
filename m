Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 89CC678634
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:28:40 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id a137so1010739wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M4usviXxEiyAGNzLkoqHIBvhSfQv9D1sZU8VrLVsoxY=;
	b=dTLYmJXhPNm0qzWZMlkmyklH4Czb3gHjWiUehO/FEs0hrgNadOSciaJ8c/b/JrvpQ9
	xl96HTn3BReGjwuZApkWM8AqeFiA6puf9Ksa52iJdeQxpLNHIbqAYD6bxIszFuYmyaIq
	zUZemnvbMUjySz/I3YWfWPoWwPa0/d6jv825X4ZD1+IwnYEC5s9I1kzlvSO9InwtDQTR
	tnK/EKJ1IrloR7BBC2Ztf4DgeVcOqet6VKyWcq7fqFklOXQbg0lOqWujAFL96tHVjfk1
	jONZ7gEQbVRq3WKi5vnUQM/+fB6fCAhe5hGfAPj/paIHrU8ayUkPi7WYx+9WddQc1mt6
	V4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M4usviXxEiyAGNzLkoqHIBvhSfQv9D1sZU8VrLVsoxY=;
	b=N1z076t3DH4ZaMpVnkjOGSiaUxgkIMoVP1Uov/v4F5W4MMOwicMGWuptmNsu9TUDKy
	6mS667s+5GgVBw8OegUy8V5SYjA3VyYjICwTdjv/EUXlADozrczcKcdWMxzjycVlDBHe
	/BisBJk5tHSc65BoT0peOH4mlxd9XfZP7ZyYMhnhBIYk7neeeGESmWHhjfWSE3GqmVM4
	WXFk1DER7hNDF8M6cvMFvtyT+lTVwn/qaKbE6/BEOoLCvpgQwhvQAIux5dU/5WPSF9ID
	b7sRUx2byVXeAT4Cke8rmTgU6EMQLivDaOIYuzSXsH1U+CcAZvdGkuzA4qZdnvSSVl0T
	TUwQ==
X-Gm-Message-State: AHPjjUhzUR3D5IX2wKHPJXUWKrLvBFjh2luhmPOHLKiMG1iyoPxvMsja
	f3hU6AerUxzlf/m5
X-Google-Smtp-Source: AOwi7QBmkp3hwTb0+ZXdgTjGJNonZaSLJZNNhXQk2g3DN6QaYZS62DF8B3/9eOaAMQbUJvreBz1hag==
X-Received: by 10.28.140.18 with SMTP id o18mr56616wmd.145.1505338120863;
	Wed, 13 Sep 2017 14:28:40 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o21sm10601355wrf.31.2017.09.13.14.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 14:28:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Sep 2017 23:30:58 +0200
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <20170913213058.GF3288@jama>
References: <20170907094920.191059-1-wenzong.fan@windriver.com>
	<7c50c6f1-e834-f2a2-1ebd-33e411deea8b@windriver.com>
	<CA+chaQd8BSz_wHGiG+xf47GQ5f7mNNeCoNRCE8RjL15mwZpzbg@mail.gmail.com>
	<4fdd7a5c-f984-eea9-a481-3b19e0c1d4f5@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4fdd7a5c-f984-eea9-a481-3b19e0c1d4f5@linux.intel.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] tcpdump: fix CVE-2017-11541, 11542, 11543
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 21:28:40 -0000
X-Groupsio-MsgNum: 68773
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mrJd9p1Ce66CJMxE"
Content-Disposition: inline

--mrJd9p1Ce66CJMxE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 09:05:45AM -0500, Jose Lamego wrote:
>=20
>=20
> On 09/13/2017 04:17 AM, Martin Jansa wrote:
> > Please update the state on patchwork (https://patchwork.
> > openembedded.org/project/oe/patches/) when sending updates like this.
> >
> > You can update it on the site or use some magic keywords in the e-mail
> > reply to update it automatically (but I've failed to find link to
> > documentation how this magic should look like).
> >
>=20
> To automatically change a patch status in Patchwork, the string to be
> included at the bottom of an email reply must be in the form:
>     [Patchwork-Status: <new-state>]
>=20
> where <new-state> can be any of the existing states (excepting "Accepted"=
).
>=20
> This and other ways of updating patch statuses can be seen at:
> http://www.openembedded.org/wiki/Patchwork#Update_the_state_of_patches

Thanks for the info.

I've tried it with:
https://patchwork.openembedded.org/patch/144079/

and it doesn't seem to work, patchwork shows my reply, but the state is
still New not Rejected.

>=20
> > On Wed, Sep 13, 2017 at 5:21 AM, wenzong fan <wenzong.fan@windriver.com>
> > wrote:
> >
> >> Please ignore this patch, the fixes has been included by:
> >>
> >>   [oe] [meta-networking][PATCH] tcpdump: update to 4.9.2 to fix CVEs
> >>
> >> Thanks
> >> Wenzong
> >>
> >>
> >> On 09/07/2017 05:49 PM, wenzong.fan@windriver.com wrote:
> >>
> >>> From: Wenzong Fan <wenzong.fan@windriver.com>
> >>>
> >>> Backport patches for fixing:
> >>> - CVE-2017-11541:
> >>>    https://nvd.nist.gov/vuln/detail/CVE-2017-11541
> >>>    https://github.com/the-tcpdump-group/tcpdump/commit/21d702a
> >>> 136c5c16882e368af7c173df728242280
> >>>
> >>> - CVE-2017-11542:
> >>>    https://nvd.nist.gov/vuln/detail/CVE-2017-11542
> >>>    https://github.com/the-tcpdump-group/tcpdump/commit/bed4806
> >>> 2a64fca524156d7684af19f5b4a116fae
> >>>
> >>> - CVE-2017-11543:
> >>>    https://nvd.nist.gov/vuln/detail/CVE-2017-11543
> >>>    https://github.com/the-tcpdump-group/tcpdump/commit/7039327
> >>> 875525278d17edee59720e29a3e76b7b3
> >>>
> >>> The tests/* changes dropped to workaround patch error:
> >>>    File tests/*.pcap: git binary diffs are not supported.
> >>>
> >>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >>> ---
> >>>   ...541-In-safeputs-check-the-length-before-c.patch | 49 +++++++++++=
++
> >>>   ...1-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch | 43 +++++++++++
> >>>   ...543-Make-sure-the-SLIP-direction-octet-is.patch | 85
> >>> ++++++++++++++++++++++
> >>>   .../recipes-support/tcpdump/tcpdump_4.9.1.bb       |  3 +
> >>>   4 files changed, 180 insertions(+)
> >>>   create mode 100644 meta-networking/recipes-suppor
> >>> t/tcpdump/tcpdump/0001-CVE-2017-11541-In-safeputs-check-
> >>> the-length-before-c.patch
> >>>   create mode 100644 meta-networking/recipes-suppor
> >>> t/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
> >>>   create mode 100644 meta-networking/recipes-suppor
> >>> t/tcpdump/tcpdump/0001-CVE-2017-11543-Make-sure-the-SLIP-
> >>> direction-octet-is.patch
> >>>
> >>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11541-In-safeputs-check-the-length-before-c.patch
> >>> b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11541-In-safeputs-check-the-length-before-c.patch
> >>> new file mode 100644
> >>> index 000000000..a83214b02
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11541-In-safeputs-check-the-length-before-c.patch
> >>> @@ -0,0 +1,49 @@
> >>> +From 21d702a136c5c16882e368af7c173df728242280 Mon Sep 17 00:00:00 20=
01
> >>> +From: Guy Harris <guy@alum.mit.edu>
> >>> +Date: Tue, 7 Feb 2017 11:40:36 -0800
> >>> +Subject: [PATCH] CVE-2017-11541: In safeputs(), check the length bef=
ore
> >>> + checking for a NUL terminator.
> >>> +
> >>> +safeputs() doesn't do packet bounds checking of its own; it assumes =
that
> >>> +the caller has checked the availability in the packet data of all ma=
xlen
> >>> +bytes of data.  This means we should check that we're within the
> >>> +specified limit before looking at the byte.
> >>> +
> >>> +This fixes a buffer over-read discovered by Kamil Frankowicz.
> >>> +
> >>> +Add a test using the capture file supplied by the reporter(s).
> >>> +
> >>> +CVE: CVE-2017-11541
> >>> +
> >>> +Upstream-Status: Backport
> >>> +https://github.com/the-tcpdump-group/tcpdump/commit/21d702a
> >>> 136c5c16882e368af7c173df728242280
> >>> +
> >>> +Drop the tests/* changes to workaroud patch error:
> >>> +File tests/hoobr_safeputs.pcap: git binary diffs are not supported.
> >>> +
> >>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >>> +---
> >>> + tests/TESTLIST            |   1 +
> >>> + tests/hoobr_safeputs.out  |   2 ++
> >>> + tests/hoobr_safeputs.pcap | Bin 0 -> 88 bytes
> >>> + util-print.c              |   2 +-
> >>> + 4 files changed, 4 insertions(+), 1 deletion(-)
> >>> + create mode 100644 tests/hoobr_safeputs.out
> >>> + create mode 100644 tests/hoobr_safeputs.pcap
> >>> +
> >>> +diff --git a/util-print.c b/util-print.c
> >>> +index 394e7d59..ec3e8de8 100644
> >>> +--- a/util-print.c
> >>> ++++ b/util-print.c
> >>> +@@ -904,7 +904,7 @@ safeputs(netdissect_options *ndo,
> >>> + {
> >>> +       u_int idx =3D 0;
> >>> +
> >>> +-      while (*s && idx < maxlen) {
> >>> ++      while (idx < maxlen && *s) {
> >>> +               safeputchar(ndo, *s);
> >>> +               idx++;
> >>> +               s++;
> >>> +--
> >>> +2.13.0
> >>> +
> >>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11542-PIMv1-Add-a-bounds-check.patch b/meta-networking/recipes-s=
upp
> >>> ort/tcpdump/tcpdump/0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch
> >>> new file mode 100644
> >>> index 000000000..a177e7c0b
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11542-PIMv1-Add-a-bounds-check.patch
> >>> @@ -0,0 +1,43 @@
> >>> +From bed48062a64fca524156d7684af19f5b4a116fae Mon Sep 17 00:00:00 20=
01
> >>> +From: Guy Harris <guy@alum.mit.edu>
> >>> +Date: Tue, 7 Feb 2017 11:10:04 -0800
> >>> +Subject: [PATCH] CVE-2017-11542/PIMv1: Add a bounds check.
> >>> +
> >>> +This fixes a buffer over-read discovered by Kamil Frankowicz.
> >>> +
> >>> +Add a test using the capture file supplied by the reporter(s).
> >>> +
> >>> +CVE: CVE-2017-11542
> >>> +
> >>> +Upstream-Status: Backport
> >>> +https://github.com/the-tcpdump-group/tcpdump/commit/bed4806
> >>> 2a64fca524156d7684af19f5b4a116fae
> >>> +
> >>> +Drop the tests/* changes to workaroud patch error:
> >>> +File tests/hoobr_pimv1.pcap: git binary diffs are not supported.
> >>> +
> >>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >>> +---
> >>> + print-pim.c            |   1 +
> >>> + tests/TESTLIST         |   1 +
> >>> + tests/hoobr_pimv1.out  |  25 +++++++++++++++++++++++++
> >>> + tests/hoobr_pimv1.pcap | Bin 0 -> 3321 bytes
> >>> + 4 files changed, 27 insertions(+)
> >>> + create mode 100644 tests/hoobr_pimv1.out
> >>> + create mode 100644 tests/hoobr_pimv1.pcap
> >>> +
> >>> +diff --git a/print-pim.c b/print-pim.c
> >>> +index 25525953..ed880ae7 100644
> >>> +--- a/print-pim.c
> >>> ++++ b/print-pim.c
> >>> +@@ -306,6 +306,7 @@ pimv1_print(netdissect_options *ndo,
> >>> +                       pimv1_join_prune_print(ndo, &bp[8], len - 8);
> >>> +               break;
> >>> +       }
> >>> ++      ND_TCHECK(bp[4]);
> >>> +       if ((bp[4] >> 4) !=3D 1)
> >>> +               ND_PRINT((ndo, " [v%d]", bp[4] >> 4));
> >>> +       return;
> >>> +
> >>> +--
> >>> +2.13.0
> >>> +
> >>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
> >>> b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
> >>> new file mode 100644
> >>> index 000000000..36e3f6b0d
> >>> --- /dev/null
> >>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-
> >>> 2017-11543-Make-sure-the-SLIP-direction-octet-is.patch
> >>> @@ -0,0 +1,85 @@
> >>> +From 7039327875525278d17edee59720e29a3e76b7b3 Mon Sep 17 00:00:00 20=
01
> >>> +From: Guy Harris <guy@alum.mit.edu>
> >>> +Date: Fri, 17 Mar 2017 12:49:04 -0700
> >>> +Subject: [PATCH] CVE-2017-11543/Make sure the SLIP direction octet is
> >>> valid.
> >>> +
> >>> +Report if it's not, and don't use it as an out-of-bounds index into =
an
> >>> +array.
> >>> +
> >>> +This fixes a buffer overflow discovered by Wilfried Kirsch.
> >>> +
> >>> +Add a test using the capture file supplied by the reporter(s), modif=
ied
> >>> +so the capture file won't be rejected as an invalid capture.
> >>> +
> >>> +CVE: CVE-2017-11543
> >>> +
> >>> +Upstream-Status: Backport
> >>> +https://github.com/the-tcpdump-group/tcpdump/commit/7039327
> >>> 875525278d17edee59720e29a3e76b7b3
> >>> +
> >>> +Drop the tests/* changes to workaroud patch error:
> >>> +File tests/slip-bad-direction.pcap: git binary diffs are not support=
ed.
> >>> +
> >>> +Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> >>> +---
> >>> + print-sl.c                    |  25 +++++++++++++++++++++++--
> >>> + tests/TESTLIST                |   3 +++
> >>> + tests/slip-bad-direction.out  |   1 +
> >>> + tests/slip-bad-direction.pcap | Bin 0 -> 79 bytes
> >>> + 4 files changed, 27 insertions(+), 2 deletions(-)
> >>> + create mode 100644 tests/slip-bad-direction.out
> >>> + create mode 100644 tests/slip-bad-direction.pcap
> >>> +
> >>> +diff --git a/print-sl.c b/print-sl.c
> >>> +index 3fd7e898..a02077b3 100644
> >>> +--- a/print-sl.c
> >>> ++++ b/print-sl.c
> >>> +@@ -131,8 +131,21 @@ sliplink_print(netdissect_options *ndo,
> >>> +       u_int hlen;
> >>> +
> >>> +       dir =3D p[SLX_DIR];
> >>> +-      ND_PRINT((ndo, dir =3D=3D SLIPDIR_IN ? "I " : "O "));
> >>> ++      switch (dir) {
> >>> +
> >>> ++      case SLIPDIR_IN:
> >>> ++              ND_PRINT((ndo, "I "));
> >>> ++              break;
> >>> ++
> >>> ++      case SLIPDIR_OUT:
> >>> ++              ND_PRINT((ndo, "O "));
> >>> ++              break;
> >>> ++
> >>> ++      default:
> >>> ++              ND_PRINT((ndo, "Invalid direction %d ", dir));
> >>> ++              dir =3D -1;
> >>> ++              break;
> >>> ++      }
> >>> +       if (ndo->ndo_nflag) {
> >>> +               /* XXX just dump the header */
> >>> +               register int i;
> >>> +@@ -155,13 +168,21 @@ sliplink_print(netdissect_options *ndo,
> >>> +                * has restored the IP header copy to IPPROTO_TCP.
> >>> +                */
> >>> +               lastconn =3D ((const struct ip *)&p[SLX_CHDR])->ip_p;
> >>> ++              ND_PRINT((ndo, "utcp %d: ", lastconn));
> >>> ++              if (dir =3D=3D -1) {
> >>> ++                      /* Direction is bogus, don't use it */
> >>> ++                      return;
> >>> ++              }
> >>> +               hlen =3D IP_HL(ip);
> >>> +               hlen +=3D TH_OFF((const struct tcphdr *)&((const int
> >>> *)ip)[hlen]);
> >>> +               lastlen[dir][lastconn] =3D length - (hlen << 2);
> >>> +-              ND_PRINT((ndo, "utcp %d: ", lastconn));
> >>> +               break;
> >>> +
> >>> +       default:
> >>> ++              if (dir =3D=3D -1) {
> >>> ++                      /* Direction is bogus, don't use it */
> >>> ++                      return;
> >>> ++              }
> >>> +               if (p[SLX_CHDR] & TYPE_COMPRESSED_TCP) {
> >>> +                       compressed_sl_print(ndo, &p[SLX_CHDR], ip,
> >>> +                           length, dir);
> >>> +
> >>> +--
> >>> +2.13.0
> >>> +
> >>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> >>> b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> >>> index 261c78427..668d6f5e1 100644
> >>> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> >>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.1.bb
> >>> @@ -11,6 +11,9 @@ SRC_URI =3D " \
> >>>       file://tcpdump-configure-dlpi.patch \
> >>>       file://add-ptest.patch \
> >>>       file://run-ptest \
> >>> +    file://0001-CVE-2017-11542-PIMv1-Add-a-bounds-check.patch \
> >>> +    file://0001-CVE-2017-11541-In-safeputs-check-the-length-before-c=
=2Epatch
> >>> \
> >>> +    file://0001-CVE-2017-11543-Make-sure-the-SLIP-direction-octet-is=
=2Epatch
> >>> \
> >>>   "
> >>>     SRC_URI[md5sum] =3D "1e0293210b0dea5ef18e88e4150394b7"
> >>>
> >>> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
>=20
> --=20
> Jose Lamego | OTC Embedded Platform & Tools | GDC
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mrJd9p1Ce66CJMxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbmjkQAKCRA3VSO3ZXaA
HJVLAJ0fdeMdUKQvHgiD1c6vEDzyxtNYkQCgto0efmJFxA5tjR0zk7OTgZ1MpLw=
=MRhr
-----END PGP SIGNATURE-----

--mrJd9p1Ce66CJMxE--
