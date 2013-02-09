Received: from barracuda.ventureresearch.com ([216.74.248.135])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <btv1==75297506191==kevinb@ventureresearch.com>)
	id 1U42po-0005c1-N6 for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 06:18:45 +0100
X-ASG-Debug-ID: 1360386169-05ff071089102d0001-aWHRdb
Received: from MAIL.crm.ventureresearch.com (mail.crm.ventureresearch.com
	[192.168.19.8]) by barracuda.ventureresearch.com with ESMTP id
	9tpryRBP6wAAjfcZ for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 23:02:49 -0600 (CST)
X-Barracuda-Envelope-From: kevinb@ventureresearch.com
X-ASG-Whitelist: Client
Received: from embedded-dev.crm.ventureresearch.com ([192.168.19.35]) by
	MAIL.crm.ventureresearch.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 8 Feb 2013 23:02:49 -0600
From: Kevin Baker <kevinb@ventureresearch.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 23:02:47 -0600
X-ASG-Orig-Subj: [oe][meta-oe][PATCH] redis: add new recipe for redis-2.6.9
Message-Id: <1360386167-20689-1-git-send-email-kevinb@ventureresearch.com>
X-Mailer: git-send-email 1.8.1.2
X-OriginalArrivalTime: 09 Feb 2013 05:02:49.0626 (UTC)
	FILETIME=[B53927A0:01CE0682]
X-Barracuda-Connect: mail.crm.ventureresearch.com[192.168.19.8]
X-Barracuda-Start-Time: 1360386169
X-Barracuda-URL: http://192.168.19.9:80/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at ventureresearch.com
X-Barracuda-BRTS-Status: 1
Subject: [meta-oe][PATCH] redis: add new recipe for redis-2.6.9
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
X-List-Received-Date: Sat, 09 Feb 2013 05:18:45 -0000

A recipe for Redis 2.6.9, an advanced key-value store.
Needed some patching of Makefiles and deps to get it to work with OE.

OE Specific configuration: This is built to override MALLOC and use
    libc's malloc instead of the provided jemalloc or tcmalloc that
    weren't building correctly.

    Also the default savepoint setting was updated in the default
    redis.conf to tune for a small embedded system.

Known Bug: redis-cli eats all the input on a serial port - watch out
    when using the serial console with redis-cli.
    see https://github.com/antirez/linenoise/issues/38

Tested with Yocto "Danny" / armv7a.

Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
---
 .../hiredis-use-default-CC-if-it-is-set.patch      |  29 ++
 .../recipes-extended/redis/redis/init-redis-server |  40 ++
 ...Makefile-to-use-environment-build-setting.patch |  54 ++
 .../redis/redis/oe-use-libc-malloc.patch           |  33 ++
 meta-oe/recipes-extended/redis/redis/redis.conf    | 550 +++++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_2.6.9.bb      |  36 ++
 6 files changed, 742 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
 create mode 100755 meta-oe/recipes-extended/redis/redis/init-redis-server
 create mode 100644 meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/redis.conf
 create mode 100644 meta-oe/recipes-extended/redis/redis_2.6.9.bb

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
new file mode 100644
index 0000000..8135fc2
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
@@ -0,0 +1,29 @@
+From dc745a33f3875cc72d41bd34ed490b352e546352 Mon Sep 17 00:00:00 2001
+From: Venture Research <tech@ventureresearch.com>
+Date: Fri, 8 Feb 2013 17:39:52 -0600
+Subject: [PATCH] hiredis: use default CC if it is set
+
+Instead of trying to automagically figure out CC, which breaks with OE
+as CC has spaces in it, just skip it if one was already passed in.
+
+Signed-off-by: Venture Research <tech@ventureresearch.com>
+---
+ deps/hiredis/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
+index 16b8767..0b27c82 100644
+--- a/deps/hiredis/Makefile
++++ b/deps/hiredis/Makefile
+@@ -11,7 +11,7 @@ HIREDIS_MAJOR=0
+ HIREDIS_MINOR=10
+ 
+ # Fallback to gcc when $CC is not in $PATH.
+-CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
++CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+ OPTIMIZATION?=-O3
+ WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
+ DEBUG?= -g -ggdb
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-extended/redis/redis/init-redis-server b/meta-oe/recipes-extended/redis/redis/init-redis-server
new file mode 100755
index 0000000..6014d70
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/init-redis-server
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+### BEGIN INIT INFO
+# Provides:          redis-server
+# Required-Start:    $network
+# Required-Stop:     $network
+# Default-Start:     S 2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Redis, a key-value store
+# Description:       Redis is an open source, advanced key-value store.
+#                    http://redis.io
+### END INIT INFO
+
+test -f /usr/bin/redis-server || exit 0
+
+ARGS="/etc/redis/redis.conf"
+
+case "$1" in
+    start)
+	echo "Starting redis-server..."
+        start-stop-daemon --start --quiet --exec /usr/bin/redis-server -- $ARGS
+	;;
+    stop)
+        echo "Stopping redis-server..."
+        start-stop-daemon --stop --quiet --exec /usr/bin/redis-server
+	;;
+    restart)
+        echo "Stopping redis-server..."
+        start-stop-daemon --stop --quiet --exec /usr/bin/redis-server
+	echo "Starting redis-server..."
+        start-stop-daemon --start --quiet --exec /usr/bin/redis-server -- $ARGS
+	;;
+    *)
+	echo "Usage: /etc/init.d/redis-server {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit 0
+
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
new file mode 100644
index 0000000..c4d1bc4
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -0,0 +1,54 @@
+From 394108035d350ae662a431c80131f812b5f72dff Mon Sep 17 00:00:00 2001
+From: Venture Research <tech@ventureresearch.com>
+Date: Fri, 8 Feb 2013 20:22:19 -0600
+Subject: [PATCH] lua: update Makefile to use environment build settings
+
+OE-specific parameters, instead of overriding all of these simply use
+the ones that are already passed in. Also configure for only Linux...
+
+Signed-off-by: Venture Research <tech@ventureresearch.com>
+---
+ deps/lua/src/Makefile | 18 +++++++-----------
+ 1 file changed, 7 insertions(+), 11 deletions(-)
+
+diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile
+index 77d6a48..888d0da 100644
+--- a/deps/lua/src/Makefile
++++ b/deps/lua/src/Makefile
+@@ -5,18 +5,14 @@
+ # == CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =======================
+ 
+ # Your platform. See PLATS for possible values.
+-PLAT= none
++PLAT= linux
+ 
+-CC= gcc
+-CFLAGS= -O2 -Wall $(MYCFLAGS)
+-AR= ar rcu
+-RANLIB= ranlib
+-RM= rm -f
+-LIBS= -lm $(MYLIBS)
+-
+-MYCFLAGS=
++MYCFLAGS=-DLUA_USE_LINUX
+ MYLDFLAGS=
+-MYLIBS=
++MYLIBS=-Wl,-E -ldl -lreadline -lhistory -lncurses
++
++CFLAGS += $(MYCFLAGS)
++LIBS += -lm $(MYLIBS)
+ 
+ # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
+ 
+@@ -48,7 +44,7 @@ o:	$(ALL_O)
+ a:	$(ALL_A)
+ 
+ $(LUA_A): $(CORE_O) $(LIB_O)
+-	$(AR) $@ $?
++	$(AR) rcu $@ $?
+ 	$(RANLIB) $@
+ 
+ $(LUA_T): $(LUA_O) $(LUA_A)
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
new file mode 100644
index 0000000..b89c871
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -0,0 +1,33 @@
+From f8861d2129b9e18bba137705bfa38c6bd9be1790 Mon Sep 17 00:00:00 2001
+From: Venture Research <tech@ventureresearch.com>
+Date: Wed, 6 Feb 2013 20:51:02 -0600
+Subject: [PATCH] hack to force use of libc malloc
+
+Hack to force libc usage as it seems the option to pass it in has been
+removed in favor of magic.
+
+Note that this of course doesn't allow tcmalloc and jemalloc, however 
+jemalloc wasn't building correctly.
+
+Signed-off-by: Venture Research <tech@ventureresearch.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 204a271..91b307d 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -13,7 +13,8 @@
+ # Just use 'make dep', but this is only needed by developers.
+ 
+ release_hdr := $(shell sh -c './mkreleasehdr.sh')
+-uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
++# use fake uname option to force use of generic libc
++uname_S := "USE_LIBC_MALLOC"
+ OPTIMIZATION?=-O2
+ DEPENDENCY_TARGETS=hiredis linenoise lua
+ 
+-- 
+1.8.1.2
+
diff --git a/meta-oe/recipes-extended/redis/redis/redis.conf b/meta-oe/recipes-extended/redis/redis/redis.conf
new file mode 100644
index 0000000..923b98e
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/redis.conf
@@ -0,0 +1,550 @@
+# Redis configuration file example
+
+# Note on units: when memory size is needed, it is possible to specify
+# it in the usual form of 1k 5GB 4M and so forth:
+#
+# 1k => 1000 bytes
+# 1kb => 1024 bytes
+# 1m => 1000000 bytes
+# 1mb => 1024*1024 bytes
+# 1g => 1000000000 bytes
+# 1gb => 1024*1024*1024 bytes
+#
+# units are case insensitive so 1GB 1Gb 1gB are all the same.
+
+# By default Redis does not run as a daemon. Use 'yes' if you need it.
+# Note that Redis will write a pid file in /var/run/redis.pid when daemonized.
+#
+# OE: run as a daemon.
+#
+daemonize yes
+
+# When running daemonized, Redis writes a pid file in /var/run/redis.pid by
+# default. You can specify a custom pid file location here.
+pidfile /var/run/redis.pid
+
+# Accept connections on the specified port, default is 6379.
+# If port 0 is specified Redis will not listen on a TCP socket.
+port 6379
+
+# If you want you can bind a single interface, if the bind option is not
+# specified all the interfaces will listen for incoming connections.
+#
+# bind 127.0.0.1
+
+# Specify the path for the unix socket that will be used to listen for
+# incoming connections. There is no default, so Redis will not listen
+# on a unix socket when not specified.
+#
+# unixsocket /tmp/redis.sock
+# unixsocketperm 755
+
+# Close the connection after a client is idle for N seconds (0 to disable)
+timeout 0
+
+# Set server verbosity to 'debug'
+# it can be one of:
+# debug (a lot of information, useful for development/testing)
+# verbose (many rarely useful info, but not a mess like the debug level)
+# notice (moderately verbose, what you want in production probably)
+# warning (only very important / critical messages are logged)
+loglevel notice
+
+# Specify the log file name. Also 'stdout' can be used to force
+# Redis to log on the standard output. Note that if you use standard
+# output for logging but daemonize, logs will be sent to /dev/null
+logfile /var/log/redis.log
+
+# To enable logging to the system logger, just set 'syslog-enabled' to yes,
+# and optionally update the other syslog parameters to suit your needs.
+# syslog-enabled no
+
+# Specify the syslog identity.
+# syslog-ident redis
+
+# Specify the syslog facility.  Must be USER or between LOCAL0-LOCAL7.
+# syslog-facility local0
+
+# Set the number of databases. The default database is DB 0, you can select
+# a different one on a per-connection basis using SELECT <dbid> where
+# dbid is a number between 0 and 'databases'-1
+databases 16
+
+################################ SNAPSHOTTING  #################################
+#
+# Save the DB on disk:
+#
+#   save <seconds> <changes>
+#
+#   Will save the DB if both the given number of seconds and the given
+#   number of write operations against the DB occurred.
+#
+#   In the example below the behaviour will be to save:
+#   after 900 sec (15 min) if at least 1 key changed
+#   after 300 sec (5 min) if at least 10 keys changed
+#   after 60 sec if at least 10000 keys changed
+#
+#   Note: you can disable saving at all commenting all the "save" lines.
+#
+#   It is also possible to remove all the previously configured save
+#   points by adding a save directive with a single empty string argument
+#   like in the following example:
+#
+#   save ""
+
+#save 900 1
+#save 300 10
+#save 60 10000
+
+# OE: tune for a small embedded system with a limited # of keys.
+save 120 1
+save 60 100
+save 30 1000
+
+# By default Redis will stop accepting writes if RDB snapshots are enabled
+# (at least one save point) and the latest background save failed.
+# This will make the user aware (in an hard way) that data is not persisting
+# on disk properly, otherwise chances are that no one will notice and some
+# distater will happen.
+#
+# If the background saving process will start working again Redis will
+# automatically allow writes again.
+#
+# However if you have setup your proper monitoring of the Redis server
+# and persistence, you may want to disable this feature so that Redis will
+# continue to work as usually even if there are problems with disk,
+# permissions, and so forth.
+stop-writes-on-bgsave-error yes
+
+# Compress string objects using LZF when dump .rdb databases?
+# For default that's set to 'yes' as it's almost always a win.
+# If you want to save some CPU in the saving child set it to 'no' but
+# the dataset will likely be bigger if you have compressible values or keys.
+rdbcompression yes
+
+# Since verison 5 of RDB a CRC64 checksum is placed at the end of the file.
+# This makes the format more resistant to corruption but there is a performance
+# hit to pay (around 10%) when saving and loading RDB files, so you can disable it
+# for maximum performances.
+#
+# RDB files created with checksum disabled have a checksum of zero that will
+# tell the loading code to skip the check.
+rdbchecksum yes
+
+# The filename where to dump the DB
+dbfilename dump.rdb
+
+# The working directory.
+#
+# The DB will be written inside this directory, with the filename specified
+# above using the 'dbfilename' configuration directive.
+# 
+# Also the Append Only File will be created inside this directory.
+# 
+# Note that you must specify a directory here, not a file name.
+dir /var/lib/redis/
+
+################################# REPLICATION #################################
+
+# Master-Slave replication. Use slaveof to make a Redis instance a copy of
+# another Redis server. Note that the configuration is local to the slave
+# so for example it is possible to configure the slave to save the DB with a
+# different interval, or to listen to another port, and so on.
+#
+# slaveof <masterip> <masterport>
+
+# If the master is password protected (using the "requirepass" configuration
+# directive below) it is possible to tell the slave to authenticate before
+# starting the replication synchronization process, otherwise the master will
+# refuse the slave request.
+#
+# masterauth <master-password>
+
+# When a slave lost the connection with the master, or when the replication
+# is still in progress, the slave can act in two different ways:
+#
+# 1) if slave-serve-stale-data is set to 'yes' (the default) the slave will
+#    still reply to client requests, possibly with out of date data, or the
+#    data set may just be empty if this is the first synchronization.
+#
+# 2) if slave-serve-stale data is set to 'no' the slave will reply with
+#    an error "SYNC with master in progress" to all the kind of commands
+#    but to INFO and SLAVEOF.
+#
+slave-serve-stale-data yes
+
+# You can configure a slave instance to accept writes or not. Writing against
+# a slave instance may be useful to store some ephemeral data (because data
+# written on a slave will be easily deleted after resync with the master) but
+# may also cause problems if clients are writing to it because of a
+# misconfiguration.
+#
+# Since Redis 2.6 by default slaves are read-only.
+#
+# Note: read only slaves are not designed to be exposed to untrusted clients
+# on the internet. It's just a protection layer against misuse of the instance.
+# Still a read only slave exports by default all the administrative commands
+# such as CONFIG, DEBUG, and so forth. To a limited extend you can improve
+# security of read only slaves using 'rename-command' to shadow all the
+# administrative / dangerous commands.
+slave-read-only yes
+
+# Slaves send PINGs to server in a predefined interval. It's possible to change
+# this interval with the repl_ping_slave_period option. The default value is 10
+# seconds.
+#
+# repl-ping-slave-period 10
+
+# The following option sets a timeout for both Bulk transfer I/O timeout and
+# master data or ping response timeout. The default value is 60 seconds.
+#
+# It is important to make sure that this value is greater than the value
+# specified for repl-ping-slave-period otherwise a timeout will be detected
+# every time there is low traffic between the master and the slave.
+#
+# repl-timeout 60
+
+# The slave priority is an integer number published by Redis in the INFO output.
+# It is used by Redis Sentinel in order to select a slave to promote into a
+# master if the master is no longer working correctly.
+#
+# A slave with a low priority number is considered better for promotion, so
+# for instance if there are three slaves with priority 10, 100, 25 Sentinel will
+# pick the one wtih priority 10, that is the lowest.
+#
+# However a special priority of 0 marks the slave as not able to perform the
+# role of master, so a slave with priority of 0 will never be selected by
+# Redis Sentinel for promotion.
+#
+# By default the priority is 100.
+slave-priority 100
+
+################################## SECURITY ###################################
+
+# Require clients to issue AUTH <PASSWORD> before processing any other
+# commands.  This might be useful in environments in which you do not trust
+# others with access to the host running redis-server.
+#
+# This should stay commented out for backward compatibility and because most
+# people do not need auth (e.g. they run their own servers).
+# 
+# Warning: since Redis is pretty fast an outside user can try up to
+# 150k passwords per second against a good box. This means that you should
+# use a very strong password otherwise it will be very easy to break.
+#
+# requirepass foobared
+
+# Command renaming.
+#
+# It is possible to change the name of dangerous commands in a shared
+# environment. For instance the CONFIG command may be renamed into something
+# of hard to guess so that it will be still available for internal-use
+# tools but not available for general clients.
+#
+# Example:
+#
+# rename-command CONFIG b840fc02d524045429941cc15f59e41cb7be6c52
+#
+# It is also possible to completely kill a command renaming it into
+# an empty string:
+#
+# rename-command CONFIG ""
+
+################################### LIMITS ####################################
+
+# Set the max number of connected clients at the same time. By default
+# this limit is set to 10000 clients, however if the Redis server is not
+# able ot configure the process file limit to allow for the specified limit
+# the max number of allowed clients is set to the current file limit
+# minus 32 (as Redis reserves a few file descriptors for internal uses).
+#
+# Once the limit is reached Redis will close all the new connections sending
+# an error 'max number of clients reached'.
+#
+# maxclients 10000
+
+# Don't use more memory than the specified amount of bytes.
+# When the memory limit is reached Redis will try to remove keys
+# accordingly to the eviction policy selected (see maxmemmory-policy).
+#
+# If Redis can't remove keys according to the policy, or if the policy is
+# set to 'noeviction', Redis will start to reply with errors to commands
+# that would use more memory, like SET, LPUSH, and so on, and will continue
+# to reply to read-only commands like GET.
+#
+# This option is usually useful when using Redis as an LRU cache, or to set
+# an hard memory limit for an instance (using the 'noeviction' policy).
+#
+# WARNING: If you have slaves attached to an instance with maxmemory on,
+# the size of the output buffers needed to feed the slaves are subtracted
+# from the used memory count, so that network problems / resyncs will
+# not trigger a loop where keys are evicted, and in turn the output
+# buffer of slaves is full with DELs of keys evicted triggering the deletion
+# of more keys, and so forth until the database is completely emptied.
+#
+# In short... if you have slaves attached it is suggested that you set a lower
+# limit for maxmemory so that there is some free RAM on the system for slave
+# output buffers (but this is not needed if the policy is 'noeviction').
+#
+# maxmemory <bytes>
+
+# MAXMEMORY POLICY: how Redis will select what to remove when maxmemory
+# is reached? You can select among five behavior:
+# 
+# volatile-lru -> remove the key with an expire set using an LRU algorithm
+# allkeys-lru -> remove any key accordingly to the LRU algorithm
+# volatile-random -> remove a random key with an expire set
+# allkeys-random -> remove a random key, any key
+# volatile-ttl -> remove the key with the nearest expire time (minor TTL)
+# noeviction -> don't expire at all, just return an error on write operations
+# 
+# Note: with all the kind of policies, Redis will return an error on write
+#       operations, when there are not suitable keys for eviction.
+#
+#       At the date of writing this commands are: set setnx setex append
+#       incr decr rpush lpush rpushx lpushx linsert lset rpoplpush sadd
+#       sinter sinterstore sunion sunionstore sdiff sdiffstore zadd zincrby
+#       zunionstore zinterstore hset hsetnx hmset hincrby incrby decrby
+#       getset mset msetnx exec sort
+#
+# The default is:
+#
+# maxmemory-policy volatile-lru
+
+# LRU and minimal TTL algorithms are not precise algorithms but approximated
+# algorithms (in order to save memory), so you can select as well the sample
+# size to check. For instance for default Redis will check three keys and
+# pick the one that was used less recently, you can change the sample size
+# using the following configuration directive.
+#
+# maxmemory-samples 3
+
+############################## APPEND ONLY MODE ###############################
+
+# By default Redis asynchronously dumps the dataset on disk. This mode is
+# good enough in many applications, but an issue with the Redis process or
+# a power outage may result into a few minutes of writes lost (depending on
+# the configured save points).
+#
+# The Append Only File is an alternative persistence mode that provides
+# much better durability. For instance using the default data fsync policy
+# (see later in the config file) Redis can lose just one second of writes in a
+# dramatic event like a server power outage, or a single write if something
+# wrong with the Redis process itself happens, but the operating system is
+# still running correctly.
+#
+# AOF and RDB persistence can be enabled at the same time without problems.
+# If the AOF is enabled on startup Redis will load the AOF, that is the file
+# with the better durability guarantees.
+#
+# Please check http://redis.io/topics/persistence for more information.
+
+#
+# OE: changed default to enable this
+appendonly yes
+
+# The name of the append only file (default: "appendonly.aof")
+# appendfilename appendonly.aof
+
+# The fsync() call tells the Operating System to actually write data on disk
+# instead to wait for more data in the output buffer. Some OS will really flush 
+# data on disk, some other OS will just try to do it ASAP.
+#
+# Redis supports three different modes:
+#
+# no: don't fsync, just let the OS flush the data when it wants. Faster.
+# always: fsync after every write to the append only log . Slow, Safest.
+# everysec: fsync only one time every second. Compromise.
+#
+# The default is "everysec" that's usually the right compromise between
+# speed and data safety. It's up to you to understand if you can relax this to
+# "no" that will let the operating system flush the output buffer when
+# it wants, for better performances (but if you can live with the idea of
+# some data loss consider the default persistence mode that's snapshotting),
+# or on the contrary, use "always" that's very slow but a bit safer than
+# everysec.
+#
+# More details please check the following article:
+# http://antirez.com/post/redis-persistence-demystified.html
+#
+# If unsure, use "everysec".
+
+# appendfsync always
+appendfsync everysec
+# appendfsync no
+
+# When the AOF fsync policy is set to always or everysec, and a background
+# saving process (a background save or AOF log background rewriting) is
+# performing a lot of I/O against the disk, in some Linux configurations
+# Redis may block too long on the fsync() call. Note that there is no fix for
+# this currently, as even performing fsync in a different thread will block
+# our synchronous write(2) call.
+#
+# In order to mitigate this problem it's possible to use the following option
+# that will prevent fsync() from being called in the main process while a
+# BGSAVE or BGREWRITEAOF is in progress.
+#
+# This means that while another child is saving the durability of Redis is
+# the same as "appendfsync none", that in practical terms means that it is
+# possible to lost up to 30 seconds of log in the worst scenario (with the
+# default Linux settings).
+# 
+# If you have latency problems turn this to "yes". Otherwise leave it as
+# "no" that is the safest pick from the point of view of durability.
+no-appendfsync-on-rewrite no
+
+# Automatic rewrite of the append only file.
+# Redis is able to automatically rewrite the log file implicitly calling
+# BGREWRITEAOF when the AOF log size will growth by the specified percentage.
+# 
+# This is how it works: Redis remembers the size of the AOF file after the
+# latest rewrite (or if no rewrite happened since the restart, the size of
+# the AOF at startup is used).
+#
+# This base size is compared to the current size. If the current size is
+# bigger than the specified percentage, the rewrite is triggered. Also
+# you need to specify a minimal size for the AOF file to be rewritten, this
+# is useful to avoid rewriting the AOF file even if the percentage increase
+# is reached but it is still pretty small.
+#
+# Specify a percentage of zero in order to disable the automatic AOF
+# rewrite feature.
+
+auto-aof-rewrite-percentage 100
+auto-aof-rewrite-min-size 64mb
+
+################################ LUA SCRIPTING  ###############################
+
+# Max execution time of a Lua script in milliseconds.
+#
+# If the maximum execution time is reached Redis will log that a script is
+# still in execution after the maximum allowed time and will start to
+# reply to queries with an error.
+#
+# When a long running script exceed the maximum execution time only the
+# SCRIPT KILL and SHUTDOWN NOSAVE commands are available. The first can be
+# used to stop a script that did not yet called write commands. The second
+# is the only way to shut down the server in the case a write commands was
+# already issue by the script but the user don't want to wait for the natural
+# termination of the script.
+#
+# Set it to 0 or a negative value for unlimited execution without warnings.
+lua-time-limit 5000
+
+################################## SLOW LOG ###################################
+
+# The Redis Slow Log is a system to log queries that exceeded a specified
+# execution time. The execution time does not include the I/O operations
+# like talking with the client, sending the reply and so forth,
+# but just the time needed to actually execute the command (this is the only
+# stage of command execution where the thread is blocked and can not serve
+# other requests in the meantime).
+# 
+# You can configure the slow log with two parameters: one tells Redis
+# what is the execution time, in microseconds, to exceed in order for the
+# command to get logged, and the other parameter is the length of the
+# slow log. When a new command is logged the oldest one is removed from the
+# queue of logged commands.
+
+# The following time is expressed in microseconds, so 1000000 is equivalent
+# to one second. Note that a negative number disables the slow log, while
+# a value of zero forces the logging of every command.
+slowlog-log-slower-than 10000
+
+# There is no limit to this length. Just be aware that it will consume memory.
+# You can reclaim memory used by the slow log with SLOWLOG RESET.
+slowlog-max-len 128
+
+############################### ADVANCED CONFIG ###############################
+
+# Hashes are encoded using a memory efficient data structure when they have a
+# small number of entries, and the biggest entry does not exceed a given
+# threshold. These thresholds can be configured using the following directives.
+hash-max-ziplist-entries 512
+hash-max-ziplist-value 64
+
+# Similarly to hashes, small lists are also encoded in a special way in order
+# to save a lot of space. The special representation is only used when
+# you are under the following limits:
+list-max-ziplist-entries 512
+list-max-ziplist-value 64
+
+# Sets have a special encoding in just one case: when a set is composed
+# of just strings that happens to be integers in radix 10 in the range
+# of 64 bit signed integers.
+# The following configuration setting sets the limit in the size of the
+# set in order to use this special memory saving encoding.
+set-max-intset-entries 512
+
+# Similarly to hashes and lists, sorted sets are also specially encoded in
+# order to save a lot of space. This encoding is only used when the length and
+# elements of a sorted set are below the following limits:
+zset-max-ziplist-entries 128
+zset-max-ziplist-value 64
+
+# Active rehashing uses 1 millisecond every 100 milliseconds of CPU time in
+# order to help rehashing the main Redis hash table (the one mapping top-level
+# keys to values). The hash table implementation Redis uses (see dict.c)
+# performs a lazy rehashing: the more operation you run into an hash table
+# that is rehashing, the more rehashing "steps" are performed, so if the
+# server is idle the rehashing is never complete and some more memory is used
+# by the hash table.
+# 
+# The default is to use this millisecond 10 times every second in order to
+# active rehashing the main dictionaries, freeing memory when possible.
+#
+# If unsure:
+# use "activerehashing no" if you have hard latency requirements and it is
+# not a good thing in your environment that Redis can reply form time to time
+# to queries with 2 milliseconds delay.
+#
+# use "activerehashing yes" if you don't have such hard requirements but
+# want to free memory asap when possible.
+activerehashing yes
+
+# The client output buffer limits can be used to force disconnection of clients
+# that are not reading data from the server fast enough for some reason (a
+# common reason is that a Pub/Sub client can't consume messages as fast as the
+# publisher can produce them).
+#
+# The limit can be set differently for the three different classes of clients:
+#
+# normal -> normal clients
+# slave  -> slave clients and MONITOR clients
+# pubsub -> clients subcribed to at least one pubsub channel or pattern
+#
+# The syntax of every client-output-buffer-limit directive is the following:
+#
+# client-output-buffer-limit <class> <hard limit> <soft limit> <soft seconds>
+#
+# A client is immediately disconnected once the hard limit is reached, or if
+# the soft limit is reached and remains reached for the specified number of
+# seconds (continuously).
+# So for instance if the hard limit is 32 megabytes and the soft limit is
+# 16 megabytes / 10 seconds, the client will get disconnected immediately
+# if the size of the output buffers reach 32 megabytes, but will also get
+# disconnected if the client reaches 16 megabytes and continuously overcomes
+# the limit for 10 seconds.
+#
+# By default normal clients are not limited because they don't receive data
+# without asking (in a push way), but just after a request, so only
+# asynchronous clients may create a scenario where data is requested faster
+# than it can read.
+#
+# Instead there is a default limit for pubsub and slave clients, since
+# subscribers and slaves receive data in a push fashion.
+#
+# Both the hard or the soft limit can be disabled just setting it to zero.
+client-output-buffer-limit normal 0 0 0
+client-output-buffer-limit slave 256mb 64mb 60
+client-output-buffer-limit pubsub 32mb 8mb 60
+
+################################## INCLUDES ###################################
+
+# Include one or more other config files here.  This is useful if you
+# have a standard template that goes to all Redis server but also need
+# to customize a few per-server settings.  Include files can include
+# other files, so use this wisely.
+#
+# include /path/to/local.conf
+# include /path/to/other.conf
diff --git a/meta-oe/recipes-extended/redis/redis_2.6.9.bb b/meta-oe/recipes-extended/redis/redis_2.6.9.bb
new file mode 100644
index 0000000..f6818ee
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis_2.6.9.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Redis key-value store"
+DESCRIPTION = "Redis is an open source, advanced key-value store."
+HOMEPAGE = "http://redis.io"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM="file://COPYING;md5=673e0ac66aac758f8f2140c6fc7947d2"
+
+SRC_URI = "http://redis.googlecode.com/files/redis-${PV}.tar.gz \
+           file://hiredis-use-default-CC-if-it-is-set.patch \
+           file://lua-update-Makefile-to-use-environment-build-setting.patch \
+           file://oe-use-libc-malloc.patch \
+           file://redis.conf \
+           file://init-redis-server \
+          "
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "redis-server"
+INITSCRIPT_PARAMS = "defaults 87"
+
+SRC_URI[md5sum] = "5093fb7c5f763e828c857daf260665bc"
+SRC_URI[sha256sum] = "4d967eff2038aebea33875d17e85ed67179df6505df68529a622f7836d1c7489"
+
+do_install() {
+    export PREFIX=${D}/${prefix}
+    oe_runmake install
+
+    install -d ${D}/${sysconfdir}/redis
+    install -m 0755 ${WORKDIR}/redis.conf ${D}/${sysconfdir}/redis/redis.conf
+
+    install -d ${D}/${sysconfdir}/init.d 
+    install -m 0755 ${WORKDIR}/init-redis-server ${D}/${sysconfdir}/init.d/redis-server
+
+    install -d ${D}/var/lib/redis/
+}
+
-- 
1.8.1.2



