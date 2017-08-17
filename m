Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id DAC9A783E7
	for <openembedded-devel@openembedded.org>;
	Thu, 17 Aug 2017 11:08:34 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id j189so21136601vka.0
	for <openembedded-devel@openembedded.org>;
	Thu, 17 Aug 2017 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kbhJB7FgjxkESjlZormlwJE2fBQLaPImJ2CwBWa9DDk=;
	b=XckA1abpmZ2Iy2tDW3Ef3rU04RC34lPa4pMgU2DMqTpq2+ZluJGGWSlWm/Vc/woPQU
	UUp1MnWBZgw/2YmPBGaCLHe373eW0IODatC1cUnCCQtxTHLdT9s1Q3SqSWJcas1TSbPJ
	n/BXVq4bIndxiXo+PoNMLOAeYpUaaYMdLdvkL/jtGwZ2JtX6DlxSJYk0u64+P05Cee3g
	ZUxaioi2iBPKO0+SBAZrDREFEMUwNt801HhUfy3NZYPR/IlDf8+JaU2QO+SrE07ygsgO
	8PAMIChphZT1oI0ArYdhAdx+bR9eZOLSK7ZOBB3bw7JSLIsM6iu6o2e1p9n7HUmkEHpp
	G9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kbhJB7FgjxkESjlZormlwJE2fBQLaPImJ2CwBWa9DDk=;
	b=RBvcBsVVPBC1CJMaLaQKAjE8K9VcrsWcRejTn6zEw/gW7E0u1nE2HF95tPqLLRVB8p
	JFfOH4/qBK3EiCQzRs0f9rc90d/Lmcue1MFQFUq5eGEtVrcA5FQkPqzYrHInsUMQPkRo
	yszR6/KQcVcoMRbJbGvy+cSMszFCONhSEY8HTlsrrkx29LJAJsn6NOVzTuxlLBtJ6EKv
	NmEnPdU7hSssD8yG9PnSo5NDaFC4VNqWaeiA/70iRhd9On5804eLmBkZ9tn4ltIqtCl9
	MyecYGzNS2cmwFDMKX1/72CZcxTHP12UY1oUIu5yWDWkH1HkeSzqPAo+o1U8toqHcf3T
	RZxg==
X-Gm-Message-State: AHYfb5h0CljsbYiUb8gi8vQ1bd2lnJINeDG+e1d0VL4b+g9A9BKm+TRg
	KJ8HOp3WuVs5qZYLN/ULgHokVUraNQ==
X-Received: by 10.31.156.135 with SMTP id f129mr3098319vke.90.1502968114814;
	Thu, 17 Aug 2017 04:08:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 17 Aug 2017 04:08:34 -0700 (PDT)
In-Reply-To: <CAJgxT3_abFJom8rGYkavgwL7w2nYLBT7vdV3MK5O6LS0Y2tRbg@mail.gmail.com>
References: <CAJgxT3_abFJom8rGYkavgwL7w2nYLBT7vdV3MK5O6LS0Y2tRbg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 17 Aug 2017 13:08:34 +0200
Message-ID: <CA+chaQfgD6EsxYuHZKySvwYb8GrxTq4mq0q8GHv3yuSkNyMFtw@mail.gmail.com>
To: Matt Hoosier <matt.hoosier@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: [meta-qt5] Pull request for 'qtbase: fix Krogoth build regression'
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
X-List-Received-Date: Thu, 17 Aug 2017 11:08:35 -0000
Content-Type: text/plain; charset="UTF-8"

We don't do github pull requests, send the change to ML with git send-email
as described in README, so that it's picked up by patchwork.

On Wed, Aug 16, 2017 at 11:45 PM, Matt Hoosier <matt.hoosier@gmail.com>
wrote:

> https://github.com/meta-qt5/meta-qt5/pull/62
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

