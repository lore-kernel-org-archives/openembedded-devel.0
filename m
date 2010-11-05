Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PENiZ-0005sN-TD
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 15:56:42 +0100
Received: by bwz10 with SMTP id 10so2905484bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=I8rZvPvzdER0uahmrQHzGHJoh6PODtMKprKryqQfMtA=;
	b=mNMynF7PUoSf4ylclKZ3JO9jO1PDkvFy7HXzqZnSJRHL5mCmhIwOXZP1hCH0gRzloG
	YeZyBwqEb+eLI16TXblGunOYQbKrqPjbfvuWAo3pmnEtoemBqq0nXXN+FOdp6m7ILawE
	TMk/RtWrtg0u6EVeN0aVgbdt2d4mff6q6bBl0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ilDx+HPpSxv9dokIEXjFFVisQZzqr9T15DzGjVzgWxNGDYt3XMQNpuLiNufWEYnWlP
	ahyW8ZvlfX7NqKcvfPEXh0erPuB3rca7gxFyvDo74nDUnYMVRsf99IKqrtaXvEPwXwDS
	k7eDcRDQe1h4IuCyb758MLOr8XAgZtSLNFoYI=
Received: by 10.204.65.198 with SMTP id k6mr1965464bki.18.1288968948634;
	Fri, 05 Nov 2010 07:55:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm1056428bks.20.2010.11.05.07.55.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Nov 2010 07:55:46 -0700 (PDT)
Date: Fri, 5 Nov 2010 15:55:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101105145525.GR3440@jama>
References: <1288916214.28481.13419.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1288916214.28481.13419.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Discussions from 2010/11/03
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
X-List-Received-Date: Fri, 05 Nov 2010 14:56:42 -0000
X-Groupsio-MsgNum: 25910
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 05, 2010 at 12:16:54AM +0000, Richard Purdie wrote:
> Hi,
> 
> The TSC met yesterday and discussed various topics. We're trying a
> slightly different approach to recording the outcome of the discussions:
> 
> http://wiki.openembedded.org/index.php/TSCDecisions
> 
> and the output from 5 such discussions yesterday is recorded there.
> These were all things that had discussion by the TSC pending after
> OEDEM.

Just idea for last point about FILESPATH:

It isn't tested and bitbake's Local fetcher localpath still
needs FILESPATH or similar change.

Just to show what I meant in:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/025673.html

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-base.bbclass-test-for-FILESPATHPKG-existence-first-t.patch"

From a3c0a5af9640a6c9395e3747fbcff288020b2355 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 5 Nov 2010 15:47:25 +0100
Subject: [PATCH] base.bbclass: test for FILESPATHPKG existence first, then try FILESPATHOVERRIDES

---
 classes/base.bbclass |   15 +++++++++------
 conf/bitbake.conf    |    3 ++-
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index fd507d3..a1f65a9 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -203,18 +203,21 @@ python base_do_unpack() {
     if not src_uri:
         return
     srcurldata = bb.fetch.init(src_uri.split(), d, True)
-    filespath = d.getVar("FILESPATH", True).split(":")
+    filespathlist = d.getVar("FILESPATHLIST", True).split(":")
+    filespathoverrides = d.getVar("FILESPATHOVERRIDES", True).split(":")
 
     for url in src_uri.split():
         urldata = srcurldata[url]
         if urldata.type == "file" and "*" in urldata.path:
             # The fetch code doesn't know how to handle globs, so
             # we need to handle the local bits ourselves
-            for path in filespath:
-                srcdir = oe.path.join(path, urldata.host,
-                                      os.path.dirname(urldata.path))
-                if os.path.exists(srcdir):
-                    break
+            for path in filespathlist:
+                if os.path.exists(path):
+                    for override in filespathoverrides:
+                        srcdir = oe.path.join(path, override, urldata.host,
+                                          os.path.dirname(urldata.path))
+                    if os.path.exists(srcdir):
+                        break
             else:
                 bb.fatal("Unable to locate files for %s" % url)
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 177e0b3..e623281 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -271,7 +271,8 @@ FILES_${PN}-locale = "${datadir}/locale"
 FILE_DIRNAME = "${@os.path.dirname(bb.data.getVar('FILE', d))}"
 FILESPATHBASE = "${FILE_DIRNAME}"
 FILESPATHPKG = "${PF}:${P}:${PN}:${BP}:${BPN}:files:."
-FILESPATH = "${@':'.join(uniq(os.path.normpath(os.path.join(fp, p, o)) for fp in '${FILESPATHBASE}'.split(':') for p in '${FILESPATHPKG}'.split(':') for o in reversed([''] + filter(None, '${OVERRIDES}'.split(':')))))}"
+FILESPATHOVERRIDES = "${MACHINE}:${DISTRO}:${TARGET_ARCH}:{BASE_PACKAGE_ARCH}:."
+FILESPATHLIST = "${@':'.join(uniq(os.path.normpath(os.path.join(fp, p)) for fp in '${FILESPATHBASE}'.split(':') for p in '${FILESPATHPKG}'.split(':')))}"
 FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 ##################################################################
-- 
1.7.3.2


--Nq2Wo0NMKNjxTN9z--
