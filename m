Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id B0F8D78869
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 09:00:26 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z74-v6so954473qkb.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 02:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XzBt6WawvNYKSc5bJB9AQFH7P9G8KVmhoHJFVjmEdlU=;
	b=HYGc+XdT/ZAhk4pytbYAuK/1zHe+gR5wKr3Pdxk66CuZigzcRgPoQhVlAZR1RBhAx3
	tOymrzRrvsU0GOKDpPv2WDCdA6LpaRrmUMc7zEZ5AZpn2/YJN6+7GIbDQVPmKmUh1qXp
	eRpf/pk/40WQqre3+NWtkkam2nXEm163+cfLUC+PZ0wApuLU8YOVtCF6mDHhpBGvPTp0
	Tzuq6G6RYQtbXKCvVDMMr+3BJIQvBQwyzBYzKty8vctXP7ID35DLNOeKIousodjCUUZl
	x5fgHpYLrMmftpwfCb3A/r8Vz6pCmZ/h754IDXbPGhv34jsw92Y9qDUVJ3yA1eeKH6SJ
	VYwg==
X-Gm-Message-State: AOUpUlGcErvCP/Y59cywnJL9rGNNxivbgG5FSDRDOmMUFxPMdV6NhVAf
	zrgIsNDPTOSMlFPZjmAh2OZE5ZtI
X-Google-Smtp-Source: AA+uWPyA0Lo7A+ZavdLOonAfDPOjBSNj0K31+r9FLelK8kG1b3PynnNgITWLWwE1NwVq/44vxmafTw==
X-Received: by 2002:a37:b445:: with SMTP id
	d66-v6mr1553015qkf.357.1533718827472; 
	Wed, 08 Aug 2018 02:00:27 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o68-v6sm2130528qkf.9.2018.08.08.02.00.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Aug 2018 02:00:26 -0700 (PDT)
Message-ID: <45f8db3f198dfefc9e9c437457f24a6ba82d92ac.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>, 
	openembedded-devel@lists.openembedded.org
Date: Wed, 08 Aug 2018 10:00:23 +0100
In-Reply-To: <902bc2a0-067b-fb87-efd3-66ff587e80b3@skidata.com>
References: <20180802144523.28023-1-andreas.obergschwandtner@skidata.com>
	<44106c2a8fb083e5ad989a46c03cc5bbc996b754.camel@andred.net>
	<902bc2a0-067b-fb87-efd3-66ff587e80b3@skidata.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [meta-java][PATCH 1/2] classes:java: move version_specific_cflags to java.bbclass
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
X-List-Received-Date: Wed, 08 Aug 2018 09:00:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 2018-08-06 at 08:31 +0200, Richard Leitner wrote:
> On 08/04/2018 11:53 AM, André Draszik wrote:
> > On Thu, 2018-08-02 at 16:45 +0200, Andreas Obergschwandtner wrote:
> > > moved version_specific_cflags from openjfdk-8-common.inc to
> > > java.bbclass
> > > and
> > > renamed it to java_version_specific_cflags because it will be used for
> > > a
> > > fix
> > > in icedtea7
> > 
> > Does it really make sense to have openjdk / icedtea specific flags in a
> > generic java class in a function with a generic name as is
> > java_version_specific_cflags?
> 
> As far as I understood this patch the specific GCC flags are in the
> openjdk/icedtea recipe (those FLAGS_GCCx which are appended to C(XX)FLAGS
> using the java_version_specific_cflags function).
> 
> Therefore I think the function itself is not bound to any recipe at all as
> it only checks if the flags should be set for the used GCC version.
> 
> Nonetheless a improvement which would make sense IMHO is:
>  a) either getting the fact it's for GCC-only inside the function name or
>     make it work for all supported compilers
>  b) maybe move it to oe-core or meta-oe as it might be useful also for
>     other recipes (beside java).
> 
> What do you think about it?

OK, fair enough, the commit message subject is mentioning
version_specific_cflags, and I didn't read the actual patch carefully
enough.

Still, this patch places things related to *compiling* Java itself into a
class (java.bbclass) that is meant to be used by recipes building/installing
java sources judging by the class' name.

> Maybe it would be better to create a new class for these things instead?
> 
> As mentioned above, I don't think it is openjdk/icedtea specific...
> Basically it's not even java specific. IMHO it's a plain helper function
> for GCC flags which are not supported in older releases of GCC. So maybe
> there's really a better place to be in for this function. Any ideas?

In this specific case, it's a patch against master, and it's for GCC >= 6.
Are compilers not supporting -fno-lifetime-dse -fno-delete-null-pointer-
checks (gcc 5?) even still supported by everything on master? Would it make
sense to add -fno-lifetime-dse -fno-delete-null-pointer-checks to CFLAGS
CXXFLAGS unconditionally instead?


Cheers,
Andre'


