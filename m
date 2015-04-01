Return-Path: <otavio.salvador@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id CB79A60034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 15:25:58 +0000 (UTC)
Received: by wixo5 with SMTP id o5so53569632wix.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=vr0V88YX8F07xsb7c94glB7+Czs5P3B88u/ZlAl7iqA=;
	b=g3MbrzLI/ZuG5EdEweUsYqwTKdU3g6EVvL/gq83KvwReNCVcdiWZLtuGLfjQQOfEqY
	eOVSI8Acuuv40nfzgPN4RrXZnjZNG/83g8MCpNfo9XoobsupBhOlydNHmHnBCc/FHGny
	whHrfOdcsTCAZhMtr6nJNIYxNF0VwOGB5717up7tvf7SFWWuLDEvxzy48V2N7wR6DIJb
	vcxKdMWqj7g4DvmogJExRmoFKBRF2m/s1inPFUKxg2FGdrVQfEOsyS736oc7Eodb1mFw
	Os4n0sv1h47eGaevT3tVP28MMwiA5KkAT4VbDSsHMw7EvX1CGPo5kkdvNwwbzW51M92H
	2npg==
MIME-Version: 1.0
X-Received: by 10.194.60.173 with SMTP id i13mr83577258wjr.124.1427901959798; 
	Wed, 01 Apr 2015 08:25:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.27.131.224 with HTTP; Wed, 1 Apr 2015 08:25:59 -0700 (PDT)
In-Reply-To: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
Date: Wed, 1 Apr 2015 12:25:59 -0300
X-Google-Sender-Auth: DQK6uf26ADJog3tKyUwVWVIG1y0
Message-ID: <CAP9ODKoR5VYhDGVgoj8HLzXwc6H4mAGfBh64bFx5drLE9W+pSg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Wed, 01 Apr 2015 15:26:02 -0000
Content-Type: text/plain; charset=UTF-8

Hello Sven,

On Wed, Apr 1, 2015 at 12:19 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> I'm currently trying to update openjdk-7 to the current icedtea-release.
> I'm getting as far as to the compile step which fails during a run of rmic.
> In difference to earlier builds, it tries to run the just compiled
> rmic java-classes.

Thanks a lot for doing this, this is indeed an important change to be
done ... also due security reasons.

> The bootstrap jdk6 complains about incompatible class version.
> "Exception in thread "main" java.lang.UnsupportedClassVersionError:
> sun/rmi/rmic/Main : Unsupported major.minor version 51.0"
>
> That is correct as the build process compiles these classes with
> "-source 7" and "-target 7".
> Currently I don't really know how to fix this problem. Atm I guess I
> would need to add a jdk6 bootstrap version of rmic. Can anyone give me
> a hint how to fix this problem?

Yes, you likely needs a rmic-native variant.

I am very busy now and won't have bandwidth to help on this, am sorry.

One side note though ... you might want, before, clean old versions of
the recipe and rework it so in the process you gain more intimacy of
the build process ... and helps to provide a nicer base of work as
well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

