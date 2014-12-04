Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id E5A6265E1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:29:58 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id n15so14163160lbi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=NXx7So/u5T7qMkF7HD7oyP/fGweWd55D6ujanpA4Ij0=;
	b=CPqiWwCT4hizmNCDIZH2gkBSn5awGpLrFYx/FG5aWodaKdplfjFO1+Pjt2dVSN86wu
	POig+Z4bLSoJuy5Y/EB8ij5NiiGYhZUA1pLvBDAQUlRmaOpfj7yt55xCP0lKh1TxxDMx
	reiytKRjVBD7rIOljlEt5dgExjLMzAYVchwcpdlr1x3yEF3oeIyULfMeeQIyS6KhvNcL
	+uq18WFCVukZVt3CFJrVot4cz7BxLm1cd1NJWP4M7nJNQvupaXLCCQnIgpS8xUnHWk5/
	UiBkSdorkni3Oe1YoZorx9wwRKlcRO7Rgptwimmn+ySEQ8Lxoo0xH5mQT+/McJ6GkD2R
	pL9Q==
X-Gm-Message-State: ALoCoQmiqKqj8AlQJN84+g1F6Bx2Pmjq81TDUmzTFxs/fYJ1VybbboPV+ZjOQakVsjvwlRJ0gsd5
MIME-Version: 1.0
X-Received: by 10.152.121.1 with SMTP id lg1mr9970344lab.28.1417706997937;
	Thu, 04 Dec 2014 07:29:57 -0800 (PST)
Received: by 10.25.23.86 with HTTP; Thu, 4 Dec 2014 07:29:57 -0800 (PST)
Date: Thu, 4 Dec 2014 18:29:57 +0300
Message-ID: <CAHPquwM2m25serTe-FRvcsVi_BQUCgVXASUwQC99ExZ9UpZNZw@mail.gmail.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Rootfs over 4GB
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
X-List-Received-Date: Thu, 04 Dec 2014 15:30:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

 I'm using oe-core for building images and have a problem. rootfs.img is
over 5GB and cannot be copied to FAT32 partition because of file size
limit. This happens during do_bootimg task for core-image-sato-sdk. No
warning is given by bitbake.
 The problem occurs in build_fat_img() function in bootimg.bbclass.

 What is the technical reason behind putting rootfs.img to FAT partition?
 What is the right way of building core-image-sato-sdk with large rootfs?

---
Petr

