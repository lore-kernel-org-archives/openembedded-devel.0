Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NJEkY-0000NX-TJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Dec 2009 00:18:18 +0100
Received: by fxm25 with SMTP id 25so1520124fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2009 15:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Tz+4VPXhWNkrMkaM0c8aNDhwp5REZdNwiFPyA9IHTZE=;
	b=Kre0r+UWqnxTvUMSDgwoKrDakqxLVmpNUMvdoiPZ7H+B2oW3Q6N/CENQufgSAcyDts
	PeTWWgJgVGEb6lgwxBsQyTGSDsNs2fCivetMf7X6MkgU5FCnM00cf27RDDnAKQGUEBLe
	Nf5oAP3UEhD2FaxaFVyzw5fqG5BG5dD4oDZec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SF2VVRVRaRK+/9RJ5dc2EpOqQWKeuan/1vDhqvabAJvtLfl8XooKR70W9bmI6Y95kn
	AM1qXhRSJhDpxYTRpCrTYz7Io8hCyWLQeiPBW6BPB8xbTmp9KlNlT3oFMP5mp+kVGC/K
	5cxfUQDkHjqhzRmho8lThdK3A+gi0mRFjiSkM=
MIME-Version: 1.0
Received: by 10.239.170.36 with SMTP id q36mr202165hbe.153.1260573391804; Fri, 
	11 Dec 2009 15:16:31 -0800 (PST)
In-Reply-To: <hfilr3$osr$1@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<hfilr3$osr$1@ger.gmane.org>
Date: Sat, 12 Dec 2009 00:16:31 +0100
Message-ID: <c384c5ea0912111516m616a6032v1f1f32cc58f2e927@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] nios2.conf: New architecture nios2.
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
X-List-Received-Date: Fri, 11 Dec 2009 23:18:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Dec 7, 2009 at 11:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 06-12-09 23:44, Leon Woestenberg wrote:
>
>> +# Select the nios2-specific toolchain parts
>> +PREFERRED_VERSION_binutils = "nios2-2.15"
>> +PREFERRED_VERSION_binutils-cross = "nios2-2.15"
>> +PREFERRED_VERSION_linux-libc-headers = "nios2-2.6.28"
>> +PREFERRED_VERSION_elf2flt-cross = "nios2-git"
>> +PREFERRED_VERSION_gcc-cross = "nios2-3.4.6"
>> +PREFERRED_VERSION_gcc-cross-initial = "nios2-3.4.6"
>> +PREFERRED_VERSION_gcc-cross-intermediate = "nios2-3.4.6"
>> +PREFERRED_VERSION_uclibc = "nios2-0.9.29"
>> +PREFERRED_VERSION_uclibc-initial = "nios2-0.9.27"
>
> NAK
>
> This doesn't belong in a machine.conf, it belongs in the distro.
>

Hmm, the architecture file (conf/machine/nios2.conf) is the most
related file to give sane defaults for the toolchain etc.

Of course distro's and end-users can override that, but I think this
information belongs with the machine or underlying architecture by
default.


I will change it, but my opinion is per above, unless some good
reasons are given why we shouldn't use the system where higher-level
.conf files can override lower-level .conf files.

Regards,
-- 
Leon


