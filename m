Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id E4E2D6A463
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2013 08:17:33 +0000 (UTC)
Received: from android-17c990e6fd634c9c.lan (83.252.255.124) by
	stoexhubfe02.domain01.net (10.12.10.7) with Microsoft SMTP Server (TLS)
	id 8.3.279.1; Sat, 19 Oct 2013 10:17:33 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <20131018094009.GF3930@jama>
References: <cover.1381920288.git.anders@chargestorm.se>
	<cace5960-a68e-4774-911d-debd3fc71b6d@email.android.com>
	<20131018094009.GF3930@jama>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Sat, 19 Oct 2013 10:17:26 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Message-ID: <29fe97d5-76b0-4898-bc80-9af1aef64855@email.android.com>
X-GFI-SMTP-Submission: 1
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
X-List-Received-Date: Sat, 19 Oct 2013 08:17:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"



Martin Jansa <martin.jansa@gmail.com> wrote:
>On Fri, Oct 18, 2013 at 07:14:09AM +0200, Anders Darander wrote:
>> I'm going to resend this series with the correct prefix added. 
>
>Are they the same, just with prefix added?

Yes, they are the same. Had I known that you already had them included in the last Jenkins build, I wouldn't have resent them. 

So no need to fetch a new version. 

Cheers, 
Anders 

>I've already included them in last jenkins builds, so to know if I
>should fetch new version from patchwork or not.
>
>> Anders Darander <anders@chargestorm.se> wrote:
>> >
>> >These are a couple of recipes that we've been using internally for
>some
>> >time. They
>> >were developed and mostly used on a dylan-based setup. Testing has
>> >primarily been 
>> >performed on ARM, both qemuarm and our custom machine.
>> >
>> >Breakpad is a crash reporting tool, that's getting a wider use.
>> >Please, let me know if there's a more efficient way (or otherwise
>> >better way) to 
>> >have the bbclass generate the symbol file.
>> >
>> >Ktap is a new scripting dynamic tracing tool for Linux. This recipe
>> >will be of
>> >use until everyone is on 3.13+ kernels (ktap has been merged for the
>> >3.13 series).
>> >
>> >The following changes since commit
>> >f8903f53db717294d63a8d79b5ef7ca34b3c189e:
>> >
>> >libhugetlbfs: install perl lib to directory perl instead of perl5
>> >(2013-10-15 13:43:53 +0200)
>> >
>> >are available in the git repository at:
>> >
>> >  git://github.com/darander/meta-oe breakpad-ktap
>> >  https://github.com/darander/meta-oe/tree/breakpad-ktap
>> >
>> >Anders Darander (2):
>> >  breakpad: add initial recipe
>> >  ktap: add initial recipe
>> >
>> > meta-oe/classes/breakpad.bbclass                  | 32 ++++++++++
>> >meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 72
>> >+++++++++++++++++++++++
>> > meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb    | 19 ++++++
>> > meta-oe/recipes-kernel/ktap/ktap.inc              | 11 ++++
>> > meta-oe/recipes-kernel/ktap/ktap_0.3.bb           | 17 ++++++
>> > 5 files changed, 151 insertions(+)
>> > create mode 100644 meta-oe/classes/breakpad.bbclass
>> > create mode 100644
>meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
>> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
>> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap.inc
>> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap_0.3.bb
>> 
>> -- 
>> ChargeStorm AB / eStorm 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Anders Darander
ChargeStorm AB          Tel: +46 702 44 84 36
Laxholmstorget 3        Email: anders@chargestorm.se
602 21 Norrköping       Web: www.chargestorm.se

Sent from my Android phone with K-9 Mail. Please excuse my brevity.

