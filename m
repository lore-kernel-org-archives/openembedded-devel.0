Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 53FF16D15E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 05:14:17 +0000 (UTC)
Received: from android-17c990e6fd634c9c.lan (83.252.255.124) by
	STOEXHUB01.domain01.net (10.12.10.1) with Microsoft SMTP Server (TLS)
	id 8.3.279.1; Fri, 18 Oct 2013 07:14:14 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <cover.1381920288.git.anders@chargestorm.se>
References: <cover.1381920288.git.anders@chargestorm.se>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Fri, 18 Oct 2013 07:14:09 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <cace5960-a68e-4774-911d-debd3fc71b6d@email.android.com>
Subject: Re: [PATCH 0/2] Breakpad and ktap recipes
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
X-List-Received-Date: Fri, 18 Oct 2013 05:14:18 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"

I'm going to resend this series with the correct prefix added. 

Anders Darander <anders@chargestorm.se> wrote:
>
>These are a couple of recipes that we've been using internally for some
>time. They
>were developed and mostly used on a dylan-based setup. Testing has
>primarily been 
>performed on ARM, both qemuarm and our custom machine.
>
>Breakpad is a crash reporting tool, that's getting a wider use.
>Please, let me know if there's a more efficient way (or otherwise
>better way) to 
>have the bbclass generate the symbol file.
>
>Ktap is a new scripting dynamic tracing tool for Linux. This recipe
>will be of
>use until everyone is on 3.13+ kernels (ktap has been merged for the
>3.13 series).
>
>The following changes since commit
>f8903f53db717294d63a8d79b5ef7ca34b3c189e:
>
>libhugetlbfs: install perl lib to directory perl instead of perl5
>(2013-10-15 13:43:53 +0200)
>
>are available in the git repository at:
>
>  git://github.com/darander/meta-oe breakpad-ktap
>  https://github.com/darander/meta-oe/tree/breakpad-ktap
>
>Anders Darander (2):
>  breakpad: add initial recipe
>  ktap: add initial recipe
>
> meta-oe/classes/breakpad.bbclass                  | 32 ++++++++++
>meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 72
>+++++++++++++++++++++++
> meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb    | 19 ++++++
> meta-oe/recipes-kernel/ktap/ktap.inc              | 11 ++++
> meta-oe/recipes-kernel/ktap/ktap_0.3.bb           | 17 ++++++
> 5 files changed, 151 insertions(+)
> create mode 100644 meta-oe/classes/breakpad.bbclass
> create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> create mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
> create mode 100644 meta-oe/recipes-kernel/ktap/ktap.inc
> create mode 100644 meta-oe/recipes-kernel/ktap/ktap_0.3.bb

-- 
ChargeStorm AB / eStorm 

