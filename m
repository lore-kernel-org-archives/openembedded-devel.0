Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 69D9A6CC57
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 13:26:40 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id m15so2130289wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 06:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1IdOB+CwLTSge0/taWrVss1BSp7XJ6IoxpjdoAeHqqk=;
	b=VEU8UOsDXVeAQK8c4EkqB6rB/47rZqZvSqpBTBSWwQfVYt/vvGAsoCYxptCJzxqxyo
	pOTZSaAKmHINTUHWTHUHcFRfCbcVY7bpksFFzuWQCTbGsMsniutJctt4xbJvqzv1Q2Tg
	IieEV9RxPNQSSHGy8zAzT78WyOYbtyWhhJYCBIyn59kJFVxtQ3/5sV5GeWEIV7DFayNK
	ZGMMTxsu80MIwOgEO0PQvc9Ks1QvCqz5FDsij7fBLBkY079hoGCNjYFiwX29/hPeVFF5
	QcHHylbOdzkKK9zATOSE2QufCaj/3dqixGwkfYAfs0K2bYRl3lqsJu56wrHvFD3aALP7
	I97A==
X-Gm-Message-State: ALoCoQkpgY6bsOaBsP08ynDlfoZddXqJN4oFiwhaLKrYyBHXZcjNLaVQV7am97U8+T9scnlV2Xry
X-Received: by 10.180.36.36 with SMTP id n4mr7416563wij.62.1380893201788; Fri,
	04 Oct 2013 06:26:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.74.46 with HTTP; Fri, 4 Oct 2013 06:26:21 -0700 (PDT)
In-Reply-To: <20131004132250.GE6240@jama>
References: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
	<20131004100904.GC6240@jama>
	<CAP71WjyKDm_NYTbA_DRLxcK8nkfsURca0UgRHPkoO+O5bzso7Q@mail.gmail.com>
	<20131004132250.GE6240@jama>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Oct 2013 15:26:21 +0200
Message-ID: <CAP71WjzY7STw_W1Zt2Lkg1D-GmZaxfGe_O37+tiH2wa6Bz4Vqg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: ruby-native problem (on dylan)
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
X-List-Received-Date: Fri, 04 Oct 2013 13:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 4, 2013 at 3:22 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> qmake also has hard coded paths inside and we depend on qt.conf
> overrides to set correct paths when building on host with different
> paths to sysroot.

well, gcc too in fact, since it has hardcoded sysroot ...

>
> I think that only better solution is to patch ruby/qmake to remove the
> support for "default" paths hard coded in binary and to always show an
> error when correct paths aren't supplied by env variable or some cmdline
> param.

i think that's what --enable-load-relative does in ruby ./configure.

i wonder what happens on ruby on the target then. i guess the standard
/usr/lib/xxx might be used by default.. but i haven't tried that.

can you make a similar patch on the dylan branch too?

