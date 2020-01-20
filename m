Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jan 2020 20:35:00 UTC
Received: from us-smtp-delivery-164.mimecast.com
	(us-smtp-delivery-164.mimecast.com [63.128.21.164])
	by mail.openembedded.org (Postfix) with ESMTP id AD8237FC46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 20:35:00 +0000 (UTC)
Received: from webmail.essvote.com (40.142.57.162 [40.142.57.162]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-10--EqKzWJ7N_6r6tLOjxrCTA-1; Mon, 20 Jan 2020 15:28:32 -0500
Received: from ESS-EX02.essvote.corp.local (172.16.130.13) by
	ESS-EX02.essvote.corp.local (172.16.130.13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1591.10; Mon, 20 Jan 2020 14:28:31 -0600
Received: from ESS-EX02.essvote.corp.local ([fe80::4d14:423b:3668:f6f5]) by
	ESS-EX02.essvote.corp.local ([fe80::4d14:423b:3668:f6f5%3]) with mapi
	id 15.01.1591.017; Mon, 20 Jan 2020 14:28:31 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java][PATCH] java.bbclass: oe_makeclasspath does nothing
	without -s
Thread-Index: AQHVz9AukMCTCyPrQkOJNNJbuWGq+A==
Date: Mon, 20 Jan 2020 20:28:31 +0000
Message-ID: <20200120202815.58841-1-michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.24.1
x-originating-ip: [192.168.98.55]
MIME-Version: 1.0
X-MC-Unique: -EqKzWJ7N_6r6tLOjxrCTA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: essvote.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java][PATCH] java.bbclass: oe_makeclasspath does nothing without -s
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
X-List-Received-Date: Mon, 20 Jan 2020 20:35:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

oe_makeclasspath is supposed to output for the target platform by default a=
nd the staging platform with -s.
However it checks if the file exists even if -s is not defined which is alw=
ays false.
Additionaly remove comment around an error that never occurs.

Signed-off-by: Michael Davis <michael.davis@essvote.com>
---
 classes/java.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index fc97295..7b9677a 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -80,8 +80,6 @@ oe_makeclasspath() {
   # in variable "bootcp".
   #=20
   # Provide the -s at the beginning otherwise strange things happen.
-  # If -s is given the function checks whether the requested jar file exis=
ts
-  # and exits with an error message if it cannot be found.
   #
   # Note: In order to encourage usage of the DEPENDS variable, the functio=
n
   # can accept recipe names. If a recipe has no corresponding Jar file it
@@ -91,6 +89,7 @@ oe_makeclasspath() {
   classpath=3D
   delimiter=3D
   retval=3D$1
+  staging=3Dfalse
=20
   shift
=20
@@ -106,6 +105,7 @@ oe_makeclasspath() {
                   dir=3D${STAGING_DATADIR_JAVA}
                   ;;
               esac
+              staging=3Dtrue
               ;;
           -*)
               bbfatal "oe_makeclasspath: unknown option: $1"
@@ -113,9 +113,9 @@ oe_makeclasspath() {
           *)
               file=3D$dir/$1.jar
=20
-              if [ -e $file ]; then
-                  classpath=3D$classpath$delimiter$file
-                  delimiter=3D":"
+              if [ $staging =3D=3D false ] || [ -e $file ]; then
+                classpath=3D$classpath$delimiter$file
+                delimiter=3D":"
               fi
=20
           ;;
--=20
2.24.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast Ltd, an innovator in Software as a Service (=
SaaS) for business. Providing a safer and more useful place for your human =
generated data. Specializing in; Security, archiving and compliance. To fin=
d out more visit the Mimecast website.

