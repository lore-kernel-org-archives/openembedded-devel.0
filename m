Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LS6L6-0000Iq-KX
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jan 2009 10:04:06 +0100
Received: by rv-out-0708.google.com with SMTP id f25so7513047rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 00:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6mPidApJ+a9t2gg9X4Wg5in8BpWbS/EBxdiPunYfmcU=;
	b=I/2Rb6o/4Ei96j/fqF+KTkhQIlLBz4O18T4IwKBlf4ZQCf6M4Mq/bVmDfxrVWsZR0D
	T7/RGFWFubl3wQKadcpGuyTUpbUyn2TRYjDADbgzIreBAd3mo6610sgId4CU91FIfaaA
	aiNetPE4vOGhb2cXPtiO/AUegOQAjXnL6mLhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pBcnY6j5NmFDhMz6UylON8F/EFOqZ+L06shPI14j/Y9kWQX2z78XcVq00774XSzDKi
	RU40jtqSy8yfEHGRmLnoT++EFp0OIoONauKX7yDjpdWdVHX+oY5jOcR7Q6e5XWgdp70v
	xK4CMk1k5cyDhk1cVGX816Nit/b86XwIFCwj0=
MIME-Version: 1.0
Received: by 10.140.173.10 with SMTP id v10mr3227820rve.199.1233132987034; 
	Wed, 28 Jan 2009 00:56:27 -0800 (PST)
In-Reply-To: <glp4v5$3aq$2@ger.gmane.org>
References: <a7f8874a0901280021u2d3bcbd9w2e6f47bfca00bb81@mail.gmail.com>
	<glp4v5$3aq$2@ger.gmane.org>
Date: Wed, 28 Jan 2009 00:56:27 -0800
Message-ID: <a7f8874a0901280056o73460b4dr7eaf5ea13f25e3e5@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Added rsnapshot
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
X-List-Received-Date: Wed, 28 Jan 2009 09:04:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Jan 28, 2009 at 12:28 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 28-01-09 09:21, Hans Henry von Tresckow wrote:
>>
>>  From 6d8f2311c513392996aef7bf61114977c859412b Mon Sep 17 00:00:00 2001
>> From: Henry von Tresckow<hvontres@gmail.com>
>> Date: Wed, 28 Jan 2009 00:19:45 -0800
>> Subject: [PATCH] Added rsnapshot
>>
>
>> +RDEPENDS += " perl rsync logrotate"
>
> Does it need any additional perl-modules to work?

The author recomends perl-lchown, but I don't think we have this in OE
yet. I will do some more testing for this.

>
>> +RRECOMENTS += " ssh"
>
> Typo

Fixed

>
>> +#SRC_URI= "http://www.rsnapshot.org/downloads/rsnapshot-${PV}.tar.gz"
>
> Remove that.

Fixed

>
> regards,
>
> Koen
>

Thakns for taking a look at this.
-- 
Henry von Tresckow (hvontres)
Marilyn Monroe  - "It's not true that I had nothing on. I had the radio on."


