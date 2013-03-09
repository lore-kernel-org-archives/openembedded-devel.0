Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UEMxY-00061X-SB
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 17:49:31 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so2273118pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2013 08:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=lsrXGft0sNeaTNTLmNKfC83pX26ltR1G4nGEGrDWsXM=;
	b=GYNbCCQKNuXYKjUZPQVTWJ4uW5zIUfr1Tif/CdrSgO/i8regKPmII/V5NgWJLFXWAn
	/xQ4qIIQJ9TWLSceYVkM+kKY/4OIfu0Y74h9xzBevu7t5JV8kwOIfaThSgBpsqcTI0Xi
	/6P1Uw5ibFLZ5QcunUUfGtT6hFIBuqAyVtCfoAyiad+2S5Zaw8t+Qjw6mLhdfybBbkoQ
	TI6suf1rC+lU+dOCfFm7pTq4OYDGhWA8+OY+wskvTWo00kusDmUTW7GTYwTI6g1szkvc
	SQ70r9ieFKbBnYJQYIcHGCcVPhb5gBNLUy50mglGALWPAQXxJP+st/dcpBP4/FclN7MS
	gXqw==
X-Received: by 10.68.222.163 with SMTP id qn3mr2250372pbc.77.1362846768731;
	Sat, 09 Mar 2013 08:32:48 -0800 (PST)
Received: from sa-nc-apg-191.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id ip8sm10944885pbc.39.2013.03.09.08.32.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 08:32:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
Date: Sat, 9 Mar 2013 08:32:45 -0800
Message-Id: <3C660C3C-34A4-4805-B6C0-E49AC8EEED55@gmail.com>
References: <cover.1362831936.git.apelete@seketeli.net>
	<73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: [2011.03-maintenance][PATCH v2 1/2] gnutls: update SRC_URI
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
X-List-Received-Date: Sat, 09 Mar 2013 16:49:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 9, 2013, at 4:38 AM, Apelete Seketeli <apelete@seketeli.net> =
wrote:

> -SRC_URI =3D =
"ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;name=3Dgnutls"
> +SRC_URI =3D =
"ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${PV}.tar.bz2;name=3Dgnut=
ls"

can we use PV instead of 2.10 ? if not then move SRC_URI out of .inc =
into .bb=


