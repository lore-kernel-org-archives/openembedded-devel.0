Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4h63-00005K-Rg
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 00:09:08 +0200
Received: by fxm19 with SMTP id 19so680029fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 15:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bbpgXcwOqh6CnXS33s0jQoElAEsbn5lZGPTnCeZXAXI=;
	b=gAAGpm+FIVq2SccyvF25jaAR/KrE7ZOhacAZXKEHcx50wJXWXXLTNRLVf/tJ4FsJzE
	LHX3atcB4a1ZeNhJdNMXW4XRTxkWTgdJDM8nTQxw8svDRt1Y/oP9F7eAEO0JBpGwma8v
	EO3U2igKivesfcI8+UaW4TLWQ0rKZ8Q1F398Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=BE8mI9s3s4GPH7z/r84C6oaYDxcRLQMq94Un3sewggAcO+8AGqc0A31rDs9EaFj9RX
	hOdRZc3Eh1NtJghJ9nVIyZfkLDN1HzvTpzyo8fnIoz+9wep8Vi4VeLOPzWOiSaPkbWRI
	aJOgtaqIMsNo2FWNcLZEbfsKQkZrqPO8uLhVQ=
Received: by 10.223.94.129 with SMTP id z1mr378272fam.144.1301436426080; Tue,
	29 Mar 2011 15:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Tue, 29 Mar 2011 15:05:50 -0700 (PDT)
In-Reply-To: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
References: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Mar 2011 15:05:50 -0700
Message-ID: <AANLkTi=hmv+5ROYN2NH_0MA_TM_5cyybj4n_VdiG=pR-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: do_compile of gcc-cross-sdk-4.5 fails with -mfloat-abi=hard
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
X-List-Received-Date: Tue, 29 Mar 2011 22:09:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 29, 2011 at 6:33 AM, Julian Pietron <julian@whisper-net.de> wrote:
> Hallo,
>
> I encountered a problem on bitbaking meta-toolchain for a Cortex A8 CPU with
> hardfp enabled. I'm using a modified cm-t35 machine which enables
> ARM_FP_MODE="hardfp" to enforce using the hardware FPU. Up to compilation of
> gcc-cross-sdk-4.5 everything is fine, but the build process fails on linking
> some files to libgcc_s.so.1.tmp, please see attached log.do_compile for more
> information.
> Currently I'm trying to build with ARM_FP_MODE="softfp" to see whether the
> problem persists, but I don't think so as it seems to be related to the VFP
> instructions. My guess is that somewhere in the build process the
> TARGET_CC_ARCH flags are not applied where they should have been applied.
>

Only if life was so simple. We do not support multilib in OE which
means the default multilib becomes
all more important since thats what we will build and link. So it
seems that the default multilib for gcc
runtime support is still soft-fp and hence the problem. Please send
your run.do_configure as well as log.do_configure
and lets see whats in there



> Thanks for your help,
> Julian
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


