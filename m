Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6297A724DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 18:59:33 +0000 (UTC)
Received: by ignm3 with SMTP id m3so69300260ign.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2015 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=YzzuxbBFpRKsHD2sNPiyv44kWT5LzKXoxRdeN+m99o8=;
	b=iM1uh8yYzC/jEQ/uGAZkklvoKKQOCsCU5lzO2fUwUeE9Ee06OfKsHaHTUCLNyo80EX
	MGb210AcWzKddw7UYBOdPkjPEQIWdB/R8HA7tj7Mmluax43DpboeyUG8bkFwwTzAcxsJ
	00WVzByXRrUzSbc1pN2B7K076k2s1tV5EggwfQqvw2FXbc3tBXUW1H2E7MUoYZy6jd4j
	DIXjco4rbuN/Ivmq/Y1EQA77LxSBH7Y+o6qPJUlMyPzt1h1Jz/5qXV8YMaizOvYKQ5ex
	ks9+06p3IGF7tjQW14T2jlBPJwcIosjLUtAYEKklxnpWZBTLNnp7V1CN9pdM7Py+9Awr
	kQrw==
MIME-Version: 1.0
X-Received: by 10.50.43.130 with SMTP id w2mr6753250igl.30.1428087574881; Fri,
	03 Apr 2015 11:59:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Fri, 3 Apr 2015 11:59:34 -0700 (PDT)
In-Reply-To: <1427988182-26274-1-git-send-email-dmitry_eremin@mentor.com>
References: <1427988182-26274-1-git-send-email-dmitry_eremin@mentor.com>
Date: Fri, 3 Apr 2015 15:59:34 -0300
X-Google-Sender-Auth: 9umPC2wgFck7FQpPsPiTjcKLuyM
Message-ID: <CAP9ODKr0TOvebRX--Q1zuYVqhYgRFx2H7HR7VBFXWy5VvqaeLw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 1/2] initramfs-debug: add simple init script for debugging
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
X-List-Received-Date: Fri, 03 Apr 2015 18:59:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

On Thu, Apr 2, 2015 at 12:23 PM, Dmitry Eremin-Solenikov
<dmitry_eremin@mentor.com> wrote:
> Add a tiny simple debug script that will mount all available virtual
> file systems and then execute a shell.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>

I think this is easy to be accomplished with a module for
initramfs-framework[1].

1. http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts

When we designed it at O.S. Systems we tried to make it very easy to
extend and we use it with some products with good success. It also
includes a debug module which allow for fancy stuff like to support to
dynamic debugging of initramfs using bootparam in following format:

  shell                 : starts a shell before and after each module
  shell=before:<module> : starts a shell before <module> is loaded and run
  shell=after:<module>  : starts a shell after <module> is loaded and run

  shell-debug                 : run set -x as soon as possible
  shell-debug=before:<module> : run set -x before <module> is loaded and run
  shell-debug=after:<module>  : run set -x after <module> is loaded and run

The missing aspect is the debugfs which is not mounted but could be
added as a module.

Please take a look on it as avoid work duplication is a health effort :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

