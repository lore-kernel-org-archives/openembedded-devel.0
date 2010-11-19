Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PJORM-0005gS-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 11:43:36 +0100
Received: by qwh5 with SMTP id 5so1474144qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 02:42:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.186.75 with SMTP id cr11mr1702329qcb.15.1290163347164;
	Fri, 19 Nov 2010 02:42:27 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Fri, 19 Nov 2010 02:42:27 -0800 (PST)
X-Originating-IP: [78.106.240.238]
In-Reply-To: <4CE64779.3020802@sensortherm.de>
References: <4CE64779.3020802@sensortherm.de>
Date: Fri, 19 Nov 2010 13:42:27 +0300
X-Google-Sender-Auth: V8uTcnE9LfZSuziCnFOhm-XXNJk
Message-ID: <AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Nov 2010 10:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/19 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:
> Hi,
>
> i have some problems with the ti recipes, see my emails on the list.
>
> The two problems are:
> * the recipes are out of date and don't work.
> * the recipes can't download the source files.
>
> My idea is, to have an buildserver. On every commit (every night or every
> week), the buildserver download the sources and build the recipe.

For which DISTRO/MACHINE and image should it build? :)
What to do with commits while building is in process?
What to do with non-recipes commits (classes, conf, contrib)

> If the server builds the recipe successful, it copy the source files to the
> webserver.
>
> If the builds fails, the person how committed the recipe recieve a email
> with the log files.
>
> What do you think about my idea?

Just remember that OE have a lot of distros, machines and images.
Ideal case is to test all combinations, but, let's try to imagine how
long this will be.

We have following number of distros, machines and images:
$ ls conf/distro/*.conf | wc -l
32
$ ls conf/machine/*.conf | wc -l
297
$ ls recipes/images/*.bb | wc -l
99

My testbuilder (phenom II x6) is building one image in about 2 hours.
So, 32 * 297 * 99 * 2 = 1881792 hours. It is about 214 years if I
calculate right. Well, cluster of 32 alike machines can reduce this
time to 6 years :)

It would be great to have buildserver that will rebuild some most
frequently used combinations once per day. Probably, qemu machines +
automated testing under qemu.
Or even create some distributed build system (buildbot?) with server
(should give tasks to clients) and clients (should build tasks given
by server).

Other good idea is to have sanity checker running once per day too. It
may do next things:
- check recipes syntax
- check thath recipes SRC_URI can be fetched
- check recipes for security flaws (we have tool already)
- ...
- PROFIT! :) (sorry, just can't not to write this :)

-- 
Yury Bushmelev


