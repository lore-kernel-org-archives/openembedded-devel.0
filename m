Received: from [209.85.210.173] (helo=mail-yx0-f173.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Mv6A7-0002L9-3t
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 11:16:54 +0200
Received: by yxe3 with SMTP id 3so3571245yxe.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2009 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer;
	bh=NkIHZi3bxqLP1TwseogvIP0YK8OIHUOSFJs0khWEOjM=;
	b=CY3Zi1GIQak75C6k51MUMtyajNgpiKR6dOMUgCta04/xQGdqMmlTrIeUSZ0OOZWxl3
	RNndlGnRg9kvdhN2LylYYuyPC2rnQtO4/UTLoHiOvFg0m21fBnXULoNNuo8A/5SV+MEP
	g8tojLYHXcGeUyrBcczpIUtstGojMPzKzu7Zk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer;
	b=FEDFgYqVx2VWs5KM7fim3Ww2j+KhgCk+DtdWR7XQAYw8tORn5mdORMEzvgmC0LPo1S
	K3yVYknq1pWIjqBJKd2kGOpW6+PbQxR8RaqZGx1h6b/zJoBW4wZeQkdcCYfo1FldEUpC
	ulFA2dpNb5b5QqREsPObUzma1nn3hzvnj2Lv4=
Received: by 10.100.51.10 with SMTP id y10mr1177888any.128.1254820562016;
	Tue, 06 Oct 2009 02:16:02 -0700 (PDT)
Received: from ?192.168.1.2? (d86-32-77-106.cust.tele2.at [86.32.77.106])
	by mx.google.com with ESMTPS id 22sm418784ywh.0.2009.10.06.02.15.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Oct 2009 02:16:00 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0910051559v21ab3a2et766095a124dfb537@mail.gmail.com>
References: <1254768733.10712.3.camel@leeloo.somedomain>
	<1254770821.9214.105.camel@lenovo.internal.reciva.com>
	<1254774335.3947.12.camel@leeloo.somedomain>
	<be7a9f3d0910051559v21ab3a2et766095a124dfb537@mail.gmail.com>
Date: Tue, 06 Oct 2009 11:16:03 +0200
Message-Id: <1254820563.6107.4.camel@leeloo.somedomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 209.85.210.173
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Tue, 06 Oct 2009 09:16:54 -0000
X-Groupsio-MsgNum: 13341
Content-Type: multipart/mixed; boundary="=-AfrBRG7VAQtyXi3//CEg"

--=-AfrBRG7VAQtyXi3//CEg
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 05.10.2009, 19:59 -0300 schrieb Otavio Salvador:
> The best way to provide the patch is to commit it locally and use git
> format-patch to export it. Then send it attached to the mail.

Thx for all the infos. Here's the patch.



--=-AfrBRG7VAQtyXi3//CEg
Content-Disposition: attachment; filename*0=0001-lighttpd-1.4.18-Fixed-missing-runtime-module-depende.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-lighttpd-1.4.18-Fixed-missing-runtime-module-depende.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From fc5de54141069d3c6ef8a15783563123e1c479d1 Mon Sep 17 00:00:00 2001
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Tue, 6 Oct 2009 11:04:04 +0200
Subject: [PATCH] lighttpd 1.4.18: Fixed missing runtime module dependencies


Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 recipes/lighttpd/lighttpd_1.4.18.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/lighttpd/lighttpd_1.4.18.bb b/recipes/lighttpd/lighttpd_1.4.18.bb
index d5870ba..a446122 100644
--- a/recipes/lighttpd/lighttpd_1.4.18.bb
+++ b/recipes/lighttpd/lighttpd_1.4.18.bb
@@ -2,7 +2,12 @@ DESCRIPTION = "Web server"
 SECTION = "net"
 LICENSE = "BSD"
 DEPENDS = "libpcre"
-PR = "r3"
+RDEPENDS_${PN} += " \
+        lighttpd-module-indexfile \
+        lighttpd-module-dirlisting \
+        lighttpd-module-staticfile"
+
+PR = "r4"
 
 SRC_URI = "http://www.lighttpd.net/download/lighttpd-${PV}.tar.gz \
 	   file://configure.in.patch;patch=1 \
-- 
1.6.3.3


--=-AfrBRG7VAQtyXi3//CEg--
