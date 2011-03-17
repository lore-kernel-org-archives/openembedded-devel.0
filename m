Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0Dex-0006E1-Pf
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 14:54:40 +0100
Received: by bwz10 with SMTP id 10so2312795bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bLc0CL4uk77yYWTQH+ki8AO4raNN6PJOWLhelBuSHgI=;
	b=wJZZ9ZXE2u6t18XINvRSrqb+O0XeGqwv/sVAw6wi7WUeh/l8nmc5GPgjCOZ8bNb6Ny
	2fsBENxlTitzIF+06kWoaK0lLgAhdzhrXwNQh/pQriRAC+sNO5FDmYSULukAY/narz1t
	bYXQSKiqZ+37eqcnVSBCLUrmAON1zsq4pQ9Js=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pLXTPvyar9y/rOnwSKX+75aghzPZ90WHX6ifblPFYfPsgDvf5pYXy5Gtt4BIC4rdvi
	ZTapsZCKAt/TM0hbrP+lTuFz50af+YW0USUMY2r5o9Qfp9jta02Y/en37rzJt7xfQEuI
	Ygc8sYvBq/UT2TauNbqP50PmY7dXSFKnXJIDc=
Received: by 10.204.20.142 with SMTP id f14mr1157659bkb.155.1300369975505;
	Thu, 17 Mar 2011 06:52:55 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k5sm1382874bku.4.2011.03.17.06.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 06:52:54 -0700 (PDT)
Date: Thu, 17 Mar 2011 14:52:47 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110317135247.GB3585@jama.jama.net>
References: <1300365679-20067-1-git-send-email-Martin.Jansa@gmail.com>
	<1300365679-20067-2-git-send-email-Martin.Jansa@gmail.com>
	<ilt2d9$sr2$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ilt2d9$sr2$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] gst-plugins: define disjunctive PACKAGES_DYNAMIC for each pack base/good/bad/ugly
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
X-List-Received-Date: Thu, 17 Mar 2011 13:54:40 -0000
X-Groupsio-MsgNum: 30349
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline

--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 17, 2011 at 02:30:17PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 17-03-11 13:41, Martin Jansa wrote:
> > * adds a bit more bits to keep in sync while changing gst-plugins
> >   version, but not that much (this patch was mostly prepared by script)
>=20
> Can you upload the script as well? The constant motion of plugins
> between the releases (a good thing!) was my reason to have a single
> PACKAGES_DYNAMIC.

OK, I'll have to cleanup it a bit to be usable for others :).

So I'll wait for outcome of patch and discrussion Phil started if
silencing that notice is worth it.

> The other case to consider is ENTERPRISE_DISTRO and DISTRO_FEATURES[1],
> how do those interact with this patch.

I guess it should be fine with this patch as extra patterns in
PACKAGES_DYNAMIC won't harm afaik, it will only make my script a bit
more complicated (I just build it and then list plugins from builddir
like do_split_packages in gst-plugins-package.inc does).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2CEi8ACgkQN1Ujt2V2gBxYLQCfYP5VVmwV0AnQ+kSrK4S/H/BF
knQAoKleWLqT/ylKkLvQ0BVqryXyHu0c
=ROHZ
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
