Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPeQ4-00042R-A0
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 20:36:56 +0200
Received: by eekc1 with SMTP id c1so264100eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 11:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=3MFObLwzNSFz9xaSnOKEIbKC2Aas8O2xuf+j76S4TI8=;
	b=dojRgVhwaMVj04xoUUw0+wBm6PHvmIqy+dUp39HrrjTDDVipM+fShGKi51/Y5/WZBG
	1yBliWF+lxBViya9yomGfrOr8a7HYkiCPO+3P/79VdtYuqht3It4v+FSIPHUD4ZE6Bzv
	NM4PelpI63zX6NXTAFQ/4lnsJTdZtTaZZfm2wLwbvXAVFfGTzYjgeLyl5Ru00iWXys3L
	+d+MotyfJhBZIbVWDf90u+ENy54sbZL2K9F5KGzYur5ZPNmV6vDJNl80W1MNC1ld3j/H
	ejW45+jbAxuegVw6m7Zf5lHzUzT1dDVWJb4wp6YN3/oGhqDC2JfEGLh3oTBMxBxPp72p
	oucQ==
Received: by 10.14.119.197 with SMTP id n45mr213600eeh.46.1335983231710;
	Wed, 02 May 2012 11:27:11 -0700 (PDT)
Received: from [10.26.19.134] ([84.241.197.48])
	by mx.google.com with ESMTPS id n56sm12991119eeb.4.2012.05.02.11.27.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 11:27:10 -0700 (PDT)
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-4-git-send-email-koen@dominion.thruhere.net>
	<20120502095150.GA3682@jama.jama.net>
	<CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
In-Reply-To: <CAMKF1spM9urWo1VBXG=qdWOcC_5_2kw-vBGqWv3Lg0xBPWiADA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <788719CB-F74E-4219-85AC-82BE71D2068F@dominion.thruhere.net>
X-Mailer: iPhone Mail (9B179)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 2 May 2012 20:26:49 +0200
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQm9xGIchzEK4d5qDJnKSbXb7cHMKSbdFwNOMlNmL3QRO3++5N2SypYYbYY8z5HNlD5QdfF4
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/denzil][PATCH 4/6] gcc-4.5: Match with OE-Core on building procedure for libgcc and gcc-runtime
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
X-List-Received-Date: Wed, 02 May 2012 18:36:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 2 mei 2012 om 20:14 heeft Khem Raj <raj.khem@gmail.com> het volgende gesc=
hreven:

> On Wed, May 2, 2012 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>>=20
>> I'm not using gcc-4.5, but aren't those 3 patches only for master? As
>> gcc-4.7 and other gcc changes were in oe-core only after release AFAIK.
>>=20
>=20
> Yes they are strictly for master to accomodate basic changes in build sequ=
ence
> we did for gcc 4.7 that said, I think now that denzil has released we shou=
ld
> reconsider maintaining gcc 4.5 in toolchain-layer and same goes for other
> recipes in the layer. Infact I feel the whole layer can be dropped.

I was planning to propose the same, any objections?=


