Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGGvh-0001ud-S7
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 23:42:49 +0200
Received: by lagw12 with SMTP id w12so2394209lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2012 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=PgsuNPAxS7BcZXAXeLM2+BGN2tfgJX830WaC27xjOY0=;
	b=Qfnp+KSgYb8p8oRxK3ua2OHs/h5Cg7CnwTIsEtR5BWJ9/vxxk7p/YY3YU2yhKyfLG6
	n3qxbVDEMPcrMhBap4Kd4QaiEwe1GeoSI5Duz5NdF6Ut9ZZGrFOmtHxS5ovX6Br33gId
	Ry332I2NAMxWh6MLOEF1WzECWUvGkDxGgnp3Hv+YFvFBEepYbf9BZOKFRET03hEdEieZ
	qXnVfXPUs2+nENVNEFPD8d6wVUMwBTAUC6IXRY5kQZ2j2sl8LEGzv6TDWWGFKD2XvKjR
	yakG+iMNuFz8KqOwk7Rt/ADdG/fw2gdHY2IRnSohg/RbfSSC7FfGGFdFnCNJTkeBzBMb
	3Rjw==
Received: by 10.152.115.38 with SMTP id jl6mr10632941lab.24.1333748016390;
	Fri, 06 Apr 2012 14:33:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 6 Apr 2012 14:33:05 -0700 (PDT)
In-Reply-To: <20120406220702.3a710cad@eb-e6520>
References: <20120406142921.323c069d@eb-e6520>
	<20120406220702.3a710cad@eb-e6520>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Apr 2012 14:33:05 -0700
Message-ID: <CAMKF1sr2rDgCbuRpPH9Xw+xLK53OF8=ZCbTo0orP5r9Sf=KZeg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: toolchain-layer -> ld: error: cannot find -lm
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
X-List-Received-Date: Fri, 06 Apr 2012 21:42:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 6, 2012 at 1:07 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> gnueabi/4.6.4/ld: error: cannot find -lm
>> (compressed log.do_compile attached)
>>
>> The host is a Fedora 16 x86_64.
>> The problem was also reproduced on a Ubuntu 11.10 x86_64 and with a qemu=
arm target.
>> I don't seem to reproduce the problem without the toolchain-layer.
>>
>> Do you have any idea of what could be wrong here ?
>>
> FWIW : adding meta-angstrom and using angstrom-bleeding doens't exhibit
> the problem so I assume I miss something in the configuration when I
> only have oe-core + meta-oe
>
> Eric

what are your distro settings ? especially show me the content of
DISTRO_FEATURES and DISTRO_FEATURES_LIBC variables


