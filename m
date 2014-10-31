Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id BDB0E60557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 15:16:52 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id l13so1218014iga.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JipIVoJWDWLYl9WgORcGiZWbwuqNji1+rZ1ZcTySQWQ=;
	b=OvCJBX96jHReK22C905MtvC1Fa6RIC3e4+Whg1QXWO47qAGr4qCKI9ReEuJB7P/EHR
	9gms0qUCLRtDkm8KXIVDXdkIK7/i7m5QzTQf/COjDH/V01E0/NVX6Qet6sLOJvCpLmtB
	5R17bdDDLybr0GLCwgENNbOcAnucrxexzb023xtRs+AxA6NVyqnwxYLTsUr/pCY+XF5+
	8YL5mmfhEm51Hw04IJnXoI1cI6MGstDy/AExrl3dX2blt0A2zj4s+qghATs+wVTQSZ6n
	AQEjmM8ThogIuJdEYqbThziu9nL+jxcKhJ3OIm2cd+Uqz0ns7PHntDhCyglQQe3ZE0J9
	fbDw==
X-Received: by 10.50.73.131 with SMTP id l3mr4947175igv.10.1414768612272; Fri,
	31 Oct 2014 08:16:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Fri, 31 Oct 2014 08:16:22 -0700 (PDT)
In-Reply-To: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
References: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Oct 2014 08:16:22 -0700
Message-ID: <CAMKF1so+zRawQV7Q9zQqiN71AWiR25f7fKbzN0ejnFR06S_qkg@mail.gmail.com>
To: Cliff Brake <cbrake@bec-systems.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 31 Oct 2014 15:16:53 -0000
Content-Type: text/plain; charset=UTF-8

Acked-by: Khem Raj <raj.khem@gmail.com>

On Wed, Oct 29, 2014 at 11:08 AM, Cliff Brake <cbrake@bec-systems.com> wrote:
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

