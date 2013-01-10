Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TtG35-0001Rz-FK
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:11:52 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so391968oag.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 02:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ecZUGCi0uFlESRLVkxbcQewtp7biy+cv0ifaFEwkALA=;
	b=p6qV1rftVZ+wwzZUTA7F2+xasDFTCAZ8rUu1hi6AJfQXR/XQHOf15NZwQbKXpjEcz2
	a3gDJwHDDcfXx2XTswexTRf7HiPZnfqOeRcq66BJm90M4o9umh/aDxITOEEaTY3gVD6U
	aXyHRIpZaQIMA0CwKtTSzhDp6bRr5N15l7RMjJI1NoLYBWKQvcrEsWbmv2vTdreY8gTZ
	aDT82Yr0bn7V5bxus8nDNiqh21S6J1WWuAGJGIqYmvWQNv1oOVZjrTE0wjnDCGVQwn0o
	xoFAC2XZnQywyEF8cvCBN+bc2YzhRj+hdIudRTQC0Ja5vLI5jmdYTx6S/c9AV1GesTXS
	MtqQ==
MIME-Version: 1.0
Received: by 10.60.172.178 with SMTP id bd18mr42432141oec.133.1357815397377;
	Thu, 10 Jan 2013 02:56:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Thu, 10 Jan 2013 02:56:37 -0800 (PST)
In-Reply-To: <1357772281-15932-1-git-send-email-raj.khem@gmail.com>
References: <1357772281-15932-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 10 Jan 2013 08:56:37 -0200
X-Google-Sender-Auth: qi8cxx9reuskj0Yjlpk6lUUy1Uw
Message-ID: <CAP9ODKqcX9hMO0V3KnU=OO8HOWsd4k1QZgTAPUM+0-KqU1F3DQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] nss: Fix build for 64bit targets
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
X-List-Received-Date: Thu, 10 Jan 2013 11:11:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 9, 2013 at 8:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> it would fair to compile for x86-64 since native flags
> would pass 64bit flags but internally it would append
> 32bit flags to linker cmdline since we did not ask for
> 64bit build.
>
> This patch asks for 64bit build on x86_64 and additionally
> nullifies ARCHFLAG when NATIVE_CC is set, ARCHFLAG is
> one which sets the 32bit/64bit ness of ABI
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Applied.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


