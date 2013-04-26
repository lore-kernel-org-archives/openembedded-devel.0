Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UVd8c-0007AS-D3
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 09:32:10 +0200
Received: by mail-pa0-f45.google.com with SMTP id lf10so2346189pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 00:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=LzCpgBMmOFCQOza3n3moYVkXaJslCsCfTd3yO+zvJAM=;
	b=PmPI0EG7Mj1RmNAeBucPD0ylTAklDFCE2PtWUl0VLvB2gC2GDxQsDRtEweRUFdCbvl
	h4+XiOxoQ+EkJaTIW6eBTWBkSRsuKgxUPdfGuc59dVfuNnmnBNVK8y+oaf7CJk75tcHr
	vJ1yqNBuNAVqPfVyREvcDeyISjvVwbdiaElZRZIkcFWDYg6eEiYGo666SZSpzE4Vwvu/
	L4ATIB9Tj1LkAB5TL9O+oPlB5+p4Tkh0HKLv5J7hJgQxBV/Wty6sW957Yc2codPn9jk2
	fZv/XanfVCY3JvP6o4ddDMiW/kihPA4S42NkE1cMKETHIKp96zJAOuuJWwOIjA6+TumU
	6iQw==
X-Received: by 10.66.138.72 with SMTP id qo8mr29118513pab.172.1366960465349;
	Fri, 26 Apr 2013 00:14:25 -0700 (PDT)
Received: from sa-nc-common-173.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	wl5sm11527974pac.18.2013.04.26.00.14.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 00:14:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51706174.6070407@linaro.org>
Date: Fri, 26 Apr 2013 00:14:25 -0700
Message-Id: <27CEFBA8-7262-4449-B611-5E75B7F444AA@gmail.com>
References: <51706174.6070407@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: openldap and icu
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
X-List-Received-Date: Fri, 26 Apr 2013 07:32:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 18, 2013, at 2:11 PM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> dnl International Components for Unicode
> OL_ICU
> if test "$ol_icu" =3D no ; then
> 	AC_MSG_WARN([ICU not available])
> else
> 	ICU_LIBS=3D"$ol_icu"
> fi
> -----
>=20
> Now the question is: will we kill ICU dependency or will we add it =
into
> build dependencies?

force ice dependency using DEPENDS=


