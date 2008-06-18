Received: from [66.249.92.169] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lvcargnini@gmail.com>) id 1K8zMC-0005lq-GK
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jun 2008 17:13:56 +0200
Received: by ug-out-1314.google.com with SMTP id c2so1112912ugf.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2008 08:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:to:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=9RYBiuUN7wyZJcJT3d8y3R2O/ytDR7PHwZ4D1eBb3Lo=;
	b=LTSLm5C/qYF7FTw3dQ4WJzuUQTfFuAYBL62mjgUz5JHCr8T5nS8+/EtXqSr7DaROwu
	jEwPLiZs5nizgm7cTsuentbKU5xMht6sF6KlyGzSI6Eg7T/1pKEArLtyDnbGznMXChaU
	Nq4iaG+wfvT+VigG63bAJJSCzyJwNStFTQ2OI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=pJ9b8MzC5mSsh5dDxq+riIPo29sTVzeZfburcasHerbGlFBOMGf8pMoqWNy4uc99Bs
	PbGm6/F+gHm1w4TFKUqE+18/iJ+PgE+gNrNydqgRYvy2ziD/QZRUeRpbZ0KTWrMyCgj4
	Wn+5Xz8V0c4JFbZWpDMF/IWnRqi33cktB6cg8=
Received: by 10.210.25.20 with SMTP id 20mr712622eby.46.1213801974018;
	Wed, 18 Jun 2008 08:12:54 -0700 (PDT)
Received: by 10.210.24.18 with HTTP; Wed, 18 Jun 2008 08:12:53 -0700 (PDT)
Message-ID: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
Date: Wed, 18 Jun 2008 12:12:53 -0300
From: "=?UTF-8?Q?Lu=C3=ADs_Vit=C3=B3rio_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: problems with bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 18 Jun 2008 15:13:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear fellows:

I'm restarting the development process based on openembedded with
angstrom distro, after reconfiguring a new machine (ubuntu 8.04) to
work properly I did the following:
bitbake base-image ; bitbake console-image ; bitbake x11-image

and get the following errors:

ERROR: no files to build.

NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
NOTE: build 200806181208: started
NOTE: <type 'exceptions.IndexError'>:list index out of range while evaluating:
${@base_get_metadata_monotone_revision(d)}
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 134, in <module>
    main()
  File "/usr/bin/bitbake", line 131, in main
    cooker.cook()
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 600, in cook
    return self.buildTargets(pkgs_to_build)
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 496, in
buildTargets
    bb.event.fire(bb.event.BuildStarted(buildname, targets,
self.configuration.event_data))
  File "/var/lib/python-support/python2.5/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 31, in tmpHandler
  File "/var/lib/python-support/python2.5/bb/data.py", line 97, in getVar
    return d.getVar(var,exp)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 170, in getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 85, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 71,
in python_sub
    s = eval(code)
  File "<string>", line 1, in <module>
  File "<bb>", line 4, in base_get_metadata_monotone_revision
  File "<bb>", line 4, in base_get_scmbasepath
IndexError: list index out of range
ERROR: no files to build.

NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
NOTE: build 200806181209: started
NOTE: <type 'exceptions.IndexError'>:list index out of range while evaluating:
${@base_get_metadata_monotone_revision(d)}
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 134, in <module>
    main()
  File "/usr/bin/bitbake", line 131, in main
    cooker.cook()
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 600, in cook
    return self.buildTargets(pkgs_to_build)
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 496, in
buildTargets
    bb.event.fire(bb.event.BuildStarted(buildname, targets,
self.configuration.event_data))
  File "/var/lib/python-support/python2.5/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 31, in tmpHandler
  File "/var/lib/python-support/python2.5/bb/data.py", line 97, in getVar
    return d.getVar(var,exp)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 170, in getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 85, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 71,
in python_sub
    s = eval(code)
  File "<string>", line 1, in <module>
  File "<bb>", line 4, in base_get_metadata_monotone_revision
  File "<bb>", line 4, in base_get_scmbasepath
IndexError: list index out of range
ERROR: no files to build.

NOTE: Parsing finished. 0 cached, 0 parsed, 0 skipped, 0 masked.
NOTE: build 200806181209: started
NOTE: <type 'exceptions.IndexError'>:list index out of range while evaluating:
${@base_get_metadata_monotone_revision(d)}
Traceback (most recent call last):
  File "/usr/bin/bitbake", line 134, in <module>
    main()
  File "/usr/bin/bitbake", line 131, in main
    cooker.cook()
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 600, in cook
    return self.buildTargets(pkgs_to_build)
  File "/var/lib/python-support/python2.5/bb/cooker.py", line 496, in
buildTargets
    bb.event.fire(bb.event.BuildStarted(buildname, targets,
self.configuration.event_data))
  File "/var/lib/python-support/python2.5/bb/event.py", line 67, in fire
    if tmpHandler(event) == Handled:
  File "tmpHandler(e)", line 31, in tmpHandler
  File "/var/lib/python-support/python2.5/bb/data.py", line 97, in getVar
    return d.getVar(var,exp)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 170, in getVar
    return self.expand(value,var)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 85, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/var/lib/python-support/python2.5/bb/data_smart.py", line 71,
in python_sub
    s = eval(code)
  File "<string>", line 1, in <module>
  File "<bb>", line 4, in base_get_metadata_monotone_revision
  File "<bb>", line 4, in base_get_scmbasepath
IndexError: list index out of range
lvcargnini@protheus:~/instramed/openembedded$

my local.conf is the following:

# Use this to specify where BitBake should place the downloaded sources into
DL_DIR = "${HOME}/instramed/openembedded/sources"

# Delete the line below. Then specify which .bb files to consider for
# your build. Typically this will be something like BBFILES =
"/path/to/openembedded/packages/*/*.bb"
BBFILES := "${HOME}/instramed/org.openembedded.dev/packages/*/*.bb"

BBMASK = ""
TMPDIR = ${HOME}/instramed/openembedded/tmp
TARGET_OS = "linux"
DISTRO = "angstrom-2008.1"
MACHINE = "omap5912osk"

# 'uclibc' or 'glibc' or 'eglibc'
# ANGSTROM_MODE = "glibc"

INHERIT = "package_ipk"
# INHERIT = "package_tar"

# Add the required image file system types below. Valid are
# jffs2, tar(.gz|bz2), cpio(.gz), cramfs, ext2(.gz), ext3(.gz)
# squashfs, squashfs-lzma
IMAGE_FSTYPES = "jffs2 tar.bz2 cramfs"

# Uncomment this to disable the parse cache (not recommended).
# CACHE = ""

# Uncomment this if you want BitBake to emit debugging output
# BBDEBUG = "yes"

# Uncomment these two if you want BitBake to build images useful for debugging.
# PROFILE_OPTIMIZATION = "-pg"
# SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
# LDFLAGS =+ "-pg"
# Uncomment this if you want BitBake to emit the log if a build fails.
BBINCLUDELOGS = "yes"


Please any help will be welcome
Thanks.



-


