Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PCq8S-0007Vh-Tn for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 09:53:11 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PCq7i-00041B-AD for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 09:52:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 09:52:14 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 09:52:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Nov 2010 09:52:02 +0100
Message-ID: <ialv3j$7nq$1@dough.gmane.org>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 08:53:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-11-10 08:49, Frans Meulenbroeks wrote:

> PS: a few comments wrt the libcdio issue:
> 
> - it would have been nice if this was discussed with the recipe
> maintainer. This is in accordance with our commit policy [2, 4th
> block]. I strongly doubt that this has happened (and apologies if this
> is a faulty assumption).

Since I'm not sure if you're getting at the fix or breakage, I will talk
about the breakage commit:

I don't tend to discuss things with myself since it creeps people out :)
I created the cdio recipe myself in 2009 and pushed in januari 2010.
The funny thing is that all the breakage occured by this:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b672b28ba6a29e2715c91fcbbda8b2776b6f1105

That commit has no ACKs so SOBs from me, so I wonder why it went in.

> (btw: a good place would probably be [3] and yeah, I am aware of the
> debian renaming [4], but I am also aware of [5] which as an example
> says:
> FILES_${PN} = "\
>     ${bindir}/* \
>     ${sbindir}/* \
>     ${libexecdir}/* \
>     ${libdir}/lib*.so.* \
>     .....
> which was exactly what was in the original commit [6]:
> +FILES_${PN} = "${libdir}/lib${PN}${SOLIB}"

But there's no file called liblibcdio.so.x.y, only libcdio.so.x.y. The
original recipe already had a way to split all the libs automatically.

Thankfully the incremental angstrom autobuilder caught that issue and
was fixed shortly after.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMzn+yMkyGM64RGpERAhCeAKClVVlShXMOPZfX0E75/zdyfcgyngCgtFgO
eT/mGyAz6nqYFEI2HpAJ/oE=
=5WFz
-----END PGP SIGNATURE-----



