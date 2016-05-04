Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6A236731B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 19:36:34 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id bi2so158568770igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eCe5H7KhZTGhTndzHtttFe2GfSpF6uIR8i7y9GZbu4w=;
	b=VJPJdJ7BQE5xFZpvg3WTRS9DCJ+QBjZ4US4c3NpBbLCKTOs1Fc34Do8tmHWhLiB30J
	nmYtUINCOVwfHTP+45DOW/k+R9+2Ikqq18/h9G86eO0ga9WMaeokEieggjVE5TP/72rz
	E2Cuc69QZKB4MNgmS9hHEwrT7ScflJsFkG8tMNkR9Sz3tYhw6ijx9byXg/4GniEcScOJ
	t1z9D93IgDwF5ONiq4a76X3YbqVcJC5eCpxQCdPMzkyGuJeNeiABtPyCk0kDuFkYZWKs
	BsdQjw0WbRRFou9FI7373q7rmw2869q2pyxQEhEk7x7H1Peqk6So3BdyELGnNN4qt8Hn
	1jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eCe5H7KhZTGhTndzHtttFe2GfSpF6uIR8i7y9GZbu4w=;
	b=X2Ovnx5l+cnrMwMlK+QLw74h2UevlvTu8RoZO8PRPIA77/jCqGlb084g3YedyjwZI5
	zRVq4lK1sayesj6dta6GPgzM/Y3wYDuLFJYHArqPuVeyCc9G2IFs4gyQG0aBRcaz2OUx
	TVoTI6hk9J2vXQUNZOvMTqfJ0w0JhqUPrzmGnsMyllxLyiMfsASO77JqWiDidlsn7haq
	qT3eCRG0f8WxISeBjWGV4PFWXVOWB6V2tKRxSd7e+QZhds82Cafm5mRlktf/GFAllXTQ
	zjCsBJusQD+Hs1RqjggSwSlnMYUStvlwSHyoBm5EJVUQ0ZbbYU+rgB5mDWhIG2NK6c7R
	Te+w==
X-Gm-Message-State: AOPr4FUq/89/v4msuns4Uw4Aawy0t+OztT+GlYgLJzmus99cEvspnoKkdpLPXQ27teqpLTuh603mvs/+ceIWq2Jp
X-Received: by 10.50.160.41 with SMTP id xh9mr12664915igb.64.1462390594862;
	Wed, 04 May 2016 12:36:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 12:36:15 -0700 (PDT)
In-Reply-To: <CAJTo0LaDTuXZu9r7py2ZaKOYF2oMa1GUmKSRBWP61J1k_EDwew@mail.gmail.com>
References: <1462374941-8473-1-git-send-email-j-stiffler@ti.com>
	<CAJTo0LaDTuXZu9r7py2ZaKOYF2oMa1GUmKSRBWP61J1k_EDwew@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 20:36:15 +0100
Message-ID: <CAJTo0LbFf5Eopd1=aahEUbLneHVqPhi0XYjvmKsc+XAOVqDfsQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] opencv: Fix broken deps for opencv meta package
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
X-List-Received-Date: Wed, 04 May 2016 19:36:36 -0000
Content-Type: text/plain; charset=UTF-8

On 4 May 2016 at 20:35, Burton, Ross <ross.burton@intel.com> wrote:

> (it currently returns duplicates if multiple files are packages, but this
> doesn't cause a problem for metapackage dependencies)
>

Update: krogoth and earlier have this bug, oe-core master is already fixed.

Ross

