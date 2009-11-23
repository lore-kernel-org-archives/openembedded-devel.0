Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NCdtq-0002rO-4a
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 19:44:37 +0100
Received: by fg-out-1718.google.com with SMTP id d23so2282717fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 10:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=AAQTd7+mY6CwC1UdYF3tsdjJqi2lxss4744mQITbbts=;
	b=hksQaMpV8eTAPkLuxdaTWaCMb9id764dElXtdx33uqYH866DTd8iVBHDxtNF5l26s9
	pkDUmu2Ns+hyfAk0N9ppoQsW80oT6qfG5WdwHEfcmQPCl3XtWSgvf0W4hhL9mfMEF1sy
	nifVrnVkVpyuTW88LKi7m/Srvf/S3OtgiGNUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RKYJbABfYd6dQPxH891qsN9BrXa4neGOgrqkENIL0qgmd1ZAUBneJ3mIlfzAxO5xj1
	2/1ioRKtfo7i9cqT+qieJ+wMCM3RWklq6oQwCcJ+uJ8SHS0qB9zUcHUTLo7NVGIBoVJY
	+z7C8zivrxsvC9kRLo5bm/pcmMflV/IFYT5Yc=
MIME-Version: 1.0
Received: by 10.239.139.154 with SMTP id t26mr604483hbt.74.1259001788045; Mon, 
	23 Nov 2009 10:43:08 -0800 (PST)
In-Reply-To: <1259001133.10321.140.camel@dax.rpnet.com>
References: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
	<1259001133.10321.140.camel@dax.rpnet.com>
Date: Mon, 23 Nov 2009 19:43:08 +0100
Message-ID: <c384c5ea0911231043h75ae7402me61d82d90b8234bd@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what is the expected STAGING_INCDIR for cross packages?
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
X-List-Received-Date: Mon, 23 Nov 2009 18:44:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Richard,

On Mon, Nov 23, 2009 at 7:32 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2009-11-23 at 18:25 +0100, Leon Woestenberg wrote:
>> what is the expected STAGING_INCDIR for -cross packages?
>
> Where is this used and what kind of problem is occurring?
>
It's in binutils-cross.

I'm adding a new architecture (nios2) which has additional staging
steps in which it brings out a few binutils build-host specifics,
in order for the following "elf2flt" tool to build.

Up-to-current binutils-cross did not stage anything, so we never saw this there.

(I'm aware this should fold into install with your packaged-staging
cleanup, but I don't dare to move the binutils to the new approach
just yet).

Regards,
-- 
Leon


