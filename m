Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 69FCE7391D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Apr 2015 01:56:37 +0000 (UTC)
Received: by igcau2 with SMTP id au2so91413916igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2015 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8xVNvm+9c6omAHfRrzR8wzDlHuiyXNMUtlYud4jE4gQ=;
	b=EONdsaC0sqb6/TChPwH0uEcfeUGmTm4Tj8NiYy7pB76RMe6eblJ/2c/37awbIkaK9w
	DfEhfj4jsQbLzTeK671BheWTCST40QK4cgFC20Mh2ue27SKlgNZSJ8OxK6N0DnXhtaJA
	n6d+LxL2CQsInAWMpgO4Y6NMQwqM+4H1CV6f2J7Y6BIEPwI/KxJSHQ4ZkpsTgfEvz/Wi
	V2Guaj44+ZWaIFqMxCcrXMzCL0nc4cBBoqW2N8gzrYo1QJmF73EtF3Fqbba2t2vgPUnd
	tVl+tactn3B6UgOUio+V4gJcBjaewmbRKp4Wqt7u0tKVHL32ffXbapvbHHQ6vjWep7YR
	Wjyg==
MIME-Version: 1.0
X-Received: by 10.107.136.144 with SMTP id s16mr347525ioi.62.1428026198407;
	Thu, 02 Apr 2015 18:56:38 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Thu, 2 Apr 2015 18:56:38 -0700 (PDT)
In-Reply-To: <551DA5BA.3050505@gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
Date: Thu, 2 Apr 2015 22:56:38 -0300
X-Google-Sender-Auth: frKymnx1UTzOps85iCH1LIyu814
Message-ID: <CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 03 Apr 2015 01:56:40 -0000
Content-Type: text/plain; charset=UTF-8

Hello Sven,

On Thu, Apr 2, 2015 at 5:25 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> I've managed to build and run OpenJDK-7-75b13 on an armv7 target but now
> I run into an issue reported all around in the net:
> http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=1851
>
> I'm adressing the same issue with the quartz library on my target as in
> the last comment. For this specific case it looks like the segfault is
> thrown on a call to Object.clone() within the quartz library.
> Unfortunately I don't find any bugfix or other hint for fixing that
> issue. Other sites state, that "-XX:+PrintCommandLineFlags" works around
> that issue. This is right but it makes the VM painfully slow. So it
> looks like either the ThumbEE or the whole ASM optimizations won't be
> used with that option.
> http://blog.timmattison.com/archives/2014/08/29/deal-with-os-linux-zero-dot-cpp-related-jvm-crashes-without-using-the-oracle-jvm/
>
> I've looked for solutions a lot but didn't find anything helpful, yet.
> Any ideas?
>
> If anyone wants to play around with my current work. Please have a look
> at my fork on github https://github.com/esven/meta-java/tree/jdk_update

It would be good to hook a gdb on this before the failure and try to
see if something can be identified which might help fixing the root
cause of the issue?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

