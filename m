Return-Path: <diego.sueiro@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 625F56D799
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 17:08:45 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id tp5so14259016ieb.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 09:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=b96Og+v4zHH8WfYPk/SA4aDpLyzb0+8iWNTKoymDyG8=;
	b=sXuTx2PzH7upJI1IoQe9j4CqzY96ihb/h29laOq9A5t/o34GsD/ScxOLFXkmnUizAu
	DCFBQqi4N4TozrFbr8FXWcnrApOWir8oemJIXua9UA3rtF/l960PzCEbHHDKY5Zvg/Uq
	4PcWfrgTamYcVPU0M+RtIe+qMvcugetfhz14TnHZfNFJ75OmWEsLHNNOf3GD5B7Cbis2
	EBKz+DspM1V3nEABagAVqQF1RNLTFTk4ctyK9LzdlhAs59UQPAHGOMEH7qEs4V0iQQRa
	c7grdrw0P0FyRYINeAGqLfC3PLFesaYHz7u88fC1ONKiMt4aHbTbkv03pmQVRf1NclEg
	i6lQ==
X-Received: by 10.42.130.129 with SMTP id v1mr27462254ics.32.1385658524629;
	Thu, 28 Nov 2013 09:08:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.26.233 with HTTP; Thu, 28 Nov 2013 09:08:24 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 28 Nov 2013 15:08:24 -0200
Message-ID: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Change to vsftpd recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Nov 2013 17:08:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I realized that when trying to connect via ftp to a target system (which
has vsftpd installed) I should had to create the /var/run/vsftpd/empty
directory before.

Bellow is the patch to create the folder on vsftpd install task:

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bbb/meta-networking/recipes-daemons/vsftpd/
vsftpd_3.0.0.bb
index 49d5d2a..82466d1 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
@@ -70,6 +70,8 @@ do_install() {
         sed -i "s:/lib/security:${base_libdir}/security:"
${D}${sysconfdir}/pam.d/vsftpd
         sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
     fi
+
+    install -d ${D}${localstatedir}/run/vsftpd/empty
 }

 INITSCRIPT_PACKAGES = "${PN}"



Regards,

--
*dS
Diego Sueiro

/*long live rock 'n roll*/

