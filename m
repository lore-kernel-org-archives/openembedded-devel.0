Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7YWj-0004Kz-Q4 for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 21:04:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P7YWC-0005Ln-QD for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 21:03:40 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 21:03:40 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 21:03:40 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 Oct 2010 21:03:33 +0200
Message-ID: <i9fha5$t75$1@dough.gmane.org>
References: <1287340776.3748.31.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1287340776.3748.31.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libgee: `do_configure` fails: gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
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
X-List-Received-Date: Sun, 17 Oct 2010 19:04:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-10-10 20:39, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> commit a89e9c
> 
>         libgee.inc: Use libtool macros from installed libtool
> 
> breaks task `do_configure` with at least `minimal-{libc,uclibc,eglibc}`.
> 
>         | gee/Makefile.am:95: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL
>         | autoreconf: automake failed with exit status: 1
>         | FATAL: autoreconf execution failed.
>         | ERROR: Function do_configure failed
>         NOTE: package libgee-1_0.6.0-r6.0: task do_configure: Failed
> 
> This problem was seen before [2].
> 
> Reverting commit a89e9c fixes the build.

Does building gobject-introspection-native help as well?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMu0iFMkyGM64RGpERAgYRAKCyO2SUg0iKVntrgH5jrYAglTjErgCfXayy
/pK7jgn6hjy+RsCD70ZR6lY=
=t/Jp
-----END PGP SIGNATURE-----



