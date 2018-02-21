Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 554B5787F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:58:17 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id p104so5284524wrc.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Wy2XCQO152FaCvtkEnpr1aR/Drq3rlP1tf4XvDHb/4M=;
	b=FjsEz4eif1BIqU7GPvJxCfdsU3vMV0ePezg3FUGIHNwl40BJq4m/vQ+T/QIE67QrqF
	Q3TsKm6BI3KUxE4K9xyuoqI2aJKweFs19mJJQBsQ1enadmu40XN/iJOifneJjXbERmg5
	02FZOSz5I5vIk/T0mnXzLPqD9+8h8DlM+kyMM0ys4RAxoZ3OFwA0KyMJS+fGrYnXccu9
	H9wA32flVdPOP622boeZmGV3L+J8+mV8NMuEAxoYbRM8wOXwWLc1TFUL0XPh92N+ryQ9
	I3OMMi/KWVLkAx0SKqECBT+MJCfo/OjVLVBemhMzC1rYyF7YsjPBCao97VtBSfUp6fxk
	ZqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Wy2XCQO152FaCvtkEnpr1aR/Drq3rlP1tf4XvDHb/4M=;
	b=qZraLj/zphxccddnpqIXrLhnUktu9SqAtsL++TzlxlN7NRoAKGQUDyqlKl0bKudI25
	vRLChdKOOpWDm4lxPs3QvQFwaeFYU3pMgWDJXcsDcWIGjkOp3QeTSzRXWxkcXwCe1W51
	4+67YvXD6O5ZxhrNdcpx2IrWtkyJf46Cv752TpMgrA//zumMc6rBkxZ0ttt3mI4pNW20
	+ONeXTKmRQs2zqUl8DdxMYqr7RDmBLooQo+id21P58DYqVP73IDQC4WHgBoE1ieynS73
	4+cg3epQZ3Vs8R3COyyD5g0hwPHJUnPAeOSE+AXVnp0eiGoypuQDsYS64fmKkmLYuuBt
	gfRw==
X-Gm-Message-State: APf1xPC5JgQcH1cEUJE1EuoIpfYiL6Rufy90+Scfnau08ny2VW2UTOd2
	BPRu+G7dYBReIs0sz9DLrcUx
X-Google-Smtp-Source: AH8x227XInPOA3lw9gZUYN8lBEGZ2zg3Yoh8t+xgEGh+FtJL9a15NmXpDnSrD0t/X7r56WXs3s6fMw==
X-Received: by 10.28.239.19 with SMTP id n19mr2445567wmh.20.1519225099121;
	Wed, 21 Feb 2018 06:58:19 -0800 (PST)
Received: from pohly-mobl1 (p548497B7.dip0.t-ipconnect.de. [84.132.151.183])
	by smtp.gmail.com with ESMTPSA id 62sm2433527wrf.24.2018.02.21.06.58.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Feb 2018 06:58:17 -0800 (PST)
Message-ID: <1519225097.6698.8.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Joe MacDonald
	<Joe_MacDonald@mentor.com>
Date: Wed, 21 Feb 2018 15:58:17 +0100
In-Reply-To: <CAJTo0LYe1koEr7kJg7RfXLDbZLVa0qQyWiig5Sng_hpRTr_3dw@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
	<CAJTo0LYe1koEr7kJg7RfXLDbZLVa0qQyWiig5Sng_hpRTr_3dw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 14:58:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-02-21 at 14:14 +0000, Burton, Ross wrote:
> > But that kind of mechanism seems highly prone to breakage and
> > likely to
> > be highly contentious even if it was shown to be reliable, so it
> > may not
> > get beyond a "that'd be nice" thing for me.
> > 
> > Unless someone else has already implemented it and I'm just not
> > aware of
> > how to use it?  :-)
> > 
> 
> meta-freescale (iirc) does this, conditionally adds
> sub-layers to BBLAYERS based on what other layers are already
> enabled.

The approach used by meta-freescale works with older releases.
BBFILES_DYNAMIC [1] (supported by bitbake 1.36/Yocto 2.4) is a bit more
robust.

[1] https://patchwork.openembedded.org/patch/140532/

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



