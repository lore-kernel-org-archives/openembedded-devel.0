Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id D9767609AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 18:38:44 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so3019805wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L7dv6ePILtDILudYgyEtfvp5hRB/3x8qFkOFEciF0pQ=;
	b=0VexcFtXsR6/Pg3WBM074y/UV7q4MuNFlIMzZE+CjSDRgD67F44wJXiMYjUD+V8Rxb
	opKGSkyUzz2MIbSpxvGCE5P3y0rCk7E78UXMBkMCIgxP8qd6tcZBZnNCZNCwM7Et4LN3
	tb2bS7oP8jES7tEDOqQUAsK6VYmDm3FvwnLMtO2m8GJNFZw6qwwPc4kLH4rj+ZCDOlbz
	qzvbDVeDMWtV8YD8BoekdPqsGYgolSvsGIZawgZ2xa9lC2Q2Mb2f6zZ1jFlsss9uHUNn
	oxbXVS8kmpEy4srzFPTY0hCVWclF6KP6EC3pP9rX1877il3LxWLQywoOWSqpGU2+6HvM
	soBw==
X-Received: by 10.180.221.134 with SMTP id qe6mr18569899wic.66.1407350324935; 
	Wed, 06 Aug 2014 11:38:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub11sm20801627wib.1.2014.08.06.11.38.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 11:38:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 20:39:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806183909.GO14848@jama>
References: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407332271-32696-1-git-send-email-joe_macdonald@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] wireshark: update to latest stable version
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
X-List-Received-Date: Wed, 06 Aug 2014 18:38:51 -0000
X-Groupsio-MsgNum: 51461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m46qSNjkc66Ye11q"
Content-Disposition: inline

--m46qSNjkc66Ye11q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 06, 2014 at 09:37:51AM -0400, Joe MacDonald wrote:
> Version 1.12.0 is out, update the SRC_URI and associated variables.

One more issue:

WARNING: QA Issue: wireshark rdepends on c-ares but its not a build
dependency? [build-deps]

it's strange, but it's new with 1.12.0 final.

> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../wireshark/va_list-can-t-be-NULL-on-ARM.patch   | 99 ----------------------
>  ...wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} | 10 +--
>  2 files changed, 5 insertions(+), 104 deletions(-)
>  delete mode 100644 meta-networking/recipes-support/wireshark/wireshark/va_list-can-t-be-NULL-on-ARM.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_1.12.0-rc2.bb => wireshark_1.12.0.bb} (81%)

--m46qSNjkc66Ye11q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPidk0ACgkQN1Ujt2V2gBxKxgCgkWxoK9JI1/9EwLtvZ7+KJM6n
qxoAn3gUjBkcQpsR/fy5K++cApzGK+04
=cp3h
-----END PGP SIGNATURE-----

--m46qSNjkc66Ye11q--
