Return-Path: <gary.robertson@linaro.org>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id CED00717DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Nov 2014 19:23:36 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id e131so1270751oig.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Nov 2014 11:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NN21+izByWWQrBi7zPlxUBiTT3c5oKylp2tPAM7DTzk=;
	b=PmgReMxH1XRnezWeeTyLb6tKC1Za6f54leKO3qdVkM4qi46Q1XOwUVm8e0xVBTir9L
	ZHeU2r54JfD33uKduMCwdtPaWKhdl7XdmwXZQvfdko/jd1l+F2xCrbc9kBzGeYaMCs+o
	4FF36cnhDOpI4985QVnDC3QNbDKNkpGftQFCVSmLJaoVsFDlECVa9mO7ptnWfZeBOvCQ
	xfN78wHMjMNPjbt83hKKvOJvV9jcaTxOXiV1b7ZtTfbxpqzUkasTI5jH64jtAQrUn8OL
	ZGLtInLgRILxLm0R1dnncQJq7+3PxZYBM0oyl3CHDC14yUOjIXsVEW9LqzTHTNMU3BBi
	oXtg==
X-Gm-Message-State: ALoCoQknfwTYqrZNLSuIiWL/A9EWrPjsdF/u2IPc66Tu0lOngOVL3mBKu2jk0WOBSu99c8dLTVNX
X-Received: by 10.60.161.115 with SMTP id xr19mr5374924oeb.8.1415301816713;
	Thu, 06 Nov 2014 11:23:36 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id 2sm3016019obq.29.2014.11.06.11.23.35
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 11:23:35 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Nov 2014 13:23:00 -0600
Message-Id: <1415301783-5342-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libhugetlbfs: extend x86 and arm arch compatibility
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
X-List-Received-Date: Thu, 06 Nov 2014 19:23:45 -0000

I wish to submit the following patches for your consideration and
(hopefully) approval. These patches were required in order to
add libhugetlbfs and libhugetlbfs-tests packages to our OE rootfs image
build for the architectures tested by the Linaro Networking Group.

Using these patches we have been successful at building libhugetlbfs for
armv7a, armv7ab, armv8, armv8b, x86 (i586), and x86_64 platforms.

The patches to the libhugetlbfs Makefile and build scripts have been
submitted to the libhugetlbfs project as well.

Thanks,
Gary Robertson


