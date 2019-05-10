Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 734907E08F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYj45zyz7k
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489321;
	bh=wTt8viGEdaOi39AEM2Ts9KjhHwKX82QL6erBo6afnfk=;
	h=From:To:Subject:Date:From;
	b=GWJqjjJLGD6Chc6AP8I5uJk7r+JMbAC3SZM54jvwKh+t0KAupbj3LrVweDHa0aAZl
	PUQfur8GzrLJ0XmEnkDIwUf+WYq/9Rso0DnKYssAt7soI4XnW+/dLseO0aaowtK3qg
	W5Kwxrc6TXBXNQVgn08l1umbHgdh2WlAqMn0geXDk+8oXCXD5yH0AZmEHF2UqU2PlO
	ZU5CLh7uH469nTgsJppEl9DQN360q+ZnHeLZteuTHsRk//6l01bXsnULx1qaAheuLd
	ZMTUgPw6P3Ckal8I/jqDIttfIOGYM9kygXeF9IRDLk6BT4moWEn20BwvLZcjA/Sj01
	BmLX+2GSlBtqidYyDz85dup+bTYfXdJxRI6btxzuWeRaOnVRB9TIK1BWRb8nXvot3K
	R1j7kkNWmb9pXW+dXbvmu8Oi6k3t8zGZlbK15zHQMPZvUMUmAPjGmUo9o1yPZdJUM9
	1GHbJxrmbk2qF/J81SMnBi4uJd3RwC5p/+laLkOssBi0VLCJeh0NqFZaZxe3JNneRY
	Aj+uye6dUUh7vzTc/Fnqd6J2cc48wbrzLALgEVGXgw2HFrH5At6S4KGnYrWpiU134z
	4oAZAzhsb+S9kZp2KdSZeV69WBNLCKX3DYwvLKtsEfipz0PtghwUae6LdWQw9WJcFm
	5u3asviZZbmWCoESdysJv3Dk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:13 +0300
Message-Id: <20190510115515.19491-17-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] openwbem: Remove stale files of recipe removed 2 years ago
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
X-List-Received-Date: Fri, 10 May 2019 11:55:20 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../openwbem/openwbem/checkserverkey          |  20 ---
 .../openwbem/openwbem/loadmof.sh              | 118 ----------------
 .../openwbem/novell-openwbem-root-acl.mof     |  21 ---
 .../openwbem/openwbem-etc_pam.d_openwbem      |   7 -
 .../openwbem/openwbem/openwbem-owcimomd.init  | 131 ------------------
 .../openwbem/openwbem/openwbem-rpmlintrc      |   2 -
 .../openwbem/openwbem/owcimomd.service        |  12 --
 .../openwbem/openwbem/rmmof.sh                |  53 -------
 8 files changed, 364 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/checkserverkey
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/loadmof.sh
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/owcimomd.service
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem/rmmof.sh

diff --git a/meta-oe/recipes-support/openwbem/openwbem/checkserverkey b/meta-oe/recipes-support/openwbem/openwbem/checkserverkey
deleted file mode 100644
index bcfa36101..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/checkserverkey
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/bash
-
-if [ ! -f "/etc/openwbem/serverkey.pem" ]; then
-	if [ -f "/etc/ssl/servercerts/servercert.pem" \
-	     -a -f "/etc/ssl/servercerts/serverkey.pem" ]; then
-		echo "Using common server certificate /etc/ssl/servercerts/servercert.pem"
-		ln -s /etc/ssl/servercerts/server{cert,key}.pem /etc/openwbem/
-	else
-		echo "FAILED: Starting OpenWBEM server"
-		echo "There is no ssl server key available for OpenWBEM server to use."
-		echo -e "Please generate one with the following script and start the OpenWBEM service again:\n"
-		echo "##################################"
-		echo "/etc/openwbem/owgencert"
-		echo "================================="
-
-		echo "NOTE: The script uses /dev/random device for generating some random bits while generating the server key."
-		echo "      If this takes too long, you can replace the value of \"RANDFILE\" in /etc/openwsman/ssleay.cnf with /dev/urandom. Please understand the implications"
-		exit 1
-	fi
-fi
diff --git a/meta-oe/recipes-support/openwbem/openwbem/loadmof.sh b/meta-oe/recipes-support/openwbem/openwbem/loadmof.sh
deleted file mode 100644
index dd87811a3..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/loadmof.sh
+++ /dev/null
@@ -1,118 +0,0 @@
-#!/bin/sh
-# 
-# options:
-# loadmof.sh <MOF_PATH> <NAMESPACE> <FILES>
-#
-# - or -
-#
-# options:
-# loadmof.sh -n <NAMESPACE> <FILES> [...]
-#
-# The former is preserved for compatibility with Pegasus and 
-# sblim providers.  The latter is preferred.  If $1 is "-n",
-# the latter code path is executed.  Otherwise the former is 
-# executed.
-
-if [ "x$1" != "x-n" -a "x$1" != "x-v" ]; then
-# OLD STYLE
-if [ -f "/etc/init.d/owcimomd" ]; then
-    /etc/init.d/owcimomd status 1>&2 > /dev/null
-    if [ $? = "0" ]; then
-        CIMOM_RUNNING="true"
-    else
-        CIMOM_RUNNING="false"
-    fi
-else
-    exit 1
-fi
-if [ "$YAST_IS_RUNNING" = "instsys" ]; then
-  CIMOM_RUNNING="false"
-fi
-
-CIMOM=$1
-shift
-case "$CIMOM" in
-    pegasus)
-        exit 0
-    ;;
-esac
-MOF_PATH=$1
-shift
-NS=$1
-shift
-
-REPOSITORY="/var/lib/openwbem"
-#tmp_dir=`mktemp -d -p /tmp openwbem.XXXXXX`
-case "$CIMOM_RUNNING" in 
-    true|false)
-    while [ "$#" -gt 0 ]
-    do
-        echo "Loading $MOF_PATH/$1"
-        #sed "s/cmpi:/cmpi::/g" $MOF_PATH/$1 > $tmp_dir/$1
-        /usr/bin/owmofc -c -n  $NS -d $REPOSITORY $MOF_PATH/$1 > /dev/null 2>&1
-        shift
-    done
-    ;;
-esac
-#rm -rf $tmp_dir
-# END OLD STYLE
-
-else
-# NEW STYLE
-if [ "x$3" = "x" ]; then
-    echo "Usage: $0 -n <NAMESPACE> <FILES> [...]"
-    exit 1
-fi
-
-if [ "x$1" = "x-v" ]; then
-  VERBOSE=1
-  shift
-fi
-
-# get rid of "-n" arg
-shift 
-
-NS="$1"
-
-shift 
-
-DBDIR=/var/lib/openwbem
-LOGFILE=$DBDIR/loadmof.log
-CIMOM_INIT=/etc/init.d/owcimomd
-if [ "$YAST_IS_RUNNING" != "instsys" ] ; then
-    $CIMOM_INIT status > /dev/null 2>&1
-    CIMOM_RUNNING=$?
-fi
-if [ "x$CIMOM_RUNNING" = "x0"  ]; then
-  $CIMOM_INIT stop > /dev/null 2>&1
-fi
-bkpdir=$DBDIR/backup-$$
-mkdir $bkpdir
-cp -a $DBDIR/*.{dat,ndx,lock} $bkpdir/
-rm -f $LOGFILE.9
-for i in 8 7 6 5 4 3 2 1 0; do
-  let newI=$i+1
-  if [ -f $LOGFILE.$i ]; then
-    mv $LOGFILE.$i $LOGFILE.$newI
-  fi
-done
-if [ -f $LOGFILE ]; then
-  mv $LOGFILE $LOGFILE.0
-fi
-if [ "x$VERBOSE" = "x1" ]; then
-  /usr/bin/owmofc -c -n $NS -d $DBDIR -s /usr/share/mof/cim-current "$@" 2>&1 | tee $LOGFILE
-else
-  /usr/bin/owmofc -c -n $NS -d $DBDIR -s /usr/share/mof/cim-current "$@" > $LOGFILE 2>&1
-fi
-RVAL=$?
-if [ "x$RVAL" != "x0" ]; then
-  echo "MOF import failed!  Check $LOGFILE for details."
-  mv $bkpdir/* $DBDIR/
-fi
-rm -rf $bkpdir
-if [ "x$CIMOM_RUNNING" = "x0"  ]; then
-  $CIMOM_INIT start > /dev/null 2>&1
-fi
-exit $RVAL
-fi
-
diff --git a/meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof b/meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof
deleted file mode 100644
index c9970c79e..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/novell-openwbem-root-acl.mof
+++ /dev/null
@@ -1,21 +0,0 @@
-#pragma namespace("root/security")
-
-instance of OpenWBEM_NamespaceACL
-{
-	nspace = "root";
-	capability = "";
-};
-
-instance of OpenWBEM_NamespaceACL
-{
-	nspace = "root/cimv2";
-	capability = "";
-};
-
-instance of OpenWBEM_UserACL
-{
-	nspace = "root/cimv2";
-	username = "root";
-	capability = "rw";
-};
-
diff --git a/meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem b/meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem
deleted file mode 100644
index b3785aa49..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/openwbem-etc_pam.d_openwbem
+++ /dev/null
@@ -1,7 +0,0 @@
-#%PAM-1.0
-auth       required	pam_unix2.so	nullok
-auth       required	pam_nologin.so
-account    required	pam_unix2.so
-password   required	pam_pwcheck.so	nullok
-password   required	pam_unix2.so	nullok use_first_pass use_authtok
-session    required	pam_unix2.so	none
diff --git a/meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init b/meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init
deleted file mode 100644
index 47fa8a7c6..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/openwbem-owcimomd.init
+++ /dev/null
@@ -1,131 +0,0 @@
-#!/bin/sh
-#
-### BEGIN INIT INFO
-# Provides: owcimomd
-# Required-Start: $network
-# Required-Stop: $network
-# Default-Start: 2 3 4 5
-# Default-Stop: 0 1 6 
-# Short-Description: OpenWBEM CIMOM Daemon
-# Description: owcimomd
-#       Start/Stop the OpenWBEM CIMOM Daemon
-### END INIT INFO
-#
-#
-# chkconfig: 2345 36 64
-# description: OpenWBEM CIMOM Daemon
-# processname: owcimomd
-
-NAME=owcimomd
-DAEMON=/usr/sbin/$NAME
-OPTIONS=
-PIDFILE=/var/run/$NAME.pid
-
-if [ $EUID != 0 ]; then
- echo "This script must be run as root."
- exit 1;
-fi
-
-if [ "$DESCRIPTIVE" = "" ]; then
- DESCRIPTIVE="OpenWBEM CIMOM Daemon"
-fi
-
-lockfile=${SVIlock:-/var/lock/subsys/$NAME}
-
-[ -x $DAEMON ] || exit 0
-
-# See how we were called.
-. /etc/init.d/functions
-
-start() {
-    if [ ! -f "/etc/openwbem/serverkey.pem" ]; then
-        if [ -f "/etc/ssl/servercerts/servercert.pem" \
-                -a -f "/etc/ssl/servercerts/serverkey.pem" ]; then
-            echo "Using common server certificate /etc/ssl/servercerts/servercert.pem"
-            ln -s /etc/ssl/servercerts/server{cert,key}.pem /etc/openwbem/
-        else
-            echo "Generating OpenWBEM server public certificate and private key"
-            FQDN=`hostname --fqdn`
-            if [ "x${FQDN}" = "x" ]; then
-                FQDN=localhost.localdomain
-            fi
-cat << EOF | sh /etc/openwbem/owgencert > /dev/null 2>&1
---
-SomeState
-SomeCity
-SomeOrganization
-SomeOrganizationalUnit
-${FQDN}
-root@${FQDN}
-EOF
-        fi
-    fi
-
-    # Start daemons.
-    echo -n "Starting the $DESCRIPTIVE"
-    daemon $DAEMON $OPTIONS > /dev/null 2>&1 
-    RETVAL=$?
-
-    if [ $RETVAL -eq 0 ]; then
-        touch $lockfile
-        success
-    fi
-
-    echo
-    return $RETVAL
-}
-
-stop() {
-    # Stop daemons.
-    echo -n "Shutting down $DESCRIPTIVE"
-    killproc $DAEMON
-    RETVAL=$?
-
-    if [ $RETVAL -eq 0 ]; then
-        rm -f $lockfile
-        success
-    else
-        failure
-    fi
-    echo
-    return $RETVAL
-}
-
-restart() {
-    stop
-    start
-}
-
-case "$1" in
-    start)
-    start
-    ;;
-
-    stop)
-    stop
-    ;;
-
-    restart|force-reload)
-    restart
-    ;;
-
-    reload)
-    echo -n "Reload service $DESCRIPTIVE"
-    killproc -p $PIDFILE  -HUP $DAEMON
-    RETVAL=$?
-    echo
-    exit $RETVAL
-    ;;
-
-    status)
-    echo -n "Checking for service $DESCRIPTIVE"
-    status $DAEMON
-    RETVAL=$?
-    exit $RETVAL
-    ;;
-
-    *)
-    echo "Usage: $0 {restart|start|stop|reload|force-reload|status}"
-esac
-
-exit $RETVAL
diff --git a/meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc b/meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc
deleted file mode 100644
index 785e32aaa..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/openwbem-rpmlintrc
+++ /dev/null
@@ -1,2 +0,0 @@
-addFilter("devel-file-in-non-devel-package .*/lib.*\.so")
-
diff --git a/meta-oe/recipes-support/openwbem/openwbem/owcimomd.service b/meta-oe/recipes-support/openwbem/openwbem/owcimomd.service
deleted file mode 100644
index c6694b719..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/owcimomd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=Web Based Enterprise Management (WBEM) Implementation
-After=syslog.target
-
-[Service]
-Type=forking
-ExecStart=/usr/sbin/owcimomd
-ExecStartPre=/etc/openwbem/checkserverkey
-PIDFile=/var/run/owcimomd.pid
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openwbem/openwbem/rmmof.sh b/meta-oe/recipes-support/openwbem/openwbem/rmmof.sh
deleted file mode 100644
index a495415be..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem/rmmof.sh
+++ /dev/null
@@ -1,53 +0,0 @@
-#!/bin/sh
-# 
-# options:
-# rmmof.sh <MOF_PATH> <NAMESPACE> <FILES>
-#
-# - or -
-#
-# options:
-# loadmof.sh -n <NAMESPACE> <FILES> [...]
-#
-# The former is preserved for compatibility with Pegasus and 
-# sblim providers.  The latter is preferred.  If $1 is "-n",
-# the latter code path is executed.  Otherwise the former is 
-# executed.
-
-if [ "x$3" = "x" ]; then
-    echo "Usage: $0 -n <NAMESPACE> <FILES> [...]"
-    exit 1
-fi
-
-# get rid of "-n" arg
-shift 
-
-NS="$1"
-
-shift 
-
-DBDIR=/var/lib/openwbem
-CIMOM_INIT=/etc/init.d/owcimomd
-if [ "$YAST_IS_RUNNING" != "instsys" ] ; then
-    $CIMOM_INIT status
-    CIMOM_RUNNING=$?
-fi
-if [ "x$CIMOM_RUNNING" = "x0"  ]; then
-  $CIMOM_INIT stop
-fi
-bkpdir=/tmp/owrep.bkp-$$
-mkdir $bkpdir
-cp -a $DBDIR $bkpdir/
-echo "Compiling MOF files"
-/usr/bin/owmofc -r -n $NS -d $DBDIR "$@" > /dev/null 2>&1
-RVAL=$?
-if [ "x$RVAL" != "x0" ]; then
-  echo "MOF import failed!"
-  rm -rf $DBDIR
-  mv $bkpdir/openwbem $DBDIR
-fi
-rm -rf $bkpdir
-if [ "x$CIMOM_RUNNING" = "x0"  ]; then
-  $CIMOM_INIT start
-fi
-exit $RVAL
-
-- 
2.17.1


