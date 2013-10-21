Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id A2F666D092
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 09:05:44 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w8so3020453vbf.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 02:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Et99ZLoX1YkqAKtsTYZ2NycE7TlM42NAhhvYIlrd8XI=;
	b=NvGjj/0jDss36Adq1FPuYAuiTi+mcISzTLc2nW+4moDsHwgDs6escl6VcKsRClXMTR
	ip3L1KVSJDecs/kyeTYFWvZa7LVLav2oLj2hR/AtP6iXJaOdu6jEEOw5E6By2eyfQb9N
	G7+DCHWtwgt7zvk7FrSObiLYmv6SFVNjOSveTolXIGz1is9CkDIGI+BGoN/yB67S8Gfq
	9D3Hs1wOQTiIw9YHCKTfLhqGgIbP2hB/zn9/U15iDHSU3TdF3tcmOoKg2rk+whD7juyr
	FblTnptHN9XQlSD+vM3+DWFFt7HGsE3L7k3XOIO1bj1kS/waJlf/HDNsIrAvyM/l7Fzr
	O9qA==
X-Gm-Message-State: ALoCoQk14o4urzpLM280mSsUqtM12LppXd+kFJXUK42N+T9nHduj6c53oODTR7GMDSjOqKvn44o3
X-Received: by 10.52.243.138 with SMTP id wy10mr8928085vdc.2.1382346344937;
	Mon, 21 Oct 2013 02:05:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 21 Oct 2013 02:05:24 -0700 (PDT)
In-Reply-To: <544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
References: <2478778.XBk41EpSZr@koontz>
	<544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Oct 2013 10:05:24 +0100
Message-ID: <CAJTo0LaJ75PaAr_uwLAMNPW7=azWoTtL3JBbPR_xkB0TSMq+-w@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Regarding layers and their versioning.
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
X-List-Received-Date: Mon, 21 Oct 2013 09:05:45 -0000
Content-Type: text/plain; charset=UTF-8

On 21 October 2013 09:29, Anders Darander <anders@chargestorm.se> wrote:
> We're doing the same internally at ChargeStorm. One benefit is that we're having our
> "master" repo keeping track of all the layers that we're using and which revision of
> those layers.

Guacamayo uses a master repository with submodules for each layer.
Works nicely as the layers are pinned to revisions which are known to
work, and then branches can be made to integrate upgraded layers.

Ross

