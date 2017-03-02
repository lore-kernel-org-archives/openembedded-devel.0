Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 935F67760A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 20:48:31 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id g10so61092132wrg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 12:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJEzq02wYzng0XVkLZErkjeXpsiIguQuO3BsXCb7FRc=;
	b=A5wGniS4EqgM023wFtnnTzTqqr5kH30GHS+0dNWJk9+m2VCMLjkPK/Q/yZu1OJwQZF
	AJf9Y5NKe16mKLLCQGtlfFann1SuoVZ2HCPyC+HJ/kHPZqKcjbRDlP7TqU5WeW97loaD
	pZ+X8sw6P2rr0PqbXGbTIHc1P4kljW0CDJCwg1fMFyh06nkEPz4yskl71E8eTfUNwPOi
	mXkPU4GOuXqR9NRC3Ogm/MnWkmg4RNCrkJL9k3GHZaQG2YoUi8HrbajRNoNpVSvyTqJF
	yvx61Sblw7nFmgJNrRuCh2wC2UBXAVMIlWkdajnMcTHkuRF846/xnYCKmZ8xMeY82pG9
	RakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJEzq02wYzng0XVkLZErkjeXpsiIguQuO3BsXCb7FRc=;
	b=tTSvfWhOd2qOJYXSrLvBBeJlg4rWOzEz/ukHbrMx8LZUgpOv3REa/36cEZEU+vXtnC
	7sAWwy6QEC0VJLyVTZLk0OjyFNgwTHeIsq6UzQBqNrbB/Z7TQV2MLQZotuGRmBLev64I
	Z245j4fVqyv8WEEqtcj5uQ8gT3A5tQ0TuzZUFtb8d6gRo/ViacogcOFUxZBxwDylhl6i
	JA1BGPmPfYcZtjHT6ioKO/cEr35Zt6mEkk2OLKQr8fKK5pgNW/0JVoBO2RkNn3RZMPyW
	hLkxAZAEG2NYBmrq5GVwlAVXFcCyXjSXs6I2l0nrkhEmNFZrXouRcE7W9aMwkFFOIplq
	r5Dg==
X-Gm-Message-State: AMke39k2/PRL5YM69gfG0/tWNGQ10N5vJigX5ajFwK7yBxORl9eJDr/yKNDg0ogq+qclCrk2VVnMmBdUQ2WCZw==
X-Received: by 10.223.164.212 with SMTP id h20mr4865157wrb.196.1488487712203; 
	Thu, 02 Mar 2017 12:48:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 2 Mar 2017 12:48:31 -0800 (PST)
In-Reply-To: <CALbNGRR3DKMiSBnW+=WrWJVHqUzN5FKNoDh=4Na9s1NCnE1ysg@mail.gmail.com>
References: <20170301173049.1177-1-pkj@axis.com>
	<CALbNGRR3DKMiSBnW+=WrWJVHqUzN5FKNoDh=4Na9s1NCnE1ysg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Mar 2017 21:48:31 +0100
Message-ID: <CA+chaQemN9j4vEXqfV4gtSLKvNdsTyjWyHbsqDhGPnSSBn71kA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH] Make use of the new bb.utils.filter() function
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
X-List-Received-Date: Thu, 02 Mar 2017 20:48:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I agree with Andreas, but I'm not opposed to this so strongly.

Especially as similar patch for oe-core (changing 81 files) was already
merged. Similarly the getVar cleanup recently will also cause some
headaches when cherry-picking. Unfortunately my "safe" (as it won't break
the build) whitespace cleanup won't ever get merged to oe-core, because
it's "too intrusive" :/.

Someone else with another opinion?

On Wed, Mar 1, 2017 at 11:02 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Mar 1, 2017 at 6:30 PM, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> TBH: I don't like this patch:
>
> * It combines things which do not share same labels by design. Naming
> package-configs with same label as distro-feature is a nice to have
> but not a design rule.
> * To me old style explains better what's going on
> * Heavy-gozilla-patches tend to cause headaches when cherry-picking to
> older release branches. And yes I know we had these patches in the
> past and nobody complained.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

