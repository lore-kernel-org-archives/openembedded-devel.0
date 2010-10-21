Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P8j4R-00070n-7o
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 02:31:52 +0200
Received: by pwi3 with SMTP id 3so159019pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 17:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=yO7IyvnHvr7JvBrVuD4XiyZtm5KtGAMGWG6plIHeuAQ=;
	b=wV0s5yhiRAC77pI73I9tYggQuZt+gzk6/6b7/DjQ/amtNfr7cPmRs+uLoGEwwA0SrN
	8tbGRohV/erH06OFwDO10nNNXOgkf2YExSBCnCKNgIo4ZMRviv0qjZX+Ur6F29KuPu+l
	bB3ERO4QHJYnV85WELAZGo/XNGkuevUIa4FQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=dimjD56aVDHbpfqDVT8mnR3PT4AVP+AYciBjmkaSf8IZuHcliPbTYwCJijR/5rJeUG
	L1G2KxfIVg1biFK2Ud2ocsTGsAa/pSsIX7e9otLGzAPFIs84QSX1rW8NUbQHc7kwl7ek
	0cp3DQAPeq1g3wHr6uvisN1lDkUoDCDvNXof4=
Received: by 10.142.246.20 with SMTP id t20mr128396wfh.252.1287621074510;
	Wed, 20 Oct 2010 17:31:14 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	w42sm1284695wfh.15.2010.10.20.17.31.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Oct 2010 17:31:13 -0700 (PDT)
Message-ID: <4CBF89CE.8040705@gmail.com>
Date: Thu, 21 Oct 2010 11:01:10 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] site/mips{,64}-common: Add postgresql bits.
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
X-List-Received-Date: Thu, 21 Oct 2010 00:31:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 site/mips-common   |    6 ++++++
 site/mips64-common |    6 ++++++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/site/mips-common b/site/mips-common
index 4b18c84..49e6dee 100644
--- a/site/mips-common
+++ b/site/mips-common
@@ -29,3 +29,9 @@ ac_cv_alignof_CORBA_long_double=8
 ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_struct=1
 
+# postgresql
+pgac_cv_alignof_short=2
+pgac_cv_alignof_int=4
+pgac_cv_alignof_long=4
+pgac_cv_alignof_long_long_int=8
+pgac_cv_alignof_double=8
diff --git a/site/mips64-common b/site/mips64-common
index 5001ecd..90c2efe 100644
--- a/site/mips64-common
+++ b/site/mips64-common
@@ -29,3 +29,9 @@ ac_cv_alignof_CORBA_long_double=8
 ac_cv_alignof_CORBA_pointer=4
 ac_cv_alignof_CORBA_struct=1
 
+# postgresql
+pgac_cv_alignof_short=2
+pgac_cv_alignof_int=4
+pgac_cv_alignof_long=8
+pgac_cv_alignof_long_long_int=8
+pgac_cv_alignof_double=8
-- 
1.7.1



