Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 09C59605C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 15:03:03 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f6so6126807ioh.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2018 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VmAqkpwqY9OZdHDBBhT/E3quSfBc1lDb9JhJOyz9Ahc=;
	b=YlpV3O/KI9b3b0oIclE8Phygvy2BBvz3Y8K7s48mIEc4MkTIFkNo5aUjwbFK94cAPl
	33dM3RghxkhtCmDNL3tZUwj/Y3hOMidwfLbIGvubWMs44kkmywZ8kV09S6gYT1iBhT7N
	Uj+LoBWhnaEnCalQd/o+nbkz/gcYh2W1qVlLX9E/Q0cvJ8kgYhbVl6V9a/nh92w1Oaf5
	w3mWXVeFohxwre0JSixp2s7LWED7VniDXlSBZlqTBap6xGq7cK4Flf3lRaxlyaOY0A7k
	nJ+L+7drZZuvdi5ZOIxT1Y72TeIG4dTSeJkD81N1IPHjE4EPQkKuqeU0Vcs22ABE+gTL
	ZPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VmAqkpwqY9OZdHDBBhT/E3quSfBc1lDb9JhJOyz9Ahc=;
	b=Cx4cupphwFdD/Uu72VKDdyCJF6oktnyEvYwqpNnPCqWNJlbbo4tb0UghUvIEoCp/YP
	kXJ27fuh1NSMugtfYh1eX95+8dD4Cphf1uqaYIlBr6JM9A7nk61LKYfo0dAyPvIW8Di0
	c9h6JO89EBWWE6w6oxlU9Fqjl7zTgFWfhol4KoLLD3IG98+tRKCqDcpphpL4a9HfCP9l
	j5CMc/k2riplmox1KoryV3KI7TZLXoMefWmjbou/6NfApeRJ+539daMtP41kyzt2vwqT
	XzJq53BCkPJ5BP7avIIAO8Vt2oT5t3iUPVRZXKdfFy1XVFGI1apWjuyB204yQtN92kYR
	1u7g==
X-Gm-Message-State: AKwxytdeNTjH3OkfGx5etfckLwD33kM++DG2I30RxAptusrlqzZAWnhZ
	OAXFurwYQz2OEKSZqdnZsH3C8V2g
X-Google-Smtp-Source: ACJfBot3NP9VSi6n7QWNx4jJFH121O7hRXxTFgHxR7if0WweGEuZKzo4KTWKf+x6pD53Emn/98lwxQ==
X-Received: by 10.107.189.7 with SMTP id n7mr25695069iof.93.1515769384145;
	Fri, 12 Jan 2018 07:03:04 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	97sm2486402ioh.31.2018.01.12.07.03.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Jan 2018 07:03:03 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Joe MacDonald <joe_macdonald@mentor.com>
Date: Fri, 12 Jan 2018 09:02:56 -0600
Message-Id: <20180112150256.24391-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-networking][PATCH] ebtables: Remove bashisms
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
X-List-Received-Date: Fri, 12 Jan 2018 15:03:04 -0000

Removes the bashism of prefacing shell functions with "function" and
renames the clear function to not conflict with the command of the same
name.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../ebtables/ebtables-2.0.10-4/ebtables.common               | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
index 640025dba..1ae18fed3 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
+++ b/meta-networking/recipes-filter/ebtables/ebtables-2.0.10-4/ebtables.common
@@ -20,7 +20,7 @@ EBTABLES_BACKUP_SUFFIX="~"
 config=/etc/default/$prog
 [ -f "$config" ] && . "$config"
 
-function get_supported_tables() {
+get_supported_tables() {
 	EBTABLES_SUPPORTED_TABLES=
 	/sbin/ebtables -t filter -L 2>&1 1>/dev/null | grep -q permission
 	if [ $? -eq 0 ]; then
@@ -35,7 +35,7 @@ function get_supported_tables() {
 	done
 }
 
-function load() {
+load() {
 	RETVAL=0
 	get_supported_tables
 	echo -n "Restoring ebtables rulesets: "
@@ -64,7 +64,7 @@ function load() {
 	fi
 }
 
-function clear() {
+clear_rules() {
 	RETVAL=0
 	get_supported_tables
 	echo -n "Clearing ebtables rulesets: "
@@ -90,7 +90,7 @@ function clear() {
 	fi
 }
 
-function save() {
+save() {
 	RETVAL=0
 	get_supported_tables
 	echo -n "Saving ebtables rulesets: "
@@ -127,11 +127,11 @@ case "$1" in
 	;;
   stop)
 	[ "$EBTABLES_SAVE_ON_STOP" = "yes" ] && save
-	clear
+	clear_rules
 	;;
   restart|reload|force-reload)
 	[ "$EBTABLES_SAVE_ON_RESTART" = "yes" ] && save
-	clear
+	clear_rules
 	[ "$EBTABLES_LOAD_ON_START" = "yes" ] && load
 	;;
   load)
-- 
2.14.3


