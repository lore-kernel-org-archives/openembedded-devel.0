Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id E845073994
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 21:02:55 +0000 (UTC)
Received: by pdjy10 with SMTP id y10so27797349pdj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=kWiPnZ0/HafVWIXTeF2SR+WCT3eI0aTfzFRUfFzd/gA=;
	b=hWC/2NX/BvgK5QJp2NI4EUrAeKn9FcwnbgxoIMFJJBEDG8k5BvBTkMVkJ5OnnDByHC
	Acmn05RrkenB9epj1jKyWmTizmWtvnExN2CSjXDBrycTvlruGEHZqIE/lOgxnlk8RnY9
	+t1DiqeT0RCWW1xo0OIO1X+qsRo7ZbAEFzB4itj0QDSJ6aWIZz8qjcjSKglgK6XA/nt8
	USyjY1KkhAemhRvAkE2WBd7NafmxQuGtlef0sGyIxSojNw5xorrqCaqWLzl9VMNe4woq
	D2Q/EO0RRKUp4oRcsgAjR6cYeQ3uRx0IJSD9DuvTsNLbCnWWV9QUzTsTJf9beO2OB+4b
	sVJg==
X-Received: by 10.70.131.227 with SMTP id op3mr16903820pdb.12.1425934976741;
	Mon, 09 Mar 2015 14:02:56 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:489f:26b4:52a3:63c4?
	([2601:9:3580:84c:489f:26b4:52a3:63c4])
	by mx.google.com with ESMTPSA id n4sm20719053pdl.12.2015.03.09.14.02.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 14:02:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1425934664-14174-1-git-send-email-victor.rodriguez.bahena@intel.com>
Date: Mon, 9 Mar 2015 14:02:54 -0700
Message-Id: <02D93F92-159E-49EA-994E-3F82E6E3A955@gmail.com>
References: <1425934664-14174-1-git-send-email-victor.rodriguez.bahena@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Subject: Re: [meta-oe][PATCH 1/2] Add mpich support
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
X-List-Received-Date: Mon, 09 Mar 2015 21:02:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Mar 9, 2015, at 1:57 PM, Victor Rodriguez =
<victor.rodriguez.bahena@intel.com> wrote:
>=20
> +do_configure_prepend() {
> +    autoreconf --verbose --install --force -I . -I confdb/ -I maint/
> +    oe_runconf
> +    exit
> +}

Can this be replaced with EXTRA_AUTORECONF +=3D =E2=80=9C=E2=80=9D =
mentioning any extra options you added above to autoreconf


