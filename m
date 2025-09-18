Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D144CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:28:43 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.11716.1758194921667258898
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Axfkc+fD;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5608b619cd8so947232e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194919; x=1758799719; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu416LjCLAMU/+xQ7o6HrJ3S/CovKb93AwqxWIKNMok=;
        b=Axfkc+fDBKHUcu5CA2r4XNK5WqKFI5IWrHoFkpsd7K1QUm2n/5ZxHevGZGqi7fcr7A
         UTIe8hS+GId8irR9/DdjMHPVIXTZp7/JsL1kyauf4De/IyMN74uzXNLfPcE9XOC17iF3
         AWJDY0Y6cHyhMYBOYV/ck3kBUk/wH33BQ3ksDVIg+6oghTf3EeKa2QoqUPa9iAl2Spds
         B/HLTzg2Jvm9j3WQUkH2mLRt26lp1RJrfPzTtR14rzVzDSWV4qeJ3XVVxVOuRdEnXTDz
         H2ibfu6BqNzUnzty/bSfwBZX+AnSNtD8NdISOKSEIBHwNnVspRBZbp4AzF67sDus60ha
         6uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194919; x=1758799719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fu416LjCLAMU/+xQ7o6HrJ3S/CovKb93AwqxWIKNMok=;
        b=YChddkzAvMJlMxNBts6j2rQx8vE4q0dG/N0iZ6RB4bFxuAKKrpjL5BCIIiAaRUyRuJ
         h7UhnORnY3U7UNKlpSClhQcTdC0YqIWeopKvG1nxZk097JNrR00Dy2dUI8amtFG7ugA6
         YkqhB6z4shY3J36D4N7fW4bA+ZOPBT5SuDXAEjtSacu1//EqR2fGUsNEJIAXMozbS1/0
         bCCDFKkPPAbuud9sonVvBXqihaPCMo5LYJH06rRZPWCt7uvOUmOp6BrWOVGmviRSC67Z
         11ARwh3zKPl5vs5xosSUU0lH1dA9krpAdYOgQp1t2r8Sv/42j2FVIZTK77AvvijuYmip
         48IQ==
X-Gm-Message-State: AOJu0YzX5jZh5wrI05F7AK90UwbsEtsxJxhnBxpdUmTqyjpXgE+qzTOB
	t+XRDJxQHw0n9nAyYp9cdPyeH9RG/RqEeCr4WxIVPq6LrB41fpVRI65ny91N7M0VAdGHCk9gajm
	Q9Y1at7M//V7CqCXlA7ToKQ1wnJILQkU=
X-Gm-Gg: ASbGncsNAQMoXVKGiPgB1fk5BGui0WFWrT+87uYlwytPSt3rFAZnQGkA1+mudoATbte
	GeXsnoK88xW/Ch48lSn1E08GBAue8P5CCSX1KYkVOObFTgPCDPhvfjXAChVsoQ9LCW5Gd+plfUy
	bdChR50tZd9P4iXkXN5Vvc5QtOH+7WU357NOStDhzEVhE6X/vk632ZLphAdsCvJ2JQmIKLMFpsX
	Vkb7j5hg4zT+kKA5XoelZwd7t+0+UNb3WjLTg0=
X-Google-Smtp-Source: AGHT+IFfnoUFvo0AAF1iygGmPvgx+293VNwyeRw0p/funEtfQrZ2JT1bX2qYlN70dU8tTUx/AMlaFQ3MSA3SB78Ab6g=
X-Received: by 2002:a05:6512:3e08:b0:561:4630:8c17 with SMTP id
 2adb3069b0e04-5779c1a096fmr1532187e87.49.1758194919255; Thu, 18 Sep 2025
 04:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250918112347.1331393-1-skandigraun@gmail.com> <20250918112347.1331393-2-skandigraun@gmail.com>
In-Reply-To: <20250918112347.1331393-2-skandigraun@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Sep 2025 13:28:27 +0200
X-Gm-Features: AS18NWCWUcAAMaz_wrJ_sbbUaGZIRiLF-R0OTerEk05fxDcuI4moYxj_YnzXFeo
Message-ID: <CA+chaQcE=y-WZfEWH2whYpJF8_RXX8R3cizFZF1hxeQehU4uCg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 02/10] pm-qa: fix build with gcc-15.0.1
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119570

Do we need these fixed for gcc-15 in kirkstone? At least for target
recipes which will use gcc from OE not the native from host. I've sent
couple fixes for scarthgap and walnascar for components with native in
BBCLASSEXTEND (which were failing on my host with gcc-15), but for
target it isn't needed, right? Unless you did it just to more easily
cherry-pick some later fixes which are needed in kirkstone.

On Thu, Sep 18, 2025 at 1:23=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * fix following error:
>   http://errors.yoctoproject.org/Errors/Details/850314
>     utils/uevent_reader.c: In function 'main':
>     utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' fr=
om incompatible pointer type [-Wincompatible-pointer-types]
>     33 |         signal(SIGINT, exit_handler);
>         |                        ^~~~~~~~~~~~
>         |                        |
>         |                        void (*)(void)
>     In file included from utils/uevent_reader.c:4:
>     TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/incl=
ude/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} b=
ut argument is of type 'void (*)(void)'
>     88 | extern __sighandler_t signal (int __sig, __sighandler_t __handle=
r)
>         |                                          ~~~~~~~~~~~~~~~^~~~~~~=
~~
>     utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
>     15 | void exit_handler()
>         |      ^~~~~~~~~~~~
>     TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/incl=
ude/signal.h:72:16: note: '__sighandler_t' declared here
>     72 | typedef void (*__sighandler_t) (int);
>         |                ^~~~~~~~~~~~~~
>     make: *** [<builtin>: utils/uevent_reader] Error 1
>
>   Set PATCHTOOL to git because this recipe compiles all .c files includin=
g those in .pc/ directory which causes build errors.
>   .pc/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch/uti=
ls/uevent_reader.c:15:6: note: 'exit_handler' declared here
>    15 | void exit_handler()
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit a0b88afd798221b0751fc506e6ea224cd6745ec7)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...cc-15-Wincompatible-pointer-types-er.patch | 69 +++++++++++++++++++
>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |  7 +-
>  2 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-=
gcc-15-Wincompatible-pointer-types-er.patch
>
> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-=
Wincompatible-pointer-types-er.patch b/meta-oe/recipes-test/pm-qa/pm-qa/000=
1-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
> new file mode 100644
> index 0000000000..7efd8dd71a
> --- /dev/null
> +++ b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincomp=
atible-pointer-types-er.patch
> @@ -0,0 +1,69 @@
> +From b6b968d1c8fbba79b33d63874b551225e663435e Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Wed, 2 Apr 2025 16:59:00 +0900
> +Subject: [PATCH] fix build with gcc-15 -Wincompatible-pointer-types erro=
r
> +
> +See more details: http://errors.yoctoproject.org/Errors/Details/850314
> +utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from =
incompatible pointer type [-Wincompatible-pointer-types]
> +   33 |         signal(SIGINT, exit_handler);
> +      |                        ^~~~~~~~~~~~
> +      |                        |
> +      |                        void (*)(void)
> +In file included from utils/uevent_reader.c:4:
> +TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include=
/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but =
argument is of type 'void (*)(void)'
> +   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handle=
r)
> +      |                                          ~~~~~~~~~~~~~~~^~~~~~~~=
~
> +utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
> +   15 | void exit_handler()
> +      |      ^~~~~~~~~~~~
> +TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include=
/signal.h:72:16: note: '__sighandler_t' declared here
> +   72 | typedef void (*__sighandler_t) (int);
> +      |                ^~~~~~~~~~~~~~
> +
> +* Set the parameter of exit_handler() to int.
> +  Changed to use exit_handler(0).
> +  The parameter is not used inside exit_handler() anyway.
> +
> +Upstream-Status: Inactive-Upstream [lastrelease: 6 years ago]
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +---
> + utils/uevent_reader.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/utils/uevent_reader.c b/utils/uevent_reader.c
> +index afbb426..75d445c 100644
> +--- a/utils/uevent_reader.c
> ++++ b/utils/uevent_reader.c
> +@@ -12,7 +12,7 @@
> +
> + FILE *fp;
> +
> +-void exit_handler()
> ++void exit_handler(int sig)
> + {
> +       fprintf(stdout, "exiting from uevent reader...\n");
> +       fclose(fp);
> +@@ -42,20 +42,20 @@ int main(int argc, char *argv[])
> +       pfd.fd =3D socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT)=
;
> +       if (pfd.fd =3D=3D -1) {
> +               perror("error: socket()");
> +-              exit_handler();
> ++              exit_handler(0);
> +       }
> +
> +       if (bind(pfd.fd, (struct sockaddr *) &nls,
> +                               sizeof(struct sockaddr_nl))) {
> +               perror("error : bind()");
> +-              exit_handler();
> ++              exit_handler(0);
> +       }
> +
> +       while (-1 !=3D poll(&pfd, 1, -1)) {
> +               int i, len =3D recv(pfd.fd, buf, sizeof(buf), MSG_DONTWAI=
T);
> +               if (len =3D=3D -1) {
> +                       perror("error : recv()");
> +-                      exit_handler();
> ++                      exit_handler(0);
> +               }
> +
> +               i =3D 0;
> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-te=
st/pm-qa/pm-qa_git.bb
> index fc21e6192e..5cb51cb9eb 100644
> --- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> @@ -10,12 +10,17 @@ BRANCH ?=3D "master"
>
>  SRCREV =3D "05710ec5032be4c8edafb4109d4d908d31243906"
>
> -SRC_URI =3D "git://git.linaro.org/power/pm-qa.git;protocol=3Dgit;branch=
=3D${BRANCH}"
> +SRC_URI =3D " \
> +    git://git.linaro.org/power/pm-qa.git;protocol=3Dgit;branch=3D${BRANC=
H} \
> +    file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.pat=
ch \
> +"
>
>  S =3D "${WORKDIR}/git"
>
>  CFLAGS +=3D "-pthread"
>
> +PATCHTOOL =3D "git"
> +
>  do_compile () {
>      # Find all the .c files in this project and build them.
>      for x in `find . -name "*.c"`
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119561): https://lists.openembedded.org/g/openembedde=
d-devel/message/119561
> Mute This Topic: https://lists.openembedded.org/mt/115308032/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

