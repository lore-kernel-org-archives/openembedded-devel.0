Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SbRJf-0007m8-SW
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2012 09:03:03 +0200
Received: by eekd49 with SMTP id d49so1404005eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2012 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=LachtUkdbT7Ehf8jsXl8IM8gLFkpmk+x9QghI75MxhM=;
	b=EWrHhP1wGBd3dW7jGlTWSG3IjYqkLVSVOKFijwpzJnbLSb2Tpu2QkSLBYvy7sa1shI
	pkfuu46aIEuiJFph+qcq4h+gk4tApDETB3AGor94+PLbJWFzy9WrVFhywMi4ctZ4fzDB
	T/qfjUeMOhuWCStXPdapeoAcu19kfFT1EEN+uAHo0Gt3o/q/5zKgqYu4+IrZD9cNlrtx
	VdIAoHwq7GXO1UX7y1abDo+3P4abnEVyo2oIiCKacJrFdALF+E1mh68sWQqMbJNyBKuL
	dAgWge2HVAP8HosT6GZsDXVSnj2turc9J1Xb4PAyhPpjvsLlKyRFUWETtrHM6aBTK8NH
	eqZA==
Received: by 10.14.127.198 with SMTP id d46mr4985484eei.101.1338792758249;
	Sun, 03 Jun 2012 23:52:38 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id t3sm33669153eeb.15.2012.06.03.23.52.36
	(version=SSLv3 cipher=OTHER); Sun, 03 Jun 2012 23:52:37 -0700 (PDT)
Message-ID: <4FCC5A7B.8040204@gmail.com>
Date: Mon, 04 Jun 2012 08:49:31 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120502 Thunderbird/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: gcc-crosssdk-initial can not compile. Get message: this target does not support --with-float
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
X-List-Received-Date: Mon, 04 Jun 2012 07:03:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi.

When trying to compile meta-toolchain, it crashes during
gcc-cross-initial with the error:

this target does not support --with-float
Valied --with options are: arch arch_32 arch_64 cpu cpu_32 cpu_64 tune
tune_32 tune_64

The reason for this is a commit that happened 2012-05-01 in openembedded
core, called "gcc: Grok for callconvention-hard to enable hard float".
Reverting this patches makes it compile, and still I get the
--mfloat-abi=hard when compiling with the resulting toolchain.

I'm compiling on a x64 Linux machine, with the target being a cortexa9
processor. I have the DEFAULTTUNE set to cortexa9hf-neon. What should
the patch do, and what will happen if I disable it?

Best regard
Martin


