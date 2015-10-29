Return-Path: <prvs=7372357f8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 99176759B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 07:42:30 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqwEAPPMMVasEApK/2dsb2JhbABehApvBrp7hgkdhX4CgXkBAQEBAQGBC4Q1AQEBAwEyARgBLAYLCw0LCRYPCQMCAQIBRQYNBgICiCQNuRoBjBABLIZ3g3iBBoROSYQuBZY+hRyRIReTBIMngUFxAYQ1QYEGAQEB
X-IPAS-Result: AqwEAPPMMVasEApK/2dsb2JhbABehApvBrp7hgkdhX4CgXkBAQEBAQGBC4Q1AQEBAwEyARgBLAYLCw0LCRYPCQMCAQIBRQYNBgICiCQNuRoBjBABLIZ3g3iBBoROSYQuBZY+hRyRIReTBIMngUFxAYQ1QYEGAQEB
Message-ID: <5631CDAD.7030703@skidata.com>
Date: Thu, 29 Oct 2015 08:41:33 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
In-Reply-To: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 07:42:32 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 10/28/2015 07:01 PM, Jens Rehsack wrote:
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
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  README                                             |   13 +-
>  recipes-core/cacao/cacao_1.6.1.bb                  |    2 +-
>  recipes-core/ecj/ecj-bootstrap-native.bb           |    2 -
>  recipes-core/openjdk/openjdk-8-72b00/LICENSE       |  347 +++
>  .../dont-expect-fqpn-for-make.patch                |   18 +
>  .../openjdk-8-72b00/filter-aclocal-copy-too.patch  |   11 +
>  recipes-core/openjdk/openjdk-8-72b00/jvm.cfg       |   41 +
>  .../openjdk8-find-compiler-fix-env-respect.patch   |  140 +
>  .../openjdk-8-72b00/openjdk8-fix-shark-build.patch |  453 ++++
>  .../openjdk8-fix-shark-stdc++11.patch              | 2730 ++++++++++++++++++++
>  .../openjdk8-no-genx11-in-headless.patch           |   17 +
>  .../openjdk-8-72b00/openjdk8-no-unused-deps.patch  |   94 +
>  ...o-in-favour-of-openembedded-package-split.patch |  120 +
>  .../openjdk8-restrict-to-staging-dir.patch         |   11 +
>  ..._than_returning_address_of_local_variable.patch |   23 +
>  .../remove-shell-variables-from-autoheader.patch   |   31 +
>  recipes-core/openjdk/openjdk-8-common.inc          |  229 ++
>  recipes-core/openjdk/openjdk-8-cross.inc           |  202 ++
>  recipes-core/openjdk/openjdk-8-native.inc          |   63 +
>  recipes-core/openjdk/openjdk-8-native_72b00.bb     |   16 +
>  recipes-core/openjdk/openjdk-8-release-72b00.inc   |   89 +
>  recipes-core/openjdk/openjdk-8_72b00.bb            |   36 +
>  recipes-core/openjdk/openjre-8_72b00.bb            |   30 +
>  23 files changed, 4706 insertions(+), 12 deletions(-)
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/LICENSE
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/dont-expect-fqpn-for-make.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/filter-aclocal-copy-too.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/jvm.cfg
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-find-compiler-fix-env-respect.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-fix-shark-build.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-fix-shark-stdc++11.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-no-genx11-in-headless.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-no-unused-deps.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-prevent-debuginfo-in-favour-of-openembedded-package-split.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-restrict-to-staging-dir.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/openjdk8-use_builtin_frame_address_0_rather_than_returning_address_of_local_variable.patch
>  create mode 100644 recipes-core/openjdk/openjdk-8-72b00/remove-shell-variables-from-autoheader.patch

IMHO a version independent patches directory like for openjdk-7 would
also be good here.

To cite Otavio:
We could rename the patches directory for openjdk-7 and avoid the
version number on it. This would make easier for upgrades and to see
the diff between the patches.

>  create mode 100644 recipes-core/openjdk/openjdk-8-common.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8-cross.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8-native.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8-native_72b00.bb
>  create mode 100644 recipes-core/openjdk/openjdk-8-release-72b00.inc
>  create mode 100644 recipes-core/openjdk/openjdk-8_72b00.bb
>  create mode 100644 recipes-core/openjdk/openjre-8_72b00.bb

Furthermore I had problems building OpenJDK-7 with this patch applied.
But I will verify that again and come back to you!

best regards,
Richard L

