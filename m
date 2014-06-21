Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id A01496FE83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 14:43:55 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id el20so3011049lab.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=u3VwAromsy6/GUEULBRFqpDwcQisimGLqxrjFQKGoT8=;
	b=fAHPhX+cRdwyy1oso6mMHVXJyG3wmY64JssIIvhLsSMFJRlS2nIhWdxGi6N5n5wjKt
	+eTSe+1/NM7h32zoDtuUrp6MiA1rXnivWgfOmi67bIUBzKmhiJ3bKMCsp7yjvZ0o+Kea
	Dti0Zmbss6unJttoarYOdTibYQNimLItiy1CTQTTPmWps0EWMKSv3Jmp6dU9uzEQscbO
	3iNvt6G/9PQQZeHh21YJgm6gP3lt6Hyh1gaoJkXng0oa2qaLGbzkB5wbZp6arlPuFuKH
	f0VEr67Z2sDK4Rrq7/UFHZCwY7/vWJO0pxb/ik/uYrGVkQUfPupypKDFLg2AtQkDdE15
	8YAQ==
MIME-Version: 1.0
X-Received: by 10.152.20.168 with SMTP id o8mr1516136lae.78.1403361835718;
	Sat, 21 Jun 2014 07:43:55 -0700 (PDT)
Received: by 10.112.138.7 with HTTP; Sat, 21 Jun 2014 07:43:55 -0700 (PDT)
Date: Sat, 21 Jun 2014 16:43:55 +0200
Message-ID: <CAPbeDCmet+fhPW73ieaMD9eJWeva_bQ+c8DVhiKtAAxoXzhC+g@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] moc.exe in win32 generated SDK
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
X-List-Received-Date: Sat, 21 Jun 2014 14:44:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Continuing my adventurous road in getting Yocto to create SDK's for the
Win32 platform, I've now stopped to think about what to do with moc.exe
(and perhaps qmake.exe).

I did try building nativesdk-qtbase with SDKMACHINE=x86_64-mingw32,
however, not to my surprise, the build failed. Right now I just need moc.exe
in the SDK.

I guess I could try just downloading an official Qt build for win32, and
putting
moc.exe in the SDK, but I thought I'd ask the mailing list if anyone has a
better
idea ?

Regards
Jacob

