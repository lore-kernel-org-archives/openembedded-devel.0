Received: from mail-pd0-f169.google.com ([209.85.192.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIJqE-0003Ef-FK
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 15:18:13 +0100
Received: by mail-pd0-f169.google.com with SMTP id 3so630431pdj.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vtYdhFC0WPTX8MFC6lempCePnBh9lF3SFXMGrUS319Y=;
	b=m2oka9QNvXaHUK5mr1iaGezYda6HeSmQ6O1KFnfuy9YexM+Pi8rzUrqICjJhI/IDo/
	zwFcFZ2s5BnN0d7kANULXPuqsJaQkljXih5uCN5TXtl3qQL+nT5E0DwLaI2gSA0MZ5Mv
	HMGUUzpr8fHbEJSU8XU5yS0aH5W9e7ayi+w+tl+rZytxiw9ZtR32wEmAyzmnE3fH+dJE
	24guJZxCtSsihKLpPj1/1oRL4X4PmzB474bO4lKElruBVfSt5hRwBA2oFxNPUE8+eUrc
	j23bZZ63xlftLDkjQnVnBEiGkDEuXUeAH+Q4yCk7qKDUzeTuhnwySCiNL5zxniCKj3pv
	PdaA==
X-Received: by 10.68.220.68 with SMTP id pu4mr9162542pbc.26.1363788078842;
	Wed, 20 Mar 2013 07:01:18 -0700 (PDT)
Received: from sa-nc-ipg-172-23-0-104.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id 1sm2224841pba.32.2013.03.20.07.01.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 07:01:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51497DC8.5090006@linaro.org>
Date: Wed, 20 Mar 2013 07:01:16 -0700
Message-Id: <67231472-D70C-4E30-B790-44F6755B507B@gmail.com>
References: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
	<51497DC8.5090006@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 14:18:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 20, 2013, at 2:13 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> W dniu 20.03.2013 09:51, Khem Raj pisze:
>> ERROR: QA Issue:
>> =
/b/kraj/angstrom/sources/meta-kde/recipes-misc-support/cyrus-sasl_2.1.19.b=
b:
>> Variable pkg_postinst is set as not being package specific, please =
fix
>> this.
>=20
> meta-openembedded has 2.1.26 in meta-networking so meta-kde copy =
should
> be removed.


earlier there was a case when meta-kde aimed to build without meta-oe or =
meta-networking. I will leave it to meta-kde maintainer
weather to depend  on meta-oe or not.

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



