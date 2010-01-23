Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYcSB-00081J-Jp
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:38:55 +0100
Received: by yxe5 with SMTP id 5so1645073yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Kr+jsta9bDn3LiG/zEKajlmejcJa+YevNxqJuc9jeig=;
	b=wqHJqwFHH49L8/kZFewWuQeNPAo8hcjjz5HCOzW7jUzINkaId63Fv5J6JJNhHZ8JMw
	WjRf76W+fi68el9QJ2dKP6T/2Ie9/qn+m3JZN2z4xFydySCN+fBeGz5Egxnt5VdY0cYX
	cGzmSSV/9BrekwVWT1QZ8ig17s9AN5mKx7MNE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KT5Pa3hlm6lhpspoPYiybW9U7SLynN5Mginybyp5qpPMPjg11lDiOnkrLLZbn/ILGG
	Gk1tVplrJiWm50DpCfeR4zT2hszLFiWh3mApsKTxjYEYEcJBreH+DViBkN0IIhc46DNp
	Nt4bDiL3exOPztPGGLbUx8Wlh5Vm0e4NF7C0o=
Received: by 10.101.106.19 with SMTP id i19mr5162406anm.186.1264239392666;
	Sat, 23 Jan 2010 01:36:32 -0800 (PST)
Received: from localhost ([123.162.71.84])
	by mx.google.com with ESMTPS id 5sm1104130ywd.42.2010.01.23.01.36.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 01:36:31 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 17:36:07 +0800
Message-Id: <1264239367-26057-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux-storcenter: fix circular dependency between do_package and do_deploy
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
X-List-Received-Date: Sat, 23 Jan 2010 09:38:55 -0000

* 'addtask deploy' sentence in linux-storcenter_2.6.27.7.bb conflicts with the same one in kernel.bbclass and causes circular dependency between do_package and do_deploy

Signed-off-by: Guo Hongruan <camelguo@gmail.com>
---
 recipes/linux/linux-storcenter_2.6.27.7.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-storcenter_2.6.27.7.bb b/recipes/linux/linux-storcenter_2.6.27.7.bb
index b403cda..e842ab7 100644
--- a/recipes/linux/linux-storcenter_2.6.27.7.bb
+++ b/recipes/linux/linux-storcenter_2.6.27.7.bb
@@ -53,5 +53,3 @@ do_deploy() {
 }
 
 do_deploy[dirs] = "${S}"
-
-addtask deploy before do_package after do_install
-- 
1.5.4.3



