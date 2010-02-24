Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NkKpw-000501-Pj
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 18:15:58 +0100
Received: by bwz5 with SMTP id 5so3549208bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 09:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kRSwufqy3Q2BKk4Mwwc4mIugxtmdMfdleT4DySw0O7c=;
	b=wYVBcM2zTISnKvq9Y4TczAoJTxyOuAOeGyRzJCy5ogWl4oqfpNKv2diifIbfWH0Kkz
	Per2/1fO81NLYog94sLidA3FQ1fYA2yLbRP4KI7sZcCynLfUtvBJs+tuSamYlbLbvCgx
	zagOCAn3InUlCpry5f2o3uNng3/Pfo1GUIIao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Z2aP3F2O8RylEenI04Hi9kGRdcYVSe/W4wbxfd9DF5/Oy3Dk5ossw5nMelIxpKnDI3
	iYqb+ofJK3gP5p+OFUP9RrM75ayi1k9LyusRdEtSj35Sx6jCFM6hIj7++HL81v2fk5mY
	cbm/doEfbaC9uYqMvRnKu7X3iYhcom/sdL/BE=
Received: by 10.204.156.22 with SMTP id u22mr67168bkw.24.1267031583014;
	Wed, 24 Feb 2010 09:13:03 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 14sm2812929bwz.14.2010.02.24.09.13.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Feb 2010 09:13:01 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NkKsa-0005en-1P; Wed, 24 Feb 2010 18:18:32 +0100
Date: Wed, 24 Feb 2010 18:18:32 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100224171832.GA20737@mx.loc>
References: <1266766352-28786-1-git-send-email-rep.dot.nop@gmail.com>
	<20100222162424.GA27420@denix.org>
	<1266857709.14566.348.camel@mill.internal.reciva.com>
	<b6ebd0a51002220906p53b3b3b2h5257ebca50d6227c@mail.gmail.com>
	<20100222181754.GB24049@jama> <20100222194159.GZ30265@mx.loc>
	<20100222214335.GB30265@mx.loc> <20100222220621.GB27420@denix.org>
	<20100222224543.GD30265@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100222224543.GD30265@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] git: add SRC_URI name
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
X-List-Received-Date: Wed, 24 Feb 2010 17:15:59 -0000
X-Groupsio-MsgNum: 17039
Content-Type: multipart/mixed; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 22, 2010 at 11:45:43PM +0100, Bernhard Reutner-Fischer wrote:
>On Mon, Feb 22, 2010 at 05:06:21PM -0500, Denys Dmytriyenko wrote:
>
>>> Not using "archive" as Martin likes as default, but uri%d, but
>>
>>For multiple SRC_URIs, using uri1/uri2 can be more confusing and may be not 
>>much better than looking up real names in .inc file...
>
>ok, so let's drop that superfluous .note and the url%d handling.
>Other opinions?

I'm using this now, fwiw.

cheers,

--RnlQjJ0d97Da+TV1
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="default-sum_for_first_uri.01.patch"

diff --git a/classes/base.bbclass b/classes/base.bbclass
index c8ee722..0b0a2d8 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -61,10 +61,14 @@ def base_chk_file_vars(parser, localpath, params, data):
         name = params["name"]
     except KeyError:
         return False
-    flagName = "%s.md5sum" % name
-    want_md5sum = bb.data.getVarFlag("SRC_URI", flagName, data)
-    flagName = "%s.sha256sum" % name
-    want_sha256sum = bb.data.getVarFlag("SRC_URI", flagName, data)
+    if name:
+        md5flag = "%s.md5sum" % name
+        sha256flag = "%s.sha256sum" % name
+    else:
+        md5flag = "md5sum"
+        sha256flag = "sha256sum"
+    want_md5sum = bb.data.getVarFlag("SRC_URI", md5flag, data)
+    want_sha256sum = bb.data.getVarFlag("SRC_URI", sha256flag, data)
 
     if (want_sha256sum == None and want_md5sum == None):
         # no checksums to check, nothing to do
@@ -702,12 +706,18 @@ python base_do_fetch() {
 	pn = bb.data.getVar('PN', d, True)
 
 	# Check each URI
+	first_uri = True
 	for url in src_uri.split():
 		localpath = bb.data.expand(bb.fetch.localpath(url, localdata), localdata)
 		(type,host,path,_,_,params) = bb.decodeurl(url)
 		uri = "%s://%s%s" % (type,host,path)
 		try:
 			if type in [ "http", "https", "ftp", "ftps" ]:
+				# We provide a default shortcut of plain [] for the first fetch uri
+				# Explicit names in any uri overrides this default.
+				if not "name" in params and first_uri:
+					first_uri = False
+					params["name"] = ""
 				if not (base_chk_file_vars(parser, localpath, params, d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
 					if not bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):
 						bb.fatal("%s-%s: %s has no checksum defined, cannot check archive integrity" % (pn,pv,uri))
diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
index a35e1ee..7b51b56 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -29,7 +29,12 @@
   be used in preference to retrieving a new version . Any source that is
   retrieved from a remote URI will be stored in the download source directory
   and an appropriate md5 sum generated and stored alongside it.</para>
-
+  <para>Checksums for http/https/ftp/ftps uris are stored in each recipe in
+  the form of<screen>SRC_URI[md5sum] = &quot;9a7a11ffd52d9c4553ea8c0134a6fa86&quot;
+SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31701921b9434&quot;</screen>
+  for the first remote SRC_URI that has <emphasis>no</emphasis> explicit <command>name=foo</command>
+  associated with it. Following <emphasis>unnamed</emphasis> SRC_URIs without
+  a checksum will throw errors.</para>
   <para>Each URI supports a set of additional options. These options are
   tag/value pairs of the form <command>"a=b"</command> and are semi-colon
   separated from each other and from the URI. The follow examples shows two

--RnlQjJ0d97Da+TV1--
