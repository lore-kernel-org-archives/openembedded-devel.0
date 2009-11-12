Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8eY1-0002UD-1o
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 19:37:36 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8eWh-0004Kv-KE
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 18:36:12 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1257971641.25369.426.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
	<1257971641.25369.426.camel@lenovo.internal.reciva.com>
Date: Thu, 12 Nov 2009 18:36:02 +0000
Message-ID: <1258050962.25369.454.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Thu, 12 Nov 2009 18:37:36 -0000
X-Groupsio-MsgNum: 14230
Content-Type: multipart/mixed; boundary="=-WO+usx6MvcFxMqP+Axo0"

--=-WO+usx6MvcFxMqP+Axo0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 20:34 +0000, Phil Blundell wrote:
> That should still work fine.  The purpose of the "name=bar" thing is to
> decouple the checksum from the exact URI in use.  So, you can write:
> 
> SRC_URI = "${MIRROR}/somedir/${PN}-${PV}.tar.gz;name=mytarball \
>            ${OTHERMIRROR}/${PN}-${PV}-extra-files.tar.gz;name=extrafiles"
> 
> and then, in another file if you prefer, add:
> 
> SRC_URI[md5sum:mytarball] = "d3b07384d113edec49eaa6238ad5ff00"
> SRC_URI[md5sum:extrafiles] = "c157a79031e1c40f85931829bc5fc552"

It turns out that colons in flag names aren't actually accepted by the
parser, but something similar with dots is OK.  So, here's a patch to
make it work.  The modified notation is actually:

SRC_URI[mytarball.md5sum] = "d3b07384d113edec49eaa6238ad5ff00"

and likewise for sha256sum.

p.



--=-WO+usx6MvcFxMqP+Axo0
Content-Disposition: attachment; filename="base.patch"
Content-Type: text/x-patch; name="base.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 9d063f2..9508754 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -56,6 +56,50 @@ def base_chk_load_parser(config_paths):
 
     return parser
 
+def base_chk_file_vars(parser, localpath, params, data):
+    try:
+        name = params["name"]
+    except KeyError:
+        return False
+    flagName = "%s.md5sum" % name
+    want_md5sum = bb.data.getVarFlag("SRC_URI", flagName, data)
+    flagName = "%s.sha256sum" % name
+    want_sha256sum = bb.data.getVarFlag("SRC_URI", flagName, data)
+
+    if (want_sha256sum == None and want_md5sum == None):
+        # no checksums to check, nothing to do
+        return False
+
+    if not os.path.exists(localpath):
+        localpath = base_path_out(localpath, data)
+        bb.note("The localpath does not exist '%s'" % localpath)
+        raise Exception("The path does not exist '%s'" % localpath)
+
+    if want_md5sum:
+        try:
+	    md5pipe = os.popen('PATH=%s md5sum %s' % (bb.data.getVar('PATH', data, True), localpath))
+            md5data = (md5pipe.readline().split() or [ "" ])[0]
+            md5pipe.close()
+        except OSError, e:
+            raise Exception("Executing md5sum failed")
+        if want_md5sum != md5data:
+            bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%s'" % (want_md5sum, md5data))
+            raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" % (want_md5sum, md5data))
+
+    if want_sha256sum:
+        try:
+            shapipe = os.popen('PATH=%s oe_sha256sum %s' % (bb.data.getVar('PATH', data, True), localpath))
+            shadata = (shapipe.readline().split() or [ "" ])[0]
+            shapipe.close()
+        except OSError, e:
+            raise Exception("Executing shasum failed")
+        if want_sha256sum != sha256data:
+            bb.note("The SHA256Sums did not match. Wanted: '%s' and Got: '%s'" % (want_sha256sum, sha256data))
+            raise Exception("SHA256 Sums do not match. Wanted: '%s' Got: '%s'" % (want_sha256sum, sha256data))
+
+    return True
+
+
 def base_chk_file(parser, pn, pv, src_uri, localpath, data):
     no_checksum = False
     # Try PN-PV-SRC_URI first and then try PN-SRC_URI
@@ -639,11 +683,11 @@ python base_do_fetch() {
 	# Check each URI
 	for url in src_uri.split():
 		localpath = bb.data.expand(bb.fetch.localpath(url, localdata), localdata)
-		(type,host,path,_,_,_) = bb.decodeurl(url)
+		(type,host,path,_,_,params) = bb.decodeurl(url)
 		uri = "%s://%s%s" % (type,host,path)
 		try:
 			if type == "http" or type == "https" or type == "ftp" or type == "ftps":
-				if not base_chk_file(parser, pn, pv,uri, localpath, d):
+				if not (base_chk_file_vars(parser, localpath, params, d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
 					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS",d, True):
 						bb.fatal("%s-%s: %s has no entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
 					else:

--=-WO+usx6MvcFxMqP+Axo0--
