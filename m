Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 44295601A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:08:28 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h18so3206968igc.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 19:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CA2EituaHhYrzXarCSVTBVkgkUP9Ir7VRTG0z7g+480=;
	b=Li9X7xjD4Ww3RZhrsM3YzIjHbc362PbBjIlaMW1courmz7Sodp/D+LTeZvZxz9EwBs
	U0p85lmfWrMt4/0ZXOoswvReFAhum/rqMUy6SNeugj/1108lG4X2VgjK5Xdj386YmYpY
	v1wCgn9MDaZ6WwS0xy8slmQB6lTD/6IOxKNvzstfmYTYcSTUz2njinJPMlYHCCkwqLxH
	4H9T1Kt+T8tl6ktdf3D0w/LGyHUz8nlfTJWvOuNJ1ChIUu0zEPWKgruoOvCGTsEqJyyy
	7/99K7GAuw+/AFZ8quM2XehA6XTUHerijj0ErHopnHR6m94sEk0fx+MrGSBN8o4FnOsi
	XGDw==
MIME-Version: 1.0
X-Received: by 10.43.145.137 with SMTP id ju9mr10841864icc.36.1397095709875;
	Wed, 09 Apr 2014 19:08:29 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Wed, 9 Apr 2014 19:08:29 -0700 (PDT)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3B0981@post.tritech.se>
References: <CALYKT1gcCmYKqy55T3Xv7qevR2g-EWv-y9dabjzz-D8psdYF2w@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B3B0981@post.tritech.se>
Date: Thu, 10 Apr 2014 11:08:29 +0900
Message-ID: <CALYKT1i_qEM=W26LG3My9Xv8rSsou2LgUn_NgHiChMjFFheXxw@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I use gdb in oe?
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
X-List-Received-Date: Thu, 10 Apr 2014 02:08:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mats K=E4rrman,

Thank you for kind concern!
I will try your method.
Thank you very much!

Sincerely
Journeyer
Seoul

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-09 16:28 GMT+09:00 Mats K=E4rrman <Mats.Karrman@tritech.se>:

> Hi,
>
> Assuming that you mean to debug programs on your target...
>
> Prerequisites:
> - a network connection between your target and your development host (it'=
s
> possible to use a tty too).
> - OE built SDK installed on your host.
> - gdbserver package installed on your target.
> - your binary (my-program) on target
> - an unstripped version of your binary in the working directory on host.
>
> The exact commands below will vary with the install path of your SDK
> (/usr/local/oecore-x86_64 in my case)
> and target specifics (e.g. powerpc, ppce300c3... in my case).
>
> On target:
> # gdbserver :2345 my-program
>
> On host:
> $ source /usr/local/oecore-x86_64/environment-setup-ppce300c3-oe-linux
> $ powerpc-oe-linux-gdb my-program
> (gdb) set sysroot /usr/local/oecore-x86_64/sysroots/ppce300c3-oe-linux
> (gdb) target remote <target-ip>:2345
> (gdb) br main
> (gdb) cont
> ...
>
> Good Luck!
> // Mats
>
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [
> openembedded-devel-bounces@lists.openembedded.org] on behalf of Journeyer
> J. Joh [oosaprogrammer@gmail.com]
> Sent: Tuesday, April 08, 2014 4:20 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] How can I use gdb in oe?
>
> Hello,
>
> I use open-embedded in my company.
> It is used in Qualcomm's communication module - specifically on AP
> (Qualcomm's chipset is composed of MDM + AP).
>
> And when I compile oe linux, I use bitbake.
>
> In this environment I'd like to use gdb to debug applications for this oe
> linux.
>
> How can I use gdb in this?
> I have experience in using gdb in just PC environment. Not in embedded
> env..
>
> Thank you very much in advance!
>
> Sincerely
> Journeyer
>
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

