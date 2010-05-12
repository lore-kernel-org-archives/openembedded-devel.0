Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vonami@gmail.com>) id 1OCDKF-0000r9-Q4
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 16:54:22 +0200
Received: by ewy25 with SMTP id 25so56851ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=NjSdoVQ88k16B5Q5LbIimMRLHKM/h6xmg5DhXPMfiAo=;
	b=uGb18HGgkk9w9RE3wes7f7P+9Ygp9jjbeIFFxwurJdhT9Jar7UqggmqLO18gyzjjSU
	qlsjEWhLOgQuuNZWOn+X0UpesoN70CjP95EdHYyEOTuM5TcshUmL6WF3rixW2qxBB6/q
	wd6w8e1FVaTzseseJXHFDR6nEayVzifwE9BVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=yD3HMnPmhGI6/ez+8Z7gyYQU9VoaIY6eDWf9L+rVOB444IGu4Wy+/TCyK6WS8sdYdK
	MSqLI9Y66gAyu2KkppLeliDbjmiuV1RgX9AZEkc1YptKLzE5X5/zVpYuoumvMy6vttXF
	nIUQLr6g5YehOmesyhAUYTi05eMUwDFfShNIM=
MIME-Version: 1.0
Received: by 10.239.135.139 with SMTP id d11mr753196hbd.106.1273675823545; 
	Wed, 12 May 2010 07:50:23 -0700 (PDT)
Received: by 10.239.157.131 with HTTP; Wed, 12 May 2010 07:50:22 -0700 (PDT)
Date: Wed, 12 May 2010 18:50:22 +0400
Message-ID: <AANLkTik0NdQzA-Sn6nVYMP5HmAmyo1ZOBqHEW-Awi_p_@mail.gmail.com>
From: Dmitry Ivanov <vonami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.225
X-SA-Exim-Mail-From: vonami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Fix build of krb5
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
X-List-Received-Date: Wed, 12 May 2010 14:54:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello, list!

The krb5 recipe says krb5 depends on system's libcom_err that comes
with e2fsprogs. But the recipe lists the native version of e2fsprogs
in DEPENDS. The following one-liner fixed compilation for me:

diff --git a/recipes/krb/krb5_1.6.3.bb b/recipes/krb/krb5_1.6.3.bb
index e25cdcf..35c7975 100644
--- a/recipes/krb/krb5_1.6.3.bb
+++ b/recipes/krb/krb5_1.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 PR = "r6"
 LICENSE = "MIT"
-DEPENDS = "perl-native ncurses util-linux-ng e2fsprogs-native"
+DEPENDS = "perl-native ncurses util-linux-ng e2fsprogs"

 inherit autotools binconfig


-- 
Dmitry Ivanov
KDE PIM developer (pim.kde.org)
partimage-ng developer (partimage-ng.net)


