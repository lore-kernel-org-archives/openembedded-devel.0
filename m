Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5DD6D767
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 12:20:00 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id u12so2896086iop.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 04:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wzyIMlMhOUSp9Vr4N23zP46d4CuJldjX+iUpS5YbZmI=;
	b=bwq3Uaa/SCbXc3e3J7g1UJFH9mvM1C3TOLEuf/Cmf/uCR0no8LaOC3FsY+09Niy5LG
	vU0LksuItFuNlqDHjYomTLECMHXc8xspGMw+z27NLcDi00eECCB/cmZzjtKs58J50Lo9
	jqwtfC3FA0o7y0ONMpsrFrDko9x3Rhhkd8phuZCkH9mBR7j/FIFDXvdaEndqK2ld5J6C
	zQhs/4uGI51F0sdYlPCBzi2ojxVJkbbltIzuKSbOKujXpTrDYdB2UVhc+Lvs+9SF8tFI
	PAFsvggzIbzYwWh3D1VAsANJcbQhCQG6sNrZL65XKuMuxD2jt6xFxzSO3FtyFhKp07wQ
	gRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wzyIMlMhOUSp9Vr4N23zP46d4CuJldjX+iUpS5YbZmI=;
	b=g5RL9qkZUAdSYGGanBC6aNo3fKynLIe/buEtMi9HKDPyp/BWjHHcEykaMj1RUIuG2R
	Bqn0rzP7vYyh3rnMtjKoYuqmy5ybvXutDuLC+tobrUv1VzXGdgG4bL/ymCLPJHm7/VkN
	tHc83eomBAfEYbXHWdnZKIIqtGjqyhiT+3S0Hbn2ba8gVt1hoMt7AgUnP6TwTndRs06i
	Js72bP8QBGxYkMl04Zfl7MM9Qn4ordNUeaHCLZeh1QsahZXpopt/lttImXHl9HmrOWsH
	mM51cw/H8A8VaHjWl3wnvkn+cA8JPJho8xdEikQV8cI7k3834L6C7PvCthSfLjDEEq3d
	Pf8Q==
X-Gm-Message-State: APjAAAU1R9fbJuG0h698ft4jpGqs4xl2xmhk4BS7e2sZuYolw/5+LNak
	xOTPpjSr1b7F186pkf7D6pAY4Nno0JDj6f1J0bLjRQ==
X-Google-Smtp-Source: APXvYqxIUkVZDPnqwRcGD3grefp3W/GGBECFsJaS0tIAD0WQHjk2od3FMtUZ2Zz1ik5Oi9n0LVrFSYIWh2nSL04GDII=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr9097023ion.20.1552047601139; 
	Fri, 08 Mar 2019 04:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20190308013237.194105-1-kai.kang@windriver.com>
	<20190308013237.194105-4-kai.kang@windriver.com>
	<CALbNGRSzvkdwr24cvwrp1MW29JeduDKqza2epCaqJGQqXXUD-g@mail.gmail.com>
	<a0071efe-cb11-7398-c49c-2b35e302e4bd@windriver.com>
In-Reply-To: <a0071efe-cb11-7398-c49c-2b35e302e4bd@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Mar 2019 12:19:49 +0000
Message-ID: <CAJTo0Lbew8AAzKisPS=rMjwpGNvzx1T1DYBPy38GJ3nkStzqcg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 3/5] gvfs: 1.39.1 -> 1.39.92
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
X-List-Received-Date: Fri, 08 Mar 2019 12:20:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That recipe should inherit upstream-version-is-even to remind everyone
of this, and stop any automatic tooling that use the upgrade checking
code in oe-core from suggesting upgrades to development releases.

Ross

On Fri, 8 Mar 2019 at 08:10, Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/3/8 =E4=B8=8B=E5=8D=883:57, Andreas M=C3=BCller wrote:
> > On Fri, Mar 8, 2019 at 2:33 AM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > I have overlooked your last update: Please don't update to unstable
> > gnome releases (odd version numbers) in the future. As far as I can
> > remember there were similar comments in oe-core already.
> >
> > Andreas
> >
> Hi Andreas,
>
> I searched for gnome version policy and got
>
> https://developer.gnome.org/programming-guidelines/stable/versioning.html=
.en
>
> Most GNOME modules follow a convention for stable and unstable releases.
> The minor version is even for stable releases and is odd for unstable
> releases. For example, the 3.20.* versions are stable, but the 3.19.*
> versions are unstable. The 3.19.* versions can be seen as alpha and beta
> releases of the 3.20 version.
>
> Thanks for reminder.
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

