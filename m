Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 386D378EE0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 10:05:13 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l19-v6so3184016ljb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=QyGOahtbHyJXTAgEr5ad4OLOBL4vzWxvWgEyxvPQzxc=;
	b=GLdpal6PrSFiPgtk3UYNXSq4tySTkEIsjvhr6E8KCTgqYbm+ci1aHsyaZxQn5EbRuQ
	xlwRb/Zxc8Ro9gyVvNS4VuVsqtxE7whJZ1vWNzE1gNx1zLEbIYS59GUpMgxCSB5X8PWh
	3GGqShJzMho8sFq7dC6Tg6dzP77ETnylfxons=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=QyGOahtbHyJXTAgEr5ad4OLOBL4vzWxvWgEyxvPQzxc=;
	b=Dk3S+wMjXf7U1nqsI9B84K45FsLd/2b/eTi28oWueafzyqQ/oH4/Ob+1MzNgqKxzrC
	dVjpK2D9cdZy4ImjAlaZM/wgtpz1rLw3lL6vE6qvL2p7asEllI69sCUtvE/JpiEajLh5
	SD19peD1PfTpj3UjJ6LfVSSfI5HbFHfoIrVQyKN3+sixYa+9cxXLutSQ4yWy7WEnoS14
	omyTgX6LMhEhIYSg7jNSInCEA3GC0Ek6bK/uyx/ePLODIK6rfd1BK8cE74KJNd4rlYp7
	gjxOsKr9XGAu/4seyPS6pskxdPppqcy6pvJpawn/NwJ3UvAE6+81uTgkYSg6vdraIbMP
	+WBw==
X-Gm-Message-State: ABuFfog+A4sXU0tisa3/jXbzfbX05L/JIhdQ+bI37lzOqpDVXcCFKh7Y
	8QpbLmji2k7fT6hK4submr5n8msBIAQ3u2H+FonJRw==
X-Google-Smtp-Source: ACcGV62CuWtmlvKtf+QqlvwSNayUF0fOpua8tJi4hLqzDSKmniVgYg2QjGSaTtFAeI0XChlsaYZ94faWjffxZIBnnQY=
X-Received: by 2002:a2e:4c09:: with SMTP id z9-v6mr8493816lja.19.1537783513709;
	Mon, 24 Sep 2018 03:05:13 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Sep 2018 12:05:02 +0200
Message-ID: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: meta-oe and yocto-check-layer
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
X-List-Received-Date: Mon, 24 Sep 2018 10:05:13 -0000
Content-Type: text/plain; charset="UTF-8"

hi Armin, Paul, Richard,

I was looking at getting the compliance report for meta-oe (sumo
branch), and I have found a few issues.

* in meta-openembedded/sumo, grpc is in meta-oe layer, while it
depends on meta-networking (c-ares). It was fixes in master, with
251878e8b6b9 (grpc: move it from oe to networking layer), so I think
this fix needs to be backported to sumo as well if we want the YP 2.0
compliance script to even work. If agreed, once merged, please let me
know so that I can try again to generate a compliance report.

* in order to run the compliance report, i locally added
networking-layer in meta-oe/conf/layer.conf, and it creates a
dependency loop since meta-oe <-> meta-networking. I found out that
yocto-check-layer doesn't like that too much, and brutally fails. The
following patch makes yocto-check-layer work again even with
dependency loop. I am going to do a few more tests and send that over
as a patch.

diff --git a/scripts/lib/checklayer/__init__.py
b/scripts/lib/checklayer/__init__.py
index 2618416fab..0cc9bf3b6d 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf, layer,
layers, logger):
         logger.debug('Processing dependencies %s for layer %s.' % \
                     (depends, layer['name']))

+        # To avoid never ending recursion, we keep track of layers while
+        # they are being processed in this 'static' attribute.
+        if not hasattr(recurse_dependencies, "layers"):
+            recurse_dependencies.layers = []
+
         for depend in depends.split():
             # core (oe-core) is suppose to be provided
             if depend == 'core':
                 continue

+            if depend in recurse_dependencies.layers:
+                continue
+
+            recurse_dependencies.layers.append(depend)
+
             layer_depend = _find_layer_depends(depend, layers)
             if not layer_depend:
                 logger.error('Layer %s depends on %s and isn\'t found.' % \


cheers
nico

