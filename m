Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PD9e1-0004qO-Pg
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 06:42:54 +0100
Received: by wwi18 with SMTP id 18so683590wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 22:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=DrmQ4UnBv9z8BwuMcV7z/w2dS77lUb/pAETqKvfJvcs=;
	b=aSSpkAZuEpf1CrrnEMSH93Mz5FWwins/3QVhSjWn5qQnFoXsvSfPCZYO85Sw5VDfxC
	bAn0ZB4mKawKYPUk68OpS0a4k5AQ0gMdOdovC2XWh+cu3M4lGdpkJV4f5RWyCJQsPvMj
	rQYyZbEbBHBDUVbpIcWZSoND9Y1RVkXq57k9I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Px++a5wuRVXHSWOC5J6G553l1Q3VPsi4JBX3CpNeh9oX0WEB5MgEpJpf57FZMTqGou
	rx3wiSP4CdKRRE2YemTV+kOV2Vt1k1I1irC7vG7NUCVw69xhmF+TiBtpZ9nyGbdbtq13
	5cG2otytvmDddWMybKDO18oAfTgkQtax7eaEw=
MIME-Version: 1.0
Received: by 10.227.135.9 with SMTP id l9mr9362748wbt.49.1288676524362; Mon,
	01 Nov 2010 22:42:04 -0700 (PDT)
Received: by 10.227.37.205 with HTTP; Mon, 1 Nov 2010 22:42:04 -0700 (PDT)
In-Reply-To: <AANLkTi=s_Y6MVx9cVtqHyp5hfgJz9i=UdpoVb-4OhtyN@mail.gmail.com>
References: <4CCF64BD.4090500@gmail.com>
	<AANLkTi=s_Y6MVx9cVtqHyp5hfgJz9i=UdpoVb-4OhtyN@mail.gmail.com>
Date: Tue, 2 Nov 2010 16:12:04 +1030
Message-ID: <AANLkTimu+7ZwbtYDggSa115V-ZvQU54kJ5+f8kyKEGzL@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-cython_0.13.bb: Add python-native to DEPENDS.
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
X-List-Received-Date: Tue, 02 Nov 2010 05:42:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 November 2010 15:13, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Nov 1, 2010 at 6:09 PM, Graham Gower <graham.gower@gmail.com> wrote:
>>
>> /mnt/oe/tmp/work/x86_64-linux/python-cython-native-0.13-r0/temp/run.do_compile.28826: line 927: /mnt/oe/tmp/sysroots/x86_64-linux/usr/bin/python: No such file or directory
>> FATAL: python setup.py build_ext execution failed.
>
> hmmm what happens if you just add python to DEPENDS instead of python-native ?
>

That would probably work too since python depends on python-native. Is
this preferred? I can't tell if this app requires python itself, or if
its just the build system that needs it.

-Graham


