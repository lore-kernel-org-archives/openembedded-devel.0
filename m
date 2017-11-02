Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 94EC1782EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 17:07:00 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id q1so191754ywh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i0Tm1v0SaddUJ+ZiIK/yHJlUHzVxVvMpaxCH6NmKL7I=;
	b=S6FzPtD5gSn2yrtCp8VCxdyl89MvONl9j5e1Ua/Qp3IXIAwa6J6mk5IWmANCZYtvfI
	C7UaZKr2A7tG3IZ1TK7eTRZCjVM1PPE7kDcrpMj/zDq9KtmPTqluo88I+/nq1ceQIEI0
	IwVb/xwWKiSGl9Pl6AUQ804cUXsdxohcRvpVQWdbka4xKvliqyITrOnxgSdiECu0AkWv
	SV33/USUiLKOiry+W7xCoMsinC7QkPgpxh1JXdz9Bm43bYXs1I49dyWTIj/6tzU8O4j6
	itmuQo44WO6/quGn4DsICJMY7lBIaiAh+B3bbJYDcrBBBM96VHQWtDy5N0/vANa4cKwh
	cmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i0Tm1v0SaddUJ+ZiIK/yHJlUHzVxVvMpaxCH6NmKL7I=;
	b=Wo4a0NLZpzM0E8ZOaCdgIV0OWPpVooVQzmm62P5/gIymyWhMnqZIrhmz1zhaYmL7U2
	N29blPiCGrYLyh8EUDxpVPBcOFGX7Lv6prVRCDhvlUz+BwukXIxvLdVNllk6aES29sfG
	CwEFs1ABGQI8eRuDOcRrFibdiTSpbwLFbCJxsztci6f2k3FxQTIUZcXBEIkgx4w3x+sb
	4SRzt6MdB+SVarncs42SgHPrskDgP5VXBodFIU995H18KO685wAg2TqTH0JN9HZlWWw6
	WG6qGqsISILMn9OW9sXRhyV8O/LBFC0xUcM9pCtGZQh4qrSpEhiJaDpLXFbU80J0W7t2
	fvxw==
X-Gm-Message-State: AMCzsaWCydiCe81Gs3yHew4AXzFajwmUqBGHaubL0VBxDN6Ny3xv7/xs
	ElPS5nHualBvhbtL+xqnrM8tKnXaqbgP7xn9myQ=
X-Google-Smtp-Source: ABhQp+RP82jwM3IwOvLt4l20t2nrBEJnf9iEPwJl7qcYo7SlbCpQXNvApTct5XVn8BzxluvkFZAmnSXo2/ZaiA/OKN8=
X-Received: by 10.37.42.84 with SMTP id q81mr2613099ybq.515.1509642421372;
	Thu, 02 Nov 2017 10:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.83.2 with HTTP; Thu, 2 Nov 2017 10:07:00 -0700 (PDT)
In-Reply-To: <CALbNGRRrpSkAy8vkVQ33P-ONLdWqXnT_Oa1tViORfBx2R_Wjbw@mail.gmail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
	<20171102103129.3703-2-schnitzeltony@googlemail.com>
	<CAMKF1spbF2bJDQK_htfwpEKRgh1MzZEpkxpyde1x1dfoaqNYhw@mail.gmail.com>
	<CALbNGRRrpSkAy8vkVQ33P-ONLdWqXnT_Oa1tViORfBx2R_Wjbw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 2 Nov 2017 18:07:00 +0100
Message-ID: <CALbNGRSy0-Y=oLGbR+ON0jSitnEzkyMJevYtMhf--1+i-p7JhA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/10] tumbler: make thumbnails work again
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
X-List-Received-Date: Thu, 02 Nov 2017 17:07:00 -0000
Content-Type: text/plain; charset="UTF-8"

>  PACKAGECONFIG[gstreamer-thumbnailer] = "--enable-gstreamer-thumbnaile
r,--disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"

> >
>> > +do_install_appen() {
>>
>> typo
>>
>> Thanks and LOL: In this way this patch does simply nothing and I could
> swear having tested it. @Martin: Can you please ignore this one until I
> checked and come back with V2 (if really necessary).
>
> I checked: This patch (created on April 4th) was a leftover and does not
make sense: Link is created properly / thumbs work fine.

Thanks Khem for eagle eye :)

Andreas

