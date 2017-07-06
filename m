Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 921AF72F96
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:52:19 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b40so5803678qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jul 2017 08:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=K3v532XRZf8a0bvEA0idIU6D5ZYX6TT0WXc6cK676kI=;
	b=iT4cFCuNSj9Iyh1KWcV6YZZEoTLMb3NVuhKBPo1smhub2rvvnwhEqzsjvULSuFA/Iy
	y8XDYxt/EFROMtnl8+wWnrBTVenUwlmzmZ3nAapaqPaHTM0HYSNef/JZUHkbVuW54bYH
	bAxm6Lm69pZNSlJ6CrhMM4L/eCyBCBlImmdfoNN/dAGl3Nux8Ymtk7izNKXOQw1vE6us
	tcFasRYcUst7Qcl1O1/bdrhdw04l3JUaviYWW5nJ7Tyg5tAuTJFIdAq1mS3Gk3GzRYg5
	HKCb13OBcprRIvgC9vtaD1YxpDqNNhwIUvEULraqRDPILPKVwdKYUQoInHeJ7MHFnj3Z
	HB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=K3v532XRZf8a0bvEA0idIU6D5ZYX6TT0WXc6cK676kI=;
	b=iP0V/mQaZX/xa2WoJ450KUSUCNIgQuXOhNsS1OiEtFKiE/DTOCp+Ql3CjWz/mm3zpl
	X3Z/vDIQrJDyhTsCpVvwHqdHofT63jKXkQpNdlzpbgJ25dxvIS+5GFWofCg8WssLxUNF
	FDzkjqI5Z70e2vf7gsoPL+YgY89FqbQnQ6dBrVDqhH3TP84OuiJtxecuWKdz5k0L1553
	/rkeFh4Ik3k+OQNw2tcNMyDvj60k9i+9VYjoAwMCQ3S59qVaIFcB1iDM0H5Q70PtuyPh
	fyGAx7mlXSSnGVbJXTtVJeQDK1rISJlkOtm3OkPeoBTWMVu8+a0cI5Kw5l7cD+Cp5xpp
	/WMg==
X-Gm-Message-State: AIVw112pmwYLl+dgrko0Y5umJmD4v8dhqPUE/SmuLmXIw9sFw5Fvo67N
	+WT6SFFU/HU28pJLj3k/3R73mgX9kxPU
X-Received: by 10.200.45.241 with SMTP id q46mr12954856qta.177.1499356340287; 
	Thu, 06 Jul 2017 08:52:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Thu, 6 Jul 2017 08:51:59 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jul 2017 16:51:59 +0100
Message-ID: <CAJTo0LYKZASb7simJZDieiL+9F8iVN3mGzN5cGPktGHX3T5h0w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Moving GNOME 2 recipes to an external meta-gnome2 layer?
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
X-List-Received-Date: Thu, 06 Jul 2017 15:52:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

The meta-gnome layer in the meta-openembedded repository currently contains
a mix of GNOME 2 and GNOME 3 recipes.  Considering GNOME 3 was released in
2011, so GNOME 2 has been unmaintained for six years now, I think it is
time to consider splitting out the GNOME 2 recipes into a meta-gnome2 layer
that can be hosted somewhere else: meta-oe isn't the place for recipes to
go and die, it should be useful and relevant.  I mean, one of the most
recent commits was a fix to Dates to fix it under clang.  We (OpenedHand)
abandoned that in 2009!

So, does anyone actually use the GNOME 2 platform still?  Does anyone
volunteer to maintain this layer?  Should I instead just delete the recipes
instead, reducing meta-gnome down to the few recipes that are part of the
GNOME 3 stack?

Ross

