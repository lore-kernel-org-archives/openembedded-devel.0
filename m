Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D67CA6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 00:01:59 +0000 (UTC)
Received: by pdbep18 with SMTP id ep18so14333904pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 17:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=o5qa+7mNiTLJNATjcIuppi07poWwirhGMjSTXsFnCZ8=;
	b=trTuZPaGtSuNbLjTqZ4xdp9jBLqZ7Mi9fTwVkeNBSYvPQzjoT9Yp4mAWxMZiZvD4gZ
	md298YfJf1dWd2xFbDYzl6gg10D2h7pc7GHno58Qq+lawmZbioFQ9RpgsKi5ByAqInV+
	lZKAh0+tAN0h7uFObLsySAgMBovPBifJcXDsI3BOuX1+67tSY/CoArcEWIADyRFMgWOA
	JyG9OMmP8RT4ThrJVeqzJCr17FmbnVK9mW5ujQUJbE94xnL0658WxSEdkvvBJrApMbdG
	/tv19XRVYu1T4VXjMpC0Y5cFzJew+RXLqOOitVsulHY7xlArGwa0ruEeiz8vd61uM7zF
	vl/g==
MIME-Version: 1.0
X-Received: by 10.68.229.200 with SMTP id ss8mr2241899pbc.150.1436918519596;
	Tue, 14 Jul 2015 17:01:59 -0700 (PDT)
Received: by 10.70.65.4 with HTTP; Tue, 14 Jul 2015 17:01:59 -0700 (PDT)
In-Reply-To: <1436586581-30085-1-git-send-email-akuster808@gmail.com>
References: <1436586581-30085-1-git-send-email-akuster808@gmail.com>
Date: Wed, 15 Jul 2015 02:01:59 +0200
Message-ID: <CALbNGRS_qRj-yN69A_0Ow7=4xvkTC31WN1YkNW6snZLqrJk0LA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: fix lib soname issue
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
X-List-Received-Date: Wed, 15 Jul 2015 00:02:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2015 at 5:49 AM, Armin Kuster <akuster808@gmail.com> wrote:
> polkit failed to build do to missing mozjs libs. The libs created are:
> libmozjs-..a   libmozjs-..so
>
> this was caused by a perl script error
> Can't use 'defined(@array)' (Maybe you should just omit the defined()?) a=
t config/milestone.pl line 58.
>
seeing this before starting fixing myself would have saved time..

Acked-By: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

