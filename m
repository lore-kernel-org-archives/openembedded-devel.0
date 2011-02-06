Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay4mail@gmail.com>) id 1PmCQB-00013y-3A
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 22:45:27 +0100
Received: by bwz10 with SMTP id 10so4143846bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=nCssqsXk0c4ip38hvzjjAUyWlAn2w2TQUU4tfvaRPqM=;
	b=GXCmIGckD07U+a7timCmwQzvzDeA4fq4RTE3xUhW1TEEyo4RtNBgsvyilOg4y7JuGZ
	k7dVPTOiCNjO5VY1LWmLcOWt1uK+PV70UUWY4wh2IqyfSYi+rm6oXJP/xlrPW8dUfzkh
	F92VklBTZJOttNvp4rOTaZkXoUIWL/jLcuSk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=TFwWIJYJgPBIVjJlt8auE+Z2eR5TxjerlvM33ouwsmymxirfwNPHJgmUWquOj2+C4g
	7i71e6tRqit1+5kpCSfwHmS03VMbFh4JcxSEDmFaluSxOYJGgcbCXkff4Tin6Fb1dIf5
	L+PpjmhZPVjDFBuU7vIJw9gwkU1PT5Rzguv+4=
Received: by 10.204.62.209 with SMTP id y17mr2294852bkh.98.1297028661934;
	Sun, 06 Feb 2011 13:44:21 -0800 (PST)
Received: from localhost.localdomain (95-29-109-234.broadband.corbina.ru
	[95.29.109.234])
	by mx.google.com with ESMTPS id f20sm1653368bkf.4.2011.02.06.13.44.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 13:44:21 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Feb 2011 00:44:19 +0300
Message-Id: <1297028659-2331-1-git-send-email-jay4mail@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] tinderclient: Remove it (obsoleted by oestats-client)
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
X-List-Received-Date: Sun, 06 Feb 2011 21:45:27 -0000

Tinderclient is unusable now and obsoleted by oestats-client. So we should
remove it from tree.

NOTE for Angstrom and Kaelios maintainers: this patch change your configs.

---
 classes/tinderclient.bbclass         |  389 ----------------------------------
 conf/distro/include/angstrom.inc     |   26 ---
 conf/distro/include/kaeilos-2010.inc |   22 --
 conf/distro/include/kaeilos.inc      |   26 ---
 conf/tinder.conf                     |   27 ---
 recipes/bitbake/bitbake.inc          |    2 +-
 6 files changed, 1 insertions(+), 491 deletions(-)
 delete mode 100644 classes/tinderclient.bbclass
 delete mode 100644 conf/tinder.conf

diff --git a/classes/tinderclient.bbclass b/classes/tinderclient.bbclass
deleted file mode 100644
index 7ccc1f2..0000000
--- a/classes/tinderclient.bbclass
+++ /dev/null
@@ -1,389 +0,0 @@
-def tinder_http_post(d, server, selector, content_type, body):
-    import httplib
-    # now post it
-    for i in range(0,5):
-       try:
-	   proxy = data.getVar('HTTP_PROXY', d, True )
-	   if (proxy):
-		   if (proxy.endswith('/')):
-			   proxy = proxy[:-1]
-		   if (proxy.startswith('http://')):
-			   proxy = proxy[7:]
-		   h = httplib.HTTP(proxy)
-		   h.putrequest('POST', 'http://%s%s' % (server, selector))
-	   else:
-		   h = httplib.HTTP(server)
-		   h.putrequest('POST', selector)
-           h.putheader('content-type', content_type)
-           h.putheader('content-length', str(len(body)))
-           h.endheaders()
-           h.send(body)
-           errcode, errmsg, headers = h.getreply()
-           #print errcode, errmsg, headers
-           return (errcode,errmsg, headers, h.file)
-       except Exception, e:
-           print "Error sending the report! ", e
-           # try again
-           pass
-
-    # return some garbage
-    return (-1, "unknown", "unknown", None)
-
-def tinder_form_data(bound, dict, log):
-    output = []
-    # for each key in the dictionary
-    for name in dict:
-        assert dict[name]
-        output.append( "--" + bound )
-        output.append( 'Content-Disposition: form-data; name="%s"' % name )
-        output.append( "" )
-        output.append( dict[name] )
-    if log:
-        output.append( "--" + bound )
-        output.append( 'Content-Disposition: form-data; name="log"; filename="log.txt"' )
-        output.append( '' )
-        output.append( log )
-    output.append( '--' + bound + '--' )
-    output.append( '' )
-
-    return "\r\n".join(output)
-
-def tinder_time_string():
-    """
-    Return the time as GMT
-    """
-    return ""
-
-def tinder_format_http_post(d,status,log):
-    """
-    Format the Tinderbox HTTP post with the data needed
-    for the tinderbox to be happy.
-    """
-
-    import random
-
-    # the variables we will need to send on this form post
-    variables =  {
-        "tree"         : data.getVar('TINDER_TREE',    d, True),
-        "machine_name" : data.getVar('TINDER_MACHINE', d, True),
-        "os"           : os.uname()[0],
-        "os_version"   : os.uname()[2],
-        "compiler"     : "gcc",
-        "clobber"      : data.getVar('TINDER_CLOBBER', d, True) or "0",
-        "srcdate"      : data.getVar('SRCDATE', d, True),
-        "PN"           : data.getVar('PN', d, True),
-        "PV"           : data.getVar('PV', d, True),
-        "PR"           : data.getVar('PR', d, True),
-        "FILE"         : data.getVar('FILE', d, True) or "N/A",
-        "TARGETARCH"   : data.getVar('TARGET_ARCH', d, True),
-        "TARGETFPU"    : data.getVar('TARGET_FPU', d, True) or "Unknown",
-        "TARGETOS"     : data.getVar('TARGET_OS', d, True) or "Unknown",
-        "MACHINE"      : data.getVar('MACHINE', d, True) or "Unknown",
-        "DISTRO"       : data.getVar('DISTRO', d, True) or "Unknown",
-    }
-
-    # optionally add the status
-    if status:
-        variables["status"] = str(status)
-
-    # try to load the machine id
-    # we only need on build_status.pl but sending it
-    # always does not hurt
-    try:
-        f = file(data.getVar('TMPDIR',d,True)+'/tinder-machine.id', 'r')
-        id = f.read()
-        variables['machine_id'] = id
-    except:
-        pass
-
-    # the boundary we will need
-    boundary = "----------------------------------%d" % int(random.random()*1000000000000)
-
-    # now format the body
-    body = tinder_form_data( boundary, variables, log )
-
-    return ("multipart/form-data; boundary=%s" % boundary),body
-
-
-def tinder_build_start(d):
-    """
-    Inform the tinderbox that a build is starting. We do this
-    by posting our name and tree to the build_start.pl script
-    on the server.
-    """
-    from bb import data
-
-    # get the body and type
-    content_type, body = tinder_format_http_post(d,None,None)
-    server = data.getVar('TINDER_HOST', d, True )
-    url    = data.getVar('TINDER_URL',  d, True )
-
-    selector = url + "/xml/build_start.pl"
-
-    #print "selector %s and url %s" % (selector, url)
-
-    # now post it
-    errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
-    #print errcode, errmsg, headers
-    report = h_file.read()
-
-    # now let us find the machine id that was assigned to us
-    search = "<machine id='"
-    report = report[report.find(search)+len(search):]
-    report = report[0:report.find("'")]
-
-    import bb
-    bb.note("Machine ID assigned by tinderbox: %s" % report )
-
-    # now we will need to save the machine number
-    # we will override any previous numbers
-    f = file(data.getVar('TMPDIR', d, True)+"/tinder-machine.id", 'w')
-    f.write(report)
-
-
-def tinder_send_http(d, status, _log):
-    """
-    Send this log as build status
-    """
-    from bb import data
-
-
-    # get the body and type
-    server = data.getVar('TINDER_HOST', d, True )
-    url    = data.getVar('TINDER_URL',  d, True )
-
-    selector = url + "/xml/build_status.pl"
-
-    # now post it - in chunks of 10.000 charachters
-    new_log = _log
-    while len(new_log) > 0:
-        content_type, body = tinder_format_http_post(d,status,new_log[0:18000])
-        errcode, errmsg, headers, h_file = tinder_http_post(d,server,selector,content_type, body)
-        #print errcode, errmsg, headers
-        #print h.file.read()
-        new_log = new_log[18000:]
-
-
-def tinder_print_info(d):
-    """
-    Print the TinderBox Info
-        Including informations of the BaseSystem and the Tree
-        we use.
-    """
-
-    from   bb import data
-    import os
-    # get the local vars
-
-    time    = tinder_time_string()
-    ops     = os.uname()[0]
-    version = os.uname()[2]
-    url     = data.getVar( 'TINDER_URL' , d, True )
-    tree    = data.getVar( 'TINDER_TREE', d, True )
-    branch  = data.getVar( 'TINDER_BRANCH', d, True )
-    srcdate = data.getVar( 'SRCDATE', d, True )
-    machine = data.getVar( 'MACHINE', d, True )
-    distro  = data.getVar( 'DISTRO',  d, True )
-    bbfiles = data.getVar( 'BBFILES', d, True )
-    tarch   = data.getVar( 'TARGET_ARCH', d, True )
-    fpu     = data.getVar( 'TARGET_FPU', d, True )
-    oerev   = data.getVar( 'OE_REVISION', d, True ) or "unknown"
-
-    # there is a bug with tipple quoted strings
-    # i will work around but will fix the original
-    # bug as well
-    output = []
-    output.append("== Tinderbox Info" )
-    output.append("Time: %(time)s" )
-    output.append("OS: %(ops)s" )
-    output.append("%(version)s" )
-    output.append("Compiler: gcc" )
-    output.append("Tinderbox Client: 0.1" )
-    output.append("Tinderbox Client Last Modified: yesterday" )
-    output.append("Tinderbox Protocol: 0.1" )
-    output.append("URL: %(url)s" )
-    output.append("Tree: %(tree)s" )
-    output.append("Config:" )
-    output.append("branch = '%(branch)s'" )
-    output.append("TARGET_ARCH = '%(tarch)s'" )
-    output.append("TARGET_FPU = '%(fpu)s'" )
-    output.append("SRCDATE = '%(srcdate)s'" )
-    output.append("MACHINE = '%(machine)s'" )
-    output.append("DISTRO = '%(distro)s'" )
-    output.append("BBFILES = '%(bbfiles)s'" )
-    output.append("OEREV = '%(oerev)s'" )
-    output.append("== End Tinderbox Client Info" )
-
-    # now create the real output
-    return "\n".join(output) % vars()
-
-
-def tinder_print_env():
-    """
-    Print the environment variables of this build
-    """
-    from bb import data
-    import os
-
-    time_start = tinder_time_string()
-    time_end   = tinder_time_string()
-
-    # build the environment
-    env = ""
-    for var in os.environ:
-        env += "%s=%s\n" % (var, os.environ[var])
-
-    output = []
-    output.append( "---> TINDERBOX RUNNING env %(time_start)s" )
-    output.append( env )
-    output.append( "<--- TINDERBOX FINISHED (SUCCESS) %(time_end)s" )
-
-    return "\n".join(output) % vars()
-
-def tinder_tinder_start(d, event):
-    """
-    PRINT the configuration of this build
-    """
-
-    time_start = tinder_time_string()
-    config = tinder_print_info(d)
-    #env    = tinder_print_env()
-    time_end   = tinder_time_string()
-    packages = " ".join( event.getPkgs() ) 
-
-    output = []
-    output.append( "---> TINDERBOX PRINTING CONFIGURATION %(time_start)s" )
-    output.append( config )
-    #output.append( env    )
-    output.append( "<--- TINDERBOX FINISHED PRINTING CONFIGURATION %(time_end)s" )
-    output.append( "---> TINDERBOX BUILDING '%(packages)s'" )
-    output.append( "<--- TINDERBOX STARTING BUILD NOW" )
-
-    output.append( "" )
-
-    return "\n".join(output) % vars()
-
-def tinder_do_tinder_report(event):
-    """
-    Report to the tinderbox:
-        On the BuildStart we will inform the box directly
-        On the other events we will write to the TINDER_LOG and
-        when the Task is finished we will send the report.
-
-    The above is not yet fully implemented. Currently we send
-    information immediately. The caching/queuing needs to be
-    implemented. Also sending more or less information is not
-    implemented yet.
-
-    We have two temporary files stored in the TMP directory. One file
-    contains the assigned machine id for the tinderclient. This id gets
-    assigned when we connect the box and start the build process the second
-    file is used to workaround an EventHandler limitation. If BitBake is ran
-    with the continue option we want the Build to fail even if we get the
-    BuildCompleted Event. In this case we have to look up the status and
-    send it instead of 100/success.
-    """
-    from bb.event import getName
-    from bb import data, mkdirhier, build
-    import os, glob
-
-    # variables
-    name = getName(event)
-    log  = ""
-    status = 1
-    # Check what we need to do Build* shows we start or are done
-    if name == "BuildStarted":
-        tinder_build_start(event.data)
-        log = tinder_tinder_start(event.data,event)
-
-        try:
-            # truncate the tinder log file
-            f = file(data.getVar('TINDER_LOG', event.data, True), 'w')
-            f.write("")
-            f.close()
-        except:
-            pass
-
-        try:
-            # write a status to the file. This is needed for the -k option
-            # of BitBake
-            g = file(data.getVar('TMPDIR', event.data, True)+"/tinder-status", 'w')
-            g.write("")
-            g.close()
-        except IOError:
-            pass
-
-    # Append the Task-Log (compile,configure...) to the log file
-    # we will send to the server
-    if name == "TaskSucceeded" or name == "TaskFailed":
-        log_file = glob.glob("%s/log.%s.*" % (data.getVar('T', event.data, True), event.task))
-
-        if len(log_file) != 0:
-            to_file  = data.getVar('TINDER_LOG', event.data, True)
-            log     += "".join(open(log_file[0], 'r').readlines())
-
-    # set the right 'HEADER'/Summary for the TinderBox
-    if name == "TaskStarted":
-        log += "---> TINDERBOX Task %s started\n" % event.task
-    elif name == "TaskSucceeded":
-        log += "<--- TINDERBOX Task %s done (SUCCESS)\n" % event.task
-    elif name == "TaskFailed":
-        log += "<--- TINDERBOX Task %s failed (FAILURE)\n" % event.task
-    elif name == "PkgStarted":
-        log += "---> TINDERBOX Package %s started\n" % data.getVar('PF', event.data, True)
-    elif name == "PkgSucceeded":
-        log += "<--- TINDERBOX Package %s done (SUCCESS)\n" % data.getVar('PF', event.data, True)
-    elif name == "PkgFailed":
-        if not data.getVar('TINDER_AUTOBUILD', event.data, True) == "0":
-            build.exec_func('do_clean', event.data)
-        log += "<--- TINDERBOX Package %s failed (FAILURE)\n" % data.getVar('PF', event.data, True)
-        status = 200
-        # remember the failure for the -k case
-        h = file(data.getVar('TMPDIR', event.data, True)+"/tinder-status", 'w')
-        h.write("200")
-    elif name == "BuildCompleted":
-        log += "Build Completed\n"
-        status = 100
-        # Check if we have a old status...
-        try:
-            h = file(data.getVar('TMPDIR',event.data,True)+'/tinder-status', 'r')
-            status = int(h.read())
-        except:
-            pass
-
-    elif name == "MultipleProviders":
-        log += "---> TINDERBOX Multiple Providers\n"
-        log += "multiple providers are available (%s);\n" % ", ".join(event.getCandidates())
-        log += "consider defining PREFERRED_PROVIDER_%s\n" % event.getItem()
-        log += "is runtime: %d\n" % event.isRuntime()
-        log += "<--- TINDERBOX Multiple Providers\n"
-    elif name == "NoProvider":
-        log += "Error: No Provider for: %s\n" % event.getItem()
-        log += "Error:Was Runtime: %d\n" % event.isRuntime()
-        status = 200
-        # remember the failure for the -k case
-        h = file(data.getVar('TMPDIR', event.data, True)+"/tinder-status", 'w')
-        h.write("200")
-
-    # now post the log
-    if len(log) == 0:
-        return
-
-    # for now we will use the http post method as it is the only one
-    log_post_method = tinder_send_http
-    log_post_method(event.data, status, log)
-
-
-# we want to be an event handler
-addhandler tinderclient_eventhandler
-python tinderclient_eventhandler() {
-    from bb import note, error, data
-    from bb.event import getName
-
-    if e.data is None or getName(e) == "MsgNote":
-        return
-
-    do_tinder_report = data.getVar('TINDER_REPORT', e.data, True)
-    if do_tinder_report and do_tinder_report == "1":
-        tinder_do_tinder_report(e)
-}
diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 6d7770b..5a02723 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -157,32 +157,6 @@ DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
 DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION if you really want to build an unversioned distro')}"
 
 
-# Configuration for tinderbox, so people only need:
-# INHERIT          += "tinderclient"
-# in their local.conf 
-
-#Name of the client
-TINDER_MACHINE  = "${MACHINE}-${LIBC}-build-image"
-
-# Which lof file to write to, which tree to report to
-TINDER_LOG        = "${TMPDIR}/tinder.log"
-TINDER_TREE       = "Angstrom"
-
-# HTTP posting    
-TINDER_HOST       ?= "ewi546.ewi.utwente.nl"
-TINDER_URL        ?= "/tinderbox"
-
-# Which branch do we build
-TINDER_BRANCH     = "org.openembedded.dev"
-   
-## Clobbing
-## 0 for rebuilding everything from scratch
-## 1 for incremental builds
-TINDER_CLOBBER    = "1"
-
-## Do a report at all
-TINDER_REPORT     = "1"
-
 # Configuration for seppuku autobuilder, people only need to put:
 # INHERIT += "seppuku oestats-client"
 # SEPPUKU_USER         = "your_bugzilla@user.id"
diff --git a/conf/distro/include/kaeilos-2010.inc b/conf/distro/include/kaeilos-2010.inc
index 061039d..fe42858 100644
--- a/conf/distro/include/kaeilos-2010.inc
+++ b/conf/distro/include/kaeilos-2010.inc
@@ -120,28 +120,6 @@ DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
 # KaeilOS *always* has some form of release config, so error out if someone thinks he knows better 
 DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION if you really want to build an unversioned distro')}"
 
-# Configuration for tinderbox, so people only need:
-# INHERIT          += "tinderclient"
-# in their local.conf 
-
-#Name of the client
-TINDER_MACHINE  = "${MACHINE}-${LIBC}-build-image"
-
-# Which lof file to write to, which tree to report to
-TINDER_LOG        = "${TMPDIR}/tinder.log"
-TINDER_TREE       = "KaeilOS"
-
-# Which branch do we build
-TINDER_BRANCH     = "org.openembedded.dev"
-   
-## Clobbing
-## 0 for rebuilding everything from scratch
-## 1 for incremental builds
-TINDER_CLOBBER    = "1"
-
-## Do a report at all
-TINDER_REPORT     = "1"
-
 OESTATS_SERVER      ?= "tinderbox.openembedded.org"
 
 # We want images supporting the following features (for task-base)
diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index df4c069..848614f 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -161,32 +161,6 @@ DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
 DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION if you really want to build an unversioned distro')}"
 
 
-# Configuration for tinderbox, so people only need:
-# INHERIT          += "tinderclient"
-# in their local.conf 
-
-#Name of the client
-TINDER_MACHINE  = "${MACHINE}-${LIBC}-build-image"
-
-# Which lof file to write to, which tree to report to
-TINDER_LOG        = "${TMPDIR}/tinder.log"
-TINDER_TREE       = "KaeilOS"
-
-# HTTP posting    
-#TINDER_HOST       ?= "ewi546.ewi.utwente.nl"
-#TINDER_URL        ?= "/tinderbox"
-
-# Which branch do we build
-TINDER_BRANCH     = "org.openembedded.dev"
-   
-## Clobbing
-## 0 for rebuilding everything from scratch
-## 1 for incremental builds
-TINDER_CLOBBER    = "1"
-
-## Do a report at all
-TINDER_REPORT     = "1"
-
 # Configuration for seppuku autobuilder, people only need to put:
 # INHERIT += "seppuku oestats-client"
 # SEPPUKU_USER         = "your_bugzilla@user.id"
diff --git a/conf/tinder.conf b/conf/tinder.conf
deleted file mode 100644
index 614ed89..0000000
--- a/conf/tinder.conf
+++ /dev/null
@@ -1,27 +0,0 @@
-INHERIT          += "tinderclient"
-
-
-#Name of the client
-#TINDER_MACHINE  = "Test-NameOfClient-build-image"
-
-
-# Which lof file to write to, which tree to report to
-#TINDER_LOG        = "${TMPDIR}/tinder.log"
-#TINDER_TREE       = "OpenEmbeddedBuilds"
-
-
-# HTTP posting
-#TINDER_HOST       = "ewi546.ewi.utwente.nl"
-#TINDER_URL        = "/tinderbox"
-
-# Which branch do we build
-#TINDER_BRANCH     = "org.openembedded.dev"
-
-# Clobbing
-# 0 for rebuilding everything from scratch
-# 1 for incremental builds
-#TINDER_CLOBBER    = "0"
-
-# Do a report at all
-#TINDER_REPORT     = "1"
-
diff --git a/recipes/bitbake/bitbake.inc b/recipes/bitbake/bitbake.inc
index 67dc6a5..97983ce 100644
--- a/recipes/bitbake/bitbake.inc
+++ b/recipes/bitbake/bitbake.inc
@@ -12,7 +12,7 @@ SUMMARY = "BitBake build tool"
 RDEPENDS_${PN} += "python-shell python-lang python-textutils python-pickle python-crypt python-netclient"
 
 # crypt for md5
-# netclient for tinderclient.bbclass
+# netclient for oestats-client.bbclass (urllib2)
 
 # We don't need a toolchain...
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.7.2.3



