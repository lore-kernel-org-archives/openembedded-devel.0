Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqUn-0003xk-JZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 20:55:09 +0100
Received: by fxm17 with SMTP id 17so12720931fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 11:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=pEDeXawO6re4Ww4ZJNd9/F9pCjkgimc4X+GZm9Po3jo=;
	b=vsnYqe/5ajumhMCHlrHyBgmhi1DK0CEs8dzYXddw0W71jrx75cKOeL2oazaGi7DH8G
	c88lRCW8pay9S4do78BmKcRNTy3DHWD4fLwfN0UA137NFQ+bujgC7hq7BXHvSWsFLIPD
	FwjSXT5y1qwCnsX+tf0jJW79TTzcs8gltFEuM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Yd7qmYw+GTQqMA0CCSpwCghsdHa5amX6ZV9afLRIaR1nl35FRhs6xNlmnqj9v6zuW7
	2uOOWEhfPDitAYjbYK/hOZ1bgxcAaENq/ycZ716+sH9GJXYcXt/ylFT8vOoqWnIS6xHO
	dmvmIVbyEE+jlmg7RgBwFVe967V7OWW/yzl6o=
Received: by 10.223.93.133 with SMTP id v5mr338091fam.119.1294084487732;
	Mon, 03 Jan 2011 11:54:47 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a6sm3127703fak.3.2011.01.03.11.54.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 11:54:46 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqUO-0000iw-8p; Mon, 03 Jan 2011 20:54:44 +0100
Date: Mon, 3 Jan 2011 20:54:44 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110103195444.GB25803@mx.loc>
References: <1292951999-18969-1-git-send-email-rep.dot.nop@gmail.com>
	<1292951999-18969-2-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1292951999-18969-2-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] patch.bbclass: conditional patch-tool dependency
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
X-List-Received-Date: Mon, 03 Jan 2011 19:55:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 21, 2010 at 06:19:59PM +0100, Bernhard Reutner-Fischer wrote:
>only depend do_patch on patch-tool if recipe references any patch

ping?
>
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> classes/patch.bbclass |   21 +++++++++++++++++++--
> 1 files changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/classes/patch.bbclass b/classes/patch.bbclass
>index 7629e9a..1cfe24c 100644
>--- a/classes/patch.bbclass
>+++ b/classes/patch.bbclass
>@@ -38,7 +38,7 @@ python patch_do_patch() {
> 	src_uri = d.getVar("SRC_URI", True).split()
> 	srcurldata = bb.fetch.init(src_uri, d, True)
> 	workdir = bb.data.getVar('WORKDIR', d, 1)
>-	for url in d.getVar("SRC_URI", True).split():
>+	for url in src_uri:
> 		urldata = srcurldata[url]
> 
> 		local = urldata.localpath
>@@ -120,8 +120,25 @@ python patch_do_patch() {
> 			bb.fatal(str(exc))
> }
> 
>+def patch_deps(d):
>+    import oe.unpack
>+
>+    src_uri = d.getVar("SRC_URI", True).split()
>+    srcurldata = bb.fetch.init(src_uri, d, True)
>+    for url in src_uri:
>+        urldata = srcurldata[url]
>+        local = urldata.localpath
>+        if local:
>+            base, ext = os.path.splitext(os.path.basename(local))
>+            if ext in ('.gz', '.bz2', '.Z', '.xz'):
>+                local = base
>+            if oe.unpack.is_patch(local, urldata.parm):
>+                return "${PATCHDEPENDENCY}"
>+    return ""
>+        
>+
> addtask patch after do_unpack
> do_patch[dirs] = "${WORKDIR}"
>-do_patch[depends] = "${PATCHDEPENDENCY}"
>+do_patch[depends] = "${@patch_deps(d)}"
> 
> EXPORT_FUNCTIONS do_patch
>-- 
>1.7.2.3
>


