Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NjgTH-0001F5-K7
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Feb 2010 23:09:46 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KY9001VZK2MGIK2@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Feb 2010 16:06:34 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D0F0D14AF60; Mon,
	22 Feb 2010 17:06:21 -0500 (EST)
Date: Mon, 22 Feb 2010 17:06:21 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20100222214335.GB30265@mx.loc>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100222220621.GB27420@denix.org>
MIME-version: 1.0
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
	<b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
	<20100222181754.GB24049@jama> <20100222194159.GZ30265@mx.loc>
	<20100222214335.GB30265@mx.loc>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Mon, 22 Feb 2010 22:09:47 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Mon, Feb 22, 2010 at 10:43:35PM +0100, Bernhard Reutner-Fischer wr=
ote:
> On Mon, Feb 22, 2010 at 08:41:59PM +0100, Bernhard Reutner-Fischer =
wrote:
> >On Mon, Feb 22, 2010 at 07:17:54PM +0100, Martin Jansa wrote:
> >>On Mon, Feb 22, 2010 at 10:06:00AM -0700, Chris Larson wrote:
> >>> On Mon, Feb 22, 2010 at 9:55 AM, Phil Blundell <philb@gnu.org> =
wrote:
> >>> > On Mon, 2010-02-22 at 11:24 -0500, Denys Dmytriyenko wrote:
> >>> >> On Sun, Feb 21, 2010 at 04:32:32PM +0100, Bernhard Reutner-F=
ischer wrote:
> >>> >> > Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail=
.com>
> >>> >> > ---
> >>> >> > =A0recipes/git/git.inc | =A0 =A02 +-
> >>> >> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >>> >> >
> >>> >> > diff --git a/recipes/git/git.inc b/recipes/git/git.inc
> >>> >> > index 644e159..fd7b708 100644
> >>> >> > --- a/recipes/git/git.inc
> >>> >> > +++ b/recipes/git/git.inc
> >>> >> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "The git revision control =
system used by the Linux kernel develope
> >>> >> > =A0SECTION =3D "console/utils"
> >>> >> > =A0LICENSE =3D "GPL"
> >>> >> >
> >>> >> > -SRC_URI =3D "http://www.kernel.org/pub/software/scm/git/g=
it-${PV}.tar.bz2"
> >>> >> > +SRC_URI =3D "http://www.kernel.org/pub/software/scm/git/g=
it-${PV}.tar.bz2;name=3Dgit"
> >>> >>
> >>> >> Is there a patch to add checksums in corresponding recipes t=
o use the name? Or
> >>> >> what is the purpose of adding one?
> >>> >
> >>> > I guess the idea is to make it possible for new recipes (whic=
h use
> >>> > this .inc file) to include their own checksums. =A0Seems like=
 a reasonable
> >>> > enough plan even if the old recipes are not converted.
> >>>=20
> >>> Has anyone thought about programmatically injecting a name to t=
he
> >>> first tarball/zip in the SRC_URI if no sources have that name y=
et?  It
> >>> seems like adding a name to the primary tarball is becoming com=
mon
> >>> boilerplate, and the common case is for that to be the first so=
urce.
> >
> >For recipes that have only one fetched source, could we perhaps de=
fault
> >to plain SRC_URI[md5sum], without a name. If a second fetched sour=
ce is
> >added, this would transparently break (i.e. require adding two nam=
es).
> >>
> >>Also would be great to have unified names where possible.
> >
> >For recipes that have two or more fetched sources, i personally wo=
uld
> >use PN but, as you say, that has the disadvantage that you have to
> >potentially lookup the package name in an .inc. Not my call though=
.
> >
> >>It would make adding new recipes a bit easier (no need to
> >>check/copy&paster name used in .inc and also base.bbclass could e=
asily
> >>generate those checksum sections with right name easier.
> >>
> >>I'm using "archive" as few others also used.
> >
> >and some use tarball, some pn ....
>=20
> Not using "archive" as Martin likes as default, but uri%d, but

For multiple SRC_URIs, using uri1/uri2 can be more confusing and may =
be not=20
much better than looking up real names in .inc file...


> what do you all think about the attached proposal (including docs!:=
)?
>=20
> cheers,
>=20
> PS: does the ftps fetcher work, i didn't bother to try, i admit..
> docs seem to be inconsistent about it WRT wget..

> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index c8ee722..769cf2d 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -61,11 +61,15 @@ def base_chk_file_vars(parser, localpath, param=
s, data):
>          name =3D params["name"]
>      except KeyError:
>          return False
> -    flagName =3D "%s.md5sum" % name
> -    want_md5sum =3D bb.data.getVarFlag("SRC_URI", flagName, data)
> -    flagName =3D "%s.sha256sum" % name
> -    want_sha256sum =3D bb.data.getVarFlag("SRC_URI", flagName, dat=
a)
> -
> +    if name:
> +        md5flag =3D "%s.md5sum" % name
> +        sha256flag =3D "%s.sha256sum" % name
> +    else:
> +        md5flag =3D "md5sum"
> +        sha256flag =3D "sha256sum"
> +    want_md5sum =3D bb.data.getVarFlag("SRC_URI", md5flag, data)
> +    want_sha256sum =3D bb.data.getVarFlag("SRC_URI", sha256flag, d=
ata)
> +    bb.note("sha=3D%s, md5=3D%s" % (want_md5sum, want_sha256sum))
>      if (want_sha256sum =3D=3D None and want_md5sum =3D=3D None):
>          # no checksums to check, nothing to do
>          return False
> @@ -702,12 +706,21 @@ python base_do_fetch() {
>  =09pn =3D bb.data.getVar('PN', d, True)
> =20
>  =09# Check each URI
> +=09uri_num =3D 0
>  =09for url in src_uri.split():
>  =09=09localpath =3D bb.data.expand(bb.fetch.localpath(url, localda=
ta), localdata)
>  =09=09(type,host,path,_,_,params) =3D bb.decodeurl(url)
>  =09=09uri =3D "%s://%s%s" % (type,host,path)
>  =09=09try:
>  =09=09=09if type in [ "http", "https", "ftp", "ftps" ]:
> +=09=09=09=09# We provide a default shortcut of plain [] for the fi=
rst fetch uri
> +=09=09=09=09# and default to uri%d for subsequent fetch uris.
> +=09=09=09=09# Explicit names in any uri overrides this default.
> +=09=09=09=09if not "name" in params:
> +=09=09=09=09=09if uri_num:
> +=09=09=09=09=09=09params["name"] =3D "uri%d" % uri_num
> +=09=09=09=09=09else:
> +=09=09=09=09=09=09params["name"] =3D ""
>  =09=09=09=09if not (base_chk_file_vars(parser, localpath, params, =
d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
>  =09=09=09=09=09if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS"=
, d, True):
>  =09=09=09=09=09=09bb.fatal("%s-%s: %s has no checksum defined, can=
not check archive integrity" % (pn,pv,uri))
> @@ -715,6 +728,7 @@ python base_do_fetch() {
>  =09=09=09=09=09=09bb.note("%s-%s: %s has no checksum defined, arch=
ive integrity not checked" % (pn,pv,uri))
>  =09=09except Exception:
>  =09=09=09raise bb.build.FuncFailed("Checksum of '%s' failed" % uri=
)
> +=09=09uri_num +=3D 1
>  }
> =20
>  addtask fetchall after do_fetch
> diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/userm=
anual/reference/var_src_uri.xml
> index a35e1ee..132bce8 100644
> --- a/docs/usermanual/reference/var_src_uri.xml
> +++ b/docs/usermanual/reference/var_src_uri.xml
> @@ -29,7 +29,16 @@
>    be used in preference to retrieving a new version . Any source t=
hat is
>    retrieved from a remote URI will be stored in the download sourc=
e directory
>    and an appropriate md5 sum generated and stored alongside it.</p=
ara>
> -
> +  <para>Checksums for http/https/ftp/ftps uris are stored in each =
recipe in
> +  the form of<screen>SRC_URI[md5sum] =3D &quot;9a7a11ffd52d9c4553e=
a8c0134a6fa86&quot;
> +SRC_URI[sha256sum] =3D &quot;36bdb85c97b39ac604bc58cb7857ee0829524=
2c78a12848ef8a31701921b9434&quot;</screen>
> +  for the first remote SRC_URI that has <emphasis>no</emphasis> ex=
plicit <command>name=3Dfoo</command>
> +  associated with it. Following <emphasis>unnamed</emphasis> SRC_U=
RIs default to<screen>
> +SRC_URI[uri1.md5sum] =3D
> +SRC_URI[uri1.sha256sum] =3D
> +SRC_URI[uri2.md5sum] =3D
> +SRC_URI[uri2.sha256sum] =3D</screen>
> +  etc.</para>
>    <para>Each URI supports a set of additional options. These optio=
ns are
>    tag/value pairs of the form <command>"a=3Db"</command> and are s=
emi-colon
>    separated from each other and from the URI. The follow examples =
shows two
> @@ -38,7 +47,7 @@
> =20
>    <variablelist>
>      <varlistentry>
> -      <term>http, https, ftps</term>
> +      <term>http, https, ftp, ftps</term>
> =20
>        <listitem>
>          <para>Used to download files and source code via the speci=
fied URL.
> @@ -164,6 +173,7 @@
>          <term>md5sum</term>
> =20
>          <listitem>
> +          <para><note>DEPRECATED<!-- isn't it? --></note></para>
>            <para>If an md5sum is provided then the downloaded files=
 will only
>            be considered valid if the md5sum of the downloaded file=
 matches the
>            md5sum option provided.</para>

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel




