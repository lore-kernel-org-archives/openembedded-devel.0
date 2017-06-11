Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2328971A8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 17:01:44 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id o9so23056784yba.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uW0Jp5YCRjRXDmkxHJ18iMoEuMaPB7MrlhzapspWkhU=;
	b=dlgSGm7F8XG8CvkiXOaDFtA7xgXlcseGk2zHc6O7lDn4bxeR4W6/q+R64spj5y9ew6
	MGdNhN9gBwyw73RZddYEGFucC8SijTKeUgDoAhHaMiTh3qYQ1P64e3wmliDfa76R9eYr
	TVBT9t/nyCGcIenVz+G/jpr6h/sFpDwspCqeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uW0Jp5YCRjRXDmkxHJ18iMoEuMaPB7MrlhzapspWkhU=;
	b=NSfW/ZAQJ73+IlQqZ4dAVI8hRWsDa91y5bzOccGsd6BZ8HetD+tTkd5wyH5bzjcM0v
	CEcI0YD0WVdZjkbeEpvnokExyiaKBSd5QKvVPay0xRBGju9gLCcKq3EdAQHDvKc98xol
	w3Kyfo23vKjM1enu+cMajrnlYV6/tx0/gDI9vWWNrzdkU+JPuIg1miVjpubKk5KjyXUs
	qYb1WcSjItDz1UloDrUZ0z9cSoaxlzMUox6aiqb0x9/ggEfQErvkGgOBakg6uv5x9rl4
	Dir6twYml8/6iotxGAWX8uxGmx6w7xgvIl+JWrMuXPRrvNRcT7COJNR7wT5sOtxLKvbD
	y+rg==
X-Gm-Message-State: AODbwcDzbOKPIET68OnPM0xogMwDobAetQkSIkt6X2XOR5BhI4f4PPOH
	2TbxZRy6LVQtELkP
X-Received: by 10.37.183.6 with SMTP id t6mr11208518ybj.221.1497200505351;
	Sun, 11 Jun 2017 10:01:45 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id m4sm2867133ywh.36.2017.06.11.10.01.44
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 10:01:44 -0700 (PDT)
Date: Sun, 11 Jun 2017 13:02:04 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170611170204.GU10782@bill-the-cat>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
	<CAMKF1srsu4Aq=aPVwCCCQynDNz5uPe1MsaasP7Mrx4oXm=MS4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srsu4Aq=aPVwCCCQynDNz5uPe1MsaasP7Mrx4oXm=MS4A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] libfile-fnmatch-perl: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 17:01:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 11, 2017 at 08:59:49AM -0700, Khem Raj wrote:
> On Sun, Jun 11, 2017 at 8:06 AM, Tom Rini <trini@konsulko.com> wrote:
> > File::FnMatch::fnmatch() provides simple, shell-like pattern matching.
> >
> > Though considerably less powerful than regular expressions, shell patterns
> > are nonetheless useful and familiar to a large audience of end-users.
> >
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> >  .../perl/libfile-fnmatch-perl_0.02.bb              | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
> >
> > diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
> 
> may be meta-perl is better suited for this

I only hesitate because I don't think debsums then belongs in meta-perl.
I took the existing example of a few other libfoo-perl recipes as being
appropriate for here.  Thanks!

-- 
Tom

