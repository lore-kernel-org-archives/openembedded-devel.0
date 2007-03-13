Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <janjans321@gmail.com>) id 1HR4dS-0003np-Ep
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2007 11:53:42 +0100
Received: by ug-out-1314.google.com with SMTP id e2so241588ugf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2007 03:53:41 -0700 (PDT)
Received: by 10.115.78.1 with SMTP id f1mr2301574wal.1173783217027;
	Tue, 13 Mar 2007 03:53:37 -0700 (PDT)
Received: by 10.115.74.19 with HTTP; Tue, 13 Mar 2007 03:53:36 -0700 (PDT)
Message-ID: <7c8eac300703130353t4982c66bua4f24205e4e651d6@mail.gmail.com>
Date: Tue, 13 Mar 2007 11:53:36 +0100
From: "Jan Janssens" <janjans321@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <665468377.20070311213332@gmail.com>
MIME-Version: 1.0
References: <274295013.20070311040657@gmail.com>
	<7c8eac300703110856v1e825559x8f89abd79d17fed8@mail.gmail.com>
	<665468377.20070311213332@gmail.com>
Subject: Re: [RFC] Allow to limit generated binary locales to predefined list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2007 10:53:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>   My intention was to do as little (pre/post)processing/interpretation
> for GLIBC's SUPPORTED file as possible. Looking at what it has:
>
> aa_DJ.UTF-8 UTF-8
> aa_DJ ISO-8859-1
>
>   It's clear why dot couldn't be used - it already appears in
> SUPPORT's syntax. So, again, I don't try to interpret it in any way,
> just provide means to specify expressions of that syntax using OE variable,
> using simple substitution of newlines with spaces, and spaces with
> commas.
Ok, that makes sense.

I don't really get why the SUPPORTED file postfixes all UTF-8 locales
with ".UTF-8" as well as adds " UTF-8". That seems redundant
information; it seems all UTF-8 locales are in the form of
<locale>.UTF-8 UTF-8, while all other encodings simply use <locale>
<encoding>... Anyway, since we don't control that syntax, let's indeed
keep it simple and compatible.

I would like usage of the colon better than the comma though...

Jan.


