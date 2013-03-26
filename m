Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UKNBC-0001oT-Bt
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 07:16:20 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so3547927daj.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=h9LnsJWxyobIRbhoP1v9ZtrQ5a7BCMSHAJ8Emoxn68E=;
	b=tYH5WnsWsAw8dbBj/JQ0kJ58aTfH74KAFht+VDByW0j67AHZrdygOXs1WHmPiu07u6
	iaFN637WWTcfLRlN0SUj5gYQiTOTxNcBGObOZt99hK6hsCe+0utwj4mnpw2qJZ6cNsU7
	UmIIhQo4bdhCDFamoO//RfeioM4GdKuWiehhVGu4v75PcG/PhrvL2AHC/gu8p6JKGQyo
	tWEImaQB4c0Y4VUOerDhaLCcIS7TgUi/gLLFQFP+3zU5sUicYuuh8fN6MkmjsSlHOwpk
	NeZhGJgOst64LkIN3ZOuERuGTeQIRuCIfTx7oA/nCEO/CF6W9q1aNV5JgPkyDiS7YTAY
	l6OQ==
X-Received: by 10.68.231.42 with SMTP id td10mr21344731pbc.174.1364277558464; 
	Mon, 25 Mar 2013 22:59:18 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id f4sm16212190pbc.6.2013.03.25.22.59.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 22:59:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1364203235-2737-1-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Mon, 25 Mar 2013 22:59:15 -0700
Message-Id: <01AB5E40-2C26-4250-BB86-20A74683FBC4@gmail.com>
References: <1364203235-2737-1-git-send-email-marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [PATCH] tbb: add 4.1 20130116 version (4.1 update 2)
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
X-List-Received-Date: Tue, 26 Mar 2013 06:16:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 25, 2013, at 2:20 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> +do_compile() {
> +    oe_runmake compiler=3Dgcc arch=3D${HOST_ARCH} =
runtime=3Dcc4.7_libc2.17_kernel3.8 tbb tbbmalloc
> +}


hmmm do you have to encode the tools versions like that, say in future =
we move to gcc 4.8 or kernel 3.9
will this need adjusting too ?=


