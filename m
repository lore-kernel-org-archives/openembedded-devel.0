Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id BEF1B74C97
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 18:05:16 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id i12-v6so9173733oik.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=FE523QEk/JcEhfvdZ5VUwsCdbiiN30hdHXzvWPnm+7Q=;
	b=WtD2AgIwidEJPSXMb+9b0dke1Ym/mcFUH6xcxho6HvMUbPjvaIWWuxTnstUrEp7lK+
	bSbBhUF9nKWjpIH+bRUWa5FQ68PQn8sirnxaxJcXK5hgck5jEBXfiR+R91ZaIjtaoTid
	o/up/WurQo+52etwJKvdCGK+YFIH/l9OjF680rlroaRxUOKF5J+Zymeh//odSvV8kH2U
	yig0fRyedkQVSpL13sRnh4xgFEuok936qYvzeg9XG/nz6UoBkqo//drRsBw3ZTiA5Dy8
	L0bWQiHJ/dKgLJuCnn4v3ItCWGe9prMYGYebnoE+XGcjponEEux67O8z+pho9wAthAir
	cmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=FE523QEk/JcEhfvdZ5VUwsCdbiiN30hdHXzvWPnm+7Q=;
	b=OD2AAbhGxnf6gKQrl+UrSRRBul7Af3rFbEarRPgXtpx5kv90klAYaMyRX2T2qcykxW
	MvHaf1ZN8FWBI3GvO5z2oTEXP3F8lp1JPATBClb3WKKPF0U88UPUhobQ2IQJ98ASlTCS
	WRMnsyQgd5BViNLmv1xmrFcknk3vVCNlrQQFwQBT6p5oRHxOfdjwc4blDP/xKucqPxUN
	Mqmz/6oVx1kUd12TkDmbWYlRvB3O+UZLrHCP7wCUctgJTnZt87PqJpDL8bq2l7lkGq0G
	3/i13DELIUzZIEyqpP/ex1Ii1zrnAcdQjmY+veIK5l8eBIHk29ENscf/4OuMky8lyAB5
	9qkw==
X-Gm-Message-State: AOUpUlHmH6sL67AAAUvKBFTwKcHicQSz78eNWW2PBQ4jExUBColKhnKR
	osTIZuBsDSrLWrlVi9MVp8JDhInz1yg5MQ==
X-Google-Smtp-Source: AAOMgpfBf2uVgujvC121wJRblPifGfO2sn1bWyK0/iaiUdrWqdhFtTN7x12COh+qEEOdckVDF061IA==
X-Received: by 2002:a54:4d82:: with SMTP id y2-v6mr4566608oix.25.1532455517214;
	Tue, 24 Jul 2018 11:05:17 -0700 (PDT)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	f4-v6sm7046484oic.52.2018.07.24.11.05.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:05:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id y207-v6so9120363oie.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 11:05:15 -0700 (PDT)
X-Received: by 2002:aca:f516:: with SMTP id
	t22-v6mr4566703oih.56.1532455515255; 
	Tue, 24 Jul 2018 11:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
	<CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
	<20180724152529.GA19585@mail.itconsulting-heinold.de>
In-Reply-To: <20180724152529.GA19585@mail.itconsulting-heinold.de>
Date: Tue, 24 Jul 2018 19:05:02 +0100
X-Gmail-Original-Message-ID: <CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
Message-ID: <CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] bug-tracker
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
X-List-Received-Date: Tue, 24 Jul 2018 18:05:17 -0000
Content-Type: text/plain; charset="UTF-8"

Em ter, 24 de jul de 2018 16:25, Henning Heinold <
henning@itconsulting-heinold.de> escreveu:

> On Tue, Jul 24, 2018 at 08:55:34AM +0100, Otavio Salvador wrote:
> > Em ter, 24 de jul de 2018 08:33, Richard Leitner <
> > richard.leitner@skidata.com> escreveu:
> >
> > > Hi,
> > > finally I have another question regarding the meta-java layer :-)
> > >
> > > Do we have some kind of bug-tracker?
> > >
> > > If no: I would really love to see one for meta-java.
> > > What are our possibilities here? YP Bugzilla? GitHub? others?
> > >
> > > What do you think?
> > >
> >
> > We recently passed the review process of meta-qt5 to github and it has
> been
> > much better this using the patchwork.
> >
> > Maybe we could consider the possibility of moving meta-java there and
> make
> > the yp.org a mirror so we use the issues, PR and all resources it offers
> > (Travis as well).
>
> The question is under which github space that should happen and who has
> the control over it.
>

We can make a organization as we did for qt5 or it might be under OSSystems
umbrella.

>
> Bye Henning
>

