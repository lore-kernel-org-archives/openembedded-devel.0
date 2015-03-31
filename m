Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id BC790736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 01:40:24 +0000 (UTC)
Received: by patj18 with SMTP id j18so3568450pat.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 18:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=cVWAcMJyT/TIO2vA6c1fchd3FNyk95ctsmE2UplvI9M=;
	b=jWMPk16vVQCHQFQkQJEw17X/G/LCl0FDiZh8tTGn+GVU4amo4iGwcqnxn7GdnYU08X
	9CjeFFGlw0CX6YSUcrsoI0QDOxB3ef9N7cm4pR8K+EwRehDxKgOPxmnlc4ChAy9bwqGS
	L/jbtsYBmnGQPWRBKIiGGwhs6HlZUbKrmYsIV7fUl+i7uFQoUSEhA9iovyqwUh00xJSZ
	KR67aZezxoi0vwZ2cg+doipXok8lfSK0O2jTz/Am8AX+DTWF3YdOCHy27tOFxclyMTun
	CnevWbQUlQKNT1GySMLnmcGAYk3d9euEivlUxRTceYaSGV5Kdhq0KsPDsYga4ypOlai3
	J9nA==
X-Received: by 10.68.174.132 with SMTP id bs4mr63685046pbc.135.1427766025443; 
	Mon, 30 Mar 2015 18:40:25 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:4995:8e53:6540:74d8?
	([2601:9:3580:84c:4995:8e53:6540:74d8])
	by mx.google.com with ESMTPSA id
	dh3sm11972513pdb.69.2015.03.30.18.40.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Mar 2015 18:40:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKoLZAv_ae7vJQ1vL_UPTX_mS9t__42Uac7Nf-6ivnNvHg@mail.gmail.com>
Date: Mon, 30 Mar 2015 18:40:23 -0700
Message-Id: <3AB4D6A9-5462-4A7D-8C7F-0E7FDE38DD18@gmail.com>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
	<20150330202507.GA22676@mail.itconsulting-heinold.de>
	<CAP9ODKoLZAv_ae7vJQ1vL_UPTX_mS9t__42Uac7Nf-6ivnNvHg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
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
X-List-Received-Date: Tue, 31 Mar 2015 01:40:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 30, 2015, at 5:45 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> On Mon, Mar 30, 2015 at 5:25 PM, Henning Heinold
> <henning@itconsulting-heinold.de> wrote:
>> if I remember correctly, than the bdwgc inside cacao differs from =
upstream.
>=20

there must be a reason why cacao decided to fork its own copy. Do we =
know ?

> I didn't compare them but assuming this works fine I am fine with this
> change. It reduces build time and also fixes a conflicting binary
> installation.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


