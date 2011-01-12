Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pd77Q-0003vc-Rd
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:16:32 +0100
Received: by bwz10 with SMTP id 10so874415bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kV4YryMK1jnAjlRsf+G3j/tah8WXU7qo27vFVp465nE=;
	b=Qzu/O37kFS7ha8jughTB/e9Nuv9hoBVNO3NtYh5STwKmt80CuwfkM6qxat0rOBMbh8
	kRAlO5lVHLHT8VaqxboOtMZDbIGGZKoRfx4oAQ/EwKpqIVbSC+oWCUSOmROa5TUQ1boy
	umQ5EksFjWt1h8HbQ1Ld3iAIveinTThFXckTQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mOhzxqHJmHPM1iVyuTS1JIzEebOxVTPTqjuxSgfwGGEK8fFxpHZNVArjCiRm8sMkD/
	v/8ipz/36odouEQMLXTqpzu64LIHkDlFd/MVa50CnmtMSFbCmVqDUlmJkIETZ6/FwgJF
	99Y2vFvbIvNiLrdbmToCLiMQjroF+/79bH4O8=
Received: by 10.223.95.207 with SMTP id e15mr1427492fan.145.1294863359416;
	Wed, 12 Jan 2011 12:15:59 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n1sm378458fam.16.2011.01.12.12.15.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 12:15:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pd76n-0000OV-O2; Wed, 12 Jan 2011 21:15:53 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 21:15:50 +0100
Message-Id: <1294863352-1486-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 1/3] autotools.bbclass: pass distro_imposed_configure_flags
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
X-List-Received-Date: Wed, 12 Jan 2011 20:16:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/autotools.bbclass |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 247e21d..77bd37d 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -65,6 +65,22 @@ def append_libtool_sysroot(d):
 			return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
 	return ''
 
+def distro_imposed_configure_flags(d):
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d, True) or ""
+	distro_features = distro_features.split()
+	flags = set()
+	features = (('largefile', 'largefile'),
+		('ipv6'     , 'ipv6'),
+		('nls'      , 'nls'))
+
+	for knob, cfgargs in features:
+		if isinstance(cfgargs, basestring):
+			cfgargs = [cfgargs]
+		en_or_dis = knob in distro_features and "enable" or "disable"
+		for flg in cfgargs:
+			flags.add("--%s-%s" % (en_or_dis, flg))
+	return " ".join(flags)
+
 # EXTRA_OECONF_append = "${@autotools_set_crosscompiling(d)}"
 
 CONFIGUREOPTS = " --build=${BUILD_SYS} \
@@ -85,6 +101,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
 		  ${@append_libtool_sysroot(d)} \
+		  ${@distro_imposed_configure_flags(d)} \
 		"
 
 oe_runconf () {
-- 
1.7.2.3



