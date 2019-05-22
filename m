Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 494316B96C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 20:14:28 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y42so4013631qtk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 13:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VYzLEtuIqWrR+/vFfBXCbNdRFocy/n0rbigbdjvVeYw=;
	b=YbstxXdFA1Kz9KNA3ASZWCyBr7DoEEZLZtAnUXt57mrAkErsk10AGiOZCksTj2WWht
	WXUp7lAtR/YZRe7MZzIFXHDzZqwNDWc9AcJuNgcCs9/0uDaMsMmDLYN56Xt9jwYsO/k2
	pYAFk62uZ2qgfe8y95lDSPqWjAfjso4TJ2/mg/2p0VcgTbEkTqnzJ+fPaKmy+KWrbdao
	lN5d9+i7BAFFsL7Cn7PxI/JeUwhNJDJM1GftnO8BtT7DXc6INAW8o1drRV0Qf+0TC3hR
	M3Z7A9wHzDcoQwlx7qCGCd4c3dwkIdBK2CvK2XOB4kBArb8r3PwPdVqAkyBjtyGG7bFL
	xSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VYzLEtuIqWrR+/vFfBXCbNdRFocy/n0rbigbdjvVeYw=;
	b=ectzBEer293szvFkkFMJLbdAzxXhJ+fKm4MNRU5m7ALtTdZ9DP4LHllkqBKr6p0Pzj
	4UskvsWUyqosgbbiiKJLz3fHxL77KuO5gYru/kPavMyxHWGHm1SH5iUKp2E2UJKFiIcz
	vZtiRtDrXTk6qsQS9DfMFM+wpdPedbcvvZBuGhoKGfvZDyL5fsP2xsgg11qlyho1oBa8
	Wo3vo52nuV/lLPSgr55qpHtk0373qX/UZ+mGe9xeDklOHDIaG+2bDVqdhoPYysdVjxZt
	alnYaWbRbF2bw5Tm2uh8ND9gcCr+M93I0UP/Yq835xqed07+8yOK6lyVZKKDkk+ruGR9
	qmzA==
X-Gm-Message-State: APjAAAWWWUbsSPYjcO7a2qLSdv52sYEn6dKZaU12qwhzZms/pLWc57Qj
	PN4S9tZWOBK9+0a9rhcfSKkWMe0TxiwFNoAXFkY=
X-Google-Smtp-Source: APXvYqz4F3tb3s+dFS7CaH0BOWCnYtRf4jdm5dE4B6pFnOl7BMzrNPEV4rGi2QmMrKMhaFRrm4ACAvro19QcWiIeLgM=
X-Received: by 2002:aed:23a8:: with SMTP id j37mr38074032qtc.53.1558556068974; 
	Wed, 22 May 2019 13:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.6750B23534D@git.openembedded.org>
	<CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
In-Reply-To: <CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2019 13:14:02 -0700
Message-ID: <CAMKF1sqMxN5ic=X8n5yVPct_8DmUCPDCoKxmy9kMVbvYdBQWGg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 02/09: mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 20:14:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 12:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> >
> > This is an automated email from the git hooks/post-receive script.
> >
> > khem pushed a commit to branch master-next
> > in repository meta-openembedded.
> >
> > commit 8587370567e7f2f398ae1efa77989b1110d15a77
> > Author: Khem Raj <raj.khem@gmail.com>
> > AuthorDate: Tue May 21 23:27:16 2019 -0700
> >
> >     mozjs: Upgrade to version 60.x
> >
> Haven't found this on mailing list so:
>
> I ve done similar here and I saw that
>
> * musl patch can go (tested)
> * polkit needs update - current version requires mozjs 52.x (shall I
> send the patch I have already?)
>

Please do. I am currently trying to upgrade polkit to 0.116 which
should work with
spidermonkey 60.x so if you have patches please send, I would be happy
to give them a shot.

> Andreas

