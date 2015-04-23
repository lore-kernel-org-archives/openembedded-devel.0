Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id E9C2C605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 22:11:31 +0000 (UTC)
Received: by wgso17 with SMTP id o17so32853567wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=QnuG6pQ6hK3RuProR/iwP/6EkHVNgOWw7tiYiC11Z+w=;
	b=UFoOBzyu62k+/fsoqRFqthWsfV5UE56xsTZxHOPtXgtGhI+yoLvPev1Lk1bsdUffOg
	r6aue+hGh1owGrdB2Rs4/rMDJci4fTICcqRSVloyG7W0Iuzj+Mzd4TOWfgeATmLcHKuk
	s9cEgaMrKiUzwq9v7wZluY2H5idgc+/T13kRKmKsWankReuFH/sldIhkh4z2bEWKQpMc
	/uTg/6F0oSLcVysk0DBgULfJ1qyGK4Juwu3k5pYj8hHRzyaQ6P6bGFuOxsWNngGIOlWa
	X5diy/WVwN2gW6ZSh7o8K5SuSUBFt3bUn8IFgyPYP/9wvPYQBAOB+0lBJKrmjlhcV4K3
	blIg==
X-Received: by 10.194.90.15 with SMTP id bs15mr9980564wjb.22.1429827092400;
	Thu, 23 Apr 2015 15:11:32 -0700 (PDT)
Received: from [192.168.0.7] (212-41-120-202.adsl.solnet.ch. [212.41.120.202])
	by mx.google.com with ESMTPSA id
	kc4sm14094460wjc.2.2015.04.23.15.11.30
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Apr 2015 15:11:31 -0700 (PDT)
Message-ID: <1429827090.3418.18.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 24 Apr 2015 00:11:30 +0200
In-Reply-To: <CAP9ODKoZmUHFPE8RyQ53a2c5ANz3-hB+oNc=R3b=ukoVCpUngg@mail.gmail.com>
References: <87pp6u4qp6.fsf@email.parenteses.org>
	<CAP9ODKoZmUHFPE8RyQ53a2c5ANz3-hB+oNc=R3b=ukoVCpUngg@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Building openjdk without X11 dependencies
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
X-List-Received-Date: Thu, 23 Apr 2015 22:11:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi

> <mario@ossystems.com.br> wrote:
> > I'm under the impression building openjdk without X11 is not feasible.
> > As far as I understand, the headless package is (or should be) generated
> > by building openjdk with the X11 dependencies, then selecting the
> > components which are not linked against X11 libraries and putthing them
> > into a separate package.  Does that sound correct?
> >
> > Is it possible to build openjdk without X11 dependencies?


My interests actually went into the other direction. Adding a
packageconfig which re-enables xawt.


While looking at it I tried to remove the DEPENDS on X11/GTK+ and came
to the conclusion that you would need to heavily change the source
tree / Makefiles to leave all the sources which include X11 (or GTK+)
headers out of the way.


The sources react to the symbol BUILD_HEADLESS_ONLY which promised to
keep the X11 dependencies out. However that is either broken in the
current versions of OpenJDK or never worked at all.
Some mailinglist post underlined that. e.g.
http://mail.openjdk.java.net/pipermail/build-dev/2012-March/005700.html


Maybe one could split openjdk-7-common and openjdk7-jre into packages
without X11 dependencies and the rest as Mario proposes. However I don't
know if that would lead to a working headless java installation. 


Regards
Max


