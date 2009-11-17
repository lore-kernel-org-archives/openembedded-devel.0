Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NALlb-0005PZ-9O
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 11:58:38 +0100
Received: by bwz19 with SMTP id 19so6737072bwz.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 02:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Vy8lQeDxT6vBeTmZL2d+46zfTol9xagFP7zalMViZMg=;
	b=huZ1O0eE7M8l4RAtOKbgxfSotO4LTxtRLUGmCcMNz725n+/8fMKp8QoV/EWrIrP98S
	LA/QnYNv7GbHjOaKmguyeH6UNvfFEwSIPSOnBw048FVzAjbRRtQmJbnVH9qu6plkpofZ
	XYa8un6yCQ9aH/Wchts/bhv9wQI+c/G/cWklo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=DoVcl7Z4s4VdrHi4qUsauob7/uz0MBg8aH6uXXWzc0PzbfiskahRyQgV/5fzUzFzzT
	JbDUVLJXqqsyH8O17M0AcSjpkhcO41H4nyxD/wOzEccAuIKlAPMYDW1OKkW2x5uhY0or
	AMtSHftXu8IcH07Lbic3NH4/yuGBEHzmNph0I=
Received: by 10.204.160.154 with SMTP id n26mr5259146bkx.90.1258455432340;
	Tue, 17 Nov 2009 02:57:12 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm328971fxm.5.2009.11.17.02.57.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Nov 2009 02:57:11 -0800 (PST)
Date: Tue, 17 Nov 2009 11:57:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091117105715.GH23383@jama>
References: <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com>
	<hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com>
	<20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com>
	<20091117085518.GF23383@jama>
	<1258452062.8810.5.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1258452062.8810.5.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.219
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
X-List-Received-Date: Tue, 17 Nov 2009 10:58:38 -0000
X-Groupsio-MsgNum: 14379
Content-Type: multipart/mixed; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Updated patch, thanks RP!

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-Optional-LOCALCOUNT-for-recipe.patch"

From 55c8f06a1382dfb11214b6e12ac47b06fce412a4 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2009 08:24:52 +0100
Subject: [PATCH] Optional LOCALCOUNT for recipe

* Instead of autoincrement from persistent cache when srcrev is changed.
* Should be used by distributions with multiple builders, where consistent
  PV is needed.
* Can be used instead of PR bump in PVs like this "0.0+${PR}+gitr${SRCPV}"
* BB_LOCALCOUNT_OVERRIDE to enable setting LOCALCOUNT for recipe
* This way LOCALCOUNTs can be specified directly in recipes instead of
  separated distro config (as not all want to use them). And will be
  used only when BB_LOCALCOUNT_OVERRIDE set in distro config.
---
 lib/bb/fetch/__init__.py |   26 +++++++++++++++++++++++++-
 1 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 8c0d7ea..9508908 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -448,6 +448,23 @@ class Fetch(object):
 
     srcrev_internal_helper = staticmethod(srcrev_internal_helper)
 
+    def localcount_internal_helper(ud, d):
+        """
+        Return:
+            a) a locked localcount if specified
+            b) None otherwise
+        """
+
+        localcount= None
+        if 'name' in ud.parm:
+            pn = data.getVar("PN", d, 1)
+            localcount = data.getVar("LOCALCOUNT_" + ud.parm['name'], d, 1)
+        if not localcount:
+            localcount = data.getVar("LOCALCOUNT", d, 1)
+        return localcount
+
+    localcount_internal_helper = staticmethod(localcount_internal_helper)
+
     def try_mirror(d, tarfn):
         """
         Try to use a mirrored version of the sources. We do this
@@ -550,13 +567,20 @@ class Fetch(object):
 
         latest_rev = self._build_revision(url, ud, d)
         last_rev = pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
-        count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
+        uselocalcount = bb.data.getVar("BB_LOCALCOUNT_OVERRIDE", d, True) or False
+        count = None
+        if uselocalcount:
+            count = Fetch.localcount_internal_helper(ud, d)
+        if count is None:
+            count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
 
         if last_rev == latest_rev:
             return str(count + "+" + latest_rev)
 
         if count is None:
             count = "0"
+        elif uselocalcount:
+            count = str(count)
         else:
             count = str(int(count) + 1)
 
-- 
1.6.5.2


--32u276st3Jlj2kUU--
