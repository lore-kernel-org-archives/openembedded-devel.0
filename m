Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NA1t7-0003XA-Mo
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 14:45:04 +0100
Received: by bwz9 with SMTP id 9so5343921bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tLKz2t3KXyiVjUMGpINBsbEGRwfBOq2Yl1FPTGD3FtY=;
	b=r6tLHWNp8jvLqToQT+rUeiBeZGSbaKnARa4DiVKyiJ61nhpmIYjG5kZvTBGtSMaEMG
	AxvW73r+4cKqI/w2/o+HqX6VmIslvoH/Ggp+IL76xg2fHRudbYMtotDoa6ubogfMth4z
	d79htoul3O/XbORvDCJe72ds3XKK1OOl9ayr0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pS4dEsrKwDAUWt+bg9ccMUWKRh6iaLind0YC1ttGvDFHUvMouyGZL5cRXeSs/U3Rdp
	Tt/ubmkoKyU8lL/oGcFxqdSRF+Xwz8fm06uZPGVh4dozn9Wvyt4sHSo5xIlOsiNLmAxr
	mMfrguDfKj/S+EI/rSffzvu6MpX/Dmm8Q+nmE=
Received: by 10.204.34.18 with SMTP id j18mr3854817bkd.38.1258379019328;
	Mon, 16 Nov 2009 05:43:39 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm2033112fxm.15.2009.11.16.05.43.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Nov 2009 05:43:38 -0800 (PST)
Date: Mon, 16 Nov 2009 14:43:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091116134339.GC23383@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1258375022.16625.3.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 13:45:04 -0000
X-Groupsio-MsgNum: 14356
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2009 at 12:37:02PM +0000, Richard Purdie wrote:
> On Mon, 2009-11-16 at 13:10 +0100, Koen Kooi wrote:
> I think we will have to hold off some of the SRCPV migration until
> bitbake has some kind of lock down functionality for the local build
> numbers. Any volunteers to write a patch?

This could be enough?

Just putting
BB_GIT_LOCALCOUNT_FOR_SRCREV = "0"
somewhere (local.conf/distro.conf) and _count will always stay on 0
(gitr0+abc1234def)

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-Lock-down-LOCALCOUNT-if-you-need-consistent-SRCPV-be.patch"

From 9c9cc27acde3d7fe059c8bae79b958180f8247d8 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2009 14:36:34 +0100
Subject: [PATCH] Lock down LOCALCOUNT if you need consistent SRCPV between multiple buildhosts

---
 lib/bb/fetch/__init__.py |    3 ++-
 lib/bb/fetch/git.py      |    3 +++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 8c0d7ea..0b9a052 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -537,6 +537,7 @@ class Fetch(object):
         
         """
         has_want_sortable = hasattr(self, "_want_sortable_revision")
+        has_want_increasing_localcount = hasattr(self, "_want_increasing_localcount")
         has_sortable = hasattr(self, "_sortable_revision")
 
         if not has_want_sortable and has_sortable:
@@ -555,7 +556,7 @@ class Fetch(object):
         if last_rev == latest_rev:
             return str(count + "+" + latest_rev)
 
-        if count is None:
+        if not has_want_increasing_localcount or count is None:
             count = "0"
         else:
             count = str(int(count) + 1)
diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
index 5cdf656..e4d0156 100644
--- a/lib/bb/fetch/git.py
+++ b/lib/bb/fetch/git.py
@@ -149,6 +149,9 @@ class Git(Fetch):
     def _want_sortable_revision(self, url, ud, d):
         return bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True) or False
 
+    def _want_increasing_localcount(self, url, ud, d):
+        return bb.data.getVar("BB_GIT_LOCALCOUNT_FOR_SRCREV", d, False) or True
+
     def _sortable_revision(self, url, ud, d):
         """
         This is only called when _want_sortable_revision called true
-- 
1.6.5.2


--pWyiEgJYm5f9v55/--
