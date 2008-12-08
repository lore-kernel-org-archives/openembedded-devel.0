Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L9ltt-0008T7-8y
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 20:36:13 +0100
Received: by nf-out-0910.google.com with SMTP id d21so635463nfb.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Dec 2008 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=IkkyzZ9XVUrG+hGMy7tI22KCJqdQu0ZNPQXADMxyzxc=;
	b=pDyWiZszuigZa44HLQKYjbKIp1nYNwzj8esANk+xw3di7rAXCjirZnUoZ7oYFsm34V
	Iy01lbEmhv2gLLPfRNXhrZcDntKj8HEYAVvRpvD+LmmcFoGAI0REofchvgRRo0rUcsQZ
	6ygcL5tI/39Zf7B91WsmJu893PYPUMau4VH2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=jUiz+JThFi23r/jngawP0gIFtAn/qlrvIqsFfLit/2dw/7jWE23dEzzSUUGRyKbwmC
	6KYvfnwz/WBX7ldP+00WMUoDNFR9X1oZUwpPSZLc0ruoje23iOyxZ7e7/lV//ivxNARd
	6LeSw9YUNvyy8siTmkwWRlKZcVkh3UvvGDX8U=
Received: by 10.223.111.195 with SMTP id t3mr1562779fap.61.1228764739893;
	Mon, 08 Dec 2008 11:32:19 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Mon, 8 Dec 2008 11:32:19 -0800 (PST)
Message-ID: <c384c5ea0812081132n77a80be7oaf5ffdec2ebda498@mail.gmail.com>
Date: Mon, 8 Dec 2008 20:32:19 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081207202356.GE15204@smtp.west.cox.net>
MIME-Version: 1.0
References: <c384c5ea0812061551j27c4e7eagb10e01f64d9e8668@mail.gmail.com>
	<d1b08f940812070258l25a1b54cg91b2b00a5fbafcaf@mail.gmail.com>
	<c384c5ea0812071155k45880240heba43426d39a2ff6@mail.gmail.com>
	<20081207202356.GE15204@smtp.west.cox.net>
Subject: Re: BUG? Some files in the build end up without read permission (mostly in .pc/)
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
X-List-Received-Date: Mon, 08 Dec 2008 19:36:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sun, Dec 7, 2008 at 9:23 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Sun, Dec 07, 2008 at 08:55:36PM +0100, Leon Woestenberg wrote:
>>
>> Anyone: is this quilt who writes these files there?
>
> IIRC, yes.
>

Here is the cause explained:

http://www.mail-archive.com/quilt-dev@nongnu.org/msg01091.html

Supposedly there are patches for quilt, not sure if it would break
stuff for us yet.

Regards,
-- 
Leon


