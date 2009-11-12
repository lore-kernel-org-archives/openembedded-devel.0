Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1N8fI8-0004dA-GH
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 20:25:15 +0100
Received: by fxm1 with SMTP id 1so2457723fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RRMA0n37N7PsZ1wEzSftPV37aub8GRzWqdXGAPoP9LI=;
	b=UOwOGLvpUCHZX/NFgEDAg4h8L/OAsSBc2ztctO+zPdPXFdxzh+d+b9UlQjwXZ209c0
	HCBvifXPU0syg8xrfdYsfluY9dP4Oi0eDzPynGzO+x8BdLZ7aAMTsaK2aaoY/ImL/jqr
	DhiBavAb2p39+h3mm5RJMQnTYpp2/jFKFWZyk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=B1dTL40lCg+bt49hdfaSsW8zbn9dGp6PNjajK9scEuB7HUmFOs0OA/6s67gwAuxl6j
	LdpLk5IxqfCF/PFler2pQP3DNilK2qdviW0qcZ2oluBnXeHMBqouzfFw2y+DPQQWrSNR
	RkU8E7USql0l+doIuK+lV2+IfyaGgTuhbd/Ec=
Received: by 10.204.48.131 with SMTP id r3mr2340517bkf.195.1258053395545;
	Thu, 12 Nov 2009 11:16:35 -0800 (PST)
Received: from s42.loc (85-127-251-67.dynamic.xdsl-line.inode.at
	[85.127.251.67])
	by mx.google.com with ESMTPS id 16sm962822bwz.11.2009.11.12.11.16.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 12 Nov 2009 11:16:34 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1N8fBJ-0008H6-Rm; Thu, 12 Nov 2009 20:18:09 +0100
Date: Thu, 12 Nov 2009 20:18:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091112191809.GG9787@mx.loc>
References: <200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257949048.29038.388.camel@dax.rpnet.com>
	<1257954353.25369.304.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110801q308a2d80g916a0271757fedd5@mail.gmail.com>
	<1257955603.25369.325.camel@lenovo.internal.reciva.com>
	<ac9c93b10911110937u4607a2c8w9e63c9df738d8fe8@mail.gmail.com>
	<1257971641.25369.426.camel@lenovo.internal.reciva.com>
	<1258050962.25369.454.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1258050962.25369.454.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
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
X-List-Received-Date: Thu, 12 Nov 2009 19:25:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2009 at 06:36:02PM +0000, Phil Blundell wrote:
>On Wed, 2009-11-11 at 20:34 +0000, Phil Blundell wrote:

>diff --git a/classes/base.bbclass b/classes/base.bbclass
>index 9d063f2..9508754 100644
>--- a/classes/base.bbclass
>+++ b/classes/base.bbclass
>@@ -56,6 +56,50 @@ def base_chk_load_parser(config_paths):
> 
>     return parser
> 
>+def base_chk_file_vars(parser, localpath, params, data):
>+    try:
>+        name = params["name"]
>+    except KeyError:
>+        return False
>+    flagName = "%s.md5sum" % name
>+    want_md5sum = bb.data.getVarFlag("SRC_URI", flagName, data)
>+    flagName = "%s.sha256sum" % name
>+    want_sha256sum = bb.data.getVarFlag("SRC_URI", flagName, data)
>+
>+    if (want_sha256sum == None and want_md5sum == None):
>+        # no checksums to check, nothing to do
>+        return False
>+
>+    if not os.path.exists(localpath):
>+        localpath = base_path_out(localpath, data)
>+        bb.note("The localpath does not exist '%s'" % localpath)
>+        raise Exception("The path does not exist '%s'" % localpath)
>+
>+    if want_md5sum:
>+        try:
>+	    md5pipe = os.popen('PATH=%s md5sum %s' % (bb.data.getVar('PATH', data, True), localpath))
>+            md5data = (md5pipe.readline().split() or [ "" ])[0]
>+            md5pipe.close()
>+        except OSError, e:
>+            raise Exception("Executing md5sum failed")
>+        if want_md5sum != md5data:
>+            bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%s'" % (want_md5sum, md5data))

please s/and Got/and got/g

>+            raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" % (want_md5sum, md5data))

Why are you providing the same information as a note and in the
exception text?
>+
>+    if want_sha256sum:
>+        try:
>+            shapipe = os.popen('PATH=%s oe_sha256sum %s' % (bb.data.getVar('PATH', data, True), localpath))
>+            shadata = (shapipe.readline().split() or [ "" ])[0]
>+            shapipe.close()
>+        except OSError, e:
>+            raise Exception("Executing shasum failed")

sha256sum
[]
>@@ -639,11 +683,11 @@ python base_do_fetch() {
> 	# Check each URI
> 	for url in src_uri.split():
> 		localpath = bb.data.expand(bb.fetch.localpath(url, localdata), localdata)
>-		(type,host,path,_,_,_) = bb.decodeurl(url)
>+		(type,host,path,_,_,params) = bb.decodeurl(url)
> 		uri = "%s://%s%s" % (type,host,path)
> 		try:
> 			if type == "http" or type == "https" or type == "ftp" or type == "ftps":

if type in ["http", "https", "ftp", "ftps"]:
(while you're at it :)

cheers,
Bernhard


