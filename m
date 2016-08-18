Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id DE5B960722
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:33:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20160818093320096_0485
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:33:20 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=44365 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1baJj5-000424-Qo for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2016 05:35:03 -0400
Date: Thu, 18 Aug 2016 05:32:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1608180530180.16639@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] meta-oe: Standardize use of "_append" versus use of "+="
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
X-List-Received-Date: Thu, 18 Aug 2016 09:33:24 -0000
Content-Type: text/plain; charset=US-ASCII


Remove superfluous "+=", then manually add necessary leading space.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  not build-tested, but looks pretty straightforward.

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 500e194..3a3886b 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -57,8 +57,8 @@ CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regc
                   ac_cv_printf_positional=yes ac_cv_file__etc_environment=yes \
                   ac_cv_file__etc_TIMEZONE=no"

-CFLAGS_append += "-DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
-LDFLAGS_append += "-lpthread"
+CFLAGS_append = " -DDESTRUCTOR_ATTR_WORKS=1 -I${STAGING_INCDIR}/et"
+LDFLAGS_append = " -lpthread"

 FILES_${PN} += "${datadir}/gnats"
 FILES_${PN}-doc += "${datadir}/examples"
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
index c2c4eae..03bad31 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_2.4.7.bb
@@ -53,7 +53,7 @@ EXTRA_OECONF = '--enable-dependency-tracking \
 	        --with-ssh2 \
 	        --with-sqlite3 \
 	        '
-CFLAGS_append += "-lldap -llber"
+CFLAGS_append = " -lldap -llber"

 do_configure_prepend() {
     export KERNEL_VERSION="${KERNEL_VERSION}"
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
index 3fa5724..34749d0 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.5.bb
@@ -16,8 +16,8 @@ S = "${WORKDIR}/zeromq-${PV}"

 #Uncomment to choose polling system manually. valid values are kqueue, epoll, devpoll, poll or select
 #EXTRA_OECONF += "--with-poller=kqueue"
-#CFLAGS_append += "-O0"
-#CXXFLAGS_append += "-O0"
+#CFLAGS_append = " -O0"
+#CXXFLAGS_append = " -O0"

 inherit autotools ptest pkgconfig


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


