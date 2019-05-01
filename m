Return-Path: <matthew_stanger@trimble.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 484C660107
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 15:04:22 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id b3so20207262qtc.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=trimble-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=09hEDjtMhQmlshibBYIlKsScRI4rc8sWLuXdgijtZdw=;
	b=iaGi05e4fFzHY5OsLZalHyDIChfe1boVGS+D4APimF4h6ZcKzANWpk3J9xgDzKk65I
	6Jc5h8bvLAq2KJHLyPI+CRr1LS8rrYaug4ZWVTxHeBf+jIsHA+304vDHKxLdpc9/fb76
	UlTJHjVfVtcMs+7ZBRpIN6XX83qu9uS65A2OhBjv7n7sHaHBygdWOntvxvwBpp8MZIoL
	UQ4kYpgmaV0cu4Ko/PqI1iUPHmqpb8UHPfD9nXvBRLh0wJtQc35PEW5ZQgflkrP+9w2d
	+sYtif6JjJFB/S5XARRwhWxm0heC0yh4Z2XsE/gTbEH1A0l7sVIZ8Wu48U6ygXI0qQnc
	ze/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=09hEDjtMhQmlshibBYIlKsScRI4rc8sWLuXdgijtZdw=;
	b=W31xuAOp0+xuddy++67VQH1Qdj4U5GorsPMWZaDf7ww/T2uUDeGoiRg+mZRQ1FJuyV
	VAUMZ8+VlseiSAd/cB7/BF9ZeJXyQgRQBUVQ+qDguXe3cqRaoZdD49wRxk6jk2EdWbkJ
	5BGVPQ/fZZ+Ca80gm1RrP603mRfhjDmFD4myJZUaYw6NJb8qHsAXsbQ7JJZq/9dx69UU
	gWd1/bEvXwnvRwj1Kpe+PdIY1Gi+EkhotBhTBxp4Ci7Qtau9kO+gYv5suI9KkpugV08c
	OSi/GDKVsaKdGFZs9mHJBaoSqUbE75MZkvscA6duGRxu9+jhHW02BOH3QY0H8ewXgSRw
	ldUg==
X-Gm-Message-State: APjAAAUPoIG9ZBeDae6Z8k341tXqBJE0nYomtodfswD6CPiT50caVZkf
	9VbOQmDG2A/2TL3S/HhzhyUcBdSYkKouasG1Y/WBm3dA1Mc=
X-Google-Smtp-Source: APXvYqwkjm0Qmbvi9DumXLHklknp4+cDFT+H64I3QFpFBSy1aY+1hA693yIcumyIjgKNtnOUYiMSAw2Ei9b7dKQpPqU=
X-Received: by 2002:aed:3a04:: with SMTP id n4mr62294515qte.162.1556723062727; 
	Wed, 01 May 2019 08:04:22 -0700 (PDT)
MIME-Version: 1.0
From: Matthew Stanger <matthew_stanger@trimble.com>
Date: Wed, 1 May 2019 09:04:12 -0600
Message-ID: <CANr77M3b823R3tNGvTHvqU-F6TfFxbioiHzM_cBhx+XjbJ02Vg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Google protobuf-native doesn't install support .proto's in native
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
X-List-Received-Date: Wed, 01 May 2019 15:04:22 -0000
Content-Type: text/plain; charset="UTF-8"

`protoc` sourced by the standard Yocto SDK will fail to import "well
known"  supporting protobufs.

Steps to reproduce:

   1. Generated SDK with `protoc` via `DEPENDS = "protobuf-native"`
   2. Source SDK & run `protoc *.proto --cpp_out=.`

Example test.proto file:

syntax = "proto3";

import "google/protobuf/wrappers.proto";

package test;


message TEST

{

google.protobuf.Int64Value test_val = 1;

}

Error:
`google/protobuf/wrappers.proto: File not found.`

The source for `protoc` in my sysroot is
'/opt/poky/2.6.2/sysroots/i686-pokysdk-linux/usr/bin/protoc` however the
`wrappers.proto` is in my build target sysroot
`/opt/poky/2.6.2/sysroots/arm926ejse-poky-linux-gnueabi/usr/include/google/protobuf/wrappers.proto`.

As a hack, copying support files resolved the native run time dependency
issue `sudo cp -p
/opt/poky/2.6.2/sysroots/arm926ejse-poky-linux-gnueabi/usr/include/google/protobuf/*.proto
/opt/poky/2.6.2/sysroots/i686-pokysdk-linux/usr/include/google/protobuf/`

I think the `meta-oe/meta-oe/recipes-devtools/protobuf/protobuf_3.6.1.bb`
needs to also install the `.proto` files in the native sysroot but I'm just
not sure how that'd be done in a recipe.

Thanks,
Matt

