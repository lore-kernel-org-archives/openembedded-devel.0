Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 986A265E1A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 15:48:54 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id m15so3541546wgh.26
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Oct 2014 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7htAwpzP4bZC0I4zMgasjMEki3UZh4dYnWPQZUu2bmk=;
	b=ti6ocoUBaVDxzt4qm05LE8anSLmPBy4nEfosVAP+HQcbRAMdSVF97VEsMhqv74igxL
	9ItfEdS2UCjbVzjUqBK9UzaXsaAEKfXbkXz33CgmEHu3WxF4NVXu4ml/TM8qiLpdXuTk
	mNz41iqAn/bdN8jvlT5CFTdecW1isfdEFSG/aD+UOThDY8WRCyET1T2Xotn289R9LGTg
	SCl2tkajBF9JLBZQK+7TvsRJMaek7ZP/TMyo3Q/hwJununmBIL1zmUea+zfzPm3Yu/a9
	ZnbrJvYDHH/LT9AxCZVbmY0tALCEhDLZm0lu3uS4/rimJV9jEbNrsb/xy9LFDN31bWxk
	Pocw==
X-Received: by 10.194.220.7 with SMTP id ps7mr16413457wjc.28.1412437734953;
	Sat, 04 Oct 2014 08:48:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a2sm5328785wic.19.2014.10.04.08.48.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Oct 2014 08:48:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 4 Oct 2014 17:49:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141004154952.GP25706@jama>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
	<1412389558-13237-7-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1412389558-13237-7-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 7/7] qt5: upgrade git recipes to 5.4-alpha1
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
X-List-Received-Date: Sat, 04 Oct 2014 15:48:57 -0000
X-Groupsio-MsgNum: 52356
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eB5okr78BIEWepnS"
Content-Disposition: inline

--eB5okr78BIEWepnS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 04, 2014 at 04:25:58AM +0200, Martin Jansa wrote:
> * introduce 2nd set of qtwayland and qtwebengine recipes, because newer
>   revision isn't compatible with 5.3.2 release

I plan to merge all these changes into master before branching dizzy, do
you have some good reason for me to wait after branching?

Pros:
* It's already tested with dizzy.
* I don't think that anybody would require 5.3 from git, now when it
  receives only relatively few changes.
* Possibility to try 5.4 with dizzy branch (but useful only for very
  short time)

Cons:
* All serious 5.4 users will use meta-qt5 from some later commit in master
  branch (e.g. after 5.4.0 is released), using stable "release" branch
  for metadata and alpha release of qt doesn't make much sense.

Regards,

--eB5okr78BIEWepnS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQwFyAACgkQN1Ujt2V2gByiJwCfUclJD/ma8TPyrrxIDY7CYKEm
+tYAn2bn62vexSyyHmIpNvKNCHcv9dlI
=VbFJ
-----END PGP SIGNATURE-----

--eB5okr78BIEWepnS--
