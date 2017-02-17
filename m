Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 406CC77317
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 14:39:44 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id w20so41578554qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 06:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zLj7plkDn46meKJ+VSWohaTgWTZDKip+ZKmHCbDeVjU=;
	b=W7aWg+Ue39d0jHjLEiFm2ZdNC593pv37a6GKhO+3L7fjOTe0G6LXawESAEQ5zqc2NJ
	SPhbLxlEd0BV7Zm+Ekfc4J3duNTE0M6NUi4id2yEF/kg441+9wwfx8IZVd5likGKQ2Kz
	Pl6/UNsZBCaevtMw1RzAElvxpR+weK7BECi7lvR8FhTAi3pdOF9eEDHkBN15WvUMN6dk
	dwQyc7g6tcjIestpC8jnIGG9x9ttg+1WOV5TWtZUVXZea6UOGPre8IBiaux3wfEvveuX
	/qnvGx5o4K/tmrt8VYhLwGhhL+eCHBNH9OTv0rSOnSCYUjy7tC5BIHCMMeUa9pPGjK+w
	oSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zLj7plkDn46meKJ+VSWohaTgWTZDKip+ZKmHCbDeVjU=;
	b=HQD7hB/QkvID8hDmWMrvelmYxtS/UlCWdWJJnyOxw8juFyXSSwMTYSHtgKoc9yLekK
	nIibnKbiQfQh3tkY/5+lRGDn3Fiu/zq8Y7Vgk2yORU993J+/lYwB7vwPHl++XOtZzylJ
	jbinpKRDkm5KTI5iSM5PRx7XEH8zJXOj+pq2gzIl57vExbWGN3sLgsAXjLd79WnN5sPg
	FM3hMGwsWTYNs/Sqtwj6YRMFeGnfOrL623EdBiwMoldpdcd3/8U+3dLT1/Ck+nW/VTcV
	1Ln0aeWq5hfEkQ1dk9CLwhLo9f4Suh5Jz4UrqH96Kc4gdm6rBjOolDpELkuzCYKjenqG
	XETw==
X-Gm-Message-State: AMke39lH2EF/YUQDNFhpm4BVGtHNg2Kzw//NxtaAQ/sToitL1prN81pTqg2Mv8sNaZR/CXQucVqmyTPuseY97QGM
X-Received: by 10.237.36.208 with SMTP id u16mr8225327qtc.105.1487342385179;
	Fri, 17 Feb 2017 06:39:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 06:39:24 -0800 (PST)
In-Reply-To: <CAMKF1sq5aLAgjciAfGmr6G1-qQU4fU6Ng_Dni0hVH8u0KZdSrw@mail.gmail.com>
References: <1487246039-9185-1-git-send-email-linus.svensson@axis.com>
	<1487246039-9185-2-git-send-email-linus.svensson@axis.com>
	<CAMKF1sq5aLAgjciAfGmr6G1-qQU4fU6Ng_Dni0hVH8u0KZdSrw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 14:39:24 +0000
Message-ID: <CAJTo0LbjPJjme-+MXPvHE+Ba1GZieHZTAbuY=Rc_BjKfov1wUQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2 2/2] meson.bbclass: Add meson.bbclass
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
X-List-Received-Date: Fri, 17 Feb 2017 14:39:45 -0000
Content-Type: text/plain; charset=UTF-8

On 16 February 2017 at 15:23, Khem Raj <raj.khem@gmail.com> wrote:

> Perhaps inehriting  pkgconfig would be required too
>

Unless Meson *always* uses pkgconfig, I think this should be something done
in the recipe instead.

Ross

