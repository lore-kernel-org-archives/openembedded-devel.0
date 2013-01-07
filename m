Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsBrz-00023V-OW
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 13:32:00 +0100
Received: by mail-oa0-f45.google.com with SMTP id i18so17780605oag.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=qhrssInQWhEE/EraQseDk3SyfNhFHFyH+QYxNyhM1+U=;
	b=gwCI2WxhsE+mUCSnHD4x4So2t9rR6OHJkABDkaW0nNcC3N/D+G339wcIuzKMt1aUUl
	qHF2kua9OuHYxdDTySoFzpkp1C+fjE2KPnIcPtl1U4VwMo61kf5IxAqQjbSS17xBhH1c
	VBuwXFoN94XcoSGitvu+0vIJ6QdkVsIRnQiUBQ+cDhCKlzYLp50iFa3xenhRACC4YCzM
	GsMYsnJyjQ429aur6KS88mwrJa/FF0emNZR4PU7VOE4tKrrPJnXzzKvJfIjvsXERM01p
	OxsaFejAdyzZ5PJfYUviWwEzaqXJiLBF1z+joANmU8y4dplvAwyrST2k+PrvZ5WTWqGR
	W5/w==
MIME-Version: 1.0
Received: by 10.60.171.11 with SMTP id aq11mr33476998oec.104.1357561010130;
	Mon, 07 Jan 2013 04:16:50 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 04:16:50 -0800 (PST)
In-Reply-To: <CAOkC3RY4n66f9LgvWczskaDUn0wPOjBDbDAoKCMo8CjnFWzgSA@mail.gmail.com>
References: <CAOkC3RY4n66f9LgvWczskaDUn0wPOjBDbDAoKCMo8CjnFWzgSA@mail.gmail.com>
Date: Mon, 7 Jan 2013 10:16:50 -0200
X-Google-Sender-Auth: Be15KYz-b0LBMT0fISJK2_dLrj4
Message-ID: <CAP9ODKp4EnstE_iY-4cu2zCTUFP5FFf467NcSWe63K2iFDio-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Reg: Hiawatha
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
X-List-Received-Date: Mon, 07 Jan 2013 12:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 10:13 AM, GOPIKRISHNAN S <gopikrishnans@pec.edu> wrote:
> I am facing strange issue while building Hiawatha for Freescale P2041RDB.
>
> I am getting some errors while building hiawatha(using recipe from
> openembedded). In investigation I found all return \type and parameter type
> seems to be same & in all /usr/include/*.h files in declared as extern was
> added before to make it visible in global. I wonder no problem was
> not raised while compiling for my host platform (Debian 6 on x86), and
> getting problem only doing it for my freescale board
...

OE has a newer GCC version and GCC has get more strict about those
checks so those errors do need to be fixed.

If you upgrade your GCC to 4.7 you'll probably find same build errors.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


