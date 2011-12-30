Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RgYPB-0008Jt-G2
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 10:05:37 +0100
Received: by eeit10 with SMTP id t10so8558769eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 00:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W1/D3sET9rkp5dzbsjxpv7Qs/E0iq+g8YyKwLzCWMBU=;
	b=kbNS/ctP76bFQVa6jwzepl3J4FZVuuDG8KkEK8D2yqRBpyNykYRWrSov5aFxD4Dr2i
	bzyL/slHuOwHpTnGBWD2ov0PPdAAVVxlJOeY5Ssq2MlUIa3tRP9r7/Sie4cgap7ENkmN
	iWsU4ieTdBRSMvtHHoMJQF+i8H8p3RQenGYgU=
Received: by 10.213.101.8 with SMTP id a8mr6460960ebo.40.1325235501733;
	Fri, 30 Dec 2011 00:58:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm145078460eeb.3.2011.12.30.00.58.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 00:58:20 -0800 (PST)
Date: Fri, 30 Dec 2011 09:58:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111230085809.GE16885@jama.jama.net>
References: <1325213976-17890-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1325213976-17890-1-git-send-email-b19537@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH mete-oe] bbclass: drop gitver.bbclass amd srctree.bbclass which are already in oe-core
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
X-List-Received-Date: Fri, 30 Dec 2011 09:05:37 -0000
X-Groupsio-MsgNum: 36305
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline

--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 10:59:36AM +0800, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>

Are you sure?

I don't see them in
http://git.openembedded.org/openembedded-core/tree/meta/classes
or patch with them here
http://patchwork.openembedded.org/project/oe-core/list/
but last time I've used srctree it failed like this:

ERROR: Command execution failed: Traceback (most recent call last):
  File "/usr/lib64/python2.7/site-packages/bb/command.py", line 87, in runA=
syncCommand
    commandmethod(self.cmds_async, self, options)
  File "/usr/lib64/python2.7/site-packages/bb/command.py", line 182, in bui=
ldFile
    command.cooker.buildFile(bfile, task)
  File "/usr/lib64/python2.7/site-packages/bb/cooker.py", line 989, in buil=
dFile
    self.caches_array)
  File "/usr/lib64/python2.7/site-packages/bb/cache.py", line 410, in parse
    datastores =3D cls.load_bbfile(filename, appends, configdata)
  File "/usr/lib64/python2.7/site-packages/bb/cache.py", line 669, in load_=
bbfile
    bb_data =3D parse.handle(bbfile, bb_data)
  File "/usr/lib64/python2.7/site-packages/bb/parse/__init__.py", line 80, =
in handle
    return h['handle'](fn, data, include)
  File "/usr/lib64/python2.7/site-packages/bb/parse/parse_py/BBHandler.py",=
 line 159, in handle
    return ast.multi_finalize(fn, d)
  File "/usr/lib64/python2.7/site-packages/bb/parse/ast.py", line 379, in m=
ulti_finalize
    finalize(fn, d)
  File "/usr/lib64/python2.7/site-packages/bb/parse/ast.py", line 323, in f=
inalize
    bb.utils.simple_exec("\n".join(code), {"d": d})
  File "/usr/lib64/python2.7/site-packages/bb/utils.py", line 387, in simpl=
e_exec
    exec(code, _context, context)
  File "<string>", line 9, in <module>
  File "__anon_98__OE_shr_core_meta_openembedded_meta_oe_classes_srctree_bb=
class", line 5, in __anon_98__OE_shr_core_meta_openembedded_meta_oe_classes=
_srctree_bbclass
  File "srctree.bbclass", line 28, in merge_tasks
  File "srctree.bbclass", line 24, in gather_taskdeps
  File "srctree.bbclass", line 18, in __gather_taskdeps
  File "srctree.bbclass", line 18, in __gather_taskdeps
  File "srctree.bbclass", line 18, in __gather_taskdeps
  File "srctree.bbclass", line 18, in __gather_taskdeps
  File "srctree.bbclass", line 18, in __gather_taskdeps
  File "srctree.bbclass", line 16, in __gather_taskdeps
TypeError: 'NoneType' object is not iterable

And unfortunately syntax like this
INHERIT_append_pn-libphone-ui-shr =3D "srctree gitpkgv"
doesn't work too anymore (that's why I didn't notice sooner), so instead of=
 small .inc=20
file for "local" builds you have to add .bbappend

Regards,

>  meta-oe/classes/gitver.bbclass  |   80 -------------------------
>  meta-oe/classes/srctree.bbclass |  123 ---------------------------------=
------
>  2 files changed, 0 insertions(+), 203 deletions(-)
>  delete mode 100644 meta-oe/classes/gitver.bbclass
>  delete mode 100644 meta-oe/classes/srctree.bbclass
>=20
> diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbcl=
ass
> deleted file mode 100644
> index ee8323d..0000000
> --- a/meta-oe/classes/gitver.bbclass
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -#
> -# gitver.bbclass provides a GITVER variable which is a (fairly) sane ver=
sion,
> -# for use in ${PV}, extracted from the ${S} git checkout, assuming it is=
 one.
> -# This is most useful in concert with srctree.bbclass.
> -
> -def git_drop_tag_prefix(version):
> -    import re
> -    if re.match("v\d", version):
> -        return version[1:]
> -    else:
> -        return version
> -
> -GIT_TAGADJUST =3D "git_drop_tag_prefix(version)"
> -GITVER =3D "${@get_git_pv('${S}', d, tagadjust=3Dlambda version:${GIT_TA=
GADJUST})}"
> -GITSHA =3D "${@get_git_hash('${S}', d)}"
> -
> -def get_git_hash(path, d):
> -    return oe_run(d, ["git", "rev-parse", "--short", "HEAD"], cwd=3Dpath=
).rstrip()
> -
> -def get_git_pv(path, d, tagadjust=3DNone):
> -    import os
> -    import oe.process
> -
> -    gitdir =3D os.path.abspath(os.path.join(d.getVar("S", True), ".git"))
> -    def git(cmd):
> -        try:
> -            return oe_run(d, ["git"] + cmd, cwd=3Dgitdir).rstrip()
> -        except oe.process.CmdError, exc:
> -            bb.fatal(str(exc))
> -
> -    try:
> -        ver =3D oe_run(d, ["git", "describe", "--tags"], cwd=3Dgitdir).r=
strip()
> -    except Exception, exc:
> -        bb.fatal(str(exc))
> -
> -    if not ver:
> -        try:
> -            ver =3D get_git_hash(gitdir, d)
> -        except Exception, exc:
> -            bb.fatal(str(exc))
> -
> -        if ver:
> -            return "0.0+%s" % ver
> -        else:
> -            return "0.0"
> -    else:
> -        if tagadjust:
> -            ver =3D tagadjust(ver)
> -        return ver
> -
> -def mark_recipe_dependencies(path, d):
> -    from bb.parse import mark_dependency
> -
> -    gitdir =3D os.path.join(path, ".git")
> -
> -    # Force the recipe to be reparsed so the version gets bumped
> -    # if the active branch is switched, or if the branch changes.
> -    mark_dependency(d, os.path.join(gitdir, "HEAD"))
> -
> -    # Force a reparse if anything in the index changes.
> -    mark_dependency(d, os.path.join(gitdir, "index"))
> -
> -    try:
> -        ref =3D oe_run(d, ["git", "symbolic-ref", "-q", "HEAD"], cwd=3Dg=
itdir).rstrip()
> -    except oe.process.CmdError:
> -        pass
> -    else:
> -        if ref:
> -            mark_dependency(d, os.path.join(gitdir, ref))
> -
> -    # Catch new tags.
> -    tagdir =3D os.path.join(gitdir, "refs", "tags")
> -    if os.path.exists(tagdir):
> -        mark_dependency(d, tagdir)
> -
> -python () {
> -    mark_recipe_dependencies(d.getVar("S", True), d)
> -}
> diff --git a/meta-oe/classes/srctree.bbclass b/meta-oe/classes/srctree.bb=
class
> deleted file mode 100644
> index 1457e56..0000000
> --- a/meta-oe/classes/srctree.bbclass
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -# Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -#
> -# srctree.bbclass enables operation inside of an existing source tree fo=
r a
> -# project, rather than using the fetch/unpack/patch idiom.
> -#
> -# By default, it expects that you're keeping the recipe(s) inside the
> -# aforementioned source tree, but you could override S to point at an ex=
ternal
> -# directory and place the recipes in a normal collection/overlay, if you=
 so
> -# chose.
> -#
> -# It also provides some convenience python functions for assembling your
> -# do_clean, if you want to leverage things like 'git clean' to simplify =
the
> -# operation.
> -
> -
> -# Grab convenience methods & sane default for do_clean
> -inherit clean
> -
> -# Build here
> -S =3D "${FILE_DIRNAME}"
> -SRC_URI =3D ""
> -
> -def remove_tasks(deltasks, d):
> -    for task in filter(lambda k: d.getVarFlag(k, "task"), d.keys()):
> -        deps =3D d.getVarFlag(task, "deps")
> -        for preptask in deltasks:
> -            if preptask in deps:
> -                deps.remove(preptask)
> -        d.setVarFlag(task, "deps", deps)
> -
> -addtask configure after do_setscene
> -
> -def merge_tasks(d):
> -    """
> -    Merges all of the operations that occur prior to do_populate_sysroot
> -    into do_populate_sysroot.
> -
> -    This is necessary because of recipe variants (normal, native, cross,
> -    sdk).  If a bitbake run happens to want to build more than one of
> -    these variants in a single run, it's possible for them to step on one
> -    another's toes, due to the shared ${S}.  Interleaved
> -    configure/compile/install amongst variants will break things badly.
> -    """
> -    from itertools import chain
> -    from bb import note
> -
> -    def __gather_taskdeps(task, seen):
> -        for dep in d.getVarFlag(task, "deps"):
> -            if not dep in seen:
> -                __gather_taskdeps(dep, seen)
> -        if not task in seen:
> -            seen.append(task)
> -
> -    def gather_taskdeps(task):
> -        items =3D []
> -        __gather_taskdeps(task, items)
> -        return items
> -
> -    newtask =3D "do_populate_sysroot_post"
> -    mergedtasks =3D gather_taskdeps(newtask)
> -    mergedtasks.pop()
> -
> -    for task in (key for key in d.keys()
> -                 if d.getVarFlag(key, "task") and
> -                 not key in mergedtasks):
> -        deps =3D d.getVarFlag(task, "deps")
> -        for mergetask in mergedtasks:
> -            if mergetask in (d.getVarFlag(task, "recrdeptask"),
> -                             d.getVarFlag(task, "recdeptask"),
> -                             d.getVarFlag(task, "deptask")):
> -                continue
> -
> -            if mergetask in deps:
> -                deps.remove(mergetask)
> -                #note("removing dep on %s from %s" % (mergetask, task))
> -
> -                if not newtask in deps:
> -                    #note("adding dep on %s to %s" % (newtask, task))
> -                    deps.append(newtask)
> -        d.setVarFlag(task, "deps", deps)
> -
> -    # Pull cross recipe task deps over
> -    depends =3D []
> -    deptask =3D []
> -    for task in mergedtasks[:-1]:
> -        depends.append(d.getVarFlag(task, "depends") or "")
> -        deptask.append(d.getVarFlag(task, "deptask") or "")
> -
> -    d.setVarFlag("do_populate_sysroot_post", "depends", " ".join(depends=
))
> -    d.setVarFlag("do_populate_sysroot_post", "deptask", " ".join(deptask=
))
> -
> -python () {
> -    remove_tasks(["do_patch", "do_unpack", "do_fetch"], d)
> -    b =3D d.getVar("B", True)
> -    if not b or b =3D=3D d.getVar("S", True):
> -        merge_tasks(d)
> -}
> -
> -# Manually run do_install & all of its deps
> -python do_populate_sysroot_post () {
> -    from os.path import exists
> -    from bb.build import exec_func, make_stamp
> -    from bb import note
> -
> -    stamp =3D d.getVar("STAMP", True)
> -
> -    def rec_exec_task(task, seen):
> -        for dep in d.getVarFlag(task, "deps"):
> -            if not dep in seen:
> -                rec_exec_task(dep, seen)
> -        seen.add(task)
> -        if not exists("%s.%s" % (stamp, task)):
> -            note("%s: executing task %s" % (d.getVar("PF", True), task))
> -            exec_func(task, d)
> -            flags =3D d.getVarFlags(task)
> -            if not flags.get('nostamp') and not flags.get('selfstamp'):
> -                make_stamp(task, d)
> -
> -    rec_exec_task("do_populate_sysroot", set())
> -}
> -addtask populate_sysroot_post after do_populate_sysroot
> -do_populate_sysroot_post[lockfiles] +=3D "${S}/.lock"
> --=20
> 1.7.0.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk79fSEACgkQN1Ujt2V2gByVwACfZP3PvYK7HsHbzSdSfKBq7q0P
TuAAn3Y/BNF2+rPt9WrTd+GxUZW4EuH5
=K6OW
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
