Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7747765D56
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 01:19:34 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id a141so4180532oig.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 18:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=tvra1Ej7y/g1XkgDB6/SFvW3scZFZvpueKLweP2lz7U=;
	b=0YfDKtJTDNZPWfhKpsTDxIeh1Vn1TVf57XnAxmZP7jJap1Lz33yaBDsPCn950qklGk
	3FflQIJ46g7QE58HZFLkWGrzQxJM65kI4US6A6DxC5f95QqhQxbxs3zHbAeb6rNsUrnL
	U27D6ykI8dI1fjc5XRrxUarg83Hxlt3mgL20jlwoT1KMYGYS0SaFGhSsfyhN6j6kAAVS
	6beYD1Oky7x3lt0CKV/JEHv6xScwBI0pStrBu/RNuxQk0iJ73OWJ9yNypyZZlSUtqxwn
	O3S/+Rj2dE9/rRzKURjbswFFzGqQeo1glq/QCAqjpKOcCXf2N7Md+7BA2yT5IE7ABj+3
	te1w==
MIME-Version: 1.0
X-Received: by 10.182.215.134 with SMTP id oi6mr61211obc.84.1408411175758;
	Mon, 18 Aug 2014 18:19:35 -0700 (PDT)
Received: by 10.182.132.52 with HTTP; Mon, 18 Aug 2014 18:19:35 -0700 (PDT)
Date: Tue, 19 Aug 2014 10:19:35 +0900
Message-ID: <CALYKT1iTDfz53Yo98Mr8XKvrHHR8WUJafpMs9OSTiap+TAMKww@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Correct usage of FILES variable of OE build system
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
X-List-Received-Date: Tue, 19 Aug 2014 01:19:36 -0000
Content-Type: text/plain; charset=UTF-8

Hi list,

I've got question about OE build system variable, FILES.
I wanted to install my application into a directory under "/App".
So I placed 'mkdir', 'chmod', 'install' command into "do_install_append()"
of .bb file.
But finally my built image didn't include the directory "/App".
So I searched yocto manual and found a brief description about the variable
"FILES".

With the usage of the variable 'FILES' below, I succeeded to install my
application under "/App"

FILES_${PN} += "/App"
> FILES_${PN} += "/App/ini"
> FILES_${PN} += "/App/lib"
> FILES_${PN} += "/App/download"


But I found some weird observation. I found a directory "/App/ini" is
created like "/App/ini?".
There appended unexpected question mark at the end of the path "/App/ini".
This doesn't happen all time. This happens from time to time, once out of
almost about 200 trials.
It's rare to observe this problem.

I doubt this happens with the wrong use of the variable FILES.

Is my usage above correct?
Shouldn't I need to place spaces like below? :

FILES_${PN} += "/App "
> FILES_${PN} += "/App/ini "
> FILES_${PN} += "/App/lib "
> FILES_${PN} += "/App/download "


or like below? :

FILES_${PN} += "/App /App/ini /App/lib /App/download"


And what about the trial below? :

FILES_${PN} += "/App/*"
> FILES_${PN} += "/App/ini/*"
> FILES_${PN} += "/App/lib/*"
> FILES_${PN} += "/App/download/*"


Let me list up my questions:

1. It's shown above. Is my usage above correct? If I need to use it as
shown above?
2. What does '*' mean in the usage of FILES variable above?
3. Why I need to use this variable FILES? I know without it new directory
is not created. But I'd like to know why?

Below is the explanation from yocto reference manual.
Thank you very much in advance.
Journeyer J. Joh


> *The list of directories or files that are placed in packages.*
> *To use the FILES variable, provide a package name override that
> identifies the resulting package. Then, provide a space-separated list of
> files or paths that identifies the files you want included as part of the
> resulting package. Here is an example:**FILES_${PN} += "${bindir}/mydir1/
> ${bindir}/mydir2/myfile"*
> *If some of the files you provide with the FILES variable are editable and
> you know they should not be overwritten during the package update process
> by the Package Management System (PMS), you can identify these files so
> that the PMS will not overwrite them. See the CONFFILES variable for
> information on how to identify these files to the PMS.
> - http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html
> <http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html>*


----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

