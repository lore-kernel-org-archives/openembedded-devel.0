Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NAKxk-00089b-5q
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 11:07:07 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAHA2NRo026306 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 10:02:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0PBPNqeFSFzh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 10:02:23 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAHA2FMe026298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 10:02:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091117085518.GF23383@jama>
References: <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com> <hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com> <hdrffa$do6$1@ger.gmane.org>
	<1258375022.16625.3.camel@dax.rpnet.com> <20091116134339.GC23383@jama>
	<1258379748.16625.8.camel@dax.rpnet.com> <20091117085518.GF23383@jama>
Date: Tue, 17 Nov 2009 10:01:02 +0000
Message-Id: <1258452062.8810.5.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Tue, 17 Nov 2009 10:07:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-11-17 at 09:55 +0100, Martin Jansa wrote: 
> OK better version
> 
> with this you can add
> 
> LOCALCOUNT_pn-bar ?= "4"
> to ie sane-srcrevs.inc
> 
> or
> 
> LOCALCOUNT ?= "4" to 
> recipes/foo/bar_git.bb
> 
> (btw seems like LOCALCOUNT_pn-bar has higher preferrence even if I use
> "LOCALCOUNT = 4" in recipe, why?)

As Phil mentioned, OVERRIDES

> And it will be ignored for all distros where BB_LOCALCOUNT_OVERRIDE is
> not set. 
> 
> With BB_LOCALCOUNT_OVERRIDE enabled, you can use LOCALCOUNT instead of
> PR bump if you just change SRCREV, for others will be LOCALCOUNT in
> SRCPV incremented by default.
> 
> If BB_GIT_CLONE_FOR_SRCREV is set than LOCALCOUNT is ALWAYS set to 
> "git list-rev | wc -l" which could be considered also as consistent PV
> scheme for multiple buildhosts.

Thats fine.

> BTW: SRCPV seems to be expanded in PV a bit sooner than SRCREV was,
> which with combination with BB_GIT_CLONE_FOR_SRCREV means that all git
> repositories are checked during recipe parsing (Klaus Kurzmann has a
> list of git repositories used in OE recipes which are not accessible)

SRCPV and SRCREV would expand at the same time. BB_GIT_CLONE_FOR_SRCREV
will hit the network a lot more though a I don't think it gets cached as
nicely as SRCREV/PV does.

diff --git a/lib/bb/fetch/__init__.py b/lib/bb/fetch/__init__.py
index 8c0d7ea..3b527e2 100644
--- a/lib/bb/fetch/__init__.py
+++ b/lib/bb/fetch/__init__.py
@@ -448,6 +448,27 @@ class Fetch(object):
 
     srcrev_internal_helper = staticmethod(srcrev_internal_helper)
 
+    def localcount_internal_helper(ud, d):
+        """
+        Return:
+            a) a locked localcount if specified
+           b) None otherwise
+        """
+
+        localcount= None
+        if 'name' in ud.parm: 
+            pn = data.getVar("PN", d, 1)
+            localcount = data.getVar("LOCALCOUNT_pn-" + pn + "_" + ud.parm['name'], d, 1)

Just check getVar("LOCALCOUNT_" + ud.parm['name'], d, 1)

and require the user to set LOCALCOUNT_name_pn-foo = "bar".

+        if not localcount:
+            localcount = data.getVar("LOCALCOUNT", d, 1)
+        if localcount == "INVALID":
+            raise InvalidSRCREV("Please set LOCALCOUNT to a valid
value")

No point in checking for "INVALID", thats a special catch for the SRCREV
code you copied :)

+        if not localcount:
+            return None

You can just remove the above two lines.

+        return localcount
+
+    localcount_internal_helper =
staticmethod(localcount_internal_helper)
+
     def try_mirror(d, tarfn):
         """
         Try to use a mirrored version of the sources. We do this
@@ -550,15 +571,20 @@ class Fetch(object):
 
         latest_rev = self._build_revision(url, ud, d)
         last_rev = pd.getValue("BB_URI_LOCALCOUNT", key + "_rev")
-        count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
+        localcount = Fetch.localcount_internal_helper(ud, d)
+        if localcount is None:
+            count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")
+        else:
+            count = localcount

How about just doing:

uselocalcount = bb.data.getVar("BB_LOCALCOUNT_OVERRIDE", d, True) or False
count = None
if uselocalcount
         count = Fetch.localcount_internal_helper(ud, d)
if count is None:
         count = pd.getValue("BB_URI_LOCALCOUNT", key + "_count")


which combines you second patch too?

         if last_rev == latest_rev:
             return str(count + "+" + latest_rev)
 
-        if count is None:
-            count = "0"
-        else:
-            count = str(int(count) + 1)
+        if localcount is None:
+            if count is None:
+                count = "0"
+            else:
+                count = str(int(count) + 1)

There should be no need to do this?

Cheers,

Richard



