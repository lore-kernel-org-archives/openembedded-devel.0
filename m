Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6471.1602660784795813446
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36146 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSbHS-00067Q-5q; Wed, 14 Oct 2020 10:33:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pywbemtools: Upgrade 0.7.3 -> 0.8.0
Date: Wed, 14 Oct 2020 10:32:53 +0300
Message-Id: <20201014073256.9605-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014073256.9605-1-leon.anavi@konsulko.com>
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 0.8.0:

- Moving the commands “server profiles” and “serve
  centralinsts” to the new group profiles with the commmand
  names “profile list” and “profile centralinsts” added a
  command group and removed 2 commands from the server
  command group.
- The –deprecation-warnings / –no-deprecation-warnings
  general option has been remamed to –warn / –no-warn, and
  it now controls the display of all Python warnings.
- Order display of instance names when the .? is used to pick
  an instance name so the same order of instance names is
  displayed for all versions of Python.
- Pinned prompt-toolkit to <3.0 on Python 3.8 on Windows to
  avoid WinError 995.
- Fixed exception when command entered in interactive mode,
  on Python 2.
- Test: Default connection file does not get restored in some
  cases during test.
- AssociationShrub produces instancename slightly different table
  output in some cases for pywbem 1 vs previous
  versions(inclusion of “/:” prefix).
- Test: Fixed attempt in test_class_cmds.py to invoke a non-static
  method on a class object.
- Fix help message for “–deprecated” to be unicode so python 2.7
  help does not fail.
- Upgraded nocasedict and nocaselist packages to pick up fixes.
- Error in test defintion for qualdecl Indication causes failure
  with pywbem i.1.0 where mocker validates qualifiers scopes.
- Test: Preventive fix for potential issue with virtualenv raising
  AttributeError during installtest on Python 3.4.
- Test: Added checking for no expected warning.
- Fixed incorrect property order in instance table output, where
  key properties were not ordered before non-key properties but
  ordered along with them.
- Docs/Test: Fixed failing install of Jinja2 on Python 3.4 by
  adding it to dev-requirements.txt and pinning it to <2.11 for
  Python 3.4.
- Test: Aligned qualifier definitions in test MOF with CIM Schema.
- Upgraded pywbem to 1.1.1 to pick up fixes and enhancements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pywbemtools_0.7.3.bb => python3-pywbemtools_0.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.7.3.bb => python3-pywbemtools_0.8.0.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
index 8620057f59..03caec539f 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.7.3.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "e3f8cadb8d1253b1b51afabcce4c3461"
-SRC_URI[sha256sum] = "b475da4389ac77901191c886f4348660f3c0fd59365feb18ede47a086442efff"
+SRC_URI[md5sum] = "e41ef654a0af0461d6c164752963fdfb"
+SRC_URI[sha256sum] = "b869bb217613cdfee1e97e8afc28fe3f9bf3b88f8fc99e588d03c4be0922c319"
 
 inherit pypi setuptools3
 
-- 
2.17.1

