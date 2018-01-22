Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 80BB2783C9
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 04:54:28 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id y27so6216299pgc.5
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 20:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bl3Xkavt/OqQkAb1U2hEv+Fgv88eh+f3MRi5PYezv2g=;
	b=ueBMAVsZPzh72O2CSUSGcbdktuKZZ0K5B3UtBLy32ZrP42ghlwK8ORGDwC80sQ42gZ
	QzdJiBvOY9pM5rAsSU93B8I7bVccXVZs0gYyhGKeTT46GLp+U59GCDJlqgpyZ5xytvBN
	B/zyZG2yQjBXHdXTrYPmWx5Y6Msmv8LmpMRIVEecoqLGVD4Djdca9KdngjfCBqtnPIGr
	r7UdWxGuEShAJLrUuDC2d0z8Te7fOzK6CevhU/jqDdK+kPuGV8GioUBZBFvHdB0g7qK+
	02jTmK+Ruz/rRgxb1sEFZ/HQDP752tlbSiNKcJtJOjmakZLt+icHFjfsUs2eOUIEdKHF
	2GNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bl3Xkavt/OqQkAb1U2hEv+Fgv88eh+f3MRi5PYezv2g=;
	b=GpBFP/RToe09MesbkVlqHurAX3QCGx4azvCiIF+xFzS8XE3kE8CNZpvkEG2B8Le6fF
	4UlF5Htzp6ZPBHb7ErSYEUCwHdS2+PfuSfbm3ZJzxGKGaMKkyUtMCNmf4dPL7Y7hvRH+
	57/Cho/1I63lpM1KDXnSRGk+onUd+2d32tDxh7kqXGYP5rEGJlT1bbSCvpwBkEysj/uk
	4TYjLpln2kXF8vtMsjUvB3vqo4fkBAcLdLIKAqtzj7yJ1urx4VdrzDs5hACOJ6C/dn1a
	ic1f4Ho9TZ2SsWqdS8Gc3U2etlpkWgr/HPSThr7qfbbDl4CJp+6/OZAqkJzHpMJlBNy2
	a7pg==
X-Gm-Message-State: AKwxytdFQJckILTN0ZXBfs1A0wW250dcPwBjBmpOzkPmn+4x+XvTxckl
	bCtEh5mHrKENU3fmiZHYcjC76JcjIHjY8t5YXks=
X-Google-Smtp-Source: AH8x2245uzuwjgvEqmuW30/qcIj9v8onjSKtbAmY9/6iv+cNcBgdmIblw5XO/bn7ZFHcIHGm6jHnPsFPrTVqm1NGVnQ=
X-Received: by 10.99.137.195 with SMTP id v186mr6305123pgd.25.1516596869390;
	Sun, 21 Jan 2018 20:54:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Sun, 21 Jan 2018 20:53:58 -0800 (PST)
In-Reply-To: <35308e99-f447-3e17-f652-be4f981c19fa@thecshore.com>
References: <35308e99-f447-3e17-f652-be4f981c19fa@thecshore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jan 2018 20:53:58 -0800
Message-ID: <CAMKF1spvbf1D8v_1j1O5TjMD8+aSdi40+sZW7+vALQ4PUcNQdw@mail.gmail.com>
To: "Daniel F. Dickinson" <cshored@thecshore.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt] PV for git versions for 17.01.4 upstream release, git for master?
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
X-List-Received-Date: Mon, 22 Jan 2018 04:54:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 21, 2018 at 6:06 PM, Daniel F. Dickinson
<cshored@thecshore.com> wrote:
> Hi,
>
> Wondering thoughts on using a package version with the git revisions of
> openwrt recipes that are in current stable (17.01.4) and using _git version
> for tracking upstream master?  Also in that case would it be necessary to
> use PREFERRED_VERSION for in e.g. openwrt.bbclass, or it a versioned recipe
> preferred to a git one, unless overridden?
>

Probably weakly define a global openwrt version e.g. OPENWRT_VERSION
in layer.conf
have two versions of recipes one for master and another one for
release. OPENWRT_VERSION
then can be overridden in local.conf if someone does not want to use
release version.
defining PREFERRED_VERSION for every recipe in layer.conf in meta-openwrt.

> Openwrt doesn't cut tarball releases of the sources that I am aware of, and
> only some of the code is on github; there's a lot at git.openwrt.org.
>
> (Oh and for those not in the loop, Openwrt and LEDE have re-merged; for
> those really not in the loop Openwrt was forked into LEDE project for
> a while).
> --
> https://www.thecshore.com

