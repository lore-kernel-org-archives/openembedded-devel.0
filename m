Return-Path: <jan.vermaete@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 47857744E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 13:33:42 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id e123-v6so5114148oih.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=/w9AEEbkxK7Afc2SLujN/YIgTolB5fV8QPipHyvXSWY=;
	b=eHwW5twHynZfjsmbCYSqRM1FQkZqjkJC45lGy1AvjfG3sPmxh5iRT4KB6aJfulTW3W
	FfWHjtA8/+qBrpdU8IUFtg0nWzF0wiKmZPgVFgR2s/7ZfkdIz5TMvRgXbjK3UjsbQFxo
	3q/cU/hFg+bcwcD34rG2B4SQ5mdu9s77boLR3mIDQtPUoJisvMFz1cZsFXaM7rZqDTOo
	PJiKmlB6zyZVjDVGF+QHRGFhZOmHOaNjio97Ytqw9nhiMGpRV6Z9+KoLX9h7nbzf+dCh
	adH6ZdWB6F+jrb/0H9FoAw3wQcPMRqPTfgH8Is5KuihjRz0sLcTl3DHYHGa+NiOVVjC4
	GTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=/w9AEEbkxK7Afc2SLujN/YIgTolB5fV8QPipHyvXSWY=;
	b=HhQDe1k94n2BgeInPIzl81rYxGVNhWN9IGJsTlKakOOKno7wkqAXkFgXh/v9plr455
	Ct+o/Jq4xuCLTunB8qdHKec0ajgRMwd5oid3awVBHwouzyLx5jRcLt8l33YoKD8ImBTi
	cFr31OvXi3tT2g2M0bsD06SEMeA0ZpT3w4b5hP+lEdfy88mVm+4s+lflxNJLoornAPmN
	7p5Q1Iekit9ChPM4kQk1A78/pDsDHP7M4ejn4nlL3PnxR/v0cxdBrEgjvBI+KP91vU5N
	k0eXU3dFojyl+NSSAN0pR/eLiX0Dp7Xu1kmte5JVPMwiQuvdQEzR7tvbYsdhyoHtLlHP
	eBNw==
X-Gm-Message-State: ALQs6tCag46nGzyeVpZKxB+BUw05i/EpXnUCvGLxhbJax2Yf0Rvl/mZm
	CL0hb1xez10y+vYYoPAOsSesgYVlixb77n1mILg=
X-Google-Smtp-Source: AIpwx4/HfvRMfT6Fqlncc6rmiiloaxYEtu8uPX6/JBuxFygTrEdflOvOc2YJx9ypgbv0tedgeYsXpYLLC22TQQiJf2s=
X-Received: by 2002:aca:e54b:: with SMTP id
	c72-v6mr5327678oih.65.1523540023705; 
	Thu, 12 Apr 2018 06:33:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.18.147 with HTTP; Thu, 12 Apr 2018 06:33:23 -0700 (PDT)
From: jan vermaete <jan.vermaete@gmail.com>
Date: Thu, 12 Apr 2018 15:33:23 +0200
Message-ID: <CABF_=yiRrqZTGPkMEQNvm5f=LsUQTPKtbqrCrKHjBfbWuv29zQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python-attrs: Adjust the RDEPENDS to include crypt rather than cryptography
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
X-List-Received-Date: Thu, 12 Apr 2018 13:33:43 -0000
Content-Type: text/plain; charset="UTF-8"

I'm afraid this patch just revert the file to the previous state.
As far as I can see, there is no need at all to have something of
crypto nor crypotgraphy needed for this python package.

-- 
Jan Vermaete
"For every complex problem there is an answer that is clear, simple,
and wrong." - H.L. Mencken

