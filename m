Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 103E47FAAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 01:40:54 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m16so3864167qki.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 17:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YxVdAEgBtHOFMF9YKvZRsoCtE8sRruTHwvqs4v8It28=;
	b=Nr1W2FaXZ6wb2wLRweWrraKYz0EKqA2zktJxASmnFTCx5s+WXlMwxI4cnK8WGhUN+l
	mCfkxBmq5sau+XloyEI5cu5jyWHFf8qHEfWVtxSXJSEgAUqGQZimHLDvLQD+B226ru0s
	pkxy9M0I41XFTGGo0iQ02UAmOwkEjGgvAALgVh4foOqJ6rk93EoXV7aV/n6m/+G1o+uW
	Q6TN6UvN4tz1W1TbV3LeXxywPw9DWdR+vsjmbkP9gpSCtdrtkKQ5sfAa36YeNpRICZQe
	kd1lgZJdGafrAz4mdZAMeF+GL1lDZ/S2Tn0I7T8Y2IvTnyuG0nuTLvvoDCqC0OvDqR6I
	RYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YxVdAEgBtHOFMF9YKvZRsoCtE8sRruTHwvqs4v8It28=;
	b=BL/7GKITpzH8dKmKkno5NcdiYWLIt5LbAheeOWbFz6y5ea5QUH+kEvLA/xwCsrcANv
	4cuv19Ng82+xaFwX8EVadT5RMLS1cvBq6J8NnRN5LTxSCr2Gcky11zPyAUtfhAjWRv7j
	rMwIYDtM0tpFYdmrNLI0xkjs20ZO4oGZBo3LWUrFo8cdrMufQKHNPr87MWJ49MvdabEk
	X/5F3VF+Ii9Q3BxHDMFvlmTr/lcu55XvEkjKw1YFbLN7AOzKtTUo28uuMISC7Mx820R+
	L+EH48d3GEY3RFjwCvDW2eAjHl45UBbZvVHs8wkd7f0FflMN2fyljfs32lv6z8JSjj9A
	8hWA==
X-Gm-Message-State: APjAAAUPMu6QSl6fjWco5Cjf1HFrGu52DhA6kDz5bCfeLocY7O/+1u48
	oKbqqXqMV3e9tRDlLDl3AQyoArgDNl1OCIjpIrE=
X-Google-Smtp-Source: APXvYqyh132aBKljonBW4Umo7QUNhmDjlpzsj2/Gu4W9OMJAkuikwI0tM3uAGE1J9JxcWOK7pDwdHIrwQ/3SXDDZzVQ=
X-Received: by 2002:a37:84b:: with SMTP id 72mr6435284qki.337.1573177255618;
	Thu, 07 Nov 2019 17:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
	<CALbNGRSyJYthd3zWWXfVBCzTNXhdNBA9K-MKAGFqHYVEuLNWYg@mail.gmail.com>
	<620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
In-Reply-To: <620c7105-97cf-0595-0c72-fb6bcc660348@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Nov 2019 17:40:29 -0800
Message-ID: <CAMKF1spQOVXGcitE__xXrfB1G54tEqau4JEaVXW4xEiBo521nw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/8] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Fri, 08 Nov 2019 01:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2019 at 1:30 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> On 11/6/19 5:07 PM, Andreas M=C3=BCller wrote:
> > On Wed, Nov 6, 2019 at 8:59 AM Hongxu Jia <hongxu.jia@windriver.com> wr=
ote:
> >> Python 2.7 is no longer supported. The 5.0.0 release will be the last
> >> version targeting Python 2.7. [1]
> >>
> >> [1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292=
c18cf5283de4fdc3e13e56f7
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > * Version going backwards
> > * Such a patch at times python2 is eol - really?
>
> All these patches just make python2 module work.
>
> Should we clarify that we do not support python2? If yes, we could clean
> up them.

as long as we have python2 in OE-core, IMO we should not drop the support.

>
> In this case, if we do not support python2 more-itertools, we should also
>
> clean up these python2 recipes (python-pytest,python-pluggy,python-zipp)
>
> that runtime depends on more-itertools.
>
>
> As above upstream commits [1] said, the old version 5.0.0 is the last
> version
>
> to support python2. Two choice: going backwards or cleaning up, it is
> impossible
>
> to patch latest more-itertools to support python2

this recipe was just added in last release ( zeus ) so I think its
fine to downgrade
since I dont think we have folks with feeds from previous releases
that will have to
maintain upgradable feeds.

But I think we should also apply these changes to zeus more importantly.

>
>
> //Hongxu
>
> > Andreas
>
>

