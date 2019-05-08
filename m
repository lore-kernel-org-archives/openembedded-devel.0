Return-Path: <troth@openavr.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED5DA7DE56
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 15:15:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o4so27728016wra.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 May 2019 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=openavr-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iDFYgmG/aFAgAntAyXXzTIADAOf5d4d9185YeMy5/oY=;
	b=XA3vmAMvWSMhi20r7RWxs18XVppFkloRoTmEQtfNqcTbZvS7w40aq//JKNJ09KRnxG
	ksJpVN+GN9cgoP6CEwbJPLPnPJOBtBFmRiPjtSsI6i/ttrV05n4boj7ebjOU672PseZN
	7fMR23ky+eSYhV9is8BTif5ed9KyiDAg3nfHsGOM4v/hr+Im6Nt9WgWdnDEDiAbZbdhW
	P7dKGXPJxi/22Bd6hnT3X+Nk7b86o5c/dChJYmgo9HjRsifq6puIDBSE78DkuBqnIrTH
	ndpaWnpEiBnLNjwIKPi/EgZjiKBn8lLOfggA1ZMDSbxZ9a7EzIwgnnXH79bSvjBluR6O
	3Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iDFYgmG/aFAgAntAyXXzTIADAOf5d4d9185YeMy5/oY=;
	b=GED449bG/nc2iJOd6nWHNoFaQT/CzrOw3cgITGWS5bfTXc3T3Y6Ga6K94hazeScUt7
	EaenOHz0z/gkhookxxclJy6YpxslZj+HOwpojfdNZp9w9yXX4EJx0idxmpalXC3RI39Y
	LJor8Qh/3lXDgXGPwlPSeiKprc00NpGntflK6kwYpIpIDgVyYutXeCAQA+DiYFcQvle+
	Z8RbB00cs2hxHdU6T6YYU7FRNUrD4WU/TE8SahiGMTzHHLl5pC59LrL+AbmpX7qklnBV
	qynFBHJeIYak1bYilHup4RLGA0O4VlrZ1Ozk2wKC3Jg1nyU2D3s/pkq8wiRLZVXuz82J
	ECQQ==
X-Gm-Message-State: APjAAAV8ijxRz+nsO356JcOytx4bH/SyZD/So39khcbtLec7km4BdUYB
	2eaGzcJ9KMOSdJPN9sbHQvfLSrcUyWMOnQz8WkJyhg==
X-Google-Smtp-Source: APXvYqyfhb+7q5qsF0CTZ9YqQg3IJz9aWNssPBjDz+dEK6udJvyLlQmhAZzWIziiXf6LajjEtJ31+ScunTTuR5bBHvw=
X-Received: by 2002:adf:d081:: with SMTP id y1mr21906929wrh.283.1557328523540; 
	Wed, 08 May 2019 08:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANr77M3b823R3tNGvTHvqU-F6TfFxbioiHzM_cBhx+XjbJ02Vg@mail.gmail.com>
In-Reply-To: <CANr77M3b823R3tNGvTHvqU-F6TfFxbioiHzM_cBhx+XjbJ02Vg@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Wed, 8 May 2019 09:15:11 -0600
Message-ID: <CAFMvBt191mfPoLK6bGi5MO6h9tCqUqpYYZMtLuFE3vGK-50QCg@mail.gmail.com>
To: Matthew Stanger <matthew_stanger@trimble.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Google protobuf-native doesn't install support .proto's in native
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
X-List-Received-Date: Wed, 08 May 2019 15:15:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 1, 2019 at 9:04 AM Matthew Stanger
<matthew_stanger@trimble.com> wrote:
>
> `protoc` sourced by the standard Yocto SDK will fail to import "well
> known"  supporting protobufs.
>
> Steps to reproduce:
>
>    1. Generated SDK with `protoc` via `DEPENDS = "protobuf-native"`
>    2. Source SDK & run `protoc *.proto --cpp_out=.`

This is not a problem with the protobuf recipe, but in how the SDK was
configured.

I just need to make the following changes to our image's bbappend file
and all of the
protobuf headers were properly added to the SDK we are generating

$ git diff
diff --git a/recipes-core/images/core-image-renew.bbappend
b/recipes-core/images/core-image-renew.bbappend
index 5d75531..198526f 100644
--- a/recipes-core/images/core-image-renew.bbappend
+++ b/recipes-core/images/core-image-renew.bbappend
@@ -1 +1,2 @@
-TOOLCHAIN_HOST_TASK += "nativesdk-protobuf-compiler"
+TOOLCHAIN_HOST_TASK += "nativesdk-protobuf-dev"
+TOOLCHAIN_TARGET_TASK += "protobuf-dev"

Once I built the SDK with that change in place, the project using
protobuf during build
had no problem building using the SDK.

Ted Roth

