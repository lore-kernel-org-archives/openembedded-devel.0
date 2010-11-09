Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFxTT-0007Oz-4d
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 00:20:13 +0100
Received: by yxe42 with SMTP id 42so9314yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Q7AXKiN93BIvlXXgBcfR1SQfmXBMT1L3tG/3Di+pSaQ=;
	b=VS/kS2jDq3QDe2wBsg4JpAtHEb62eYc2kbtQKWAjpRE/x7FvV5doiRimLdmxUizMPE
	thIj4AZAsk8ZpjRRF+X7G/0zDUBIRQcBMead3pGSl7XSWlHm2FgUkJFkQP4VLNYxS7FG
	stWocVh6lNnaw2yL/Qfmid0ejSgiTQ5hR0RxQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=VD5tb0wazqo6Bf3EphAoEQen+cDCJZ4mpHs9uisXBykcSpgf66iNYfclFOF0ZLps+n
	ONk+jXyotFEQcywgfc0ebohoiyHqN0BUOUGZWRCooEs/LIVd7u1GH+p4FriBduZc/FsS
	OgdgRGINMFv7IRmgMDGfqtSroj1XQ9dkMRpjc=
Received: by 10.151.41.6 with SMTP id t6mr4676814ybj.125.1289344715804;
	Tue, 09 Nov 2010 15:18:35 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id v12sm1317816ybk.23.2010.11.09.15.18.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Nov 2010 15:18:34 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Nov 2010 16:18:27 -0700
Message-Id: <1289344708-26165-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [RFC] [PATCH 1/2] Implement variable typing
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
X-List-Received-Date: Tue, 09 Nov 2010 23:21:57 -0000
X-List-Received-Date: Tue, 09 Nov 2010 23:21:57 -0000

From: Chris Larson <chris_larson@mentor.com>

This implementation consists of two components:

- oe.types python module, whose job it is to construct objects of the defined
  type for a given variable in the metadata
- typecheck.bbclass, which iterates over all configuration variables with a
  type defined and uses oe.types to check the validity of the values

This gives us a few benefits:

- Automatic sanity checking of all configuration variables with a defined type
- Avoid duplicating the "how do I make use of the value of this variable"
  logic between its users.  For variables like PATH, this is simply a split(),
  for boolean variables, the duplication can result in confusing, or even
  mismatched semantics (is this 0/1, empty/nonempty, what?)
- Make it easier to create a configuration UI, as the type information could
  be used to provide a better interface than a text edit box (e.g checkbox for
  'boolean', dropdown for 'choice')

This functionality is entirely opt-in right now.  To enable the configuration
variable type checking, simply INHERIT += "typecheck".  Example of a failing
type check:

BAZ = "foo"
BAZ[type] = "boolean"

$ bitbake -p
FATAL: BAZ: Invalid boolean value 'foo'
$

Examples of leveraging oe.types in a python snippet:

PACKAGES[type] = "list"

python () {
    import oe.types
    for pkg in oe.types.value("PACKAGES", d):
        bb.note("package: %s" % pkg)
}

LIBTOOL_HAS_SYSROOT = "yes"
LIBTOOL_HAS_SYSROOT[type] = "boolean"

python () {
    import oe.types
    assert(oe.types.value("LIBTOOL_HAS_SYSROOT", d) == True)
}

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/typecheck.bbclass |   12 +++++++
 lib/oe/types.py           |   77 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 classes/typecheck.bbclass
 create mode 100644 lib/oe/types.py

diff --git a/classes/typecheck.bbclass b/classes/typecheck.bbclass
new file mode 100644
index 0000000..646cd4e
--- /dev/null
+++ b/classes/typecheck.bbclass
@@ -0,0 +1,12 @@
+# Check types of bitbake configuration variables
+#
+# See oe.types for details.
+
+python check_types() {
+    import oe.types
+    if isinstance(e, bb.event.ConfigParsed):
+        for key in e.data.keys():
+            if e.data.getVarFlag(key, "type"):
+                oe.types.value(key, e.data)
+}
+addhandler check_types
diff --git a/lib/oe/types.py b/lib/oe/types.py
new file mode 100644
index 0000000..df6785f
--- /dev/null
+++ b/lib/oe/types.py
@@ -0,0 +1,77 @@
+# Constructs objects of the specified type for a given variable in the
+# metadata.  The 'type' flag of the variable defines which of the factory
+# functions in this module will be called.
+#
+# If no type is defined, the value() function will simply return the expanded
+# string value as is.
+
+class OEList(list):
+    def __init__(self, value, separator):
+        self.separator = separator
+        __builtins__["list"].__init__(self, value)
+
+    def __str__(self):
+        return self.separator.join(self)
+
+def boolean(key, metadata):
+    value = metadata.getVar(key, True)
+    strvalue = str(value).lower()
+    if strvalue in ('yes', 'y', 'true', 't', '1'):
+        return True
+    elif strvalue in ('no', 'n', 'false', 'f', '0'):
+        return False
+    raise ValueError("Invalid boolean value '%s'" % strvalue)
+
+def list(key, metadata):
+    value = metadata.getVar(key, True)
+    separator = metadata.getVarFlag(key, "separator") or " "
+    return OEList(value.split(separator), separator)
+
+def integer(key, metadata):
+    return int(metadata.getVar(key, True))
+
+def choice(key, metadata):
+    value = metadata.getVar(key, True).upper()
+    choices = metadata.getVarFlag(key, "choices")
+    if not choices:
+        raise ValueError("No 'choices' flag set for variable  '%s'" % key)
+
+    for choice in choices.split():
+        if choice.upper() == value:
+            break
+    else:
+        raise ValueError("Invalid choice '%s' for '%s'.  Valid choices: %s" %
+                         (value, key, choices))
+    return value
+
+def regex(key, metadata):
+    import re
+    value = metadata.getVar(key, True)
+    flagval = 0
+    flags = metadata.getVarFlag(key, "regexflags")
+    if flags:
+        for flag in flags.split():
+            flag = flag.upper()
+            try:
+                flagval |= getattr(re, flag)
+            except AttributeError:
+                raise ValueError("Invalid regex flag '%s'" % flag)
+    try:
+        return re.compile(value, flagval)
+    except Exception, exc:
+        raise ValueError("Invalid value '%s' for regex(): %s" % (value, exc))
+
+def value(key, d):
+    import bb
+    var_type = d.getVarFlag(key, "type")
+    if var_type:
+        try:
+            func = globals()[var_type]
+        except KeyError:
+            raise TypeError("Invalid variable type: %s" % var_type)
+        try:
+            return func(key, d)
+        except ValueError, exc:
+            bb.fatal("%s: %s" % (key, str(exc)))
+    else:
+        return d.getVar(key, True)
-- 
1.7.2.3



