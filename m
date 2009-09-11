Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MlvVm-0008UF-Rb
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Sep 2009 04:05:21 +0200
Received: by qw-out-1920.google.com with SMTP id 4so242270qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 19:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=nCM+oXrrmv/d+AwUj1xuIRtS5DfaVGTu1cDGFdhaMmY=;
	b=Th08+pABLG/ygardHApItOypWRDnhQso2n3NfkWIEx1yKrv62coC+Oz9wcYo9M9mRe
	pRyPAzsUqzP2zQjUEjVz6iC/sey+GnA/A2LsyBD6p4S/RY/vIRVkK2773oW1ewmQVbf1
	iSZVPIjrGTq29tb5Bss8xBO9sTD3XDBZP0l6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=S0QfQ+y84zHoohKQkNM2LiH+UaP0NRNJHNclJqb0f2P8JfyN9rlxDSkhkbrdosXAxc
	oFKGexIYrPPYkuR5UItpp87/zoJJVsIdiAeEzrX7S4h6VRSlLkkH5kHkppnvW0LvRW10
	H2NhagzIdjyS/MDBZ6alWl+ybqcXPi5OJUNk8=
MIME-Version: 1.0
Received: by 10.229.51.219 with SMTP id e27mr1160097qcg.7.1252634692525; Thu, 
	10 Sep 2009 19:04:52 -0700 (PDT)
In-Reply-To: <20090910184949.GA31155@gmail.com>
References: <20090910184949.GA31155@gmail.com>
Date: Thu, 10 Sep 2009 19:04:52 -0700
Message-ID: <19c1b8a90909101904t623c0114y8c05af8ba59a1b97@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: GCC 4.4.1 test results on minimal-uclibc/ARM
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
X-List-Received-Date: Fri, 11 Sep 2009 02:05:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2009 at 11:49 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> Attached are the results of gcc 4.4.1 on thumb/uclibc/minimal
> combination.
>
> One common fail is due to fvisibility. I havent looked at finding
> the cause but otherwise the results are ok.

visibility tests were failing because it could not locate cross objdump
that was a mistake in my test setup. I should have added the directory to
my PATH before starting the tests.

>
> Should we start using gcc 4.4.1 as default compiler for minimal distro ?
>
> Thanks
>
> -Khem
>
>


