Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10196.1603278980892464747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6L-0007Sd-RD; Wed, 21 Oct 2020 14:16:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-pymisp: Upgrade 2.4.131 -> 2.4.133
Date: Wed, 21 Oct 2020 14:16:08 +0300
Message-Id: <20201021111609.28237-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.133:

- [attribute type] telfhash added.
- [add_gitlab_user] new gitlab user fetch script to MISP object.
- Bump object templates.
- Bump changelog.
- Bump version.
- Bump test cases.
- [type] updated.
- Bump file obj version in tests.
- [data] misp-objects updated.
- Bump build system to poetry 1.1.
- [type] new type added.
- [add_github_user] add ssh keys of the user in the MISP object.
- [add_github_user] more fields added from the GitHub API.
- Bump deps, objects.
- Add test for delete=True in get_event.
- [add_github_user] add following to the MISP object.
- Bump dependencies.
- Pass a list to add_attributes.
- Use MISPObject instead of GenericObjectGenerator.
- [doc] add a reference to the license.
- Add docstrings and extend conf.py for RTD.
- Remove PyMISPExpanded from the docs.
- Add comments to ELF, PE, and MachO object generators.
- Improve error message, add comments, rename whitelist to
  allowedlist.
- Remove SG search for search() func as this doesn't support SG
  searching, but the index does.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.131.bb => python3-pymisp_2.4.133.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.131.bb => python3-pymisp_2.4.133.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
index 82ab80314a..28a24fed55 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.131.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.133.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[md5sum] = "8844204f8b059ff2fc508ba9ac07dcb2"
-SRC_URI[sha256sum] = "59adb7ee95bfb1b5c35abbc01b5372df7327baea4a8df9efe30140ea64b73c18"
+SRC_URI[md5sum] = "00e258da18f59845687f58389a2e8e12"
+SRC_URI[sha256sum] = "4a2a8a4da78c6321550522d5cf1575c095773d0867c0a4f5157a658f6e1994d5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

