Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 19D7471B4A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 18:12:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c17so23739664wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k5HVMyEHFhH4hl4A6kY8vBAdrvL3BH5rmiBHrKafzGI=;
	b=hra9K1AC6wMhwcLWv0P7Sdi9XIRVhAHTz6lkSKe1oJRI96SkWNyauLJ0sf5E2abTWn
	HCVHhvgyemr92OFR3EhxGaxFXvlKZikX8/wHsqhSNIjzQU5ZkcHaceInqwZ1U71YyD7/
	ufwaebk5GTVe3acrMSZ3sBAi38itN+lrseYHgWD+8/xLlsvue8cDBuHG3vTUjUhDCEF3
	berBo6DsRjEmBq1pcRkwpZP5jdRPtExK0vUV/z0lH5WdrZjSRwml5DOqJrws694ek1lA
	/uOga6NvJi8ElOkD2Zo1pBtxCvJZaut2QXxibRkRD/7FmcQzNeQBszXYC8pY8O57gc5E
	gUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k5HVMyEHFhH4hl4A6kY8vBAdrvL3BH5rmiBHrKafzGI=;
	b=eLyZPUTHK3DaJbCI5O3q0s87oAZH/60+W9X3c6Yvc8bCmhIh9t/nQkaQfRQpMv7CR2
	Eb9IobQCwz/Z5VKGDC7tuTv/uhsiP3iOa3+hcx48YlMskHhIoZ9QQFNAquZquiDMafRe
	Eubb/nHI+hnj9WuAGOnmFoxWffOaP3sscdoIYeJY3wXkxz/9pzN6IWzeKPqHCQywDhGw
	JM9Q1+wZvQKws8srt/e0l3EcFpdBNusU1xkYpNFFsgMPPVU/s1LlBa24DPvppttlRZY9
	5pck8qmbUrbxYCZ6rhQnX+viisVLA6uw9Iev4C7MU1HjLksPRmTsq6aGR1iMUW2yNyFu
	6Uyw==
X-Gm-Message-State: ABUngve5A+dgVf3wp6cdGL+bo6/tS54fK+tpGpKeLQTyns1iKZBVJ220MLODeolIaFGvMw==
X-Received: by 10.28.184.23 with SMTP id i23mr2573888wmf.66.1478023929080;
	Tue, 01 Nov 2016 11:12:09 -0700 (PDT)
Received: from localhost ([217.30.64.102]) by smtp.gmail.com with ESMTPSA id
	h2sm26293049wjy.40.2016.11.01.11.12.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 Nov 2016 11:12:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Nov 2016 19:12:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161101181213.GE2985@jama>
References: <1477903622-19542-1-git-send-email-Junxian.Xiao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1477903622-19542-1-git-send-email-Junxian.Xiao@windriver.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [PATCH] apache2: include .load files in modules.d
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
X-List-Received-Date: Tue, 01 Nov 2016 18:12:09 -0000
X-Groupsio-MsgNum: 63682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline

--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 04:47:01PM +0800, Junxian.Xiao wrote:
> Issue: LIN8-5007
>=20
> According to other linux distributes like ubuntu, the modules
> are usually included by 'LoadModule' command in *.load files
> in mods-enable directory, and *.conf files in this directory
> are for special configurations for each module.
>=20
> The stucture of the files tree is not the same in yocto, so this
> may be not the rule that we must follow. But still add *.load to
> be compatible with customer's normal usage habits.

OE @ ~/meta-openembedded $ pwam 133390
2016-11-01 19:10:52
URL:https://patchwork.openembedded.org/patch/133390/mbox/ [1933] ->
"pw-am-133390.patch" [1]
Applying: apache2: include .load files in modules.d
error: meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb: does not
exist in index

commit 7707dd5bc82583e4cc41ae3080b40d0d6ede8a45
Author:     Derek Straka <derek@asterius.io>
AuthorDate: Wed Jul 13 08:46:59 2016 -0400
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Fri Jul 29 11:00:55 2016 +0200

    apache2: update to version 2.4.23
   =20
    Signed-off-by: Derek Straka <derek@asterius.io>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


REBASE and retest before sending changes!

> Signed-off-by: Junxian.Xiao <Junxian.Xiao@windriver.com>
> ---
>  .../recipes-httpd/apache2/apache2_2.4.16.bb        |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> index 4aacff1..52127c2 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
> @@ -81,6 +81,7 @@ do_install_append() {
> =20
>      # Ensure configuration file pulls in conf.d and modules.d
>      printf "\nIncludeOptional ${sysconfdir}/${BPN}/conf.d/*.conf" >> ${D=
}/${sysconfdir}/${BPN}/httpd.conf
> +    printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.load" >> =
${D}/${sysconfdir}/${BPN}/httpd.conf
>      printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n"=
 >> ${D}/${sysconfdir}/${BPN}/httpd.conf
>      # match with that is in init script
>      printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd=
=2Econf
> --=20
> 1.7.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgY2vwACgkQN1Ujt2V2gBwN2wCguSCm/it9J18HZs8ytxnoyfTI
0BEAn3fqFonn2NX4ZfDK7hdWyiKnEnK6
=FTDQ
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
