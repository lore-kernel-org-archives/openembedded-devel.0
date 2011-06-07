Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QTmYj-0005EG-6O
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 05:02:25 +0200
Received: from MBX20.4emm.local ([fe80::5895:fdc9:8838:234]) by
	HUB23.4emm.local ([::1]) with mapi; Mon, 6 Jun 2011 22:58:03 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] Modified populate-volatile.sh to atomically update
	volatile.cache,
	to avoid power loss issues. Signed-off-by: jameslimbouris
	<james@digitalmatter.com.au>
Thread-Index: AcwkvlSGygjhJTaOQounm4FwOVlgFg==
Date: Tue, 7 Jun 2011 02:58:47 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF02E499@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: James Limbouris <james@digitalmatter.com.au>
Subject: [PATCH] Modified populate-volatile.sh to atomically update volatile.cache, to avoid power loss issues. Signed-off-by: jameslimbouris <james@digitalmatter.com.au>
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
X-List-Received-Date: Tue, 07 Jun 2011 03:02:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

---
 .../initscripts-1.0/populate-volatile.sh           |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/initscripts/initscripts-1.0/populate-volatile.sh b/rec=
ipes/initscripts/initscripts-1.0/populate-volatile.sh
index 3bb3d94..e355680 100755
--- a/recipes/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/recipes/initscripts/initscripts-1.0/populate-volatile.sh
@@ -14,7 +14,7 @@ create_file() {
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for =
-$1-.\" >/dev/tty0 2>&1;=20
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/d=
ev/tty0 2>&1 "=20
=20
-	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.ca=
che
+	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.ca=
che.build
=20
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" !=3D "no" ] && echo "Target already exists. Skipping."
@@ -29,7 +29,7 @@ mk_dir() {
 	chown ${TUSER}.${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for =
-$1-.\" >/dev/tty0 2>&1;=20
 	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/d=
ev/tty0 2>&1 "
=20
-	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.ca=
che
+	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "$EXEC" >> /etc/volatile.ca=
che.build
 =09
 	[ -e "$1" ] && {
 	  [ "${VERBOSE}" !=3D "no" ] && echo "Target already exists. Skipping."
@@ -41,7 +41,7 @@ mk_dir() {
 link_file() {
 	EXEC=3D"test -e \"$2\" -o -L $2 || ln -s \"$1\" \"$2\" >/dev/tty0 2>&1"=20
=20
-	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "	$EXEC" >> /etc/volatile.c=
ache
+	test "$VOLATILE_ENABLE_CACHE" =3D yes && echo "	$EXEC" >> /etc/volatile.c=
ache.build
 =09
 	[ -e "$2" ] && {
 	  echo "Cannot create link over existing -${TNAME}-." >&2
@@ -164,8 +164,10 @@ if test -e /etc/volatile.cache -a "$VOLATILE_ENABLE_CA=
CHE" =3D "yes" -a "x$1" !=3D "
 then
 	sh /etc/volatile.cache
 else=09
-	rm -f /etc/volatile.cache
+	rm -f /etc/volatile.cache /etc/volatile.cache.build
 	for file in `ls -1 "${CFGDIR}" | sort`; do
 		apply_cfgfile "${CFGDIR}/${file}"
 	done
+=09
+	[ -e /etc/volatile.cache.build ] && sync && mv /etc/volatile.cache.build =
/etc/volatile.cache
 fi
--=20
1.7.3.4



