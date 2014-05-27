Return-Path: <ashcharles@gmail.com>
Received: from mail-ve0-f180.google.com (unknown [209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8540D6FB3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 16:44:38 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id db12so11085699veb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=5U3NR+jxi3D6DUWfHuwEbrbxsMLlF8VQGW6m6rUSAA8=;
	b=PI75/Pqm/Kg7cwWeLC3FhV8razQNhNutEjNzENugM8pCefmcNqVhN4n9U4GAOgZHzP
	zmu36tb1lacSizj3QBmIoo05qWEDjMfw2/nHz8P7kyV/sMhHwR63FrknzylYsv/U4e/5
	FhVxo2kx8FN1+YDGNM8+sDrMlAjCUyd/E404msYaZ7sj6se5JwDxK1tR3KYtZ8VIndn/
	W2qGrujyqsZipoxBVaa4dRM0+MdTU8f7KBa+AhNyIsn8CeonytIObt4CILZzOND/jj5U
	yn9DPHQVb0jJuMzPkyJsJaxzREJFs3Ln+G1GGG3AFHhngfA4vXEbH9ZYX3DD/djlhOa1
	zfNw==
X-Received: by 10.58.34.72 with SMTP id x8mr2156288vei.61.1401209078997; Tue,
	27 May 2014 09:44:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.227.67 with HTTP; Tue, 27 May 2014 09:44:08 -0700 (PDT)
In-Reply-To: <CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
References: <1401132459-26526-1-git-send-email-ashcharles@gmail.com>
	<20140527091813.GA2426@jama>
	<CAK8F28=UYXL+YmzrCcWnYppsSNhUA3vJq92awZqvV=ihsL8bTA@mail.gmail.com>
	<CAP9ODKrwoKgT377SUfe6e9=VbuwX4s-7tzdTwXgdxqC=fzPAkg@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 27 May 2014 09:44:08 -0700
Message-ID: <CAK8F28kyQ7rDe_8AcwKqrOE+w6o_V2aLfuxYKy47vz2vLnVuSw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] eject: link po subdirectory for out-of-tree build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 May 2014 16:44:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 8:32 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> You need to change the configure.am (or .in) and Makefile.am.
Shucks---my knowledge of autotools is just too weak to correct this
properly.  I suspect the AM_PO_SUBDIRS has some special magic.  In any
case, I've sent a v2 with my (bad) fix in case it is useful to someone
else.

--Ash

