Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id DF142606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Aug 2015 06:05:53 +0000 (UTC)
Received: by obbop1 with SMTP id op1so77429394obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=5hSMV14h11vpuON7HWie7fjCxyk8vf/EA0W+Yl8eSJY=;
	b=kvWJvoKmGf3ZWEipETN17kmA1915dVZzQiBHo6DDahOOvMeZ16KMiflS2kwfvwLyaZ
	4PBxe4btYQtXE//MO8AWqn+7zv8ELuhNzbbp9+6GLTCVXIDvyoOzbz7hMku1fC1vHvZ5
	zDty2m5MT+2dgToOR+qJNtGrqu101TcmgJx2uYFiNYHSOvzKwu8wxbzfzao4H5a/QLcI
	ElQgBofF0nV3/rIbrpfYoRPY+5WQnvXCE+37bBi5+s/+MyyFKepWdiXm4XApBLQNWLDf
	u4Ak7USPHrSIj0xGvfx/NfF5YZ4IUplkdkLm03Ihk3lJ18s3GmrAP31m+Z7iotszB8Xm
	ElkQ==
MIME-Version: 1.0
X-Received: by 10.182.126.40 with SMTP id mv8mr10855980obb.67.1439618753863;
	Fri, 14 Aug 2015 23:05:53 -0700 (PDT)
Received: by 10.182.111.166 with HTTP; Fri, 14 Aug 2015 23:05:53 -0700 (PDT)
Date: Fri, 14 Aug 2015 23:05:53 -0700
Message-ID: <CAOLEWZW_2DMvuxsaoKXxtQpg_Qy5=rVutJaOB9Lpnjqrpo6A9g@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [PATCH][meta-fsl-arm] 2.6.35 kernel build error with perl 5.22
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
X-List-Received-Date: Sat, 15 Aug 2015 06:05:58 -0000
X-Groupsio-MsgNum: 56713
Content-Type: multipart/mixed; boundary=e89a8fb1f7646fd2da051d535c0d

--e89a8fb1f7646fd2da051d535c0d
Content-Type: text/plain; charset=UTF-8

When building fsl-image-machine-test for imx28-evk with n00b defaults
using the fsl-community-bsp repo manifest thing, it fails on the old
kernel in meta-fsl-arm/recipes-kernel/linux/linux-imx_2.6.35.3.bb.

There are a few things questionable/wrong here:

1) It uses the build host perl, which is why it fails here and not in
the upstream builder.

2) The dts file for the evk machine in 4.1 mainline looks complete
(along with several other imx28 machines) so why does it default to
such an old kernel?

3) Switching to newer kernel makes gst-fsl-plugins fail with the
"looking for kernel headers from user space" error because it can't
find the old framebuffer header (mxcfb.h).  It should depend on old
fsl kernel only.

4) The old kernel recipe should depend on perl-native.

The attached patch fixes the perl error in the the old kernel build
and the above test image completed fine with it.  Not an "official"
patch per se, just useful if you're stuck...

Steve

--e89a8fb1f7646fd2da051d535c0d
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001_fix_kernel_timeconst_perl_array_error.patch"
Content-Disposition: attachment; 
	filename="0001_fix_kernel_timeconst_perl_array_error.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_idcky4he0

ZGlmZiAtLWdpdCBhL2tlcm5lbC90aW1lY29uc3QucGwgYi9rZXJuZWwvdGltZWNvbnN0LnBsCmlu
ZGV4IGViNTFkNzYuLjg5MTU0MTkgMTAwNjQ0Ci0tLSBhL2tlcm5lbC90aW1lY29uc3QucGwKKysr
IGIva2VybmVsL3RpbWVjb25zdC5wbApAQCAtMzcwLDcgKzM3MCw3IEBAIGlmICgkaHogZXEgJy0t
Y2FuJykgewogCX0KIAogCUB2YWwgPSBAeyRjYW5uZWRfdmFsdWVzeyRoen19OwotCWlmICghZGVm
aW5lZChAdmFsKSkgeworCWlmICEoQHZhbCkgewogCQlAdmFsID0gY29tcHV0ZV92YWx1ZXMoJGh6
KTsKIAl9CiAJb3V0cHV0KCRoeiwgQHZhbCk7Cg==

--e89a8fb1f7646fd2da051d535c0d--
