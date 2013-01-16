Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gopikrishnans@pec.edu>) id 1TvVRP-0006DY-J0
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 17:02:23 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so1549294lab.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 07:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:x-gm-message-state;
	bh=OiaOyIG7/6SExPcFd6hCobVy0DvmYFlxIskcps1rho0=;
	b=iZGTwlVrsmwQfk1bPrIwK2rpHNOEMACwWNcMbxizCGMFMDfMcxbWcBGy4VfFmsGVXG
	eXWHnkKB3q0vH+w5FfmNqLwN5y6jh9z4klpKttSOmXm9Joe7d0L6kusZSY05ZdNaIL2S
	7Gvz5Uq4bxBW2TRYfDZbljYWVBBgFuvs/JlNcZuYRpSd6JzlXeWhudkTyoevBJE0RHOE
	3lenqmhxfss/roK3I7nrj3nEgh0W6z+92aRmVHxKmg4d8h/wKPTRXk7C8jhO/10RPjdi
	rJCZJRSQCrtMZXyFHpdY0Poiw6mIbr74nz5VEvRUwO2sPC9/J3lsKpzRlpJNddbX3XXm
	vu9A==
MIME-Version: 1.0
X-Received: by 10.112.36.165 with SMTP id r5mr821892lbj.112.1358351213574;
	Wed, 16 Jan 2013 07:46:53 -0800 (PST)
Received: by 10.112.89.133 with HTTP; Wed, 16 Jan 2013 07:46:53 -0800 (PST)
In-Reply-To: <CAP9ODKp4EnstE_iY-4cu2zCTUFP5FFf467NcSWe63K2iFDio-A@mail.gmail.com>
References: <CAOkC3RY4n66f9LgvWczskaDUn0wPOjBDbDAoKCMo8CjnFWzgSA@mail.gmail.com>
	<CAP9ODKp4EnstE_iY-4cu2zCTUFP5FFf467NcSWe63K2iFDio-A@mail.gmail.com>
Date: Wed, 16 Jan 2013 21:16:53 +0530
Message-ID: <CAOkC3RYXbxd9-Azs+XPEB=MCaXw1Pcz-NXyO1dU-q7UrYmtKeA@mail.gmail.com>
From: GOPIKRISHNAN S <gopikrishnans@pec.edu>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmQG0lIuRPgPlzlVyAI0BIGmfAQX4J87xuAf1D9I05AAzeeHOzlstEIhQ1HiRl4oKC3lOi6
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Wed, 16 Jan 2013 16:02:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you, I am also trying to Identify the problem.


On Mon, Jan 7, 2013 at 5:46 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Mon, Jan 7, 2013 at 10:13 AM, GOPIKRISHNAN S <gopikrishnans@pec.edu>
> wrote:
> > I am facing strange issue while building Hiawatha for Freescale P2041RDB.
> >
> > I am getting some errors while building hiawatha(using recipe from
> > openembedded). In investigation I found all return \type and parameter
> type
> > seems to be same & in all /usr/include/*.h files in declared as extern
> was
> > added before to make it visible in global. I wonder no problem was
> > not raised while compiling for my host platform (Debian 6 on x86), and
> > getting problem only doing it for my freescale board
> ...
>
> OE has a newer GCC version and GCC has get more strict about those
> checks so those errors do need to be fixed.
>
> If you upgrade your GCC to 4.7 you'll probably find same build errors.
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

