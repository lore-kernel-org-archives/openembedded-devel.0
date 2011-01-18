Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfIIR-0003nl-Pz
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 21:36:56 +0100
Received: by gxk20 with SMTP id 20so7718gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 12:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=OqZL9bYw2I4dtUiyl9m1cuhshISCU/lWDtOE650swYE=;
	b=w0SwxWDQM28h02rXtg5fMj2pP08kNjy+bq8/9wcHwFfovv4yMtkoUMa0i8FklnNNNA
	G1NdTNR8KM0sNOa7UoP33NBL/pov4u6/512sv14Muql46WlbE/srtvnL5UNZ3yEzgvab
	IFkv4yFTELznhBtdMrCGHS7OobCNEup/3in3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=L4SyuJdzbwFjlirkV/LqkgYQYeFURulPm54HgJJ9pJvVmn11rkSaP7m1BbLVEUir86
	bKb1rsS9A+1zFkJuI4QsFAi7t92XClikfLOWOYGrKJG+IfJlXPLNlf2IZXYXQXXUNMnA
	C9kJzB1+rhTHtLf8la6KG2sWgN5SXJwqC4M4Y=
Received: by 10.42.240.66 with SMTP id kz2mr6860612icb.340.1295382976266; Tue,
	18 Jan 2011 12:36:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Tue, 18 Jan 2011 12:35:56 -0800 (PST)
In-Reply-To: <1295363929-13246-2-git-send-email-kergoth@gmail.com>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-2-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2011 12:35:56 -0800
Message-ID: <AANLkTik16j=fVzeLgxsCgPRKfDZa2XmOimO5Z7fSiCaK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/4] Move stage-manager-* into bin/ rather than a recipe
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
X-List-Received-Date: Tue, 18 Jan 2011 20:36:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2011 at 7:18 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>


Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0{recipes/stage-manager/files =3D> bin}/stage-manager | =C2=A0 =C2=
=A03 --
> =C2=A0.../stage-manager/files =3D> bin}/stage-manager-ipkg | =C2=A0 26 ++=
++++++++----------
> =C2=A0.../files =3D> bin}/stage-manager-ipkg-build =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A06 ++--
> =C2=A0classes/base.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
5 +--
> =C2=A0classes/packaged-staging.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A05 ----
> =C2=A0recipes/stage-manager/stagemanager-native_0.0.1.bb | =C2=A0 26 ----=
----------------
> =C2=A06 files changed, 18 insertions(+), 53 deletions(-)
> =C2=A0rename {recipes/stage-manager/files =3D> bin}/stage-manager (99%)
> =C2=A0rename {recipes/stage-manager/files =3D> bin}/stage-manager-ipkg (9=
8%)
> =C2=A0rename {recipes/stage-manager/files =3D> bin}/stage-manager-ipkg-bu=
ild (99%)
> =C2=A0delete mode 100644 recipes/stage-manager/stagemanager-native_0.0.1.=
bb
>
> diff --git a/recipes/stage-manager/files/stage-manager b/bin/stage-manage=
r
> similarity index 99%
> rename from recipes/stage-manager/files/stage-manager
> rename to bin/stage-manager
> index 0c01a18..5b47791 100755
> --- a/recipes/stage-manager/files/stage-manager
> +++ b/bin/stage-manager
> @@ -151,6 +151,3 @@ if __name__ =3D=3D "__main__":
> =C2=A0 =C2=A0 if found_difference:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.exit(5)
> =C2=A0 =C2=A0 sys.exit(0)
> -
> -
> -
> diff --git a/recipes/stage-manager/files/stage-manager-ipkg b/bin/stage-m=
anager-ipkg
> similarity index 98%
> rename from recipes/stage-manager/files/stage-manager-ipkg
> rename to bin/stage-manager-ipkg
> index 105ea54..456bc78 100755
> --- a/recipes/stage-manager/files/stage-manager-ipkg
> +++ b/bin/stage-manager-ipkg
> @@ -131,15 +131,15 @@ Valid destinations are directories or one of the de=
st names from $IPKG_CONF:" >&
> =C2=A0 =C2=A0 =C2=A0 =C2=A0IPKG_HTTP_PROXY=3D`ipkg_option http_proxy`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0IPKG_FTP_PROXY=3D`ipkg_option ftp_proxy`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0IPKG_NO_PROXY=3D`ipkg_option no_proxy`
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "$IPKG_HTTP_PROXY" ]; then
> + =C2=A0 =C2=A0 =C2=A0 if [ -n "$IPKG_HTTP_PROXY" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export http_proxy=
=3D"$IPKG_HTTP_PROXY"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "$IPKG_FTP_PROXY" ]; then
> + =C2=A0 =C2=A0 =C2=A0 if [ -n "$IPKG_FTP_PROXY" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export ftp_proxy=
=3D"$IPKG_FTP_PROXY"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> - =C2=A0 =C2=A0 =C2=A0 if [ -n "$IPKG_NO_PROXY" ]; then
> + =C2=A0 =C2=A0 =C2=A0 if [ -n "$IPKG_NO_PROXY" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export no_proxy=3D=
"$IPKG_NO_PROXY"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> @@ -175,7 +175,7 @@ Options:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration file, (but can also be =
a directory
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name in a pinch).
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 -o <offline_root> =C2=A0 =C2=A0 =C2=A0 Use <o=
ffline_root> as the root for offline installation.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0-offline <offline_root>
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-offline <offline_root>
>
> =C2=A0Force Options (use when ipkg is too smart for its own good):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0-force-depends =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Make dependency checks warnings instead of errors
> @@ -221,7 +221,7 @@ ipkg_download() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local proxyuser=3D""
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local proxypassword=3D""
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local proxyoption=3D""
> -
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n "$IPKG_PROXY_USERNAME" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proxyuser=3D"--pro=
xy-user=3D\"$IPKG_PROXY_USERNAME\""
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proxypassword=3D"-=
-proxy-passwd=3D\"$IPKG_PROXY_PASSWORD\""
> @@ -276,7 +276,7 @@ ipkg_update() {
>
> =C2=A0ipkg_list() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for src in `ipkg_src_names`; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ipkg_require_list $=
src; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ipkg_require_list $=
src; then
> =C2=A0# black magic...
> =C2=A0sed -ne "
> =C2=A0/^Package:/{
> @@ -342,7 +342,7 @@ ipkg_info() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0case $# in
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat $IPKG_LISTS_DIR/$src
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A01)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipkg_extract_paragraph $1 < $IPKG_LIS=
TS_DIR/$src
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> @@ -545,7 +545,7 @@ ipkg_safe_pkg_name() {
> =C2=A0}
>
> =C2=A0ipkg_set_depends() {
> - =C2=A0 =C2=A0 =C2=A0 local pkg=3D$1; shift
> + =C2=A0 =C2=A0 =C2=A0 local pkg=3D$1; shift
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local new_deps=3D"$*"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg=3D`ipkg_safe_pkg_name $pkg`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0## setvar ${pkg}_depends "$new_deps"
> @@ -672,7 +672,7 @@ Status: install ok not-installed" | ipkg_status_updat=
e_sd $sd $pkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_pkgs=3D"$new_pkgs $pkg"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0### echo "Dependences not satisfied f=
or $pkg: $remaining_deps"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $curcheck -ne `echo =C2=A0$pkgs|=
wc -w` ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi
>
> @@ -886,7 +886,7 @@ diff -u $dest/$conffile $IPKG_TMP/$pkg/data/$conffile=
"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0local owd=3D`pwd`
> - =C2=A0 =C2=A0 =C2=A0 (cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; c=
d $dest; tar xf -))
> + =C2=A0 =C2=A0 =C2=A0 (cd $IPKG_TMP/$pkg/data/; tar cf - . | (cd $owd; c=
d $dest; tar xf -))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $IPKG_TMP/$pkg/data
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir $IPKG_TMP/$pkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $IPKG_TMP/data.tar.gz $IPKG_TMP/data.tar
> @@ -924,7 +924,7 @@ ipkg_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0while [ $# -gt 0 ]; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local pkg=3D"$1"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shift
> -
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case "$pkg" in
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http://* | ftp://*=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0local tmp_pkg_file=3D"$IPKG_TMP/"`ipkg_file_part $pkg`
> @@ -1013,7 +1013,7 @@ ipkg_upgrade_pkg() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ "$avail_ver" =3D "$inst_ver" ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ "$avail_ver" =3D "$inst_ver" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "Package $pkg ($inst_ver) instal=
led in $dest_name is up to date"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0elif ipkg-compare-versions $avail_ver '>>' $inst_ver; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "Upgrading $pkg ($dest_name) fro=
m $inst_ver to $avail_ver"
> @@ -1037,7 +1037,7 @@ ipkg_upgrade() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgs=3D"$*"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> -
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in $pkgs; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ipkg_upgrade_pkg $=
pkg
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> diff --git a/recipes/stage-manager/files/stage-manager-ipkg-build b/bin/s=
tage-manager-ipkg-build
> similarity index 99%
> rename from recipes/stage-manager/files/stage-manager-ipkg-build
> rename to bin/stage-manager-ipkg-build
> index 77367ac..1a5e2597 100755
> --- a/recipes/stage-manager/files/stage-manager-ipkg-build
> +++ b/bin/stage-manager-ipkg-build
> @@ -68,7 +68,7 @@ You probably want to chown these to a system user: " >&=
2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ls -ld $large_uid_=
files
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo >&2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> -
> +
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -f "$CONTROL/control" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "*** Error: C=
ontrol file $pkg_dir/$CONTROL/control not found." >&2
> @@ -109,7 +109,7 @@ You probably want to chown these to a system user: " =
>&2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0source=3D`required_field Source`
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[ "$?" -ne 0 ] && PKG_ERROR=3D1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z "$source" ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "The Source field contain the U=
RL's or filenames of the source code and any patches"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "The Source field contain the U=
RL's or filenames of the source code and any patches"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "used to build this package=
. =C2=A0Either gnu-style tarballs or Debian source packages "
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "are acceptable. =C2=A0Rela=
tive filenames may be used if they are distributed in the same"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "directory as the .ipk file=
."
> @@ -196,7 +196,7 @@ case $# in
> =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> =C2=A0*)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo $usage >&2
> - =C2=A0 =C2=A0 =C2=A0 exit 1
> + =C2=A0 =C2=A0 =C2=A0 exit 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> =C2=A0esac
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 308498f..6fa292e 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -61,8 +61,7 @@ def base_deps(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# that case though.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#
> =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D "coreutils-native"
> - =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('PN', d, True) in ("shasum-nativ=
e", "stagemanager-native",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0"coreutils-native"):
> + =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('PN', d, True) in ("shasum-nativ=
e", "coreutils-native"):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D ""
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# INHIBIT_DEFAULT_DEPS doesn't apply to the pa=
tch command. =C2=A0Whether or =C2=A0not
> @@ -76,7 +75,7 @@ def base_deps(d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.getVar('PN', d, True) not in =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0("linux-libc-headers-native", "quilt-=
native",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "unifdef-native", "shasum-native",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"stagemanager-native", "coreutils-=
native"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"coreutils-native"):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0deps +=3D " linux-libc-headers-native"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return deps
>
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.=
bbclass
> index e968e4d..19d84bd 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -23,7 +23,6 @@ PSTAGE_SCAN_CMD ?=3D "find ${PSTAGE_TMPDIR_STAGE} \( -n=
ame "*.la" -o -name "*-conf
>
> =C2=A0PSTAGE_NATIVEDEPENDS =3D "\
> =C2=A0 =C2=A0 shasum-native \
> - =C2=A0 =C2=A0stagemanager-native \
> =C2=A0 =C2=A0 "
>
> =C2=A0BB_STAMP_WHITELIST =3D "${PSTAGE_NATIVEDEPENDS}"
> @@ -75,10 +74,6 @@ python __anonymous() {
> =C2=A0 =C2=A0 # Add task dependencies if we're active, otherwise mark pac=
kaged staging
> =C2=A0 =C2=A0 # as inactive.
> =C2=A0 =C2=A0 if pstage_allowed:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D bb.data.getVarFlag('do_setscene', '=
depends', d) or ""
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D " stagemanager-native:do_populate_=
sysroot"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVarFlag('do_setscene', 'depends',=
 deps, d)
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy =3D bb.data.getVar("BB_STAMP_POLICY", =
d, True)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if policy =3D=3D "whitelist" or policy =3D=3D=
 "full":
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D bb.data.getVarFlag('do_=
setscene', 'recrdeptask', d) or ""
> diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb b/recipes=
/stage-manager/stagemanager-native_0.0.1.bb
> deleted file mode 100644
> index 9577749..0000000
> --- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DESCRIPTION =3D "Helper script for packaged-staging.bbclass"
> -PR =3D "r15"
> -
> -SRC_URI =3D "file://stage-manager \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://stage-manager-ipkg \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://stage-manager-ipkg-build "
> -LICENSE =3D "GPLv2"
> -
> -PACKAGE_ARCH =3D "all"
> -
> -inherit native
> -
> -DEPENDS =3D " "
> -PACKAGE_DEPENDS =3D " "
> -PATCHDEPENDENCY =3D ""
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
> -PSTAGING_DISABLED =3D "1"
> -
> -NATIVE_INSTALL_WORKS =3D "1"
> -do_install() {
> - =C2=A0 =C2=A0 =C2=A0 install -d ${STAGING_BINDIR}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/stage-manager ${STAGING=
_BINDIR}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/stage-manager-ipkg ${ST=
AGING_BINDIR}
> - =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/stage-manager-ipkg-buil=
d ${STAGING_BINDIR}
> -}
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


