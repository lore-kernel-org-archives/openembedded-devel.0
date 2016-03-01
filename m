Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD26731F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:35:10 +0000 (UTC)
Received: from localhost (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id B701D1C8C29;
	Tue,  1 Mar 2016 09:35:08 +0100 (CET)
Date: Tue, 1 Mar 2016 09:35:08 +0100
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: =?iso-8859-1?Q?Jo=E3o?= Henrique Freitas <joaohf@gmail.com>
Message-ID: <20160301083508.GA4897@comp-006-thk.openrnd.local>
References: <1942614094.432571.c7487dd4-fa75-4480-8552-00e8cab6887c.open-xchange@poczta.nazwa.pl>
MIME-Version: 1.0
In-Reply-To: <1942614094.432571.c7487dd4-fa75-4480-8552-00e8cab6887c.open-xchange@poczta.nazwa.pl>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-erlang] generate-manifest update and packaging fixes pull request
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
X-List-Received-Date: Tue, 01 Mar 2016 08:35:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi João,

Did you get a chance to look at the patches? I can open a pull
request on github if that's more convenient for you.

On 02/25 20:56, Maciej Borzecki wrote:
> The series contains a number of patches for the `generate-manifest` tool as
> well as fixes for packaging of Erlang modules.
>
> The first patch addresses the problem of maintaining multiple versions
> of `generate-manifest` tool, one for each Erlang version. This is not
> effective in the long run. The tool has been updated to support multiple
> Erlang versions. We exploit the fact that Erlang modules have a
> predictable directory layout. There is very little change between
> consecutive Erlang versions with respect to module organization. This
> allowed for reducing much of the duplication into a smaller, more
> maintainable code. The script can generate manifest for Erlang 18.2.3
> and 18.1.5 (version currently supported in the tree). Particular version
> is selected by passing --erlang-version <version> as a command line.
> Along with the changes described above, the script has been pylinted.
> The generated manifest contain slightly more packages, as by default a
> *-doc package is added for each module. The script output is largely
> identical to what the original code produced.
>
> The second patch tightens package file selection. We make sure that *-dev
> packages ship `src` as well as `c_src`, `java_src` and other variants,
> should they exist. The *-doc packages should ship manpages and other
> documentation files.
>
> The third patch fixes the problem of files being shipped in incorrect
> packages. The commit message is rather long, so for brevity, I will not
> repeat it here. TL;DR is that the way the packages are populated and how
> the manifest gets generated results in for instance dialyzer script
> being shipped in erlang-erts package. The fix addresses this problem by
> preserving the order in which modules are defined. Since we're using
> Erlang in an embedded system, we're rather picky about the modules and
> install only the ones that are needed for particular application. By
> shipping incorrect files in packages, we either need to install
> unnecessary packages, or install too many files, thus wasting space.
>
> The last patch is a regenerated manifest files for Erlang 18.1.5 and
> 18.2.3. The diff is large (~200kB), that's why I've put everything into
> a pull request.
>
>
> The following changes since commit 8878361e26aee0624385a4ef1ede44cdacd8108a:
>
>   erlang: add 18.2.3 (2016-02-07 16:08:55 -0200)
>
> are available in the git repository at:
>
>   https://github.com/open-rnd/meta-erlang.git
>
> for you to fetch changes up to c9ee91fed2e5241fc3d506cb0fde971b153f8909:
>
>   erlang-xxx-manifest: regenerate manifest files (2016-02-25 20:27:55 +0100)
>
> ----------------------------------------------------------------
> Maciej Borzecki (4):
>       generate-manifest: replace multiple scripts with one
>       generate-manifest: tighten file selection rules
>       generate-manifest: preserve the package order
>       erlang-xxx-manifest: regenerate manifest files
>
>  recipes-devtools/erlang/erlang-18.1.5-manifest.inc | 2058 +++++++++++---------
>  recipes-devtools/erlang/erlang-18.2.3-manifest.inc | 2058 +++++++++++---------
>  scripts/contrib/erlang/generate-manifest           |  394 ++++
>  scripts/contrib/erlang/generate-manifest-18.1.py   |  460 -----
>  scripts/contrib/erlang/generate-manifest-18.2.1.py |  460 -----
>  5 files changed, 2712 insertions(+), 2718 deletions(-)
>  create mode 100755 scripts/contrib/erlang/generate-manifest
>  delete mode 100755 scripts/contrib/erlang/generate-manifest-18.1.py
>  delete mode 100755 scripts/contrib/erlang/generate-manifest-18.2.1.py
>
> --
> Maciej Borzęcki
> Senior Software Engineer at Open-RnD Sp. z o.o.
> www.open-rnd.pl

--
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079


Niniejsza wiadomość wraz z załącznikami może
zawierać chronione prawem lub poufne informacje i została
wysłana wyłącznie do wiadomości i użytku osób, do których
została zaadresowana. Jeśli wiadomość została otrzymana
przypadkowo zabrania się jej kopiowania lub rozsyłania do osób
trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o
zaistniałej sytuacji za pomocą wiadomości zwrotnej.
Dziękujemy.

This message, including any attachments hereto,
may contain privileged or confidential information and is sent
solely for the attention and use of the intended addressee(s).
If you are not an intended addressee, you may neither use this
message nor copy or deliver it to anyone. In such case, you
should immediately destroy this message and kindly notify the
sender by reply email. Thank you.

