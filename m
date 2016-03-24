Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id A3D44605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 02:49:00 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 124so72461881iov.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=AsmRt3a6H8N3B1u5B94alJLnhf2rzO21ob3R8oDxDXM=;
	b=gu7l9FgmEoq+lssuntxx4aT8fbIVCLhH5CAGW6K0rcVryFj4P1wD15H1mNpyKv7l89
	T1eFLVjjogZCcXect3lwjlroMqZMfWcVBUeXKYb/d4IxMapjXBWpVYWFDrWN2jM5qOFL
	Igk/ox0JjJJay2jJtgY8D2DdVg88xrf0mDQwmBMhkPqRcJ37PIcI1BXXePMetrQmvpNn
	KUPmEaciKTA3B0wEwYWUu3xTBd+TD2qiLlCD0uqz5ZrLTHiDWhmWq0Q5ODvXBy41mAF1
	5YXv3Z5f1UEgvcwoErB9x354CSrRucz6T9xQ4ZZUGx4PfpGy0mbI/frx4KjvSTi4znmg
	PDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=AsmRt3a6H8N3B1u5B94alJLnhf2rzO21ob3R8oDxDXM=;
	b=hrLu6dm1x63KLKWYzjDxkgNRsdCO4J7MNPPGqMw9COvZAxmtLb/BCMROzYe8eJ0Yz3
	LVRP1MiLTozjojOGS+NReso2fR7lf8D4vWJ0BulwYdsnrtcf/6ZmBng7K6h/+pKGLhL6
	ZD43LeQfoZ7d9zkKUlnNqfKS0NxCNejBPW7nPmGdBVsVtOUQ3L0fVzXUB0wVDl4izvDt
	hkjZ+vUYem5fh10ijfK16UyvvtsPT4BruNFjXahi7SDIWeaVTN/Op+WCbBEPENkv3eIG
	VR9rkJPVMaew26Z601+wwl4I67em8W+Mdl7LBxXb4kOFT8R4C/oePhTL/IhgUcmx0C6D
	4EuQ==
X-Gm-Message-State: AD7BkJLYAOIa5O8ygTD77iDiQ1OEcjDMcwzOkPkmzUrLqdUX32JDnrlLN2JzEM6gMdTC9D9yF0Sn6H6EQHk+EA==
MIME-Version: 1.0
X-Received: by 10.107.6.40 with SMTP id 40mr6781995iog.176.1458787741009; Wed,
	23 Mar 2016 19:49:01 -0700 (PDT)
Received: by 10.64.69.138 with HTTP; Wed, 23 Mar 2016 19:49:00 -0700 (PDT)
Date: Wed, 23 Mar 2016 22:49:00 -0400
Message-ID: <CAMZfsd6f67zTGSsSfQdVViX69qykeNmKE6gP+u60WAOKGOWodA@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Unable to Build due to qtbase error
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
X-List-Received-Date: Thu, 24 Mar 2016 02:49:00 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I have been trying to build an image using meta-qt5 for quite a while now.
I am building using the meta-intel layer for an x86-64 architecture. The
build keeps failing due to qtbase. The error log is here:
http://pastebin.com/qcRQxTsH

I cannot for the life of me figure out how to fix this error. Any help
would be greatly appreciated!

-Ryan

