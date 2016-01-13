Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id ABE6B7318D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 18:03:54 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so306603461wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 10:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:cc:to:mime-version;
	bh=kPZ4dezy8phi+Tk41obbdtgH+XxnAXRc7dObNB33mS4=;
	b=0ciSFzhip25ylT1XSQeb9WLrBOikp0mmXF+UrQOFvILYtILMx3aLxZLlAGKIRmokmo
	0dWOFZTpWu+9QudKOysX2jFzFbtdFtNrs5/At6OiOopaE20pKdh6zE1Q/w0cL2WNX0RM
	Qgl8fhHb+XXXyzwQtLAd93V+43J5VdaRbEAJwkD/c4Ga9VK5cSa3ER1ltj9Fvum8j3L3
	RV58ZppNpY6ZEgVVM6cmqqbBdlJ+eQROCIEhL/YLvL6PgbG7VP70eE6sRlizdcIlFprG
	ZYKbNefZZ7suo2MC7W/Tvonb+ZHIqKf1OE/67QApgF7LTi+3EO5CjRxes58QjsbmRVtG
	Z3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:cc:to
	:mime-version;
	bh=kPZ4dezy8phi+Tk41obbdtgH+XxnAXRc7dObNB33mS4=;
	b=ASWLpygPzmDp96SAOzG7DxjD0cMQ9SgWueOD+QED5wBdPdfjV+77Qr2DNucSik8fgy
	aLGF1u5wIbr5iNOUHaGWB//I2S2Zx2XiTRGSu02wA+t5K5tsUJ1Q0ctXDYNR3RCOG4O3
	qb7gOqbJ7wwXtolo2p7FLiEqKmAuMwti5r8ZddYUyiJ3elkvb6/lSDCN8/OUYcBQnwWV
	Qg/FTwQ4xPV+10A0AWSKgTztrbq7wiBSOYu2vyPJ197eRo/GZDI+pdInmTg52KLGtQXA
	Yz+S3xOnpnqGzizvzcxCIRZJ31R/GcHA9BrDfy1okNYLJXjITsR8gXelbMhYXITBfOAG
	RQIQ==
X-Gm-Message-State: ALoCoQnKffzRVxoWg/nzDzVw+cqB/WwmtMVVEz0BJrnMLRbe3JibM4ACI6Yakx6ikOTnuxQbiMYB/GYW5mXY/LsiIUoNqObTDg==
X-Received: by 10.28.175.147 with SMTP id y141mr232160wme.64.1452708234439;
	Wed, 13 Jan 2016 10:03:54 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id v2sm3686903wmv.12.2016.01.13.10.03.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 10:03:53 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 13 Jan 2016 19:03:51 +0100
Message-Id: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: meta-java Workflow
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
X-List-Received-Date: Wed, 13 Jan 2016 18:03:56 -0000
X-Groupsio-MsgNum: 59516
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B61D8DFA-8394-4320-9270-875470F55716";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B61D8DFA-8394-4320-9270-875470F55716
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

to avoid such a problem as it occurred with ec7b984f, 04d5d0bf and =
dfb21b44, I strongly suggest that meta-java follows the merge-workflow =
from other meta-layers:

cherry-pick new stuff into master-next, when settled - merge to master
Branch releases as other layers do and same, push back-ported patches =
into ${rel_branch}-next and merge the behaving ones into ${rel_branch}.

The current way - pushing to master and live only there result in the =
happened revert - and to continue my work I would have to revert the =
reverts without any nice word in the commit message as I did in =
reverting 24b98ac3 with a88718b6.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_B61D8DFA-8394-4320-9270-875470F55716
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWlpGIAAoJEESZlq7c5QqdmNEQAKPW8vLgLtj+Ihbmjlidy0Xn
UsAMxb56e6SzhIU+57VXs48AOJISlg//D27wtmH/AfREN2qdX7JwLLpbNRE4080L
Qfgl8bAmg+q4VfmPKpPAsJtvRGVfVpWzJb6V6RPjfWi24f1FPLM7CU8eV3naoPtZ
/tgk6XAco01PyCjAkRVjUOSvhI2QonFtIzpQyB7qVxy7CLIZoM4kSPLKbV+EKPVU
7f/ctfTVboSLas1e09qBscdKoqgrktxshjlQ9LaJY9pnW2DHBugvpHDFG11vMPH5
Xeteysy9AL8wUzLN4YMY8hxVdv06jJ/XRZXXkMkNMc3swON2lJPJuB8Q8Wcw1n9F
CANIlVkIHA1yKWWKNn8WGfpdeX90HAX1CEi6ainYztpyvs4ffr34tcTQc7C9dpvF
GAuY6Yp17J3Fe8i0v4MN444s0lgE0gii2ONWg30u4MElTkYmTzk4g/1Ys+eeZmzO
y6KdG+WdZLyPJwgawe5dwR0MhtKssJ8JBHi6dW6ExCZOVWhn6b3Z221SPNa+PrXE
ze4S0oZaTd3QT6aaYaHGk/+NAWNaUGtEvUOTZ52cG68McuH4sGmMTuANdDLC3qwh
Krd4q3NTXi3dUsslEaQW0O1iEIZGWx7xM7C+mtGq0b8mFDLmMboHAdnRORlQzhz4
CXtjFtDzqPACCvRmmmLo
=Y/SG
-----END PGP SIGNATURE-----

--Apple-Mail=_B61D8DFA-8394-4320-9270-875470F55716--
