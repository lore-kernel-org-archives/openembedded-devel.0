Return-Path: <btgoodwin@geontech.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4C84974775
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 21:21:58 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id b4-v6so14487978qtc.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=geontech-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=7ycpRDzGptnRpdhwWwAFaZYQ/wYFQI/yIDbbi/K4geM=;
	b=jN6tyaXc+ef7wvqrypDrCnD/qZj3KTRvitClnIhGKLQaeZPj4Ed7aX2T5V+CurhIAP
	EtRnRQSbhfjC4bkZdQM1opkQVWvxdwsZHlW24C10vmYaEBpmFVssYxuyfo3CvxsH3rBg
	AOOWxza2rkxuyerUItHRJhGC0e8HegBMWzvYvu5R23qQcABICDtJx7K2DnqyGkMM0TPG
	fNL2emk90NunOzPeS1uTiqmxJp6n0x0fO33xtuFpt/vWdDyv3BvOF9KsNP1h/n9xon0B
	Cx3MNg66R4K994GbDsW93TI5VDAcFhAW4LNj03FQ76OLOnUxXuWz/Yt3zgmMoSAjQXTT
	cRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7ycpRDzGptnRpdhwWwAFaZYQ/wYFQI/yIDbbi/K4geM=;
	b=jv5ZbAJPOV2qhw3R2Y4teuVTJTp1AkefVNfGK1wX6jzEU1DjHI/zcv6sxf1pFMCDwy
	t2Cve0H1f9XxHGhcej+59EKRkkSq4Wbz8VVhIWkb0UUAiiyTJGaTQDn7aPlWbiNB7XGO
	g+Zztoyw1fuI3+eFDf+KYM4s3KXF8SeMnjJKzApgM49HD/TRdiDA54WnxIzA8cLHSAlR
	p+oqbOHhOOIkmtbARomD3iW+yLJVG0yPq3L6GI2VapdurMuZhX7tsbIWSTch2mThubu4
	TO7/B5WC/yeMmSQ8RCAvUkPceec/HNDHE/BLIsxdmc3noP1WGx+aeQdcS1o6IdTvOQdx
	ei3Q==
X-Gm-Message-State: ABuFfogiX+JP4WkYb91kumb6TchobXlGZcJpxnHUfE7cSgvYod8Oerg4
	RoYVMZRG9/ngqhffa+L9am1JSH9MvjjWwH/yKNIkOZ5XS2A=
X-Google-Smtp-Source: ACcGV63EdM2IV2yVyOBHT2Ag9IGNoOTUz0Ap7wzUHhll6FuVJxdvr4ETbz9lQRvf1HdarA71QeboiEr4VN+96gWOs4k=
X-Received: by 2002:ac8:3236:: with SMTP id
	x51-v6mr20687895qta.275.1539033719141; 
	Mon, 08 Oct 2018 14:21:59 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Goodwin <btgoodwin@geontech.com>
Date: Mon, 8 Oct 2018 16:21:48 -0500
Message-ID: <CABudRdzubOL9HwpnYNBDzybRkJj-EUeHMni26oWzErqJysjF4w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [sumo, rocko, pyro, morty] xerces-c, change of SRC_URI
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
X-List-Received-Date: Mon, 08 Oct 2018 21:21:58 -0000
Content-Type: text/plain; charset="UTF-8"

The URI for this recipe is to a server that seems to only maintain the most
recent version of the source tarball (currently 3.2.x vs. recipe version
3.1.4):

http://apache.lauf-forum.at/xerces/c/3/sources/


The server listed in APACHE_MIRROR does contain the correct sources (
https://archive.apache.org), so:


SRC_URI = "${APACHE_MIRROR}/dist/xerces/c/3/sources/${BP}.tar.bz2"
SRC_URI[md5sum] = "d04ae9d8b2dee2157c6db95fa908abfd"
SRC_URI[sha256sum] =
"9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8cc6891"


Note, the MD5 and SHA256 are correct for each of the impacted branches of
meta-openembedded; they're listed here for completeness.

Regards,

Thomas

