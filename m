Return-Path: <fgretief@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6752E6A457
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2013 19:52:25 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id v1so836786lbd.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2013 12:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=m53ncqQzVVY99tzQBtrqdouVyYrYBqnKNgzseUAnE4Y=;
	b=eVBZIp7jojEgXTDyVkNL8n/RMteTc9M+nkdXDE+c3chji38BgYhxkna/jACJpy14wK
	HCw1jwHETwIaHSWfai2auxWiDmZ9XzIcynDdHQpWfJaddMur0v4NvMsJ+cboxae9grrc
	2Y3DKYE8LVWwXcIjBoJPDLa6r2iL/wJI4kT2T5k8iy96odSSxs6/KZujWrPRFO6rPvS5
	yfPX0259nUF5m+c2kNCqFCoUA4UV2jqQBdEwKRBXlkeMd5hOXiVWrDkYW3m7dmfn3jLK
	JkCXrHo5UFb0Twm96s3O+60oU30mgoDHXVSPbBKl1L7By6Hzyjt1mVrjQ7NRbRWj2Z8L
	DkjQ==
MIME-Version: 1.0
X-Received: by 10.152.120.37 with SMTP id kz5mr1456077lab.21.1375818745156;
	Tue, 06 Aug 2013 12:52:25 -0700 (PDT)
Received: by 10.152.37.102 with HTTP; Tue, 6 Aug 2013 12:52:24 -0700 (PDT)
Date: Tue, 6 Aug 2013 21:52:24 +0200
Message-ID: <CAFpw0gJVRD0bYmFCuH=rUtG6fBHJH7eiwzjxOq5R_Wjg5e0crQ@mail.gmail.com>
From: Francois Retief <fgretief@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Building a MinGW SDK
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
X-List-Received-Date: Tue, 06 Aug 2013 19:52:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have been struggling for the last week trying to get a MinGW based SDK
going.

After a long struggle I found that the PREFERRED_PROVIDER for libc-for-gcc
had to change:

PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?=
"nativesdk-mingw-w64-runtime"

I am now at a point where the libc-for-gcc is compiled using the
mingw-w32-crt files, but I am don't know the exact path were OpenEmbedded
want's the libc-for-gcc libraries to go.

Using the i586-linux SDK as reference, it looks like it should be in

${TMPDIR}/sysroots/x86_64-nativesdk-oesdk-mingw32/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-mingw32

But the gcc does not pick up the crtbegin.o/crtend.o files from there when
building the libgcc library.

Has anyone experience setting up GCC for a SDK under OpenEmbedded?

I really need some advice.

Cheers
  Francois

