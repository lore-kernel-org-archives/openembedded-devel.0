Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Oea8b-0007Pc-SA
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 22:55:35 +0200
Received: by fxm12 with SMTP id 12so590328fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=dDls+FAPpML6iJ4589noKR/U2qMHxE2jgf85h20B3Kw=;
	b=Elcf6qLsaTA+HanjL61AMqBtw2xX0ykT8ttMlu4y/f4jRj/AKkE8JdXPs2oEFgfEDC
	0MPA0UXRtsjBnsGah6vywg8Cb1wWL59koYwwojhnwc74wHMdcAYpdwdOmL/KBoMMXjT1
	Iv+dDTsRgwK0Gx5adQQp8YBjerwiTB1jK4ES0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CHO7mtU/6EbcIZ/BkudxcxeTlGd5PLJWJSBtoFxUqiAGISdu7xE7jaJZHpn7gEw0jt
	suVgqMH0R4HS0nuXIUV3qitjC4Y0iRj+5AxxVZ14NOwAPiuxVnJvqcRHNUCGLmah3ITw
	8utAdYGOWHKtFn5be8FhOnj7tnvlSbhKhLQxA=
Received: by 10.223.113.144 with SMTP id a16mr996228faq.41.1280436914275;
	Thu, 29 Jul 2010 13:55:14 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id r10sm492164faq.29.2010.07.29.13.55.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Jul 2010 13:55:13 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Oea88-0000Sw-PK; Thu, 29 Jul 2010 22:55:04 +0200
Date: Thu, 29 Jul 2010 22:55:04 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100729205504.GE29814@mx.loc>
References: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
In-Reply-To: <1280415061-28353-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] distribute_license: added class to copy license files
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
X-List-Received-Date: Thu, 29 Jul 2010 20:55:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2010 at 09:51:01AM -0500, Chase Maupin wrote:
>* This class can be used to copy license files from package
>  sources into the deploy directory so they can be distributed.
>* By default it searches the top-level source directory for
>  files matching COPYING* or LICENSE*
>* Search depth and pattern can be modified using the
>  LICENSE_SEARCH_DEPTH and LICENSE_FILES variables
>  respectively.
>
>Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>---
> classes/distribute_license.bbclass |   56 ++++++++++++++++++++++++++++++++++++
> 1 files changed, 56 insertions(+), 0 deletions(-)
> create mode 100644 classes/distribute_license.bbclass
>
>diff --git a/classes/distribute_license.bbclass b/classes/distribute_license.bbclass
>new file mode 100644
>index 0000000..795a404
>--- /dev/null
>+++ b/classes/distribute_license.bbclass
>@@ -0,0 +1,56 @@
>+# distribute-license.bbclass will search the sources of a package to
>+# a given depth looking for a match to the specified pattern and if
>+# found will copy the matching file(s) to the deploy directory.
>+#
>+# This class is used to collect license files such as COPYING or
>+# LICENSE where they are found and save them per package.
>+#
>+# This package uses the following variables to control its operations:
>+#   - LICENSE_FILES         = Pattern of license files to be searched for.
>+#                             By default this is COPYING* and LICENSE* but
>+#                             this can be changed per package.
>+#   - LICENSE_SEARCH_DEPTH  = The maximum depth to search in the package
>+#                             sources for files matching the LICENSE_FILES
>+#                             pattern.
>+
>+
>+# Files to copy for the licensing.  By default this is looking for
>+# files following the patters COPYING* or LICENSING* in the top
>+# level sources directory.
>+LICENSE_FILES ?= "COPYING* LICENSE*"
>+
>+# Maximum depth to look for license files
>+LICENSE_SEARCH_DEPTH ?= "1"
>+
>+distribute_license_do_copy_license() {
>+    # Change directory to source directory
>+    cd ${S}
>+
>+    # Turn of globbing so that wildcards are not expanded in for loop

/s/of/off/

>+    set -f

hush: set: -f: invalid option

>+
>+    # Check if LICENSE_FILES exist.  If so copy them to DEPLOY_DIR
>+    for lic in ${LICENSE_FILES}
>+    do
>+        res=""

superfluous

>+        res=`find . -maxdepth ${LICENSE_SEARCH_DEPTH} -name "$lic"`
>+        if [ "$res" != "" ]

breaks on older test(1) impls that don't handle empty strings properly.
Could be that this one is moot by now though.

>+        then
>+            mkdir -p ${DEPLOY_DIR}/licenses/${PN}
>+            cp $res ${DEPLOY_DIR}/licenses/${PN}

install -D ${DEPLOY_DIR}/licenses/${PN} ${DEPLOY_DIR}/licenses/${PN}

>+        fi
>+    done
>+
>+    # Turn globbing back on
>+    set +f

hush: set: +f: invalid option

>+
>+    # Just to be clean change directory back to where we started from.
>+    cd -
>+}

What's the reason you don't do that in python instead?
Just curious as it would save quite some potential hazzle..

>+
>+EXPORT_FUNCTIONS do_copy_license
>+
>+# Put after do_patch in case a patch adds the license files
>+do_copy_license[deptask] = "do_patch"
>+
>+addtask copy_license after do_patch before do_configure
>-- 
>1.7.0.4

someone should bump git to 1.7.2, a BBCLASSEXTENDEDed version seems to
work for me ...


