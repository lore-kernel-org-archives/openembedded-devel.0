Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 641B865D59
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 21:01:44 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id lj1so3899982pab.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=EaBNqgBWfCts1z+MtBJcXA4tba+6vrCLVfDNHjXWtzY=;
	b=FaZ14wOeAAB/+FJt7lZEkepq/50z1VhomfahYc4gPgD+0SMlGoKknla7NfMOuslqnt
	u0IpD6m0uYl7XUGzOM8WhwBYiUc5M6i7Z4ncFxbW8nghtNBS/rm5VH507BcWxzATNZac
	vUij8J4zKansck6bc9z/GF+y467Jvw2/nnERayFWkBkYF/jCPJNJq5jWDnTqFxEc8daS
	09qkNokLpSUfQPOWyWRPtvl2J/6sCZ3hTPesXZ+fZ3N7CGiNZyAGomxxHwZ6d/rquX+H
	8SNVxoIPk+SvPsfpO1bC5dvrM51Cs/yXz05YwtOSmp1qWW7evPH/2vA8Nyb5q/ikLQJ+
	X0RQ==
X-Received: by 10.66.161.197 with SMTP id xu5mr5839050pab.3.1414616504727;
	Wed, 29 Oct 2014 14:01:44 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:60e9:e885:dfa5:e1c1?
	([2601:c:9380:601:60e9:e885:dfa5:e1c1])
	by mx.google.com with ESMTPSA id gn1sm5133168pbd.45.2014.10.29.14.01.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Oct 2014 14:01:43 -0700 (PDT)
Message-ID: <545155B5.2000209@gmail.com>
Date: Wed, 29 Oct 2014 14:01:41 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
In-Reply-To: <CAOd_LFxfPjWtLYc58XCZAYq9eUd_1fCQMc0ehbd-WtHgccdsqg@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Wed, 29 Oct 2014 21:01:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Armin Kuster <akuster808@gmail.com>


On 10/29/2014 11:08 AM, Cliff Brake wrote:
> The following changes since commit 518cd119a8724dbd485a5d5c5047de59e8fbd652:
>
>    imagemagick: fix SRC_URI (2014-10-14 10:49:48 -0400)
>
> are available in the git repository at:
>
>    https://github.com/cbrake/meta-openembedded.git daisy
>
> for you to fetch changes up to 8065dd8456913457a0114ddb2b4bd4842847b2a3:
>
>    ruby: fix race conditions at install-ext (2014-10-29 14:03:22 -0400)
>
> ----------------------------------------------------------------
> Jackie Huang (1):
>        ruby: fix race conditions at install-ext
>
> Roy Li (1):
>        ruby: fix a parallel building issue
>
>   meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
>                     | 37 +++++++++++++++++++++++++++++++++++++
>   meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
> | 31 +++++++++++++++++++++++++++++++
>   meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
>                       |  2 ++
>   3 files changed, 70 insertions(+)
>   create mode 100644
> meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
>   create mode 100644
> meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
>

