Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUh0n-0007Fk-LD
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 18:23:41 +0200
Received: by eekd49 with SMTP id d49so265889eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 09:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=agRL+95jY7PTyAdzYUaxKLflntn62SEVkftfXX/0Ly4=;
	b=vMkhmao9T8+ln6Gi7Q6qZMerP8V9roQrbhr7pXriMp1JbuxNx3f78emZzaFxbBm3Uz
	kkY7May+Tr2fhX3Kr0j6leKFpcEuQoa1LW+QeHB6b+PBTe+vOXDSi0M0cTsEW2ZzCtDD
	clr3DmM6xPH82+gxC7RhWwiRM6fPDCTA592ctGTgiMbby5jBzqalA5SevgD9YD9xWlNZ
	0fhLtyRfIktIz8G1sHmKsQTz0exSQtFA9CH7S3FJIxaHpCYmk4Q/4uwHJWu7vWlnxUDP
	dvwXkZPpvOQsuht4tRtHOrG4d04Y5UcJtE34xes4JjuS17RtrfR6n4EfIb+8tRPPZIvu
	tHZg==
Received: by 10.213.28.3 with SMTP id k3mr746146ebc.141.1337184820227; Wed, 16
	May 2012 09:13:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 09:13:10 -0700 (PDT)
In-Reply-To: <CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
	<CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 09:13:10 -0700
Message-ID: <CAMKF1soncwH-xM=3Q0Qh2W8gxE7-s0CWt9s8p1_g2mjXUxMG5A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
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
X-List-Received-Date: Wed, 16 May 2012 16:23:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 3:50 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
>
> Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
> support.

how so ? can you stick with denzil stable branch if you so heavily depend on 4.5
and meanwhile let the software stack for these SOCs ported to newer gcc
or is there anything that you absolutely need from master ?


You only get a heavily patched 2.6.37 kernel from TI for
> these (linux-ti81xx-psp_2.6.37). Unfortunately gcc >= 4.6 is unable to
> build a kernel which boots for these platforms. After
>
> Uncompressing linux ... booting the kernel
>
> there is silence. We can reproduce this reliably on a ti8148-evm
> development board. My best guess is it's because of an ancient kernel
> being compiled with a very recent GCC.


