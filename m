Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pd77O-0003vG-DU
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 21:16:30 +0100
Received: by fxm17 with SMTP id 17so920117fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=IuQhRn7FwS55CG/RNdzeQjRI8Yvu+pbBUfhAbNyVdlk=;
	b=Ru2l0OGYPjDwk4J1wLoU11a4sAdD2y14VyHM0hXNVD5a/b1wWdhPOG5Kwz+LLsD4C/
	p6S3eofLD0s6Oe5JDQKlME8nd/kUl28pp7ajfM4eQqLCyZIRZXrVSOAUSCgJVOqm5VMy
	ep/B3Ch4L+WcIIN+EdbHm3Iwlp4jnqH6ps5r4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pJnNpbNM2rTUwr5MCJPIMUBKw2NnepNkCFXgWiN9yzNMLqmv83dv0lHAEZQ0XQ2Czi
	zBLmncGYXls9/oRuXKIu+5ab/bSmkOgDNs9CXsfio8QBcOYOX8ICA2gj/IT6bWE086Ts
	dXRN/Nuw55XpL+fcIqTTKP3dGZWT/r/oNlqUg=
Received: by 10.223.102.79 with SMTP id f15mr1416819fao.134.1294863358588;
	Wed, 12 Jan 2011 12:15:58 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id 17sm378612far.19.2011.01.12.12.15.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Jan 2011 12:15:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pd76n-0000OX-Od; Wed, 12 Jan 2011 21:15:53 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 21:15:51 +0100
Message-Id: <1294863352-1486-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 2/3] autotools.bblass: mkdir also AC_CONFIG_MACRO_DIR
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
X-List-Received-Date: Wed, 12 Jan 2011 20:16:30 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/autotools.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 77bd37d..45b75df 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -176,7 +176,9 @@ autotools_do_configure() {
 			fi
 
 			fi
-			mkdir -p m4
+			for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
+				mkdir -p ${aux}
+			done
 			oenote Executing autoreconf --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 			autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed."
 			if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CONFIGURE_AC >/dev/null; then
-- 
1.7.2.3



