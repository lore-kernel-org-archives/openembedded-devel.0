Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4x9T-0001tM-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 12:31:51 +0100
Received: by fk-out-0910.google.com with SMTP id 18so3236189fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 03:26:51 -0800 (PST)
Received: by 10.82.184.2 with SMTP id h2mr8683218buf.22.1198063611456;
	Wed, 19 Dec 2007 03:26:51 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 28sm12347958fkx.2007.12.19.03.26.50
	(version=SSLv3 cipher=OTHER); Wed, 19 Dec 2007 03:26:50 -0800 (PST)
Date: Wed, 19 Dec 2007 13:32:08 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1187652493.20071219133208@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] BogoFeeds reloaded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2007 11:31:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  After the ipk deploy dirs were split to be per-arch, there was a
long discussion that people want to use deploy dir as the feed
directly as it is awfully practical, and that they are not advised to
do that due to various second-rate issues, so such usage should be
called "bogofeed".

  This month should have most of it:
http://projects.linuxtogo.org/pipermail/openembedded-devel/2007-March/thread.html#1658


  There were even patches posted, but they all were questionable as
either they tried to make per-arch vs flat layout configurable, which
could lead to behavior discrepancies in the future, or tried to do
some post-processing, like copying hundreds of megabytes around, while
the very first argument while deploy dir layout could be changed under
people's feet was that even in the case of flat layout, some
post-processing was required to get production-quality feed, and that
postprocessing can be well made outside of OE (hello Makefiles).

  Then, it all died off, with different people adopting different
solutions well suiting exactly them, as usual.

  Well, using deploy dir as feed directly is still demolishfully
practical, and clearing off my tree for NY, I'd finally want to offer
the solution I've been using since then. Unlike solutions cited, it
doesn't try to warp world to get familiar flat look, instead it
rejoices 3D and sails on it, all in 6 lines, why I think it could
finally get into.

--- classes/image.bbclass       57e9ee07875e7423b6e199df2c69e55bdcdb8a69
+++ classes/image.bbclass       a5d924355c51d4ef706a5c60d520aa4dde64d764
@@ -125,6 +125,13 @@ insert_feed_uris () {
                # insert new feed-sources
                echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/etc/ipkg/${feed_name}-feed.conf
        done
+
+       if [ -n "${FEED_LOCAL_BASE_URI}" ]; then
+           for arch in ${PACKAGE_ARCHS}
+           do
+               echo "src/gz local-$arch ${LOCAL_FEED_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/ipkg/local-$arch-feed.conf
+           done
+       fi
 }
 
So, you set FEED_LOCAL_BASE_URI to the root of deploy dir as exported
by Apache, and - voila - you get nice collection of per-arch local feeds in
the image.


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



