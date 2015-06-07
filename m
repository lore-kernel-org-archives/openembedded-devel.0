Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5FA60089
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Jun 2015 00:24:37 +0000 (UTC)
Received: by payr10 with SMTP id r10so71272600pay.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jun 2015 17:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=TkZsRU2XLopKRUZnEKVmrQUpiy5BN9cdBDymC4YXTqk=;
	b=uGFNKf92i08bTlcVTSvHIa8vOPYFzy8/FWMxXA31Me2LFiXJxV6iBSH0HtbMdrL6I+
	6UEx/e35whXqbvscKgIOLZ1klmB3xs0hUDOnRWW/3Wkt10iLrIY4OVLuI6a59K2jSxhV
	LI09sEzttfUFCY87DYSo5oGlMeOaGqkHG53Hw4CyOlxtPlzzp1QFCUQhNvWsKJd1hNhk
	FV102biBZFYcFnrCE2mXLZR/qrny5bm5BW6NdRNh3CuWSTuxaOJhSXbOKRendBWSSQwK
	MmlNwYxTVSwlTbfcETIDdlCaRceCnTvLkt2y44+b2LYk6wECL9iOaqNpos2gtJzZinFQ
	2p2w==
MIME-Version: 1.0
X-Received: by 10.68.198.36 with SMTP id iz4mr17512517pbc.167.1433636679020;
	Sat, 06 Jun 2015 17:24:39 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Sat, 6 Jun 2015 17:24:38 -0700 (PDT)
Date: Sun, 7 Jun 2015 02:24:38 +0200
Message-ID: <CALbNGRQg=_5U+2Mf6B=sHhAXbFRyesWKKv2Ow9x0ajWuX4zXHA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] What am I missing with qt5-opengles2-test
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
X-List-Received-Date: Sun, 07 Jun 2015 00:24:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

to gather information regarding my BPS's Open GL ES trouble I tried to
run qt5-opengles2-test: it segfaults.
To check why it does so, I added qt5-creator to my image, cloned
qt5-opengles2-test and compiled & debugged on target machine.
Result: qt5-opengles2-test segfaults in qtsensors /
qtaccelerometer.cpp / QAccelerometerReading::x().

I think I don't have accelerometers on my board and therefore the
variable d containing accel info is not set.

So if anybody has run qt5-opengles2-test successfully: Let me know
what makes the trick

Andreas

