Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arl-0000U5-Pf
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:37 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075454ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=w4d0tXMPDzCKZat5cTfhBR9eNmhRkLJumlEG10/0Pd4=;
	b=Yeep03x1ZAgjtwTfS0nTBHr9QFZfSiapsfZh31XjqqRPZUeY6pO3CguZmb9YVTImVj
	xl/1dw8hvdG9NuOte/Q6NWngQsgUErcBySqpiQLRWV4claziBSdfOsa4vg7c10m/J7tc
	KIhTqM+zvaO3PzvVjK8lI0wLaT9CYjPecfR9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=gUylGLmO8VaB/wUaIviWEpTkwfiCkJYfA3NenRsLTPXVaj3mnvnEUTH7OP30ExYTGb
	q2xEWtFIZ1TVUUQ3ShfKexYD9INybOYC/bIf0CXYvsrd7jfAbSeIxKiM+TQ2I786l+JY
	lN+jtDrrdln2CSKuJFCNix3npznzwZC7QKN14=
Received: by 10.100.251.8 with SMTP id y8mr10168821anh.74.1241830222691;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm3639452ywp.14.2009.05.08.17.50.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 171C26101A7; Fri,  8 May 2009 21:50:53 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:37 -0300
Message-Id: <1241830239-5594-22-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-21-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-19-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-20-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-21-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 21/23] libgnomeprintui: drop gnome-common dependency since it is added by gnome class
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
X-List-Received-Date: Sat, 09 May 2009 00:56:38 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/gnome/libgnomeprintui_2.18.3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/libgnomeprintui_2.18.3.bb b/recipes/gnome/libgnomeprintui_2.18.3.bb
index 7c6d289..021b9ad 100644
--- a/recipes/gnome/libgnomeprintui_2.18.3.bb
+++ b/recipes/gnome/libgnomeprintui_2.18.3.bb
@@ -1,6 +1,7 @@
 LICENSE = "GPL"
 SECTION = "x11/gnome/libs"
-DEPENDS = "libgnomeprint gtk+ libgnomecanvas gnome-icon-theme gnome-common"
+DEPENDS = "libgnomeprint gtk+ libgnomecanvas gnome-icon-theme"
+PR = "r1"
 
 inherit gnome pkgconfig
 
-- 
1.6.3.rc1.51.gea0b7



