Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ3Ca-0005hK-CK
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:26:08 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ31q-0002UH-D3
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:15:40 +0200
Message-ID: <h1q6ft$a5v$15@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-6-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-6-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 045/125] First pass of cleanup of messages outputted to the user.
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
X-List-Received-Date: Tue, 23 Jun 2009 10:26:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Chris Larson<clarson@mvista.com>
>
> OpenEmbedded outputs a lot of messages that the user is likely to never
> care about.  We should only output something when it reflects upon their
> recipe (i.e. unpacking their sources, applying their patches), or is quite
> significant or unusual.
>
> Signed-off-by: Chris Larson<clarson@mvista.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/base.bbclass             |   17 +++--------------
>   classes/insane.bbclass           |   14 +++++++-------
>   classes/package.bbclass          |    4 ++--
>   classes/packaged-staging.bbclass |    6 +++---
>   4 files changed, 15 insertions(+), 26 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index a901f02..3d4a426 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -896,22 +896,11 @@ python base_eventhandler() {
>   	from bb.event import Handled, NotHandled, getName
>   	import os
>
> -	messages = {}
> -	messages["Completed"] = "completed"
> -	messages["Succeeded"] = "completed"
> -	messages["Started"] = "started"
> -	messages["Failed"] = "failed"
> -
>   	name = getName(e)
> -	msg = ""
> -	if name.startswith("Task"):
> -		msg += "package %s: task %s: " % (data.getVar("PF", e.data, 1), e.task)
> -		msg += messages.get(name[4:]) or name[4:]
> -	elif name.startswith("Build"):
> -		msg += "build %s: " % e.name
> -		msg += messages.get(name[5:]) or name[5:]
> +	if name == "TaskCompleted":
> +		msg = "package %s: task %s is complete." % (data.getVar("PF", e.data, 1), e.task)
>   	elif name == "UnsatisfiedDep":
> -		msg += "package %s: dependency %s %s" % (e.pkg, e.dep, name[:-3].lower())
> +		msg = "package %s: dependency %s %s" % (e.pkg, e.dep, name[:-3].lower())
>   	else:
>   		return NotHandled
>
> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
> index 3e519c3..ede049a 100644
> --- a/classes/insane.bbclass
> +++ b/classes/insane.bbclass
> @@ -216,7 +216,7 @@ def package_qa_write_error(error_class, name, path, d):
>
>   def package_qa_handle_error(error_class, error_msg, name, path, d):
>       import bb
> -    bb.error("QA Issue: %s" % error_msg)
> +    bb.error("QA Issue with %s: %s" % (name, error_msg))
>       package_qa_write_error(error_class, name, path, d)
>       return not package_qa_make_fatal_error(error_class, name, path, d)
>
> @@ -482,7 +482,7 @@ def package_qa_check_rdepends(pkg, workdir, d):
>   # The PACKAGE FUNC to scan each package
>   python do_package_qa () {
>       import bb
> -    bb.note("DO PACKAGE QA")
> +    bb.debug(2, "DO PACKAGE QA")
>       workdir = bb.data.getVar('WORKDIR', d, True)
>       packages = bb.data.getVar('PACKAGES',d, True)
>
> @@ -497,10 +497,10 @@ python do_package_qa () {
>       rdepends_sane = True
>       for package in packages.split():
>           if bb.data.getVar('INSANE_SKIP_' + package, d, True):
> -            bb.note("Package: %s (skipped)" % package)
> +            bb.note("package %s skipped" % package)
>               continue
>
> -        bb.note("Checking Package: %s" % package)
> +        bb.debug(1, "Checking Package: %s" % package)
>           path = "%s/install/%s" % (workdir, package)
>           if not package_qa_walk(path, checks, package, d):
>               walk_sane  = False
> @@ -509,14 +509,14 @@ python do_package_qa () {
>
>       if not walk_sane or not rdepends_sane:
>           bb.fatal("QA run found fatal errors. Please consider fixing them.")
> -    bb.note("DONE with PACKAGE QA")
> +    bb.debug(2, "DONE with PACKAGE QA")
>   }
>
>
>   # The Staging Func, to check all staging
>   addtask qa_staging after do_populate_staging before do_build
>   python do_qa_staging() {
> -    bb.note("QA checking staging")
> +    bb.debug(2, "QA checking staging")
>
>       if not package_qa_check_staged(bb.data.getVar('STAGING_LIBDIR',d,True), d):
>           bb.fatal("QA staging was broken by the package built above")
> @@ -525,7 +525,7 @@ python do_qa_staging() {
>   # Check broken config.log files
>   addtask qa_configure after do_configure before do_compile
>   python do_qa_configure() {
> -    bb.note("Checking sanity of the config.log file")
> +    bb.debug(1, "Checking sanity of the config.log file")
>       import os
>       for root, dirs, files in os.walk(bb.data.getVar('WORKDIR', d, True)):
>           statement = "grep 'CROSS COMPILE Badness:' %s>  /dev/null" % \
> diff --git a/classes/package.bbclass b/classes/package.bbclass
> index 7a61c5a..3a30d38 100644
> --- a/classes/package.bbclass
> +++ b/classes/package.bbclass
> @@ -166,7 +166,7 @@ def runstrip(file, d):
>       # If the file is in a .debug directory it was already stripped,
>       # don't do it again...
>       if os.path.dirname(file).endswith(".debug"):
> -        bb.note("Already ran strip")
> +        bb.debug(2, "Already ran strip on %s" % file)
>           return 0
>
>       strip = bb.data.getVar("STRIP", d, 1)
> @@ -560,7 +560,7 @@ python package_do_shlibs() {
>
>   	exclude_shlibs = bb.data.getVar('EXCLUDE_FROM_SHLIBS', d, 0)
>   	if exclude_shlibs:
> -		bb.note("not generating shlibs")
> +		bb.debug(1, "not generating shlibs")
>   		return
>   		
>   	lib_re = re.compile("^lib.*\.so")
> diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
> index 849f60c..82c1a0d 100644
> --- a/classes/packaged-staging.bbclass
> +++ b/classes/packaged-staging.bbclass
> @@ -109,17 +109,17 @@ def pstage_cleanpackage(pkgname, d):
>   	pstage_set_pkgmanager(d)
>   	list_cmd = bb.data.getVar("PSTAGE_LIST_CMD", d, True)
>
> -	bb.note("Checking if staging package installed")
> +	bb.debug(2, "Checking if staging package installed")
>   	lf = bb.utils.lockfile(bb.data.expand("${STAGING_DIR}/staging.lock", d))
>   	ret = os.system("PATH=\"%s\" %s | grep %s" % (path, list_cmd, pkgname))
>   	if ret == 0:
> -		bb.note("Yes. Uninstalling package from staging...")
> +		bb.debug(1, "Uninstalling package from staging...")
>   		removecmd = bb.data.getVar("PSTAGE_REMOVE_CMD", d, 1)
>   		ret = os.system("PATH=\"%s\" %s %s" % (path, removecmd, pkgname))
>   		if ret != 0:
>   			bb.note("Failure removing staging package")
>   	else:
> -		bb.note("No. Manually removing any installed files")
> +		bb.debug(1, "Manually removing any installed files from staging...")
>   		pstage_manualclean("staging", "STAGING_DIR", d)
>   		pstage_manualclean("cross", "CROSS_DIR", d)
>   		pstage_manualclean("deploy", "DEPLOY_DIR", d)




