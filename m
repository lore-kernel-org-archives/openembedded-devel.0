Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C8B1049501
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 13:56:00 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51784.1774878678137971902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 06:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qbee.io header.s=google header.b=BadjkB/t;
 spf=pass (domain: qbee.io, ip: 209.85.167.66, mailfrom: piotr@qbee.io)
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5a13a06fc85so5609050e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qbee.io; s=google; t=1774878676; x=1775483476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+HyFQTtqgOJKmweCRC/Rqjm1sYUk9gMXobc9DPYYXA=;
        b=BadjkB/tkJUa/nBxk0qHXfUoliiRTJVp1zhXUCHl/cQczSAW8YhIoq5TsluTDoY+r8
         MjbqBvN3b4ajTXWyfFgAVQ7T1guMbEhvtDZcRoR9ZYVkpIECAvbPDHb3kS/MGmTSK5DA
         CYrZPfFheN4LShcOCECoaKgnO19xyKPm18RiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878676; x=1775483476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+HyFQTtqgOJKmweCRC/Rqjm1sYUk9gMXobc9DPYYXA=;
        b=nXqL38Cm//N4bDfsjWUIz6oZvVtk2N/3NzAVXhCLQcADi/DnYhC6+AllMUBOR3PX2J
         ED6DQck4Yxrt9eplI/+krQUMRBSe9qB3Ow8jq4FADIO/OmFq5HSeyJF4BkprY34qZEOw
         BV9kkRE7+WVSJgXNIJ3R0kSohnxkMJAriibqswFeV0sQVCtdkDBS5NefI/EWfOWNQ8pQ
         MzXTD47/EJd4wDj57decaj/KtfGZIQ8486rhyOmpRKG1fOiKKlAUqcBHd5f2zhdcyj7f
         ik8j85cRekJ7ENHiaqFrnRm4zKeevFqHunIS4pie7mQrazr/i6Fjekp4fNmUcIDlmLae
         rsYQ==
X-Gm-Message-State: AOJu0YxOG1c9khsLlfUz2ZKKkKvDIns6mlTlPaOIsdD+6nDPApccUOh/
	/VgTINYMuYU16xowE0pujeJaBEj4uqN/T1BxRYthKkVcZ0y9riZWt4gOFKKyB7hlUQJpjVUe/Ra
	+V4GF7656WPMj
X-Gm-Gg: ATEYQzwbrnxeQuJ3aI8q7rnU92gemtpHeEnGWxKVrEG+G0LwsLFTCar9druYOqjKI/v
	6UdJ4uED3BYW9ky6h8BU0ruFGjLc0Ri7G1cFO1Bt4/yAOlNpVyq6f1hKlpu/+RmL8dXFKTTAn66
	BvglpSMyDfBEOpNWutViGbQiPoI5feU9eYMijwUw+5leb/kttQZ25f+XYrmm5jbJRCEsnSemvbU
	Rwj63102Fy7/SyS4b5Ayme0sU1DxYnYb+m0XAp1rFk4jzKi2EPvte/qXcmjI+y+gubqCDv9Hbsn
	GyQ9XAai9AlfEYamSu5cwhhy3CkqoMMJHv9KhonbEPcProdN2Ea5o9nVbWvtzKgs3p/62cF81f9
	MLcU8IG/9qFkfNeVq1kUSMu0iiDMdiBluNrhCbX+yf0vnkV6Rjdg01JUXBFEs5YrfbcyqHLdUNS
	KehNoEvbzynny3GjdC90XWfW6Gr3dHwx8UUQ3sOheOVWlu6E1TgzuK
X-Received: by 2002:a05:6512:3983:b0:5a2:a43b:acae with SMTP id 2adb3069b0e04-5a2ab804562mr3896730e87.19.1774878675847;
        Mon, 30 Mar 2026 06:51:15 -0700 (PDT)
Received: from localhost (80.89-10-247.nextgentel.com. [89.10.247.80])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-5a2b1403c4esm1675135e87.26.2026.03.30.06.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:51:15 -0700 (PDT)
From: =?UTF-8?B?UGlvdHIgQnVsacWEc2tp?= <piotr@qbee.io>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Piotr=20Buli=C5=84ski?= <piotr@qbee.io>
Subject: [layerindexlib] Prevent loading unnecessary resources from layerindex-web
Date: Mon, 30 Mar 2026 15:51:12 +0200
Message-ID: <20260330135112.27161-1-piotr@qbee.io>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 13:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125866

When I was using `bitbake-layers layerindex-fetch ...` I noticed it being quite
slow. Upon further investigation, I found that the call to `load_layerindex()`
inside layerindexlib was called with the deafult `load` argument.

The deafault was set to ['layerDependencies', 'recipes', 'machines', 'distros']
where the `layerindex-fetch` effectively requires only ['layerDependencies'].

So whenever a `layerindex-fetch` is used, we pull for example 'recipes', which
is about 18-20MB in size - it takes time to produce that response by the
layerindex-web and ship over the internet, just to be discarded.

This change addresses the issue by setting a "sane" default (empty `load` list)
and sets a correct, explicit `load` list whenever it's needed (e.g. toaster)
by the caller.

Lastly, there seems to be an error when the cooker index is loaded in the
process with the `load='layerDependencies'`, that's incorrect, as the
implementation expects also a list, so that's corrected as well.

Signed-off-by: Piotr Buliński <piotr@qbee.io>
---
 lib/bblayers/layerindex.py                       | 4 ++--
 lib/layerindexlib/__init__.py                    | 6 +++---
 lib/toaster/orm/management/commands/lsupdates.py | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/bblayers/layerindex.py b/lib/bblayers/layerindex.py
index 308a5532d..2ba1103a3 100644
--- a/lib/bblayers/layerindex.py
+++ b/lib/bblayers/layerindex.py
@@ -116,7 +116,7 @@ class LayerIndexPlugin(ActionPlugin):
 
         # Load the cooker DB
         cookerIndex = layerindexlib.LayerIndex(self.tinfoil.config_data)
-        cookerIndex.load_layerindex('cooker://', load='layerDependencies')
+        cookerIndex.load_layerindex('cooker://', load=['layerDependencies'])
 
         # Fast path, check if we already have what has been requested!
         (dependencies, invalidnames) = cookerIndex.find_dependencies(names=args.layername, ignores=ignore_layers)
@@ -137,7 +137,7 @@ class LayerIndexPlugin(ActionPlugin):
 
             for remoteurl in _construct_url(apiurl, branches):
                 logger.plain("Loading %s..." % remoteurl)
-                remoteIndex.load_layerindex(remoteurl)
+                remoteIndex.load_layerindex(remoteurl, load=['layerDependencies'])
 
             if remoteIndex.is_empty():
                 logger.error("Remote layer index %s is empty for branches %s" % (apiurl, branches))
diff --git a/lib/layerindexlib/__init__.py b/lib/layerindexlib/__init__.py
index c3265ddaa..e693e5c11 100644
--- a/lib/layerindexlib/__init__.py
+++ b/lib/layerindexlib/__init__.py
@@ -174,15 +174,15 @@ class LayerIndex():
         return res
 
 
-    def load_layerindex(self, indexURI, load=['layerDependencies', 'recipes', 'machines', 'distros'], reload=False):
+    def load_layerindex(self, indexURI, load=[], reload=False):
         '''Load the layerindex.
 
            indexURI - An index to load.  (Use multiple calls to load multiple indexes)
 
            reload - If reload is True, then any previously loaded indexes will be forgotten.
 
-           load - List of elements to load.  Default loads all items.
-                  Note: plugs may ignore this.
+           load - List of elements to load. By default, an empty list is used to keep things lean.
+                  Callers need to specify a minimal set of elements to load, such as ['layerDependencies'] for dependency resolution.
 
 The format of the indexURI:
 
diff --git a/lib/toaster/orm/management/commands/lsupdates.py b/lib/toaster/orm/management/commands/lsupdates.py
index 0ee00aa15..153b26f60 100644
--- a/lib/toaster/orm/management/commands/lsupdates.py
+++ b/lib/toaster/orm/management/commands/lsupdates.py
@@ -105,7 +105,8 @@ class Command(BaseCommand):
             url_branches = ";branch=%s" % ','.join(allowed_branch_names)
         else:
             url_branches = ""
-        layerindex.load_layerindex("%s%s" % (self.apiurl, url_branches))
+        layerindex.load_layerindex("%s%s" % (self.apiurl, url_branches),
+                                   load=['layerDependencies', 'recipes', 'machines', 'distros'])
 
         http_progress.stop()
 

