Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LefXF-0001Zo-AE
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 02:04:33 +0100
Received: by rv-out-0708.google.com with SMTP id b17so3370451rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 17:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zCoNt/Dv+jAfdpvmvoacxd2EtaE1RR55IGkX8ElM9eI=;
	b=nHSJYwx9dbnbXh93t7dOS1qQVjRAWQbEIQc5HEUrpbYEys8WG7uFfaUmgrZ/o64wGk
	RGjQoeiZldX5OLA/g7ACJN8a5JDHt67/RIeQ8JbTtTtqOdhDhHlmEKwxSC9z+B2NqrMx
	iKB7AH2v0w/AwBqFiTQmbintmYRy+Pf9Z45y8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cqgyJzp7kSgAfNOWIb2bjosSBlFN0mhfplRb+1+/c5fzsr86rice51q+VYUCqxdniG
	IJKlqFvk/AQRqPJ7u60ZUJgm+sclmkuDW+4fPr7GMFpoGUaKQEh+FCt6iL/UEh26bRtP
	opY0GT4vOwuYdxZJpFF0bOyPmOJ61xodV18Z8=
MIME-Version: 1.0
Received: by 10.141.88.3 with SMTP id q3mr3837342rvl.130.1236128426225; Tue, 
	03 Mar 2009 17:00:26 -0800 (PST)
In-Reply-To: <20090303182231.2a9b2007@mobil.site>
References: <20090211213312.919E8189338@amethyst.openembedded.net>
	<20090303133626.5706500e@mobil.site>
	<ac9c93b10903030453g6bdfb268ubb30f3854e667d12@mail.gmail.com>
	<20090303182231.2a9b2007@mobil.site>
Date: Wed, 4 Mar 2009 09:00:26 +0800
Message-ID: <565965130903031700o49cfcaf3r44e81101971f436c@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Frans Meulenbroeks : opkg: fix bug that occured with file names of exactly 100 chars in the tar file
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
X-List-Received-Date: Wed, 04 Mar 2009 01:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi kjk,
  Thanks, patch applied as R203

Regards,
Tick

2009/3/4 Krzysztof Kotlenga <pocek@users.sf.net>:
> Frans Meulenbroeks wrote:
>
>> Anyway, appending the 0 byte is no good as tar_entry->name[100] is
>> already out of bounds.
>
> http://tiny.cc/964UD looks good enough. It's interesting that we have
> to trace bugs already fixed upstream years ago.
>
> --
> kjk
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


