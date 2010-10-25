Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PASq6-0007fs-RT
	for Openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 21:36:15 +0200
Received: by gxk22 with SMTP id 22so2452224gxk.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 12:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=2OSYfgAm6cmPkwiefUsct/L+x4u1A7NbS3eNXJOMXU4=;
	b=UaMlD1y3b7wjCzWU6C3JaDMYCRpa0NYTp0Ujj/2hW2t43p2FW1k0nIQYW58gcDCwmY
	SF+1IOb1G1Vylox/Ak+KSoChGqlLY0MWXkXNSI/2QLBE7TG24PDMdBYnhzaGLll+cCS5
	r19pzQKHvjp5P1V2qTGlAaM8vkcNu36IbZ8WA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=XNMyivCBZ03cFRop4uYAKCVdxlDoIMowrB3PTp9R6VvWDzd0xIxgsiks47XKQ0y8IF
	gdiH9cuQ3NU/CRoBm/lvgQPq2cdt56+4hcGQIbxRyrxSCV+PlEpPPlLN2FD8E2KRTN24
	IdH6Xw1l9KZP33yOrumhQhrXA2QrFPpjq7at0=
Received: by 10.42.12.129 with SMTP id y1mr1558116icy.185.1288035326653; Mon,
	25 Oct 2010 12:35:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 12:35:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Oct 2010 12:35:06 -0700
Message-ID: <AANLkTinX1z+MA6H8Y4FkQ3Mv1Nd0i_V8gnPUzPpczGHv@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Error when building ti-codec-engine-2_26_01_09-r90a for beagleboard
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Oct 2010 19:36:15 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I encounter the following error multiple times when compiling ti-codec-engine
I am using minimal distro.

| config.bld: Running the version from Codec Engine Examples.
| js: "/home/kraj/work/oe/tmp/work/beagleboard-oe-linux-gnueabi/ti-codec-engine-2_26_01_09-r90a/codec_engine_2_26_01_09/examples/ti/sdo/ce/examples/buildutils/Platforms.xs",
line 75: TypeError: Cannot read property "1" from null
|     "/home/kraj/work/oe/tmp/work/beagleboard-oe-linux-gnueabi/ti-codec-engine-2_26_01_09-r90a/codec_engine_2_26_01_09/examples/config.bld",
line 138

here is complete log

http://tinderbox.openembedded.org/packages/884376/

Any insights? Does it need some download voodoo

-Khem


