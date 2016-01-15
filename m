Return-Path: <stephanoc@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id F10A26080F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 21:03:57 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id q63so126899435pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 13:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xrm3ExrMHHPuVSEYEdkjw5ZPzhcjiDVEgfhnlRahBnE=;
	b=Y1q3mubg2TnRSLwoRy5n/jtEKayHgQs5PlPmEUimHkJkpiBG4OQvGGhAUnTXtuFD9k
	DLBqldGnDXmAXf/AYIlQG8XbvmTRXJL4HEfOi/VD6Q34LV5w3TidOwZM0fm/z2nmNcXW
	PeyK4/mKNkmpNRBloWNwZ7YmnE6zym5HfZjsEsfsLXUTQKwbpJxieo3dc3I9s6gD2PBS
	idipEU17MM73gHTX1kE9EhZblSD25z6Buh6/E44qF5QO59q6Okf11HCpH02903wJG3sH
	hIHiz81ogcYN/ED1+iDYMdqewRN0U4M4KHZadiBg0SBKQUiPBX8ptDaEDkctnmYqmADn
	NIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xrm3ExrMHHPuVSEYEdkjw5ZPzhcjiDVEgfhnlRahBnE=;
	b=eAuLnGVXhUqk8FAHDMrCvyhxYpdSYW66fSX2R5g3nhq+QwZoDvhaF45QyJ2C4kZvyT
	emDPBS/aSljPIizMCh/X9sHARGqII1eX6BhGc/c6xPcRR1vYWbVnBkkHXOXvZuyYvvgL
	9mntG8JRKROCJENbPp+BNPRyUoOFOklV9+UY3HwK3kIN8T/CXIQH6vH3gmMGp+d3Xt8K
	3+Z8qB4t/FxvLGKkojwhX1lk4DmEd3PH8whvCe3FqVbtqEZgcgeGvcoZz/+DJuPl2e1t
	8V8ZzDkWCOqHrvosCI6Yt8MPVytHr35BfezbVBrxls0DVe4spzmbJ+IoohDjHWoweHbR
	NNOg==
X-Gm-Message-State: ALoCoQmp+nNeJTadQzj+SS9dY8fQyt3mM4spNCUS+5OpvgOy/at1CXYwTaol4Pj+p6K7hH9U1ZGejn7mF2RwfeW3AOIfHOxy5g==
X-Received: by 10.98.75.143 with SMTP id d15mr18139326pfj.96.1452891838622;
	Fri, 15 Jan 2016 13:03:58 -0800 (PST)
Received: from ip-172-31-11-191.us-west-2.compute.internal
	(ec2-52-11-37-43.us-west-2.compute.amazonaws.com. [52.11.37.43])
	by smtp.gmail.com with ESMTPSA id
	s13sm15602660pfi.12.2016.01.15.13.03.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jan 2016 13:03:58 -0800 (PST)
From: Stephano Cetola <stephanoc@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2016 13:02:51 -0800
Message-Id: <1452891771-23738-1-git-send-email-stephanoc@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] Fix missing packageconfig for samba with sysvinit
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
X-List-Received-Date: Fri, 15 Jan 2016 21:03:58 -0000

Building samba with sysvinit currently throws a QA warning about
"invalid PACKAGECONFIG: sysv". This fixes that issue.

Signed-off-by: Stephano Cetola <stephanoc@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index a51d31f..14d5f42 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -62,6 +62,7 @@ PACKAGECONFIG[aio] = "--with-aio-support,---without-aio-support,libaio"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
 PACKAGECONFIG[pam] = "--with-pam --with-pam_smbpass --with-pammodulesdir=${base_libdir}/security,--without-pam --without-pam_smbpass,libpam"
 PACKAGECONFIG[lsb] = ",,lsb"
+PACKAGECONFIG[lsb] = ",,sysvinit"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[sasl] = ",,cyrus-sasl"
-- 
1.9.1


