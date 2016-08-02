Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B38B66E660
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Aug 2016 08:24:17 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m101so205792299ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Aug 2016 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8IxYEA2Xngwo5121q/CEs+GA3kR+k9YZM97cnD/g8OM=;
	b=ywuepxLESd3216t8h02ZbOukRN5Fp78YjCbn7BeuDgKS3guDFGE54+nDCG9oz+7ut2
	zrBdX21TjuauLL5XiNX1+TuVap7AZ3aJjd1BNwxJ9TjZFy5b9lCego4rCYm2M/cuDq0j
	ErLas/Vzk6pmjjCrteNnHn4yg+mlveZI0XSJuDHYbihMKUvmLphZQ8RkP/BwGbjdL+oF
	UimlyHwnAPlZ+LfrLIsIcdtklMS+vPXRw5KCCWqBJm3Y6lHINv2RyOzsrbfqW7RohxkX
	0ysB9Zf2k5hA0idGw9FbIN0RPTHdCcmDRRWxdTOpe3+FO3SZ9b1u+IvAzw1VNFT5UEKW
	V9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8IxYEA2Xngwo5121q/CEs+GA3kR+k9YZM97cnD/g8OM=;
	b=mBF3r/2dTCTjkPQFxXRhDoQiluGrRBJeX0zAmLVOKYD7AagCNJVdCwcApYit65V6eB
	xd0ea6dd+RmEu65R+bmLKeFMy6zL7xMYDClClcGf8Q3SXE6NSAn/PmKBoPK9j7mjfhrq
	eJX81GkmKM+Nx/kNrxrwsM+eYlUJetpEk4AZ2uCqk9agg2etr+cXdE4XFcQa2A5BVpVe
	2XQ9BSKdl1mNi4Ujb+/ehcwqOCo078cG7emPFOAtoxzLb6QYveJuDAwK5Ong2Nr5w3hJ
	GKAN6j2THY8/Osl2JASeo0ncOWWJ18SsDKCSQgB0iUL3Rvxxp5yZKdhrB7xQYQbR1xPu
	uYpQ==
X-Gm-Message-State: AEkoousz27uCA/iebjjszzwkBUC2R0IweS0RKYRDbE5qZ7/7ELAEkynjePYH01N3DClfsu8yH4Rs5MfvdNpQvci4
X-Received: by 10.107.135.142 with SMTP id r14mr67163777ioi.133.1470126258803; 
	Tue, 02 Aug 2016 01:24:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 01:23:58 -0700 (PDT)
In-Reply-To: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
References: <CAHiDW_Hu7dZYxLD0cCEbV_M=-VtQF0s7O_8aZxZrXof2LXa5gw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 09:23:58 +0100
Message-ID: <CAJTo0LbZbk_w+=G=EeG1O8U-9-hLH5B2N=MwEczyHcpzuaThxw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] augeas: oe-core removal warning
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
X-List-Received-Date: Tue, 02 Aug 2016 08:24:19 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2016 at 08:15, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> I'm considering removing the augeas recipe from oe-core: it has not
> really been depended on by anything since Danny (rpm has a non-default
> PACKAGECONFIG but even that is accompanied by comments about no
> testing) and we have nothing testing its functionality. Please speak
> up now if you think augeas should stay in oe-core.
>

I think that it really should go and will likely be doing this shortly.

Ross

