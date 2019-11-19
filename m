Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 307237F7B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 14:42:49 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 139so23628553ljf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 06:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NXB6dhtVXpew7r/jHYbHOv7h/ey3hAIDqWleq1VLBvw=;
	b=tZpxTm6NX20arbXq0X/49BVppdLYx9q16k/pfVx4LlCn5MexyTB/J2NFrmUU00BFUs
	YC1+jh1X+6J2KgOCV2rX+PkogZsM0Up+uQ0PJHD37Aaw+RYx1q2eLMtXxkDFZbIH3s4u
	rxiRmBquifdVAvdK2HBD02F4xSpKjS2g/uzjB5vRJX1nqC5jebMBBidkidS1vHoirvVV
	5gK6xmw6y3evNapwdP53HIHcV+0UfF+wIUZ/mP8hlf7xGaBfXbcOCUzokZE8Vc1Y+uyU
	SoX7XtnAoMn1Qjd76vdHfPiu8599JGYENZHOkJyU5U0uXreAcE9qg7EuTDUAGGHRMCAW
	2kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NXB6dhtVXpew7r/jHYbHOv7h/ey3hAIDqWleq1VLBvw=;
	b=hP9QubOTINolpj19bPO1yrmPFo9dj36FdeHbn0giUplwJ/+Pip3ii7wJ7hk0M3nEea
	NJJmPsNMTq1Y+2cVpEt67r/8qJeMl+ofEq7UUFBrgY/fZnqOAztuVbogOpm4OeYe+7cU
	7LMIUC2J9BSehEcr2H8+y7Iu2FcwRcbAwEPATxevppeQ0ttwfn/8YjytuXZhCpfC5vau
	n5eMEDJ2N/KzeZysNgNyxmUD5aF3oJtNL4hBloZqdFUoXihy2W50paZUHGtWhJFcMiqv
	iSP9oEoRczJH+W3qno9zw4tq4EQYwInh+3LHTUh8YMuMMxbZkg3vKWNJGyOy8yb/t87z
	gQ1Q==
X-Gm-Message-State: APjAAAUjEiEf3vTMyfYdgfA9mWDDm2JfOPYDzPme70cdW+Twqwn45TKq
	aBLRgFEuaODNPlyYNznvGMZQYZNwlindasV1istqXBZ4
X-Google-Smtp-Source: APXvYqyykc9oFZu5I/HF8MBttE7LiNI8DNRnDaX1VlvTe6ji8XiDR1j1TRvYS24a2LFjVxjcMIypuVUa2lQPSwNftx4=
X-Received: by 2002:a2e:898a:: with SMTP id c10mr4233150lji.177.1574174569609; 
	Tue, 19 Nov 2019 06:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20191119121609.19869-1-nick83ola@gmail.com>
	<1d110b29-23c2-12ea-68cb-32f465be8be9@intel.com>
	<CABPh3UORbPCPd55aGFBO2WwfN0gGdaZHZk2Ei1jPu+PqUyV-UA@mail.gmail.com>
	<CABPh3UMNoSXmW1FFtvM_j=w1L5Pq7==qg-jfgCAAKyPcsasGVg@mail.gmail.com>
	<0ce7b7c9-2965-1587-0530-acbb9f57fe92@intel.com>
In-Reply-To: <0ce7b7c9-2965-1587-0530-acbb9f57fe92@intel.com>
From: nick83ola <nick83ola@gmail.com>
Date: Tue, 19 Nov 2019 14:42:38 +0000
Message-ID: <CABPh3UPrjNZuQ1JWr3j12V+bv-cfnbU--dnTuFaoqe_S8r55jA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-importlib-metadata: fix class-target overriding default dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 14:42:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

thanks for your response.

So do you suggest to modify in python3_3.7.5.bb:

    # First set RPROVIDES for -native case
    # Hardcoded since it cant be python3-native-foo, should be
python3-foo-native
    pn = 'python3'
    rprovides = d.getVar('RPROVIDES').split()
    rprovides.append(pn + '-misc-native')

    for key in python_manifest:
        pypackage = pn + '-' + key + '-native'
        if pypackage not in rprovides:
              rprovides.append(pypackage)

        d.setVar('RPROVIDES_class-native', ' '.join(rprovides))


(Or to add an RPROVIDES ayt the end -> is more explicit mabe? this function
is getting rprovides = d.getVar('RPROVIDES').split() )

This change I imagine needs to be done also for python2?

Cheers
Nicola Lunghi


On Tue, 19 Nov 2019 at 13:46, Ross Burton <ross.burton@intel.com> wrote:

> On 19/11/2019 13:35, nick83ola wrote:
> > Hi Ross,
> >
> > no the patch is right
> >
> > If I do:
> > bitbake python3-importlib-metadata-native
> >
> > Loading cache: 100%
> >
> |##########################################################################################################################################################################################################|
>
> > Time: 0:00:01
> > Loaded 4359 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'python3-misc-native' (but
> > virtual:native:/yocto/meta-openembedded/recipes-devtools/python/
> python3-importlib-metadata_0.23.bb
> > <http://python3-importlib-metadata_0.23.bb> RDEPENDS on or otherwise
> > requires it)
> > NOTE: Runtime target 'python3-misc-native' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['python3-misc-native']
> > ERROR: Required build target 'python3-importlib-metadata-native' has no
> > buildable providers.
> > Missing or unbuildable dependency chain was:
> > ['python3-importlib-metadata-native', 'python3-misc-native']
> >
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> >
> > There's a way to provide ${PYTHON_PN}-misc-native?
>
> Looks like a bug in python3.bb, the block of code starting '# First set
> RPROVIDES for -native case' should add python3-misc-native explicitly as
> that package isn't in the manifest.
>
> A better fix would be to remove the misc package from the recipe itself
> and define it entirely in the manifest file so it is no longer 'special'.
>
> Ross
>
>
>

