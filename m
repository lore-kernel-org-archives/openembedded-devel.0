Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.betz@gmail.com>) id 1QLSp6-0000Ks-5w
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 06:20:56 +0200
Received: by gyf1 with SMTP id 1so1348980gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 May 2011 21:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xv9ZcLgbZuhbqase5dTWnqUAG0KfehYOheXx09PBH8k=;
	b=Ly4e9LMCdyUWBDHcw9smVb6KOSH/iLsoxZB0PebvIFjgCkpjIOR8ZgMLAJ/giNaIz7
	Ev+/ZA6r+sSwCho+xBcwU86yY8YOwlCGT13Yh4axILsM2Rrkz46T7iK+uHfgL/12MZdw
	huF/x5VEnTbtdWiOSCzWGyzgJpOUQoZQ+0XWQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qPcmK8dqVmjBUGL502mkEloqUf84GTeUFSCOJROw+kKfW4OOfQ4FOH/cK62O2J9nQD
	ZtEDfASGgE7CWf+zKU51E7XGigFJzDXBuvhDNAbvVWGcoUwKmPpMeMiJCLRZAPIhfsJ9
	QjlU8y3b1EA20IvjDz4TJvKNGB/g+s/jxCebk=
Received: by 10.91.50.6 with SMTP id c6mr2463121agk.66.1305433084665;
	Sat, 14 May 2011 21:18:04 -0700 (PDT)
Received: from localhost.localdomain (c-71-224-42-18.hsd1.pa.comcast.net
	[71.224.42.18])
	by mx.google.com with ESMTPS id d20sm2872853ang.43.2011.05.14.21.18.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 May 2011 21:18:03 -0700 (PDT)
From: Christian Betz <christian.betz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 00:16:52 -0400
Message-Id: <1305433012-13000-2-git-send-email-christian.betz@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
References: <BANLkTikVtDGTO=04H8kkPdJLH2UtN9JR2A@mail.gmail.com>
Subject: [PATCH] fix acpid compiler warning on some platforms
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
X-List-Received-Date: Sun, 15 May 2011 04:20:56 -0000

---
 recipes/acpid/acpid-1.0.10/netlink.diff |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/acpid/acpid-1.0.10/netlink.diff b/recipes/acpid/acpid-1.0.10/netlink.diff
index 635c550..ebdec58 100644
--- a/recipes/acpid/acpid-1.0.10/netlink.diff
+++ b/recipes/acpid/acpid-1.0.10/netlink.diff
@@ -2019,7 +2019,7 @@ diff -ruN acpid-1.0.10/libnetlink.c acpid-1.0.10-netlink2/libnetlink.c
 +
 +int addraw_l(struct nlmsghdr *n, int maxlen, const void *data, int len)
 +{
-+	if ((int)NLMSG_ALIGN(n->nlmsg_len) + NLMSG_ALIGN(len) > maxlen) {
++	if ((int)NLMSG_ALIGN(n->nlmsg_len) + (int)NLMSG_ALIGN(len) > maxlen) {
 +		fprintf(stderr, "addraw_l ERROR: message exceeded bound of %d\n",maxlen);
 +		return -1;
 +	}
-- 
1.7.0.4



