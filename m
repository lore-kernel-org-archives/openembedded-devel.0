Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZPwA-0008IW-At
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 18:42:42 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so1840736pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 09:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BHu5tnkYajqMfppEwFe7DYcLO8fK34QU15/vVqkTMOE=;
	b=XCZGmJQubqBLIvttFrnc43efn5VM5gvd6LGH7gKzqi5ff28AaJDzM9lI3V3elkpbuO
	JRaPZ5FOaYkl0I6rOSGnT8fqat7CHIEu02FowGAdvPPQQ83+NsNV8361DLH0ZpoopCzb
	eMc8USfg9kgNXoMTGDQ79pKQmzcowPwCPJQwB3J1XYMte1OqtPZ7ZoKULR4zYb0beEce
	8AMni77771UKW7qIKgh/kCVPjOAt8eUgXAjh7izJD8ChaJox/4kwQfD+wUyCOGV5jZCG
	PdYCvC7iopk6XccHSOVLLJ+4BQmDy28QqtUlgDHSnOz5+UTWu3EhZ1JBIdwfY9n6V9z3
	jTkA==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr11140038pbc.64.1353086923053; Fri,
	16 Nov 2012 09:28:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 09:28:42 -0800 (PST)
In-Reply-To: <1353082752-8187-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1353082752-8187-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Fri, 16 Nov 2012 15:28:42 -0200
X-Google-Sender-Auth: UKPUmR_b50N0JNIXRBI054xxysQ
Message-ID: <CAP9ODKqkKu_1zwX+PcA6DcE-yyVsD9VQDjB0Nwe0-sf8huM+Pg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] gitpkgv.bbclass: cache GITPKGV result
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
X-List-Received-Date: Fri, 16 Nov 2012 17:42:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 2:19 PM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> gitpkgv runs the 'git rev-list | wc -l' several times when processing a
> package using GITPKGV.  This takes ages for packages like the linux
> kernel which has a) a large repository and b) lots of subpackages.
>
> This patch caches the result of 'git rev-list' into the sources cache
> directory and uses it on the next run.  Because collisions of the sha1
> hash are very unlikely, the git revision is used directly as the key.
>
> [this is a slightly fixed version of classic OE's
>  8c61580bc303911cf77a16eefb661414fee637f4]
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

I'd prefer to have the hashes cache in same DL_DIR so we don't have another
directory there. It is a file so I see no need for another dir. What do you
think?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

