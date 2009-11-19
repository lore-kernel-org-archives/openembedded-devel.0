Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NB4oy-0002a6-27
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 12:05:08 +0100
Received: by bwz9 with SMTP id 9so2130897bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 03:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=iBfDSpnM+DmkCdnq46bbx4Lmuikxcu/hRDQlefS2NUg=;
	b=F1uizK2ufKJZa8ROydUk2WjKN6EQQxiO/9ZTiFQDB70/oO4JsvHHhyhrBhKYTq0S9v
	2cpoOJFUg8t541wIQq7YPaaxpbIu5NjJm09Bn2vtIJoTjTu5rEopgp5URx8rKlX1ErSf
	T2/apv6KsICw9+RZNU4uklROb8XIE8vkjuS+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SvE7v5C1J8E7qYMivHPfZdvWCg1lNR28SWptJNb6WC5RrSHSF/AhOi42dyHlsmLtgk
	j+wihvqKavWuRrtOF2BpVwHfaACNqYsStSZu1ljb08mpGpnIBCEnqmv7/Ihrk7p4GnGV
	BWdGt703xD9r5VNOlxujlb4ElSanSTgBRewBM=
MIME-Version: 1.0
Received: by 10.213.110.17 with SMTP id l17mr2888197ebp.91.1258628619241; Thu, 
	19 Nov 2009 03:03:39 -0800 (PST)
In-Reply-To: <818ccfc40911182327t686578acn565645806bcf280e@mail.gmail.com>
References: <818ccfc40911182327t686578acn565645806bcf280e@mail.gmail.com>
Date: Thu, 19 Nov 2009 12:03:39 +0100
Message-ID: <c384c5ea0911190303v66fe7aa9he03d5d81f14400cc@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: do staging failed while building eglibc
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
X-List-Received-Date: Thu, 19 Nov 2009 11:05:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Nov 19, 2009 at 8:27 AM, Ahsan Khawaja <ahsan.khwaja@gmail.com> wrote:
> Hello,
>
> i am using openembedded to build my develoment system for bare metal. I
> changed the TARGET _OS to arm-none-eabi. while building the system the
> eglibc gets error during staging process. Error description is to confusing.
> Please help me in resolving this issue.
>
Hmm, do we support building a bare metal (i.e. no target operating
system) toolchain?

Also, I doubt (e)glibc supports that at all.

Maybe someone can confirm/correct me.


For just a bare metal toolchain only, I'ld go with crosstool-ng or
similar projects.


Regards,
-- 
Leon


