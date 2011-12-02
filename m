Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RWUr7-0002pk-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 16:16:53 +0100
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 19E774B0052;
	Fri,  2 Dec 2011 16:10:07 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2011 16:09:57 +0100
Message-Id: <1322838598-30090-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1322838598-30090-1-git-send-email-eric@eukrea.com>
References: <1322838598-30090-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe v2 3/4] add net-snmp-5.7.1
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
X-List-Received-Date: Fri, 02 Dec 2011 15:16:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

the recipe was imported from OE-classic and upgraded to latest stable.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-extended/net-snmp/files/init       |   63 +++
 meta-oe/recipes-extended/net-snmp/files/snmpd.conf |  422 ++++++++++++++=
++++++
 .../recipes-extended/net-snmp/files/snmptrapd.conf |   18 +
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |   66 +++
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   26 ++
 5 files changed, 595 insertions(+), 0 deletions(-)
 create mode 100755 meta-oe/recipes-extended/net-snmp/files/init
 create mode 100644 meta-oe/recipes-extended/net-snmp/files/snmpd.conf
 create mode 100644 meta-oe/recipes-extended/net-snmp/files/snmptrapd.con=
f
 create mode 100644 meta-oe/recipes-extended/net-snmp/net-snmp.inc
 create mode 100644 meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb

diff --git a/meta-oe/recipes-extended/net-snmp/files/init b/meta-oe/recip=
es-extended/net-snmp/files/init
new file mode 100755
index 0000000..434b2fa
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/files/init
@@ -0,0 +1,63 @@
+#! /bin/sh
+# /etc/init.d/snmpd: start snmp daemon.
+
+test -x /usr/sbin/snmpd || exit 0
+test -x /usr/sbin/snmptrapd || exit 0
+
+# Defaults
+export MIBDIRS=3D/usr/share/snmp/mibs
+SNMPDRUN=3Dyes
+SNMPDOPTS=3D'-Lsd -Lf /dev/null -p /var/run/snmpd.pid'
+TRAPDRUN=3Dno
+TRAPDOPTS=3D'-Lsd -p /var/run/snmptrapd.pid'
+
+# Cd to / before starting any daemons.
+cd /
+
+case "$1" in
+  start)
+    echo -n "Starting network management services:"
+    if [ "$SNMPDRUN" =3D "yes" -a -f /etc/snmp/snmpd.conf ]; then
+	start-stop-daemon -S -x /usr/sbin/snmpd \
+	    -- $SNMPDOPTS
+	echo -n " snmpd"
+    fi
+    if [ "$TRAPDRUN" =3D "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+	start-stop-daemon -S -x /usr/sbin/snmptrapd \
+	    -- $TRAPDOPTS
+	echo -n " snmptrapd"
+    fi
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping network management services:"
+    start-stop-daemon -K -x /usr/sbin/snmpd
+    echo -n " snmpd"
+    start-stop-daemon -K -x /usr/sbin/snmptrapd
+    echo -n " snmptrapd"
+    echo "."
+    ;;
+  restart|reload|force-reload)
+    echo -n "Restarting network management services:"
+    start-stop-daemon -K -x /usr/sbin/snmpd
+    start-stop-daemon -K -x /usr/sbin/snmptrapd
+    # Allow the daemons time to exit completely.
+    sleep 2
+    if [ "$SNMPDRUN" =3D "yes" -a -f /etc/snmp/snmpd.conf ]; then
+	start-stop-daemon -S -x /usr/sbin/snmpd -- $SNMPDOPTS
+	echo -n " snmpd"
+    fi
+    if [ "$TRAPDRUN" =3D "yes" -a -f /etc/snmp/snmptrapd.conf ]; then
+	# Allow snmpd time to start up.
+	sleep 1
+	start-stop-daemon -S -x /usr/sbin/snmptrapd -- $TRAPDOPTS
+	echo -n " snmptrapd"
+    fi
+    echo "."
+    ;;
+  *)
+    echo "Usage: /etc/init.d/snmpd {start|stop|restart|reload|force-relo=
ad}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta-oe/recipes-extended/net-snmp/files/snmpd.conf b/meta-oe=
/recipes-extended/net-snmp/files/snmpd.conf
new file mode 100644
index 0000000..728171c
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/files/snmpd.conf
@@ -0,0 +1,422 @@
+########################################################################=
#######
+#
+# EXAMPLE.conf:
+#   An example configuration file for configuring the ucd-snmp snmpd age=
nt.
+#
+########################################################################=
#######
+#
+# This file is intended to only be an example.  If, however, you want
+# to use it, it should be placed in /etc/snmp/snmpd.conf.
+# When the snmpd agent starts up, this is where it will look for it.
+#
+# You might be interested in generating your own snmpd.conf file using
+# the "snmpconf" program (perl script) instead.  It's a nice menu
+# based interface to writing well commented configuration files.  Try it=
!
+#
+# Note: This file is automatically generated from EXAMPLE.conf.def.
+# Do NOT read the EXAMPLE.conf.def file! Instead, after you have run
+# configure & make, and then make sure you read the EXAMPLE.conf file
+# instead, as it will tailor itself to your configuration.
+
+# All lines beginning with a '#' are comments and are intended for you
+# to read.  All other lines are configuration commands for the agent.
+
+#
+# PLEASE: read the snmpd.conf(5) manual page as well!
+#
+
+
+########################################################################=
#######
+# Access Control
+########################################################################=
#######
+
+# YOU SHOULD CHANGE THE "COMMUNITY" TOKEN BELOW TO A NEW KEYWORD ONLY
+# KNOWN AT YOUR SITE.  YOU *MUST* CHANGE THE NETWORK TOKEN BELOW TO
+# SOMETHING REFLECTING YOUR LOCAL NETWORK ADDRESS SPACE.
+
+# By far, the most common question I get about the agent is "why won't
+# it work?", when really it should be "how do I configure the agent to
+# allow me to access it?"
+#
+# By default, the agent responds to the "public" community for read
+# only access, if run out of the box without any configuration file in=20
+# place.  The following examples show you other ways of configuring
+# the agent so that you can change the community names, and give
+# yourself write access as well.
+#
+# The following lines change the access permissions of the agent so
+# that the COMMUNITY string provides read-only access to your entire
+# NETWORK (EG: 10.10.10.0/24), and read/write access to only the
+# localhost (127.0.0.1, not its real ipaddress).
+#
+# For more information, read the FAQ as well as the snmpd.conf(5)
+# manual page.
+
+####
+# First, map the community name (COMMUNITY) into a security name
+# (local and mynetwork, depending on where the request is coming
+# from):
+
+#       sec.name  source          community
+com2sec paranoid  default         public
+#com2sec readonly  default         public
+#com2sec readwrite default         private
+
+####
+# Second, map the security names into group names:
+
+#             	sec.model  sec.name
+group MyROSystem v1        paranoid
+group MyROSystem v2c       paranoid
+group MyROSystem usm       paranoid
+group MyROGroup v1         readonly
+group MyROGroup v2c        readonly
+group MyROGroup usm        readonly
+group MyRWGroup v1         readwrite
+group MyRWGroup v2c        readwrite
+group MyRWGroup usm        readwrite
+
+####
+# Third, create a view for us to let the groups have rights to:
+
+#           incl/excl subtree                          mask
+view all    included  .1                               80
+view system included  .iso.org.dod.internet.mgmt.mib-2.system
+
+####
+# Finally, grant the 2 groups access to the 1 view with different
+# write permissions:
+
+#                context sec.model sec.level match  read   write  notif
+access MyROSystem ""     any       noauth    exact  system none   none
+access MyROGroup ""      any       noauth    exact  all    none   none
+access MyRWGroup ""      any       noauth    exact  all    all    none
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# System contact information
+#
+
+# It is also possible to set the sysContact and sysLocation system
+# variables through the snmpd.conf file.  **PLEASE NOTE** that setting
+# the value of these objects here makes these objects READ-ONLY
+# (regardless of any access control settings).  Any attempt to set the
+# value of an object whose value is given here will fail with an error
+# status of notWritable.
+
+syslocation Unknown (configure /etc/snmp/snmpd.local.conf)
+syscontact Root <root@localhost> (configure /etc/snmp/snmpd.local.conf)
+
+# Example output of snmpwalk:
+#   % snmpwalk -v 1 -c public localhost system
+#   system.sysDescr.0 =3D "SunOS name sun4c"
+#   system.sysObjectID.0 =3D OID: enterprises.ucdavis.ucdSnmpAgent.sunos=
4
+#   system.sysUpTime.0 =3D Timeticks: (595637548) 68 days, 22:32:55
+#   system.sysContact.0 =3D "Me <me@somewhere.org>"
+#   system.sysName.0 =3D "name"
+#   system.sysLocation.0 =3D "Right here, right now."
+#   system.sysServices.0 =3D 72
+
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# Process checks.
+#
+#  The following are examples of how to use the agent to check for
+#  processes running on the host.  The syntax looks something like:
+#
+#  proc NAME [MAX=3D0] [MIN=3D0]
+#
+#  NAME:  the name of the process to check for.  It must match
+#         exactly (ie, http will not find httpd processes).
+#  MAX:   the maximum number allowed to be running.  Defaults to 0.
+#  MIN:   the minimum number to be running.  Defaults to 0.
+
+#
+#  Examples:
+#
+
+#  Make sure mountd is running
+#proc mountd
+
+#  Make sure there are no more than 4 ntalkds running, but 0 is ok too.
+#proc ntalkd 4
+
+#  Make sure at least one sendmail, but less than or equal to 10 are run=
ning.
+#proc sendmail 10 1
+
+#  A snmpwalk of the prTable would look something like this:
+#=20
+# % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.2
+# enterprises.ucdavis.procTable.prEntry.prIndex.1 =3D 1
+# enterprises.ucdavis.procTable.prEntry.prIndex.2 =3D 2
+# enterprises.ucdavis.procTable.prEntry.prIndex.3 =3D 3
+# enterprises.ucdavis.procTable.prEntry.prNames.1 =3D "mountd"
+# enterprises.ucdavis.procTable.prEntry.prNames.2 =3D "ntalkd"
+# enterprises.ucdavis.procTable.prEntry.prNames.3 =3D "sendmail"
+# enterprises.ucdavis.procTable.prEntry.prMin.1 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prMin.2 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prMin.3 =3D 1
+# enterprises.ucdavis.procTable.prEntry.prMax.1 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prMax.2 =3D 4
+# enterprises.ucdavis.procTable.prEntry.prMax.3 =3D 10
+# enterprises.ucdavis.procTable.prEntry.prCount.1 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prCount.2 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prCount.3 =3D 1
+# enterprises.ucdavis.procTable.prEntry.prErrorFlag.1 =3D 1
+# enterprises.ucdavis.procTable.prEntry.prErrorFlag.2 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prErrorFlag.3 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prErrMessage.1 =3D "No mountd pr=
ocess running."
+# enterprises.ucdavis.procTable.prEntry.prErrMessage.2 =3D ""
+# enterprises.ucdavis.procTable.prEntry.prErrMessage.3 =3D ""
+# enterprises.ucdavis.procTable.prEntry.prErrFix.1 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prErrFix.2 =3D 0
+# enterprises.ucdavis.procTable.prEntry.prErrFix.3 =3D 0
+#
+#  Note that the errorFlag for mountd is set to 1 because one is not
+#  running (in this case an rpc.mountd is, but thats not good enough),
+#  and the ErrMessage tells you what's wrong.  The configuration
+#  imposed in the snmpd.conf file is also shown. =20
+#=20
+#  Special Case:  When the min and max numbers are both 0, it assumes
+#  you want a max of infinity and a min of 1.
+#
+
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# Executables/scripts
+#
+
+#
+#  You can also have programs run by the agent that return a single
+#  line of output and an exit code.  Here are two examples.
+#
+#  exec NAME PROGRAM [ARGS ...]
+#
+#  NAME:     A generic name.
+#  PROGRAM:  The program to run.  Include the path!
+#  ARGS:     optional arguments to be passed to the program
+
+# a simple hello world
+#exec echotest /bin/echo hello world
+
+# Run a shell script containing:
+#
+# #!/bin/sh
+# echo hello world
+# echo hi there
+# exit 35
+#
+# Note:  this has been specifically commented out to prevent
+# accidental security holes due to someone else on your system writing
+# a /tmp/shtest before you do.  Uncomment to use it.
+#
+#exec shelltest /bin/sh /tmp/shtest
+
+# Then,=20
+# % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.8
+# enterprises.ucdavis.extTable.extEntry.extIndex.1 =3D 1
+# enterprises.ucdavis.extTable.extEntry.extIndex.2 =3D 2
+# enterprises.ucdavis.extTable.extEntry.extNames.1 =3D "echotest"
+# enterprises.ucdavis.extTable.extEntry.extNames.2 =3D "shelltest"
+# enterprises.ucdavis.extTable.extEntry.extCommand.1 =3D "/bin/echo hell=
o world"
+# enterprises.ucdavis.extTable.extEntry.extCommand.2 =3D "/bin/sh /tmp/s=
htest"
+# enterprises.ucdavis.extTable.extEntry.extResult.1 =3D 0
+# enterprises.ucdavis.extTable.extEntry.extResult.2 =3D 35
+# enterprises.ucdavis.extTable.extEntry.extOutput.1 =3D "hello world."
+# enterprises.ucdavis.extTable.extEntry.extOutput.2 =3D "hello world."
+# enterprises.ucdavis.extTable.extEntry.extErrFix.1 =3D 0
+# enterprises.ucdavis.extTable.extEntry.extErrFix.2 =3D 0
+
+# Note that the second line of the /tmp/shtest shell script is cut
+# off.  Also note that the exit status of 35 was returned.
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# disk checks
+#
+
+# The agent can check the amount of available disk space, and make
+# sure it is above a set limit. =20
+
+# disk PATH [MIN=3DDEFDISKMINIMUMSPACE]
+#
+# PATH:  mount path to the disk in question.
+# MIN:   Disks with space below this value will have the Mib's errorFlag=
 set.
+#        Default value =3D DEFDISKMINIMUMSPACE.
+
+# Check the / partition and make sure it contains at least 10 megs.
+
+#disk / 10000
+
+# % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.9
+# enterprises.ucdavis.diskTable.dskEntry.diskIndex.1 =3D 0
+# enterprises.ucdavis.diskTable.dskEntry.diskPath.1 =3D "/" Hex: 2F=20
+# enterprises.ucdavis.diskTable.dskEntry.diskDevice.1 =3D "/dev/dsk/c201=
d6s0"
+# enterprises.ucdavis.diskTable.dskEntry.diskMinimum.1 =3D 10000
+# enterprises.ucdavis.diskTable.dskEntry.diskTotal.1 =3D 837130
+# enterprises.ucdavis.diskTable.dskEntry.diskAvail.1 =3D 316325
+# enterprises.ucdavis.diskTable.dskEntry.diskUsed.1 =3D 437092
+# enterprises.ucdavis.diskTable.dskEntry.diskPercent.1 =3D 58
+# enterprises.ucdavis.diskTable.dskEntry.diskErrorFlag.1 =3D 0
+# enterprises.ucdavis.diskTable.dskEntry.diskErrorMsg.1 =3D ""
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# load average checks
+#
+
+# load [1MAX=3DDEFMAXLOADAVE] [5MAX=3DDEFMAXLOADAVE] [15MAX=3DDEFMAXLOAD=
AVE]
+#
+# 1MAX:   If the 1 minute load average is above this limit at query
+#         time, the errorFlag will be set.
+# 5MAX:   Similar, but for 5 min average.
+# 15MAX:  Similar, but for 15 min average.
+
+# Check for loads:
+#load 12 14 14
+
+# % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.10
+# enterprises.ucdavis.loadTable.laEntry.loadaveIndex.1 =3D 1
+# enterprises.ucdavis.loadTable.laEntry.loadaveIndex.2 =3D 2
+# enterprises.ucdavis.loadTable.laEntry.loadaveIndex.3 =3D 3
+# enterprises.ucdavis.loadTable.laEntry.loadaveNames.1 =3D "Load-1"
+# enterprises.ucdavis.loadTable.laEntry.loadaveNames.2 =3D "Load-5"
+# enterprises.ucdavis.loadTable.laEntry.loadaveNames.3 =3D "Load-15"
+# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.1 =3D "0.49" Hex: 30=
 2E 34 39=20
+# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.2 =3D "0.31" Hex: 30=
 2E 33 31=20
+# enterprises.ucdavis.loadTable.laEntry.loadaveLoad.3 =3D "0.26" Hex: 30=
 2E 32 36=20
+# enterprises.ucdavis.loadTable.laEntry.loadaveConfig.1 =3D "12.00"
+# enterprises.ucdavis.loadTable.laEntry.loadaveConfig.2 =3D "14.00"
+# enterprises.ucdavis.loadTable.laEntry.loadaveConfig.3 =3D "14.00"
+# enterprises.ucdavis.loadTable.laEntry.loadaveErrorFlag.1 =3D 0
+# enterprises.ucdavis.loadTable.laEntry.loadaveErrorFlag.2 =3D 0
+# enterprises.ucdavis.loadTable.laEntry.loadaveErrorFlag.3 =3D 0
+# enterprises.ucdavis.loadTable.laEntry.loadaveErrMessage.1 =3D ""
+# enterprises.ucdavis.loadTable.laEntry.loadaveErrMessage.2 =3D ""
+# enterprises.ucdavis.loadTable.laEntry.loadaveErrMessage.3 =3D ""
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# Extensible sections.
+#=20
+
+# This alleviates the multiple line output problem found in the
+# previous executable mib by placing each mib in its own mib table:
+
+# Run a shell script containing:
+#
+# #!/bin/sh
+# echo hello world
+# echo hi there
+# exit 35
+#
+# Note:  this has been specifically commented out to prevent
+# accidental security holes due to someone else on your system writing
+# a /tmp/shtest before you do.  Uncomment to use it.
+#
+# exec .1.3.6.1.4.1.2021.50 shelltest /bin/sh /tmp/shtest
+
+# % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.50
+# enterprises.ucdavis.50.1.1 =3D 1
+# enterprises.ucdavis.50.2.1 =3D "shelltest"
+# enterprises.ucdavis.50.3.1 =3D "/bin/sh /tmp/shtest"
+# enterprises.ucdavis.50.100.1 =3D 35
+# enterprises.ucdavis.50.101.1 =3D "hello world."
+# enterprises.ucdavis.50.101.2 =3D "hi there."
+# enterprises.ucdavis.50.102.1 =3D 0
+
+# Now the Output has grown to two lines, and we can see the 'hi
+# there.' output as the second line from our shell script.
+#
+# Note that you must alter the mib.txt file to be correct if you want
+# the .50.* outputs above to change to reasonable text descriptions.
+
+# Other ideas:
+#=20
+# exec .1.3.6.1.4.1.2021.51 ps /bin/ps=20
+# exec .1.3.6.1.4.1.2021.52 top /usr/local/bin/top
+# exec .1.3.6.1.4.1.2021.53 mailq /usr/bin/mailq
+
+# ----------------------------------------------------------------------=
-------
+
+
+########################################################################=
#######
+# Pass through control.
+#=20
+
+# Usage:
+#   pass MIBOID EXEC-COMMAND
+#
+# This will pass total control of the mib underneath the MIBOID
+# portion of the mib to the EXEC-COMMAND. =20
+#
+# Note:  You'll have to change the path of the passtest script to your
+# source directory or install it in the given location.
+#=20
+# Example:  (see the script for details)
+#           (commented out here since it requires that you place the
+#           script in the right location. (its not installed by default)=
)
+
+# pass .1.3.6.1.4.1.2021.255 /bin/sh /usr/local/passtest
+
+# % snmpwalk -v 1 -c public localhost .1.3.6.1.4.1.2021.255
+# enterprises.ucdavis.255.1 =3D "life the universe and everything"
+# enterprises.ucdavis.255.2.1 =3D 42
+# enterprises.ucdavis.255.2.2 =3D OID: 42.42.42
+# enterprises.ucdavis.255.3 =3D Timeticks: (363136200) 42 days, 0:42:42
+# enterprises.ucdavis.255.4 =3D IpAddress: 127.0.0.1
+# enterprises.ucdavis.255.5 =3D 42
+# enterprises.ucdavis.255.6 =3D Gauge: 42
+#
+# % snmpget -v 1 -c public localhost .1.3.6.1.4.1.2021.255.5
+# enterprises.ucdavis.255.5 =3D 42
+#
+# % snmpset -v 1 -c public localhost .1.3.6.1.4.1.2021.255.1 s "New stri=
ng"
+# enterprises.ucdavis.255.1 =3D "New string"
+#
+
+# For specific usage information, see the man/snmpd.conf.5 manual page
+# as well as the local/passtest script used in the above example.
+
+########################################################################=
#######
+# Subagent control
+#
+
+# The agent can support subagents using a number of extension mechanisms=
.
+# From the 4.2.1 release, AgentX support is being compiled in by default=
.
+# However, this is still experimental code, so should not be used on
+# critical production systems.
+#   Please see the file README.agentx for more details.
+#
+# If having read, marked, learnt and inwardly digested this information,
+# you decide that you do wish to make use of this mechanism, simply
+# uncomment the following directive.
+#
+#  master  agentx
+#
+# I repeat - this is *NOT* regarded as suitable for front-line productio=
n
+# systems, though it is probably stable enough for day-to-day use.
+# Probably.
+#
+# No refunds will be given.
+
+########################################################################=
#######
+# Further Information
+#
+#  See the snmpd.conf manual page, and the output of "snmpd -H".
+#  MUCH more can be done with the snmpd.conf than is shown as an
+#  example here.
diff --git a/meta-oe/recipes-extended/net-snmp/files/snmptrapd.conf b/met=
a-oe/recipes-extended/net-snmp/files/snmptrapd.conf
new file mode 100644
index 0000000..8d2e437
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/files/snmptrapd.conf
@@ -0,0 +1,18 @@
+########################################################################=
#######
+#
+# EXAMPLE.conf:
+#   An example configuration file for configuring the ucd-snmp snmptrapd=
 agent.
+#
+########################################################################=
#######
+#
+# This file is intended to only be an example.  If, however, you want
+# to use it, it should be placed in /etc/snmp/snmptrapd.conf.
+# When the snmptrapd agent starts up, this is where it will look for it.
+#
+# All lines beginning with a '#' are comments and are intended for you
+# to read.  All other lines are configuration commands for the agent.
+
+#
+# PLEASE: read the snmptrapd.conf(5) manual page as well!
+#
+
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/rec=
ipes-extended/net-snmp/net-snmp.inc
new file mode 100644
index 0000000..159c374
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -0,0 +1,66 @@
+DESCRIPTION =3D "Various tools relating to the Simple Network Management=
 Protocol"
+HOMEPAGE =3D "http://www.net-snmp.org/"
+LICENSE =3D "BSD"
+
+DEPENDS =3D "openssl"
+RDEPENDS_${PN}-server +=3D "net-snmp-mibs"
+RDEPENDS_${PN}-client +=3D "net-snmp-mibs"
+RDEPENDS_${PN}-dev =3D "net-snmp-client (=3D ${EXTENDPV}) net-snmp-serve=
r (=3D ${EXTENDPV})"
+RRECOMMENDS_${PN}-dbg =3D "net-snmp-client (=3D ${EXTENDPV}) net-snmp-se=
rver (=3D ${EXTENDPV})"
+INC_PR =3D "r0"
+
+inherit autotools update-rc.d siteinfo
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+
+EXTRA_OECONF =3D "--enable-shared --disable-manuals --with-defaults \
+${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=3Dli=
ttle', '--with-endianness=3Dbig', d)}"
+
+do_install () {
+	oe_runmake install
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/snmp
+	install -d ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
+	install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
+	install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
+	install -d ${STAGING_BINDIR}
+	install -m 0755 ${D}${bindir}/net-snmp-config ${STAGING_BINDIR}/
+	sed -e "s@-I/usr/include@@g" \
+		-e "s@^prefix=3D.*@prefix=3D${STAGING_DIR_HOST}@g" \
+		-e "s@^exec_prefix=3D.*@exec_prefix=3D${STAGING_DIR_HOST}@g" \
+		-e "s@^includedir=3D.*@includedir=3D${STAGING_INCDIR}@g" \
+		-e "s@^libdir=3D.*@libdir=3D${STAGING_LIBDIR}@g" \
+		-i ${STAGING_BINDIR}/net-snmp-config
+}
+
+PACKAGES =3D "net-snmp-dbg net-snmp-doc net-snmp-dev net-snmp-static net=
-snmp-libs \
+            net-snmp-mibs net-snmp-server net-snmp-client"
+
+FILES_${PN}-static =3D "${libdir}/*.a"
+FILES_${PN}-libs =3D "${libdir}/*"
+FILES_${PN}-mibs =3D "${datadir}/snmp/mibs"
+FILES_${PN}-server =3D "${sbindir}/* ${sysconfdir}"
+FILES_${PN}-client =3D "${bindir}/* ${datadir}/snmp/"
+FILES_${PN}-dbg +=3D "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.de=
bug/"
+FILES_${PN}-dev +=3D ${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}=
/mib2c-update"
+
+CONFFILES_${PN}-server =3D "${sysconfdir}/snmp/snmpd.conf \
+                          ${sysconfdir}/snmp/snmptrapd.conf"
+
+INITSCRIPT_PACKAGES =3D "${PN}-server"
+INITSCRIPT_NAME_${PN}-server =3D "snmpd"
+INITSCRIPT_PARAMS_${PN}-server =3D "defaults"
+
+LEAD_SONAME =3D "libnetsnmp.so"
+
+pkg_postrm_net-snmp-server() {
+	if test "x$D" !=3D "x"; then
+		OPT=3D"-r $D "
+	else
+		OPT=3D""
+		/etc/init.d/snmpd stop
+	fi
+}
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-o=
e/recipes-extended/net-snmp/net-snmp_5.7.1.bb
new file mode 100644
index 0000000..59d8407
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
@@ -0,0 +1,26 @@
+require net-snmp.inc
+PR =3D "${INC_PR}.0"
+LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=3D8;md5=3D7f7f=
00ba639ac8e8deb5a622ea24634e"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
+        file://init \
+        file://snmpd.conf \
+        file://snmptrapd.conf"
+
+EXTRA_OECONF +=3D "--disable-embedded-perl --with-perl-modules=3Dno"
+EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D}"
+
+do_configure_prepend() {
+        gnu-configize -f
+        # We better change sources and re-autoconf here, but
+        # required autoconf is too new for us.
+        sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \
+            -e 's/tail -1/tail -n 1/g'                \
+            -i configure
+}
+
+PARALLEL_MAKE =3D ""
+CCACHE =3D ""
+
+SRC_URI[md5sum] =3D "c95d08fd5d93df0c11a2e1bdf0e01e0b"
+SRC_URI[sha256sum] =3D "7c71c9650c65b715356547e20ca2dbe6313944278af8cc19=
c32a5337f46b181f"
--=20
1.7.6.4



