Return-Path: <ryanelkholy@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id A98E262133
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:53:41 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id l20so1171118igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2016 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=N10Be3FN4CQkTaSFkp8qmWj7auIm6dRU+fSwYraD4U0=;
	b=aKSr47NG0u66dIdWGZEnmhQ1PkE6IOrNbdlD2kmuWMRIKlOE4ZfLRBXJN0HSVXHiLd
	0dsEXAmdiu65NV26b3r6Ni0PR3qgfHNEZisdRBB83cGe0fwZjLjWRmA/lP8pgbtgVjFz
	qfFjGbAPpNfvnp9Mq7FijyDs/w6VVautLgU2IbswRQNU9MOEpbfPm2NWdhYSuAaPsQaS
	pxJBnsERa3VPHihghWJp3MLz6Z13kCNzVhlZBQVVEQFQw3Xmqz+Q04QyZS/fpJGpp7qA
	VJUiT/9LnqKsrZmj/qi3SCFvTYGc5PVtjPpF2cmJpxFyMvxeh0aB4/G7T9OsU1j+/QOf
	gVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=N10Be3FN4CQkTaSFkp8qmWj7auIm6dRU+fSwYraD4U0=;
	b=aA10RjheWC7gTrEk8jqTxq6Vr5RmwUq6AsJGXm59kEwh8VKGZK8ut3/96OvxuCqZEL
	V5NlNMXNHy/hFu40M0ZMCEoZteX8IxHryaa99c2EqpD2q6RX5hsxcf5p0lLtj6RlBgO9
	UBv4KJuKMPjs/kKLcjGRLlLtvpU9ehyUjTX9nk849JO2swONz/OQ4kGljZ2ybtRM6XI0
	ipgHPrHhL6DV3+nWOp9qLe2n0+Isz3EWHIickX/eZOaLGRmiP4wh8Skz2UQWsukXrM5E
	oYGi2CqgmTDnwHB3DKnnbStSZkG06djpJ+nVFf3XYm80QAUxm2OEwfMnkvBcbs3F0Enh
	OhmQ==
X-Gm-Message-State: AD7BkJI264ursrjvlKgsFcpPzls7dKEmhUspLZb5Ymvcf5z7CpwjsHvKoYBjxYASM52Jl8hjFsYZ8SE/SoCUjg==
MIME-Version: 1.0
X-Received: by 10.50.67.83 with SMTP id l19mr11960766igt.42.1459205621995;
	Mon, 28 Mar 2016 15:53:41 -0700 (PDT)
Received: by 10.64.69.138 with HTTP; Mon, 28 Mar 2016 15:53:41 -0700 (PDT)
Date: Mon, 28 Mar 2016 18:53:41 -0400
Message-ID: <CAMZfsd4PxWBWMw0BKLOF3n_AtxH6YWBakY7_u-N9P7FrMZuCWw@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] qtsvg build failure when building meta-toolchain-qt5
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
X-List-Received-Date: Mon, 28 Mar 2016 22:53:42 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am trying to build meta-toolchain-qt5, however qtsvg_git is not able to
compile due to the following errors:

/home/ryan/development/poky-build/tmp/work/corei7-64-poky-linux/qtsvg/5.5.1+gitAUTOINC+b5d689eaaf-r0/git/src/svg/qsvgtinydocument.cpp:102:
error: undefined reference to 'inflateInit2_'
/home/ryan/development/poky-build/tmp/work/corei7-64-poky-linux/qtsvg/5.5.1+gitAUTOINC+b5d689eaaf-r0/git/src/svg/qsvgtinydocument.cpp:129:
error: undefined reference to 'inflate'
/home/ryan/development/poky-build/tmp/work/corei7-64-poky-linux/qtsvg/5.5.1+gitAUTOINC+b5d689eaaf-r0/git/src/svg/qsvgtinydocument.cpp:157:
error: undefined reference to 'inflateEnd'
/home/ryan/development/poky-build/tmp/work/corei7-64-poky-linux/qtsvg/5.5.1+gitAUTOINC+b5d689eaaf-r0/git/src/svg/qsvgtinydocument.cpp:135:
error: undefined reference to 'inflateEnd'
/home/ryan/development/poky-build/tmp/work/corei7-64-poky-linux/qtsvg/5.5.1+gitAUTOINC+b5d689eaaf-r0/git/src/svg/qsvgtinydocument.cpp:149:
error: undefined reference to 'inflateReset'

I have found that the undefined references (e.g. InflateInit2_) are
supposed to be defined in "zlib" which is included in qsvgtinydocument.cpp.
I further included zlib in my IMAGE_INSTALL_append under local.conf, but
nothing is working.

Does anyone know of any solution to get rid of these errors?

Thanks!

