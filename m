Return-Path: <sujith.h@gmail.com>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 183D977332
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 13:05:51 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id f9so27429132otd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2017 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=REx+P1J1jApd0tYC55UmbUJ112bMjar33g4e8o9uDjg=;
	b=jYFbVwUyrat208kLuDvR+LpV5QRXKZs+29RbGsUIWU9zK+hkz3WRlFio+heA2mHkS9
	RC/Js5hYa9mb++GHvsetLn+XTsh7iCf0NInp2zYxZB+0f78v5F73ndQBN2SLgmrcet0l
	vbIMcki8Q/6rfJyCcLS2B2VKtGtj7B6xLCOVqnE95iwWR5h9Ttr4/KNr+GxdtKHgn8LT
	ph6mE6mpf8+HE7xIyoHWxiHsfymps1UryShddhNUITwqlKv27n1u2gxKFumetJjZJSSt
	P1VTKxBmg07UcqZyConDlw1Dy5yVVU6Dtsv8ZUOqiTk5pf44pOh+KEfDEvKu8IFv+QO4
	Uv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=REx+P1J1jApd0tYC55UmbUJ112bMjar33g4e8o9uDjg=;
	b=AwYAIVMNnQX4G2pO9eaK2edLxgo31Gt07qZ/BYzJG1kfhU2kP3ZAubw/1/GUBf3PAS
	ACajYwy0noxD4QH41H5cHZwRVD6Y1Juojjv/gU6lwwff9ijhr6dWVs2tQYs9OMnulQrm
	FkrsQXZke2A7CSCa/uYxR3Lg/HsyN/EQlWyTDutZUQe+8GpnJwQXYvggwKORiMNPkBgb
	qCSxxywQZcv37xp5KwrJkqk8lf8r2KGH5c3W2bqeDMxntPaTSxiDA1GwF8ItECZO7Qn/
	3ZliJx9wSE4KhRM1YmLqO1uvq2j+4BkfqXJMnVqlgb9R3Y+S16iP/s4um+tYKK00ap/l
	fKnQ==
X-Gm-Message-State: AMke39lfQ7OMMQSz9sms3T1biMEUJgOMhWlpb82BoyUqsRc6oxhAN/D2tb8F1V//LNa3s2g0Q8boMuVk6EYdNw==
X-Received: by 10.157.47.234 with SMTP id b39mr4531705otd.0.1486731952039;
	Fri, 10 Feb 2017 05:05:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.67.210 with HTTP; Fri, 10 Feb 2017 05:05:31 -0800 (PST)
From: sujith h <sujith.h@gmail.com>
Date: Fri, 10 Feb 2017 18:35:31 +0530
Message-ID: <CADyYWLn3C_SBJ-t0fJe1kR5-+VE46dYcGcedeA-_3wafAvYnWQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Query regarding segmentation fault for Qt5 opengl examples
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
X-List-Received-Date: Fri, 10 Feb 2017 13:05:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to use poky master + meta-qt5 ( krogoth branch revision :
2ae48d180aebf5bf5137a1828765d41198b5ab1a). I have made the changes to the
local.conf as mentioned in "4.6.3. Using x32 Right Now" from
http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html. Once I got
the core-image-sato built I installed the qtbase-examples to the target. I
noticed that except contextinfo examples all other examples in opengl
directory are failing with segmentation fault. Can any one help me with
some pointers regarding the failure. If so that would be great.

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

