Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NpT3A-00081q-FS
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 22:02:41 +0100
Received: from 88-108-113-12.dynamic.dsl.as9105.com ([88.108.113.12]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NpT0I-000675-TG
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 20:59:43 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <5e088bd91003101234h267a24bfr558d696fdf703685@mail.gmail.com>
References: <E1NnJzb-0001K2-HM@melo.openembedded.org>
	<141020e31003052236w4afdcc26x1008a539f0491c9a@mail.gmail.com>
	<1267888617.11175.42.camel@rex> <20100309181656.GA19931@denix.org>
	<1268159056.5437.2018.camel@lenovo.internal.reciva.com>
	<5e088bd91003100922t9b6668fl577fdbafae53c82@mail.gmail.com>
	<1268247148.14566.1079.camel@mill.internal.reciva.com>
	<5e088bd91003101214y53a1d0b2h3bd47f2865e66b74@mail.gmail.com>
	<1268252731.5437.2042.camel@lenovo.internal.reciva.com>
	<5e088bd91003101234h267a24bfr558d696fdf703685@mail.gmail.com>
Date: Wed, 10 Mar 2010 20:59:40 +0000
Message-ID: <1268254780.5437.2044.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Phil Blundell : gtk+: build gtk-demo and package it appropriately
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
X-List-Received-Date: Wed, 10 Mar 2010 21:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-03-10 at 12:34 -0800, Steve Sakoman wrote:
> My repo is at current top of tree with your gtk+.inc patch and
> gtk+_2.18.6.bb unchanged:

Ah, I remember now, you need a patch to base.bbclass as well to make it
stage the files from etc/.  Try this:

diff --git a/classes/base.bbclass b/classes/base.bbclass
index bbc1cc7..2327c1e 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -1100,6 +1100,7 @@ sysroot_stage_dirs() {
                sysroot_stage_libdir $from${base_libdir} $to${STAGING_DIR_HOST}${base_libdir}
        fi
        sysroot_stage_dir $from${datadir} $to${STAGING_DATADIR}
+        sysroot_stage_dir $from${sysconfdir} $to${sysconfdir}
 }
 
 sysroot_stage_all() {

p.




