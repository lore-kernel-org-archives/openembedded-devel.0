Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OMbL5-0002lU-M4
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 08:34:09 +0200
Received: by gxk19 with SMTP id 19so345002gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 23:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=G5mxEsaqe/R+vtPXq4Kuj0mskum2tgobxwzraaevTHs=;
	b=u7bx/4q8I3MOFOEap3G6VvI8SgK1RQRhc5cPDvx8pxxNSAZX2fgHL8zTcneqkr2ria
	b+AwmcLTWvw3I53kqLom3K34JuiJaIdapyfwr4Paqsyxjy8GlyCVYukihbumcITNz9Ph
	rcNnioRNPlBmyYVf4/xUZN4oN78Tn/IYldMTU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xq4PabBacYioHn1Ov1/qmejito77n2IAlWnRzf0Lxy+f6l02J5Fh2aJCmi55pwY4FZ
	ZbCTcU163g2Zjaxs31D89PAEFy5cWY2XjjWdtO+RqjMg4UuNREBVpBrHl2YFkfTYp3Lq
	SH9rd0fLi5gvUGjD3+uvAsQQ8Zh8XWw1+9+II=
MIME-Version: 1.0
Received: by 10.91.26.26 with SMTP id d26mr886224agj.149.1276151384159; Wed, 
	09 Jun 2010 23:29:44 -0700 (PDT)
Received: by 10.90.88.14 with HTTP; Wed, 9 Jun 2010 23:29:44 -0700 (PDT)
In-Reply-To: <76E258664B189C4CBEF125491CA11ECC9445E0CF9F@KCINPUNHJCMS01.kpit.com>
References: <76E258664B189C4CBEF125491CA11ECC9445E0CF9F@KCINPUNHJCMS01.kpit.com>
Date: Thu, 10 Jun 2010 08:29:44 +0200
Message-ID: <AANLkTinGUpnqDIU6hmh3bT4Yc-mjvygCGbFnUFu99NtO@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: (No subject)
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
X-List-Received-Date: Thu, 10 Jun 2010 06:34:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/10 Soumya R <Soumya.R@kpitcummins.com>:
> Hi All,

Hi,

I think it was already told to you that it is better to use a subject line.
More chance of getting a response.

>
> =A0 =A0 I am using ubuntu 10.4 LTS and i am trying to build my own custom=
ized image
> for mipsel.. When i run bitbake avn-image i get the following error.
>
> cp: cannot stat `/home/likewise-open/KPIT/soumyar/openembedded/recipes/py=
thon/python-native-2.6.4/05-enable-ctypes-cross-build.patch': No such file =
or directory
> NOTE: Task failed:
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/likewise-open/KPIT/soumyar/openembedded/recipes/pyt=
hon/python-native_2.6.4.bb do_unpack failed
> ERROR: Task 749 (/home/likewise-open/KPIT/soumyar/openembedded/recipes/py=
thon/python-native_2.6.4.bb, do_unpack) failed
> NOTE: Waiting for 3 active tasks to finish
>
> =A0I am unable to tar Python-2.6.4.tar.bz2 by using the command
> tar -zxvf Python-2.6.4.tar.bz2
> gzip: stdin: not in gzip format
> tar: Child returned status 1
> tar: Exiting with failure status due to previous errors
>
> =A0 so i downgraded the gzip but still the same error.. If anybody got th=
e same error and resolved it please help me out.. I am stuck here:-(

Read.
It tells the file is not in gzip format.
The file has .bz2 extension so it is probably a bzip2
tar -z decompresses with gzip, tar -j juses bunzip2

And if you have a decent tar you can just omit it and it will find out by i=
tself

Frans.
>
>
> Thanks in advance :-)
>
> Regards,
> Soumya
>
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


