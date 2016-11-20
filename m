Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 572F3600BC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2016 23:28:28 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id w194so206834205vkw.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2016 15:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cmvXPx0LcQ2g7UWs0Jjk+8RHCJ2IC/G2xLU2FqHiUGY=;
	b=N6mECzivPUcGP/sw3imHEArcXgZa4sYNw71d1HYmpYnA1M7gUzv0XYJIxu3/EkIG1q
	wHYXtHJRH1XBbafyxtbOLRHwA6mPOaKHxO4lKtddPqwdoN/d6qqgs9Ve9e1c8AEd3OMw
	VOEPEnECAKQnNstVV0wJPcJqkyMP9cxYoGANnjkuJWPG7Oy/eE1sbHF9kjR6qCk1Qbua
	N0unG6935wpipYJbokCuTr3xbpWXxYVeWpY7SUYUifOM+9TaW+bpfagPA5+jJlCiTBMe
	t6l+QdazSKwUhC/bxXgjzSG1Lppuo+ttrs9/Q1lPRGtMOsjFLUP6SN2QXTY7qgmUu/JC
	t6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cmvXPx0LcQ2g7UWs0Jjk+8RHCJ2IC/G2xLU2FqHiUGY=;
	b=T8Ly9kQWH4GPgRPiwDTE8bF0Y4qNT5tR5hLT4bpiErgtqalukFVQN/Bkpx4QvChjMa
	bG191i6ShGgm4UCyWUn9peTIvXAwRzz3YGo5zjx0Djj9c2cfyTluAc+Q0CBXxAwBm+LZ
	0GC7JNwN7GCxH/2Y4VG0UOZaSCUa8X7fZeETQHCFKX+T0Fuxfll1qHsuQb0lykwl0hBB
	kVdVmAkE0VNhRBMXPdRokIrVb4A5VdiYfgd5e6uE2ZmezLjyQETYHOmLd3Xc9SZwtfHE
	yaljLzLAjOmLdqelGUGBZ/HpeKNk+XVi2PoQAksYx0fh2gJ69w2+6LHzTThk/qfjY4mR
	In0A==
X-Gm-Message-State: AKaTC01lmpNxiMe8N6QiSzjYnNSyyxbRuGjJonjHckmFQ/Lb6NC3Sri9xJRH7xHwiWYjqq94MVSywJgcmZr1kg==
X-Received: by 10.31.168.7 with SMTP id r7mr5099716vke.148.1479684510085; Sun,
	20 Nov 2016 15:28:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sun, 20 Nov 2016 15:28:29 -0800 (PST)
Received: by 10.176.5.136 with HTTP; Sun, 20 Nov 2016 15:28:29 -0800 (PST)
In-Reply-To: <2870220.C6Do4WeeW0@peggleto-mobl.ger.corp.intel.com>
References: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
	<9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
	<696ebdcf-d08d-72cd-7ee8-50b2c11e63d8@windriver.com>
	<2870220.C6Do4WeeW0@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Nov 2016 15:28:29 -0800
Message-ID: <CAMKF1sopAdkOqhWEDmEcB8zQNHM+sD9fb4GUQ5OYk5LmV-TK7g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] opencv: remove DEFAULT_PREFERENCE = "-1" for 3.1
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
X-List-Received-Date: Sun, 20 Nov 2016 23:28:29 -0000
Content-Type: text/plain; charset=UTF-8

There are abi issues that other apps which use ipencv might have not ported
to version 3. Thats one concern we need to address

On Nov 20, 2016 12:40 PM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:

> On Fri, 18 Nov 2016 10:38:38 wenzong fan wrote:
> > On 11/18/2016 02:11 AM, Khem Raj wrote:
> > > On 11/16/16 7:02 PM, wenzong.fan@windriver.com wrote:
> > >> From: Wenzong Fan <wenzong.fan@windriver.com>
> > >>
> > >> The opencv 2.4 has been blacklisted, 3.1 should be the default choice
> > >> for both opencv and lib32-opencv.
> > >
> > > blacklisting does not change the norms. Is it possible to fix the
> reason
> > > for blacklisting 2.x
> >
> > The reason is "Not compatible with currently used ffmpeg 3", I can try
> > to fix it but I can't promise it could be fixed definitely.
>
> That honestly sounds like something we really should upgrade in order to
> fix
> rather than fixing the old version (unless it's the case that nobody is
> using
> opencv 3 and won't any time soon).
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

