Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KDhXj-0004TI-Mh
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jul 2008 17:13:19 +0200
Received: by yx-out-1718.google.com with SMTP id 4so434959yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jul 2008 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=DE2UNe1HE4HyFm54uJUOT0zfyJ0Xd18oKQELCFGTcvo=;
	b=trcbhBvnslkEJofxKBj3YWZI3kEVpoWAHqWwh9gMifGok4y0oAQBBVBwyx5KH6TVPP
	m2w+wbVw/Ev5bhKjQULJLzKSjiYQW1UxUHOOULko/6U2/9EC4RUXjFSkQubqLrgBYDRv
	jCsZcYIwi5dzvwl54MphqCDw3ANDrBW0cyQ44=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ckOrP9qNPwpsMuV2W/QKKCPxb3o0/V01JyXs4qvId1DgiC+sK+Dx+RN/Ntl/kSXJ4Z
	H39GqNPCyvIs7yUPWs4MAHPoAplTMzPkUy/dLr1fgVhJST8h4q2lEEGmJRw7lu2lgORJ
	gqljIGi3qxD7M6q5PnrKcyBzB8wMmmGc4IQSk=
Received: by 10.114.132.5 with SMTP id f5mr5710781wad.125.1214925013876;
	Tue, 01 Jul 2008 08:10:13 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Tue, 1 Jul 2008 08:10:13 -0700 (PDT)
Message-ID: <f96d234e0807010810y7433f558n450464f77bb3b94f@mail.gmail.com>
Date: Tue, 1 Jul 2008 11:10:13 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200807010953.02888.e.robertson.svg@gmail.com>
MIME-Version: 1.0
References: <200807010953.02888.e.robertson.svg@gmail.com>
Subject: Re: Having multiple bb files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 01 Jul 2008 15:13:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 1, 2008 at 10:53 AM, E Robertson <e.robertson.svg@gmail.com> wrote:
> Hi,
> Can I have multiple bb files for the same package (same version)?
> If so, how do I separate them and how do I set a default one for bitbake to
> build? (i.e without using the -b option).

There are several options -- virtual packages, or simply call the
bitbake recipe by a different name.

see packages/opkg for an example of using different names for
different variations of a package.

for information on virtual packages, see:
http://www.pokylinux.org/doc/poky-handbook.html#ref-bitbake-providers

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


