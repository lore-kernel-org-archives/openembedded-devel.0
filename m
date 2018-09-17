Return-Path: <andre.draszik@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC147947E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 14:12:47 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id r37-v6so15403411qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 07:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=DJIyLAjqIJIkaMVTsLQMjqZmGJIz5CgnreqhauPyVXE=;
	b=j9dtIK/f+CRm4sAK4FkcI5a0tbZApKQEygZNsu1CMdr/DuUNSraFwz8T7mCMkSyDNq
	5B/T9lonLlppCMrQrqqexF7IbfzZ3dojadCVtakW0nMKK92JYfm75kyDUd0vqFSdGDUX
	eHfyH9gQdz+7e+viDXD02g9+Q2iSLkvchKN6QTFmQYpiuJss1ubEacPp55jbq0yhCMRs
	wOqwKN9DHdyorYAmnn1fHLT06T30os9GLXcPN8/AEi51XAsfvQCuyz7CHxx7CIkEgTpt
	to6CfPms4l04djLcwSf2ux2expM0qeEAKxwMyvuRa9k2OkzJR2HQjjiyBPiaAalNYdlN
	Ke0g==
X-Gm-Message-State: APzg51Bhuf0nxuwR02276A71oKJaLYEpstFmryNLpe3i81UdLWmS909d
	BDl3alJuXaZPS3LovkNT+Ko=
X-Google-Smtp-Source: ANB0Vdb/tC8Iqea3j6EvemSIlhVmJ/nifkhg+uChHb9HjWDe0ehc2wUDATGnLUXT76uB/3koiKOvRg==
X-Received: by 2002:a0c:d067:: with SMTP id
	d36-v6mr18131722qvh.216.1537193568646; 
	Mon, 17 Sep 2018 07:12:48 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	b16-v6sm10000088qkj.76.2018.09.17.07.12.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Sep 2018 07:12:48 -0700 (PDT)
Message-ID: <2d07894a425ab1bfef5b31c3bedeff02e2128231.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Leitner <richard.leitner@skidata.com>
Date: Mon, 17 Sep 2018 15:12:46 +0100
In-Reply-To: <582dad2a-73ae-4f23-33ca-8468464380bb@skidata.com>
References: <1536317071-17077-1-git-send-email-yevgenyp@pointgrab.com>
	<582dad2a-73ae-4f23-33ca-8468464380bb@skidata.com>
User-Agent: Evolution 3.30.0-1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8, openjre-8: Fix PROVIDES assignment
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
X-List-Received-Date: Mon, 17 Sep 2018 14:12:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Richard,

On Wed, 2018-09-12 at 08:57 +0200, Richard Leitner wrote:
> Hi,
> this is a note to let you know that I've just added this patch to the
> master-next branch of the meta-java repository at
> 	git://git.yoctoproject.org/meta-java
> 
> As soon as it has gone through some more testing it will likely be
> merged to the master branch.
> 
> If you have any questions, please let me know.

I'd say please remove this patch from the queue.

Thanks,
Andre'

> 
> regards;Richard.L
> 
> On 9/7/18 12:44 PM, Yevgeny Popovych wrote:
> > PROVIDES is a recipe-specific variable, not package-specific like
> > RPROVIDES.
> > This bug would prevent you from having recipes DEPEND on java2-runtime
> > or java2-vm (assuming you have set PREFERRED_PROVIDER correctly).
> > 
> > Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>


