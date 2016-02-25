Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4A5771A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 19:56:47 +0000 (UTC)
Received: from poczta.nazwa.pl (unknown [10.252.0.19])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id A034D2D654E;
	Thu, 25 Feb 2016 20:56:46 +0100 (CET)
Date: Thu, 25 Feb 2016 20:56:46 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
Message-ID: <1942614094.432571.c7487dd4-fa75-4480-8552-00e8cab6887c.open-xchange@poczta.nazwa.pl>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.0-Rev20
X-Originating-Client: com.openexchange.ox.gui.dhtml
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-erlang] generate-manifest update and packaging fixes pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 19:56:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The series contains a number of patches for the `generate-manifest` tool as
well as fixes for packaging of Erlang modules.

The first patch addresses the problem of maintaining multiple versions
of `generate-manifest` tool, one for each Erlang version. This is not
effective in the long run. The tool has been updated to support multiple
Erlang versions. We exploit the fact that Erlang modules have a
predictable directory layout. There is very little change between
consecutive Erlang versions with respect to module organization. This
allowed for reducing much of the duplication into a smaller, more
maintainable code. The script can generate manifest for Erlang 18.2.3
and 18.1.5 (version currently supported in the tree). Particular version
is selected by passing --erlang-version <version> as a command line.
Along with the changes described above, the script has been pylinted.
The generated manifest contain slightly more packages, as by default a
*-doc package is added for each module. The script output is largely
identical to what the original code produced.

The second patch tightens package file selection. We make sure that *-dev
packages ship `src` as well as `c_src`, `java_src` and other variants,
should they exist. The *-doc packages should ship manpages and other
documentation files.

The third patch fixes the problem of files being shipped in incorrect
packages. The commit message is rather long, so for brevity, I will not
repeat it here. TL;DR is that the way the packages are populated and how
the manifest gets generated results in for instance dialyzer script
being shipped in erlang-erts package. The fix addresses this problem by
preserving the order in which modules are defined. Since we're using
Erlang in an embedded system, we're rather picky about the modules and
install only the ones that are needed for particular application. By
shipping incorrect files in packages, we either need to install
unnecessary packages, or install too many files, thus wasting space.

The last patch is a regenerated manifest files for Erlang 18.1.5 and
18.2.3. The diff is large (~200kB), that's why I've put everything into
a pull request.


The following changes since commit 8878361e26aee0624385a4ef1ede44cdacd8108a=
:

  erlang: add 18.2.3 (2016-02-07 16:08:55 -0200)

are available in the git repository at:

  https://github.com/open-rnd/meta-erlang.git=20

for you to fetch changes up to c9ee91fed2e5241fc3d506cb0fde971b153f8909:

  erlang-xxx-manifest: regenerate manifest files (2016-02-25 20:27:55 +0100=
)

----------------------------------------------------------------
Maciej Borzecki (4):
      generate-manifest: replace multiple scripts with one
      generate-manifest: tighten file selection rules
      generate-manifest: preserve the package order
      erlang-xxx-manifest: regenerate manifest files

 recipes-devtools/erlang/erlang-18.1.5-manifest.inc | 2058 +++++++++++-----=
----
 recipes-devtools/erlang/erlang-18.2.3-manifest.inc | 2058 +++++++++++-----=
----
 scripts/contrib/erlang/generate-manifest           |  394 ++++
 scripts/contrib/erlang/generate-manifest-18.1.py   |  460 -----
 scripts/contrib/erlang/generate-manifest-18.2.1.py |  460 -----
 5 files changed, 2712 insertions(+), 2718 deletions(-)
 create mode 100755 scripts/contrib/erlang/generate-manifest
 delete mode 100755 scripts/contrib/erlang/generate-manifest-18.1.py
 delete mode 100755 scripts/contrib/erlang/generate-manifest-18.2.1.py

--
Maciej Borz=C4=99cki
Senior Software Engineer at Open-RnD Sp. z o.o.
www.open-rnd.pl

