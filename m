Return-Path: <max.oss.09@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 61E4660034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 17:17:10 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so48500458qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 10:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hOJtr9MocSziAnRqnfxE3onfEWhWMPUvPsbsFev729g=;
	b=KPwSSorGSMMOHam3xT/aTzAx+04aSI0J/SHGhy7v+PiWmpbNGIimQGSg7qA5WpbhsF
	/s4GdrmCaSQBBa4rMAoCDvGF+3QM2kOHpZ65jY7DAoKK127HMeGBs7tKbKFqrn84h///
	bXXTqq8OH626gtec+nnjtLVwnMjHi6DhgdZD3PwAyeu0JKcOgXVTt1XsRvNZ0RqDqMQi
	ZkhB2Kmwisxa6rMeMLw2c2BdrkRPr+eJP+G0DsHCq4BqTeXyBC/fWGnsCKfw4pHK0rv5
	TsJomKv3Etp5C8Uq+FqV25UQhLBWs8L4vCsZE65morwUEsO+xiD6c/GyPtMhM9Cqu17+
	7egA==
MIME-Version: 1.0
X-Received: by 10.140.235.216 with SMTP id g207mr19431257qhc.9.1427908631956; 
	Wed, 01 Apr 2015 10:17:11 -0700 (PDT)
Received: by 10.140.82.72 with HTTP; Wed, 1 Apr 2015 10:17:11 -0700 (PDT)
In-Reply-To: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
Date: Wed, 1 Apr 2015 19:17:11 +0200
Message-ID: <CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	sven.ebenfeld@gmail.com
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
X-List-Received-Date: Wed, 01 Apr 2015 17:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Sven

Maybe this pull request to the old meta-java repo location contains
already contains some of the stuff you need.
https://github.com/woglinde/meta-java/pull/62

Regards
Max

2015-04-01 17:19 GMT+02:00 Sven Ebenfeld <sven.ebenfeld@gmail.com>:
> Hi,
>
> I'm currently trying to update openjdk-7 to the current icedtea-release.
> I'm getting as far as to the compile step which fails during a run of rmic.
> In difference to earlier builds, it tries to run the just compiled
> rmic java-classes.
>
> The bootstrap jdk6 complains about incompatible class version.
> "Exception in thread "main" java.lang.UnsupportedClassVersionError:
> sun/rmi/rmic/Main : Unsupported major.minor version 51.0"
>
> That is correct as the build process compiles these classes with
> "-source 7" and "-target 7".
> Currently I don't really know how to fix this problem. Atm I guess I
> would need to add a jdk6 bootstrap version of rmic. Can anyone give me
> a hint how to fix this problem?
>
> If someone wants to have a look at my work and try themselves, I've
> quickly posted it to github:
> https://github.com/esven/meta-java/tree/jdk_update/
>
> (Just the last one dirty commit)
>
> Cheers,
> Sven
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

