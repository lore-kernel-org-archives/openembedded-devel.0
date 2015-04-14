Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-vn0-f43.google.com (mail-vn0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDED65CAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:50:39 +0000 (UTC)
Received: by vnbf62 with SMTP id f62so26496761vnb.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 19:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2TU/GSq2zXggaqLJeSb5AmhGQ8Mt6rIS/HNEvFCFKK4=;
	b=RPy/rJ395U6veh4L9oFq5HyHauLSmwUrK3Rz+AK4mQmS3rI47M6OChQgsd0VKTynkM
	Hj1oUwtmxIM1ahVeWc0POV+/VqS5LrtTcULiwDjOydH37SWQ7ZNWGxq4K3170zL3m5H9
	dFpVp0Hs2GfXBIBwrxUrQVM9jteM2sk2Vf6Rknhv733JbXTUVOO4Zo06ikGtcuLYJueD
	cQKXDwPg6O9NlOUNgupd3Odu0StgJS8wppHcF2fitsg3J2oxFlKOmF2OTMVH65rL/c+j
	FUmuxvGvnBC0Vz00RuMzODI+f1N7usUNgQQa0CVVHJO95hYPUmWOtxZlOWh+yyKAs4vQ
	yy9Q==
MIME-Version: 1.0
X-Received: by 10.202.182.136 with SMTP id g130mr9611365oif.94.1428979841047; 
	Mon, 13 Apr 2015 19:50:41 -0700 (PDT)
Received: by 10.202.194.136 with HTTP; Mon, 13 Apr 2015 19:50:41 -0700 (PDT)
Date: Tue, 14 Apr 2015 11:50:41 +0900
Message-ID: <CALYKT1jjYnB0YQ8Lcc9DScJU9BAFFEZcO00bQk90cYyBu31q5A@mail.gmail.com>
From: "Joh Journeyer J." <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [eglibc] How can I configure eglibc to support extra charset?
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
X-List-Received-Date: Tue, 14 Apr 2015 02:50:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am posting this question on yocto maillist and here because I don't
know on which mail-list I must post this question..

I tested iconv() of glibc and verified that it only supports charsets
listed in the file below:
  eglibc-2_13/libc/option-groups.def
They are listed up under 'config OPTION_EGLIBC_CHARSETS'.

But I need to use another charset, EUC-KR.
How can I enable this extra charset, EUC-KR?

I found a file below :
  meta/recipes-core/eglibc/eglibc-options.inc
This file contains a line below :
    eglibc_cfg('libc-charsets',      distro_features,
'OPTION_EGLIBC_CHARSETS', cnf)

I guess I can configure eglibc with this .inc file.. But don't know how to..

Please shed some light on this.
How can I enable extra charset into eglibc?

Thank you very much in advance!
----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

