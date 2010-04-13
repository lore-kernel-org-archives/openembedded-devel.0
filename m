Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O1gJC-0000QQ-0v
	for Openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 15:37:44 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 61603EB9C6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 09:34:16 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 13 Apr 2010 09:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=a0m7NPul0qxUGD2lpVhcv0Q5ZRI=;
	b=c6/BM6z7gBNrwthF78PAFueDwSFb+ES3UPDaSZwV3K1uaeyzxd+U6+v54p2WMoQFlpXccUexhue1PsFmZBJUsOzcS16GScPSLVNMIJxIkjYyY27CwOhCAAR4c+n0SJRVdCFRJnznPe+DLFSI0mUpHTT4eVDBeioYUMXzKEersjQ=
X-Sasl-enc: tdYWOYsziNHCInx0WVf9L0OJHPX4sCAKCD2mnGepye3M 1271165655
Received: from [192.168.1.34] (hnvr-4d07af8a.pool.mediaWays.net [77.7.175.138])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 9B8CB4D625B
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 09:34:15 -0400 (EDT)
Date: Tue, 13 Apr 2010 15:35:27 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH] base.bbclass: add support for checksums in .bb files
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
X-List-Received-Date: Tue, 13 Apr 2010 13:37:44 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

From: Phil Blundell <philb@gnu.org>

Ported from .dev branch to allow easy sharing of recipes between
.dev and stable branches.

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
  classes/base.bbclass |   56 ++++++++++++++++++++++++++++++++++++++++++++-----
  1 files changed, 50 insertions(+), 6 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 69d1979..459fbe9 100644
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
+            sha256data = (shapipe.readline().split() or [ "" ])[0]
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
      import os, bb
      no_checksum = False
@@ -652,15 +696,15 @@ python base_do_fetch() {
  	# Check each URI
  	for url in src_uri.split():
  		localpath = bb.data.expand(bb.fetch.localpath(url, localdata), localdata)
-		(type,host,path,_,_,_) = bb.decodeurl(url)
+		(type,host,path,_,_,params) = bb.decodeurl(url)
  		uri = "%s://%s%s" % (type,host,path)
  		try:
-			if type == "http" or type == "https" or type == "ftp" or type == "ftps":
-				if not base_chk_file(parser, pn, pv,uri, localpath, d):
-					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS",d, True):
-						bb.fatal("%s-%s: %s has no entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
+			if type in [ "http", "https", "ftp", "ftps" ]:
+				if not (base_chk_file_vars(parser, localpath, params, d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
+					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):
+						bb.fatal("%s-%s: %s has no checksum defined, cannot check archive integrity" % (pn,pv,uri))
  					else:
-						bb.note("%s-%s: %s has no entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
+						bb.note("%s-%s: %s has no checksum defined, archive integrity not checked" % (pn,pv,uri))
  		except Exception:
  			raise bb.build.FuncFailed("Checksum of '%s' failed" % uri)
  }
-- 
1.6.4.4


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


