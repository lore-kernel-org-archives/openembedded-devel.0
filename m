Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id B9F5C65E94
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 12:21:31 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id q9so3220951ykb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 05:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BUf27vTxEynHBGtKse9DHkauEOjgGV48W+iCkcmY/vU=;
	b=JhAcOaPlcO6sUnbCfwQTiStFMwa/B+XQEkQNSZtJw0ZezhmvsxeIR9M4EcFml8jMrh
	eH6Qo1aB17hRfaPj+q+Yi7UBkST9FVKK2u/55fjoyw5gYHSi8ycSRlmmk8rr6kXInzQa
	8AyqWMNTcCp8jE0rVf/mlyT6LsHm2kqi2jgO6bWuaoOor+Btf9TDeS7k6z+vD28hpis1
	QNNoD8iGqCxDUl2pCMqKmYdA7Sxs0+SJq52JM1FYsFyrYFCnf2eaeQAt0wtg4NtFmC7p
	sdr8UagNniKZBZ2slaPy4TV80c9dWuZdlcJPJWK8twMJQRHJK2p/cNPc0Ki3jgcF0uI6
	KXzw==
MIME-Version: 1.0
X-Received: by 10.170.195.88 with SMTP id m85mr13824919yke.30.1414758092389;
	Fri, 31 Oct 2014 05:21:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 31 Oct 2014 05:21:32 -0700 (PDT)
In-Reply-To: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
References: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
Date: Fri, 31 Oct 2014 10:21:32 -0200
X-Google-Sender-Auth: 2ot9mwkKex-KvJKcBKtqwYoh0Bs
Message-ID: <CAP9ODKo77f7vZDzHL+-qfbcPZfEFcdKurFPA7kZZca-NW1Qhow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Cliff Brake <cbrake@bec-systems.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-ruby][daisy] pull request: ruby fixes
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
X-List-Received-Date: Fri, 31 Oct 2014 12:21:35 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Wed, Oct 29, 2014 at 4:08 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> The following changes since commit 518cd119a8724dbd485a5d5c5047de59e8fbd652:
>
>   imagemagick: fix SRC_URI (2014-10-14 10:49:48 -0400)
>
> are available in the git repository at:
>
>   https://github.com/cbrake/meta-openembedded.git daisy
>
> for you to fetch changes up to 8065dd8456913457a0114ddb2b4bd4842847b2a3:
>
>   ruby: fix race conditions at install-ext (2014-10-29 14:03:22 -0400)
>
> ----------------------------------------------------------------
> Jackie Huang (1):
>       ruby: fix race conditions at install-ext
>
> Roy Li (1):
>       ruby: fix a parallel building issue
>
>  meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
>                    | 37 +++++++++++++++++++++++++++++++++++++
>  meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
> | 31 +++++++++++++++++++++++++++++++
>  meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
>                      |  2 ++
>  3 files changed, 70 insertions(+)
>  create mode 100644
> meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
>  create mode 100644
> meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

