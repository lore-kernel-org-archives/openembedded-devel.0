Return-Path: <prvs=7422397a9=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 29D0175E2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 14:21:04 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqoEAHnBOFasEApK/2dsb2JhbABehQO7IIUcgz+CVwKCBQEBAQEBAYELhDYBAQQyAUURCw0LCRYPCQMCAQIBRQYNCAKIL8FXAQEIAiGGaIR+hDVyhBQBBIdBhwuHepY9F5MNhGiFJkKBBwEBAQ
X-IPAS-Result: AqoEAHnBOFasEApK/2dsb2JhbABehQO7IIUcgz+CVwKCBQEBAQEBAYELhDYBAQQyAUURCw0LCRYPCQMCAQIBRQYNCAKIL8FXAQEIAiGGaIR+hDVyhBQBBIdBhwuHepY9F5MNhGiFJkKBBwEBAQ
Message-ID: <5638C28E.7040505@skidata.com>
Date: Tue, 3 Nov 2015 15:19:58 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
In-Reply-To: <AE55B37B-BC8F-4516-82BC-B2B1DE341859@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Tue, 03 Nov 2015 14:21:05 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/03/2015 10:36 AM, Jens Rehsack wrote:
> This adds openjdk-8 for native and target builds and allows a stripped
> openjre-8 being built as well instead of trying to cherry-pick jre
> components from jdk-image.
> 
> The recipes allow building openjdk-8 with or without:
> * x11
> * cups
> * alsa/pulseaudio
> and let packager enable unlimited-crypto, if desired.
> 
> Since there can be only one PROVIDES for virtual/java-native and virtual/javac-native,
> move the provides to openjdk-8-native (I think everyone agrees it's a better
> choice than ecj-bootstrap-native).
> 
> Plus: Applying a fix from openjdk-9 repository which fixes build issues using gcc5

For me the patch fails to apply on current master:

git am patches-from-emails/openjdk-8_and_openjre-8.eml
Applying: openjdk-8: add recipes for openjdk-8 and openjre-8
/home/leri/git/meta-java/.git/rebase-apply/patch:515: trailing whitespace.
      xargs -0 -n1
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack
--effort=9 --segment-limit=-1 --modification-time=latest --strip-debug
/home/leri/git/meta-java/.git/rebase-apply/patch:1232: trailing whitespace.
#
/home/leri/git/meta-java/.git/rebase-apply/patch:1265: trailing whitespace.

/home/leri/git/meta-java/.git/rebase-apply/patch:1270: trailing whitespace.

/home/leri/git/meta-java/.git/rebase-apply/patch:1289: trailing whitespace.

fatal: corrupt patch at line 4592
Patch failed at 0001 openjdk-8: add recipes for openjdk-8 and openjre-8


