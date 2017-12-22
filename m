Return-Path: <jacob.kroon@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0FB787C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 09:30:17 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o2so27375034wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ltn3rQp3iJklmKClZ5uVnw38vZKVl0ds+BuV5ZiB1nQ=;
	b=NhK8Exm0KEeBIjdImjcZ2TtKmaSMwlSzZEl+llbUFB+Zvz4HwJKqIUcEn3G2vvLA5/
	Uc5WClHhNRPoA5LJjB+hWow+6A3IsBCbfTlMZCnzka9i210TzKqIM99kEjrvLAktn5vn
	/Hpfj62Zas1NwPVd9aJgMcpORI+IX23kFDas8gq7FBN79S/bNdSW1URuRhiqsVrgw4sX
	KX62wPJ+9nH8bvS7WvK5gySfr31QAIp7WcNRUEzqnK8Ps0/Eh0UALLbBAxfYtDKKxoUD
	f2Vy/O3Qzk6m3Md46fFwLTTQ38g4o/s4iw8THmWdg3SbLUoWpPGLmoAAS67iN5Mbugt0
	t69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ltn3rQp3iJklmKClZ5uVnw38vZKVl0ds+BuV5ZiB1nQ=;
	b=LTTPziVGygJ3FfMiOEnznn59o6XpI+De6EIjXoxtAMTGwCqI3FnWFZhqrcQnGua/8W
	EADdaKDXxcAGRqXtqFU7wKxCSMXU8e4okCishlX0WBCoYTI0zBgx3i2aYlBZ/b/WG+av
	N91TrzyvzGYh63XeGlA8QMwl1z8aveGnCpbTPWZOymVn2YYNXjPXk+QDa+W/jAn7TnNn
	nieHCcp27tybIS+a0ac3lVFnHy+rAHKHVb6bW0BueIKVNebyui5MHmwB/aiOJEC0FnsI
	SbM8hxeqRd4NP6jQ+bVqcAz6zyEA0Gajq0XzRdbWcsWIlYPpHJywaRxPds77Jnf+yBsE
	6YbQ==
X-Gm-Message-State: AKGB3mJl6HjOf7bu2CyDkBQMwQQx48oiAfWMIj51GhZ1kgUAzOKdRJt3
	yfmcckQCA88XvQ638U3S482wW3MwzF0p/qqPfygcEg==
X-Google-Smtp-Source: ACJfBov/mwK4YjIZetvsWmrRJo6t+zHcG3f9fWcUpRA4nK/KxmPkfOt6IKocEm1jPZC10Xm1PtrDM2UGHgNL57Vjfzg=
X-Received: by 10.223.167.70 with SMTP id e6mr13915404wrd.235.1513935018439;
	Fri, 22 Dec 2017 01:30:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.162.211 with HTTP; Fri, 22 Dec 2017 01:30:17 -0800 (PST)
In-Reply-To: <CAPbeDCmTsCfrCAya_XQhN+Y5tKW7QnHQjeQThh6iT5ecneLEsw@mail.gmail.com>
References: <CAPbeDCmTsCfrCAya_XQhN+Y5tKW7QnHQjeQThh6iT5ecneLEsw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Fri, 22 Dec 2017 10:30:17 +0100
Message-ID: <CAPbeDC=7U8UMCzDnL2MoQW18JMDpLPBnSbHKf=mmOk0GnSiBKw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java] pyro, rocko and per-recipe sysroots
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
X-List-Received-Date: Fri, 22 Dec 2017 09:30:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Dec 22, 2017 at 8:55 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> Hi all,
>
> I'm trying to get a recent yocto build together with meta-java up and
> running, but ran into some problems:
>
> 1. For rocko, I don't see the corresponding branch in meta-java,
> should I use "master" ?
> 2. For pyro, there is a branch in meta-java, but the build fails
> unless I backport the patch in commit
> c4b9b97c7c60ad5c0c3392ccf143b2e4e6c7df24:
>
> "java-library.bbclass: compatibility with per-recipe sysroots"
>
> Could we get this patch officially backported to pyro ?
>

One more patch I needed backported for pyro to build:

2a706cd2d656a203ecb83bef1c687703c969732e
"icedtea-native: Fix segmentation build during build"

since I'm on Fedora with a recent gcc7 I assume.

/Jacob

