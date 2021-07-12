Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.12661.1626103150051759483
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gpanders.com header.s=gm1 header.b=SJIxZ8ty;
 spf=pass (domain: gpanders.com, ip: 217.70.183.193, mailfrom: greg@gpanders.com)
Received: (Authenticated sender: greg@gpanders.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1C5F0240003
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jul 2021 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gpanders.com;
	s=gm1; t=1626103148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=qeaYChmJhjemwOk2PAikVyFy+exyMz2Lh6mc/JBPa+Y=;
	b=SJIxZ8tyCQcel9cuEenMGbUscs9IifqtLZLOcIg57jZni5QEG1UycvEtrv6THEdLMuhzo5
	PpNW+3WIr2aniJY6sAUXXvf6Qrn13S+I/8l/nrR0meec6YwyyedMdihDFGFQMPaj8PLhcH
	9bLhke/MHN9t+4DN3fFQf3FtORjq7uj17IFQp/CBK58WxaRGcI2svIMtj5gXQokzIC9vgv
	ZBQVtIy9+SAyUNDOeYNOWCL2wNEq5BmSazINeOVEx7UZkVl6myxd91Oc5MY4kYnN4A/cXc
	fMcY9rClbk6jIBgA0oijvl9qZwY7Oaw93nuwuqsGa6G3RdGPfTJ21ADL2nqkog==
Date: Mon, 12 Jul 2021 15:19:04 +0000
From: "Gregory Anders" <greg@gpanders.com>
To: openembedded-devel@lists.openembedded.org
Subject: Upstream scipy recipe to meta-openembedded
Message-ID: <YOxdaI1jQgdxKTQn@gpanders.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hello all,

I wrote and maintain a recipe to provide scipy in the OpenEmbedded build 
system [1]. I would like to upstream this recipe into meta-python so 
that it is more broadly available to those who need it as well as to 
reduce my own maintenance burden.

Before sending a patch, however, I'd like to solicit feedback from the 
meta-oe community on how best to integrate this recipe into the 
meta-openembedded project. If you look at the source for the recipe at 
[1] you will see that there are a few steps/hacks that need to be done 
in order to get scipy to correctly cross-compile:

1. We have to add a CMake parameter to lapack ("-DCBLAS=ON"). This 
    causes LAPACK to build the C BLAS library instead of the Fortran BLAS 
    library. This is necessary as scipy tries to link against `cblas_*` 
    functions.
2. We have to patch numpy to force it not to include rpaths in the 
    compiled shared object file. Otherwise the bitbake QA fails as it 
    detects rpaths from the build system.
3. Two variables must be set in either the local.conf or distro.conf 
    file to enable Fortran support. These can't be added in the scipy 
    recipe directly (at least, last time I tried it they couldn't be) so 
    users have to manually add these themselves.

I am by no means an expert in bitbake or in the broader OE build 
environment. If you know of a better solution to any of the problems 
outlined above, please share them. I am also more than happy to provide 
more detail if anyone has any questions.

Ultimately, the ideal goal is to have a single 'python3_scipy.bb' recipe 
file that I can send as a patch for inclusion in the meta-python layer 
rather than maintaining an entirely separate meta-scipy layer.

Thanks!

Greg

[1]: https://github.com/gpanders/meta-scipy
