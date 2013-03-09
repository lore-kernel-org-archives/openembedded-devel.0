Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UENAK-0006n6-R8
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 18:02:51 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so2264807pbc.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2013 08:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=lsrXGft0sNeaTNTLmNKfC83pX26ltR1G4nGEGrDWsXM=;
	b=oDzfZlSLAe2dumhQfCapfHlCVkojUB0wgKVJnNRtql/7DvIHEgE0QGNPgbnxLOuzd5
	sI+rIlb1UT6traVbAb2P42PqON2SE+Pu9482XL4E0HvqBHsq6Z32/cDt9fBEp6NhWEhM
	9G4IbkfammIXMYP5BsPJO2HWcIoDT71AcTqwlCAXdRxUdKNUxwFDI8xsyV0vYABrzxtD
	c7CdXqNZT4tmh/kGECMTQ1o9ROLg3zzvwgUEVaUEX9RUBtp/p+u3gke1AzpjZGUFPu4S
	pCc5ILcZ4gCQ28qjaakmbF2IBam7b8wDcto1ysoQHzZrVdBlxMLARU4gNMJOOHIg9yCu
	7a1g==
X-Received: by 10.68.240.10 with SMTP id vw10mr12400387pbc.210.1362847560812; 
	Sat, 09 Mar 2013 08:46:00 -0800 (PST)
Received: from sa-nc-apg-191.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id e7sm8529487pbm.10.2013.03.09.08.45.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 08:46:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
Date: Sat, 9 Mar 2013 08:45:58 -0800
Message-Id: <2A33D8D2-0F95-445D-82E8-934E01888CF2@gmail.com>
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
X-List-Received-Date: Sat, 09 Mar 2013 17:02:59 -0000
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


