Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PmYCd-0001nJ-Cs
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 22:00:55 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p17Kxp3H008401
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Feb 2011 21:59:52 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon,  7 Feb 2011 21:59:51 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
Date: Mon, 07 Feb 2011 21:59:51 +0100
In-Reply-To: <AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
	(Khem Raj's message of "Mon, 7 Feb 2011 11:33:49 -0800")
Message-ID: <ly39nzk1bs.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 21:00:55 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

>> The '-mcpu=cortex-m3' is shorter than '-march=armv7-m -mtune=cortex-m3'
>> and enables workarounds like '-mfix-cortex-m3-ldrd'.
>
> Does -mcpu=cortex-m3 also cause gcc to tune for cortex-m3 ?

Yes; logic in gcc/config/arm/arm.c is:

|    if (i == ARM_OPT_SET_CPU || i == ARM_OPT_SET_TUNE)
|      arm_tune = (enum processor_type) (sel - ptr->processors);
|
|    if (i == ARM_OPT_SET_ARCH)
|      target_arch_cpu = sel->core;
|
|    if (i == ARM_OPT_SET_CPU)
|      selected_cpu = (enum processor_type) (sel - ptr->processors);

'-mcpu' causes the highest optimization level (both for the used instruction
set (--> '-march') and the "soft" optimizations (--> '-mcpu')).



Enrico


