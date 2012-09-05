Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9E0p-0004H2-LA
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:43:15 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 05 Sep 2012 04:30:51 -0700
Received: by iebc11 with SMTP id c11so866571ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 04:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=OXL702MR+rt6lZbVb/rBzh1Pb+HqgaXhsOutDkTflvs=;
	b=L8+82H4Y7hD2OaHsUSA4ljjvAJtd/zKWUVw5JtaowYwwi6xR2CC9p4sl2ZtCQaBi6C
	5aslfP/WpFjdfZiETVT4GRbICrFa+sDSSeUFqDp6LFCHbDJoE0HsMbdVr/GYJegppfSU
	nZmXwcecL7lYFlcqe26as9it7t3J/pzLxAQTmZ9Ww5fKlDcpKFeG0FbAPrwrxE3M9qrL
	aro23XpisjkFFgh9mB35iyx/qP/SAYaHAlxSc2BLxbito0Ro6iAXUrKEAYpqLO7gNacz
	dEGBt9XVrqneiDHnsxqZ0XQcLPrpePImSFf+CsrcmQ3rNL5pgxwloODUHc/0GNpaYgh/
	K+lg==
Received: by 10.182.124.102 with SMTP id mh6mr16682820obb.48.1346844649984;
	Wed, 05 Sep 2012 04:30:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 5 Sep 2012 04:30:29 -0700 (PDT)
In-Reply-To: <50473603.4030708@communistcode.co.uk>
References: <50473603.4030708@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Sep 2012 12:30:29 +0100
Message-ID: <CAJTo0LYnjc8X-Tv3ejOfjvPkFw7r975ymo-ewpTwWUg-cuDO=g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlBUgHkSoKvHEFmirmaqDI0S0QP3y0xcaoWjW0XrY/oGALj4xEPZRBJYz+TvbMAuBe9bAYI
Subject: Re: Struggling with creating recipe liblockdev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 11:43:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 5 September 2012 12:22, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I am really struggling with making a new recipe for a library called
> lockdev. It is fairly old and fairly basic but I am failling at the initial
> hurdles!

Your package name (from recipe file name) is "liblockdev" but the
tarball and it's contents are "lockdev".  Easiest way to solve this is
to rename liblockdev_1.0.3.bb to just lockdev_1.0.3.bb.

Alternatively, use S= to set the source directory.

Ross


