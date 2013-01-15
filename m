Received: from mail-bk0-f41.google.com ([209.85.214.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Tv7Gy-0005JC-Gz
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jan 2013 15:13:55 +0100
Received: by mail-bk0-f41.google.com with SMTP id jg9so80980bkc.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2013 05:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=E9dxhMRddZ/wgZoj8GQxtvFVlrwVNCIeBIhqdxTSGJs=;
	b=AnIE8bsjo3X1xrEAte+poh8yvpD8DK16ZxlzrpooBUo76gdZlY5soMeZ3Fh1ffRLYr
	Dk+KjnuyQIrH70yUOCw7BbI4dLR0s59cgtAYuBYA2ZctZjczYGYAvcAhfW3BPqanPXc1
	nl2JKGclE+jfPtnQ/47JEcH2yWPSldrNK8C1l4UpKMTXE1NDhgsAm4j9/zbS9TGLFNID
	f6ewka3bgNqsxXIhXbN6NtgNPqFyvweODOatFLQnybMYZuNioPgTWS2ay9ZDNDmw51nI
	QBfIxzdeH6Xt0bgBZvujgIGmbQ8RMdkd/mhDAU6PdUppaA++uvf9oHFOwOWglj81qZnc
	bs1g==
MIME-Version: 1.0
Received: by 10.204.127.22 with SMTP id e22mr40830508bks.23.1358258312016;
	Tue, 15 Jan 2013 05:58:32 -0800 (PST)
Received: by 10.204.248.148 with HTTP; Tue, 15 Jan 2013 05:58:31 -0800 (PST)
In-Reply-To: <CAPESJy7AAUbiTtU0h1sAM0Eu6konxcyF3mmZi3mfVRE-+3BQcQ@mail.gmail.com>
References: <1358201403-22227-2-git-send-email-hmatrjp@users.sourceforge.jp>
	<CAAQYJAuoSYreWC6oanAkwW-4Mqv5LsKL+kHr3NhFrKf4t2o7qg@mail.gmail.com>
	<CAPESJy7AAUbiTtU0h1sAM0Eu6konxcyF3mmZi3mfVRE-+3BQcQ@mail.gmail.com>
Date: Tue, 15 Jan 2013 14:58:31 +0100
Message-ID: <CAAQYJAu+J-cVAqJttdaz161X6paUbziaZ_yn6Ep_4BHuFRSZxA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs][PATCH] symbolic link to resource.h is also necessary to build with linux kernel 3.2.
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
X-List-Received-Date: Tue, 15 Jan 2013 14:13:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 15, 2013 at 2:13 PM, Takeshi Hamasaki
<hmatrjp@users.sourceforge.jp> wrote:
> 2013/1/15 Andrea Adami <andrea.adami@gmail.com>:
>> Hi,
>>
>> you are using an outdated recipe, the issue is already fixed.
>> Please update your meta-initramfs layer and you'll get klibc_2.0.2.
>
> Thank you for your advice,
> according to the output from
>  $ git branch
> at sources/meta-openembedded/meta-initramfs/ directory, there are two
> branches available.
>
> * denzil
>   master
>
> Do you mean that I have to do:
>  $ git checkout master
> there?
> Or is there any trick using oebb.sh?
> (Though I can't find anything suggesting this from ./oebb.sh --help)
> --
> Takeshi Hamasaki
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Ah, I see now: you are using the denzil branch with klibc_1.5.25.

This version was the last one built against kernel headers: starting
with 1.5.26 the recipe uses linux-libc-headers for building.
So for denzil, with kernel 3.2,  I suggest you to:

a) add your patch and be happy with 1.5.25
b) update to 1.5.26, backporting the commits form master
c) checkout meta-initramfs master and get klibc_2.0.2 (pls remove
linux-yocto-tiny-kexecboot_3.4.bb or you'll get errors)

Regards

Andrea


