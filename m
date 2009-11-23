Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NCfMS-0004NE-9W
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 21:18:15 +0100
Received: by fg-out-1718.google.com with SMTP id e12so965427fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 12:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=fPe6w1PBWfZg4xhhRE0JN/mi5wwDu7fufeQ7XvKo3u4=;
	b=IbHyy0JEns7MtkBOL5jQfdddux/VJNRLstIqdTcMPM1hN6Jsjhvuc/kX6kKR7bqIVJ
	Os0XFKI655klBgoxk8b8aaVyAiinIiQLrbFqWXxKq1/qb/dF6I/I25pEHI4qWb4CA9c0
	lbWeVPEF8OJhrDTLimwyBr1VAxuMqZMyGMDBc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GmAJEOM1+xB7dKVxqCInp7yntSF863nCTCFNBHdZOAlQBtq00ESv+IK5we9xNPKP3T
	G+pPRg9O+uCq0GBAuMuKOtpcuukRwImbf+WF2ENGPrNcfKefJcOSs297qps5RZowWsZJ
	0IcQMYWedQX9YjIOmT5QpuKvbntI/DHgBZr5Y=
MIME-Version: 1.0
Received: by 10.239.158.7 with SMTP id s7mr568808hbc.53.1259007406037; Mon, 23 
	Nov 2009 12:16:46 -0800 (PST)
In-Reply-To: <heeq7i$11r$1@ger.gmane.org>
References: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
	<1259001133.10321.140.camel@dax.rpnet.com>
	<c384c5ea0911231043h75ae7402me61d82d90b8234bd@mail.gmail.com>
	<heeq7i$11r$1@ger.gmane.org>
Date: Mon, 23 Nov 2009 21:16:45 +0100
Message-ID: <c384c5ea0911231216r296ebd1bo663d500510e4cb23@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.157
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
X-List-Received-Date: Mon, 23 Nov 2009 20:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen, all,

On Mon, Nov 23, 2009 at 9:10 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 23-11-09 19:43, Leon Woestenberg wrote:
>
>> I'm adding a new architecture (nios2) which has additional staging
>> steps in which it brings out a few binutils build-host specifics,
>> in order for the following "elf2flt" tool to build.
>
> elf2flt brings back nasty uclinux memories here ;)
>

Yes, happily, the nios2 now has a mmu-full variant as well.

Not that their toolchains don't suck, I have the feeling I'm opening
another can of worms.

Regards,
-- 
Leon


