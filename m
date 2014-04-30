Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id EFFC660782
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 18:12:59 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id f10so2001953yha.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=chrqwSu9RuQuGzwz5qrP9j4Mm/1fFsA3JbQJaZKgrQE=;
	b=RYEH41bOwsDg3ArFp2dURl7cPPMPJjDX2uRj5l02KTfwa9YyxI4QjVRsZu1IwycTtC
	XJ70gh6725IC/inmNHji7LjXTnOhq6dYj5Baxc2yOKM8I76Ca32sHvyU+HT8i2o8YXHU
	iZeUOLoMVaS/Gor9wj+BHBApichIm/YmF5SC6k0QDjgWNltihSWRzoo8h7kvmYAIKrDU
	6U5lV2xw5MB1NOkdrdj33Baoe120Yin1gRQvp22I9opVtKq87J56k0v5qNJ+vExUXljX
	LiiOPMsM4Q4yDfqIwwamJOpj2JCOQ/A2LRhcUQDS9yHgp1eYP30W3dAAZfS1S6aQYrVg
	YDiw==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr8204263yhi.148.1398881580273; 
	Wed, 30 Apr 2014 11:13:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 30 Apr 2014 11:13:00 -0700 (PDT)
In-Reply-To: <1398881370-12284-1-git-send-email-donny3000@gmail.com>
References: <1398881370-12284-1-git-send-email-donny3000@gmail.com>
Date: Wed, 30 Apr 2014 15:13:00 -0300
X-Google-Sender-Auth: STEXv8VoiaV4WIXUG-uY2toQWkI
Message-ID: <CAP9ODKpYUFvH5EVcPVWmPqTi=yJxSNaW4OqU=Y2B5fdmOYwx8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qmake4_base.bbclass: Add staging directory for native builds
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
X-List-Received-Date: Wed, 30 Apr 2014 18:13:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 30, 2014 at 3:09 PM, Donald R. Poole, Jr.
<donny3000@gmail.com> wrote:
> From: "Donald R. Poole, Jr" <donald (dot) poole (at) swri (dot) org>

Did you send with git send-email?

The shortlog and code does not agree. You cite qt4 and change qt5 ;)

> When building a basic Qt5 native application, the build fails on the do_install task as a result of the  variable being empty. This causes the copy command in the test block to fail because it is trying to copy files from/to itself.
> ---
>  classes/qmake5_base.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
> index 2db0fa3..18fdb2a 100644
> --- a/classes/qmake5_base.bbclass
> +++ b/classes/qmake5_base.bbclass
> @@ -171,7 +171,7 @@ qmake5_base_do_install() {
>      # but we cannot remove sysroot override, because that's useful for pkg-config etc
>      # In some cases like QtQmlDevTools in qtdeclarative, the sed above does not work,
>      # fix them manually
> -    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
> +    if [ -d ${D}${STAGING_DIR_TARGET} ] && [ -n "${STAGING_DIR_TARGET}" ] ; then
>          echo "Some files are installed in wrong directory ${D}${STAGING_DIR_TARGET}"
>          cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
>          rm -rf ${D}${STAGING_DIR_TARGET}
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

