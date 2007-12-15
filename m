Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J3XAB-0006Ca-Gp
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 14:34:43 +0100
Received: by an-out-0708.google.com with SMTP id b33so356889ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 05:30:06 -0800 (PST)
Received: by 10.100.107.7 with SMTP id f7mr9613463anc.53.1197725404291;
	Sat, 15 Dec 2007 05:30:04 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Sat, 15 Dec 2007 05:30:04 -0800 (PST)
Message-ID: <c384c5ea0712150530w33da6e73x91381f8249b5f2a5@mail.gmail.com>
Date: Sat, 15 Dec 2007 14:30:04 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <208459064.20071212231354@gmail.com>
MIME-Version: 1.0
References: <475EDA2B.8080109@gmx.net>
	<c384c5ea0712120529m10874ac8g97faeac69e60024a@mail.gmail.com>
	<476005E5.5050605@gmx.net> <208459064.20071212231354@gmail.com>
Subject: Re: RFC: merging recipes from Jalimo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Dec 2007 13:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Dec 12, 2007 10:13 PM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Wednesday, December 12, 2007, 6:01:41 PM, you wrote:
> > Hi Leon,
> > Leon Woestenberg schrieb:
> >> Hello Robert,
> >> I see the compile task assumes the availability of "javac".
> >>
> >> javac -d build -source 1.4 -sourcepath source `cat $list`;
> >>
> >> How do you expect this to be available on the host? Will any javac
> >> that's out there be good enough to use?
>
>   As was discussed lately on this list, we should track the expected
> host dependencies. This is done using ASSUME_PROVIDED in
> conf/bitbake.conf. So, based on the above, I think you want to add
> javac-native and java-runtime-native there. Then, your recipe should
> DEPENDS on them, and in comment, please include the relevant
> additional info above. This should be good compromise, as indeed,
> complete self-bootstrapping would be a task in itself, sidetracking you
> from the current work.
>

Yes, fully agreeing with this approach and reasoning.

BTW, I didn't want to sidetrack you, on the contrary, just wanted to
know what the implications where and how we should neatly solve them.

Regards,
-- 
Leon


