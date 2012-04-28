Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SOHTD-0006N2-0N
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Apr 2012 01:54:31 +0200
Received: by iakk32 with SMTP id k32so2837366iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2012 16:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IMaIb7lZX/mzjJzkS044WSY/H4OTmRhO/Yqu5/Cn/Ls=;
	b=rY2d3PVoaKKUkb4JCLdajxVDbS3E3SYpTOx63h0AbbBtCOPMJSuHGfS9cdvRZ9tSqy
	vlyVQoykRyK8gPBewsioN1O9xLZfCXGVlexGlmUGX8RYO+oAEeazmm5nRsOyB0VC1Fir
	xgv5j4YWcUbyM5yFWqrgKYrB1bqk7doNwmoceNTo5TPCT26gTN+oqbZiBBQoKbpnV3yB
	ZdPOXL50h8xX8IfvPXzHaH/qre/Z0HMtwxRaZ69tu48hwU2GcefFCIDcLnsX7ZdzShvN
	MI/cbdt4mI+LvDDGH+gs8dN26FZLSxu6TYpKxLwCSNBSP4VQBxIA7Qa9+pmKucpYNF2w
	GZcQ==
MIME-Version: 1.0
Received: by 10.50.77.136 with SMTP id s8mr6802134igw.56.1335656690383; Sat,
	28 Apr 2012 16:44:50 -0700 (PDT)
Received: by 10.231.67.134 with HTTP; Sat, 28 Apr 2012 16:44:50 -0700 (PDT)
In-Reply-To: <4F9C59B8.9000106@gmail.com>
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
	<4F9C59B8.9000106@gmail.com>
Date: Sun, 29 Apr 2012 01:44:50 +0200
Message-ID: <CAOHjBZt=Va7u5fgcaszpV32KKjFFkSJvLFH5dTQ=Ot+_H1Fw+w@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Sat, 28 Apr 2012 23:54:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Many thanks!!!

Il giorno sabato 28 aprile 2012, Khem Raj ha scritto:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 04/11/2012 03:23 AM, Giuseppe Condorelli wrote:
> > Hi, I moved to OE-Core (working on stable version dowloaded as tar
> > file from cgit.openembedded.org). I'm in trouble trying to include
> > a source through .bbappend file, located under my meta-<personal>
> > subtree.
> >
> > FILESPATHBASE_prepend := "${THISDIR}/files:" SRC_URI +=
> > "file://myfile.tar.gz"
> >
>
> assuming you have set the layer properly and bitbake is able to find
> it and parse it you will do
>
> FILESEXTRAPATHS := "${THISDIR}/files"
> SRC_URI += "file://myfile.tar.gz"
>
> that should do it.
>
> Check first if your layer is being added to the parse it should be shown
> in build header that is dumped first by bitbake before it starts
> building its also in cooker.log file in build dir.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk+cWbgACgkQuwUzVZGdMxTXOwCdH0ltQ+crP/jqJG2q/hS/QYwY
> BEgAnjrSE5qYynydngZL/i1ZfRywV/DU
> =v7Cy
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

