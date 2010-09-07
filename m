Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Ot7n2-0001i3-Ew
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 01:41:25 +0200
Received: by wye20 with SMTP id 20so6558235wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Sep 2010 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ZCoMENnQI15PLjT2qww6aj2AmdOsY/Fml54fn/ttS/0=;
	b=bKUD6ZKdKH4xMwtJQETlmicIsVRPocIVOIGk1U0thu8rcrlMqTB51gf4HNDT7Y2dfh
	/F4GhlJ2m2LEWet+X/BVm06TNRzg4Xc40lmY2V0IEAGAyavQLnHsu/r6ARVNn1qmQEZC
	FoKhGH/pFProIQXau0kRvEwWvGZO4ncWqdOEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=W7oQO4TZsFPtgcxFFZZVCR+msm3ITq7XM4cOvjuOW6WSEo9KRVosF+WU039Xw7AbEE
	QLlzu6b7PJRDcRE0poG1p1wxwotabgAiJd/Z0PFd82aJiJjJBQgwpdNDhCGRk0H/jSyi
	ACtkWE6UKZPIZilQOx8igomp0q3qkUIA3cnHg=
MIME-Version: 1.0
Received: by 10.216.157.13 with SMTP id n13mr3744674wek.35.1283902842707; Tue,
	07 Sep 2010 16:40:42 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Tue, 7 Sep 2010 16:40:42 -0700 (PDT)
Date: Tue, 7 Sep 2010 19:40:42 -0400
Message-ID: <AANLkTi=H6oMWDysJdxA+AsRvYLRxTqRZFBJz+1qVKuf-@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libsegfault on ARMV5
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
X-List-Received-Date: Tue, 07 Sep 2010 23:41:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm trying to use libsegfault to log any application faults.  On x86
it works great:

Backtrace:
./src/svs(_ZN7Mapping22mapping_control_threadEPv+0xa2)[0x81badf]
/lib/libglib-2.0.so.0(+0x67b84)[0x7f87e6266b84]
/lib/libpthread.so.0(+0x69ca)[0x7f87e53489ca]
/lib/libc.so.6(clone+0x6d)[0x7f87e43ae6fd]


But, on my PXA270 system, it only provides:

Backtrace:
/lib/libSegFault.so[0x400275cc]
/lib/libc.so.6(__default_rt_sa_restorer_v2+0x0)[0x4105e9c0]

I'm running: libsegfault - 2.9-r36.3.5

Has anyone else successfully used libsegfault on ARM built with OE, or
have other ideas on how to accomplish this?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


