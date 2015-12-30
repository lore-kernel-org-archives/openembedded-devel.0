Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7077316E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 22:10:23 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ik10so32699993igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 14:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=P5TRNiNWNC6nFvz3mHATs67CfG1GlqlqHnDH8florcw=;
	b=Y0HmmA9ocOJLm8etoFirzdiMDyRCecXrrVHUpvVDrCD4iy6KpoyGHeG+wpQWx46jyc
	YixmB8FTzuvxoSRdgZCn42vwDOqMNAi+5ZldQaSX4dICrmGKQHpO1oG4hSKLwp31QMCU
	HGYVU4GIzOCK55a70Z4CbHa/HwJCIGCpZ3K+d2dX4wZLNjSTw0ZxOD1H1HSBjFysmRMT
	Ho1tBa5S+RblmgGzjKvgS8ndltOj3qjKXLsWTsCSVpmU45EAk/7LK5+L3Loc/DkIdJU4
	ckop97XH2/g7k/xV1akTefrMQabEBCBiDFQppXWOPDy6slswG2qtvPbb2sxxj9/LIjQy
	qMCA==
X-Received: by 10.50.43.136 with SMTP id w8mr42681903igl.96.1451513424218;
	Wed, 30 Dec 2015 14:10:24 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	h19sm4082253igq.6.2015.12.30.14.10.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 14:10:23 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1451506017-6206-1-git-send-email-twoerner@gmail.com>
	<D7088E06-64E6-48CF-B84B-4E47815CFA38@gmail.com>
	<568454B1.4080803@gmail.com>
	<E160C73D-40EA-49B2-9EF1-00FE55BF86E5@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5684564B.8080106@gmail.com>
Date: Wed, 30 Dec 2015 17:10:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <E160C73D-40EA-49B2-9EF1-00FE55BF86E5@gmail.com>
Subject: Re: [meta-oe][PATCH v2] nodejs: update from 4.2.3 to 4.2.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Dec 2015 22:10:26 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 12/30/15 17:05, Khem Raj wrote:
> Yes. please include exact diff instead of summarizing as your patch does.

diff --git a/LICENSE b/LICENSE
index 7920cbb..ea51cc4 100644
--- a/LICENSE
+++ b/LICENSE
@@ -338,11 +338,32 @@ The externally maintained libraries used by
Node.js are:
 - npm is a package manager program located at deps/npm.
   npm's license follows:
   """
-    Copyright (c) Isaac Z. Schlueter
-    All rights reserved.
+    The npm application
+    Copyright (c) npm, Inc. and Contributors
+    Licensed on the terms of The Artistic License 2.0
+
+    Node package dependencies of the npm application
+    Copyright (c) their respective copyright owners
+    Licensed on their respective license terms
+
+    The npm public registry at https://registry.npmjs.com
+    and the npm website at https://www.npmjs.com
+    Operated by npm, Inc.
+    Use governed by terms published on https://www.npmjs.com
+
+    "Node.js"
+    Trademark Joyent, Inc., https://joyent.com
+    Neither npm nor npm, Inc. are affiliated with Joyent, Inc.
 
-    npm is released under the Artistic 2.0 License.
-    The text of the License follows:
+    The Node.js application
+    Project of Node Foundation, https://nodejs.org
+
+    The npm Logo
+    Copyright (c) Mathias Pettersson and Brian Hammond
+
+    "Gubblebum Blocky" typeface
+    Copyright (c) Tjarda Koster, https://jelloween.deviantart.com
+    Used with permission
 
 
     --------
@@ -554,24 +575,49 @@ The externally maintained libraries used by
Node.js are:
     --------
 
 
-    "Node.js" and "node" trademark Joyent, Inc. npm is not officially
-    part of the Node.js project, and is neither owned by nor
-    officially affiliated with Joyent, Inc.
+    The following additional terms shall apply to use of the npm
software, the npm
+    website, the npm repository and any other services or products
offered by npm,
+    Inc.:
 
-    Packages published in the npm registry (other than the Software and
-    its included dependencies) are not part of npm itself, are the sole
-    property of their respective maintainers, and are not covered by
-    this license.
+    "Node.js" trademark Joyent, Inc.  npm is not officially part of the
Node.js
+    project, and is neither owned by nor affiliated with Joyent, Inc.
 
-    "npm Logo" created by Mathias Pettersson and Brian Hammond,
-    used with permission.
+    "npm" and "The npm Registry" are owned by npm, Inc. All rights
reserved.
+
+    Modules published on the npm registry are not officially endorsed
by npm, Inc.
+    or the Node.js project.
+
+    Data published to the npm registry is not part of npm itself, and
is the sole
+    property of the publisher. While every effort is made to ensure
accountability,
+    there is absolutely no guarantee, warrantee, or assertion expressed
or implied
+    as to the quality, fitness for a specific purpose, or lack of
malice in any
+    given npm package.  Packages downloaded through the npm registry are
+    independently licensed and are not covered by this license.
+
+    Additional policies relating to, and restrictions on use of, npm
products and
+    services are available on the npm website.  All such policies and
restrictions,
+    as updated from time to time, are hereby incorporated into this license
+    agreement.  By using npm, you acknowledge your agreement to all
such policies
+    and restrictions.
+
+    If you have a complaint about a package in the public npm registry,
and cannot
+    resolve it with the package owner, please email support@npmjs.com
and explain
+    the situation.  See the [npm Dispute Resolution
+    policy](https://github.com/npm/policies/blob/master/disputes.md)
for more
+    details.
+
+    Any data published to The npm Registry (including user account
information) may
+    be removed or modified at the sole discretion of the npm server
administrators.
+
+    "npm Logo" contributed by Mathias Pettersson and Brian Hammond,
+    use is subject to https://www.npmjs.com/policies/trademark
 
     "Gubblebum Blocky" font
-    Copyright (c) by Tjarda Koster, http://jelloween.deviantart.com
+    Copyright (c) by Tjarda Koster, https://jelloween.deviantart.com
     included for use in the npm website and documentation,
     used with permission.
 
-    This program uses several Node.js modules contained in the
node_modules/
+    This program uses several Node modules contained in the node_modules/
     subdirectory, according to the terms of their respective licenses.
   """


