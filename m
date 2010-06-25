Received: from fg-out-1718.google.com ([72.14.220.156])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7xU-00064W-M8
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:25:54 +0200
Received: by fg-out-1718.google.com with SMTP id d23so235538fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=hmt1Q8VQVjq5aAx+Rf9+Ex3yJSsEmu/r9PMVu25zLnw=;
	b=VKoKVaCdwuonUNWTDLKhMU75ijMZkxTc2KxU74l2nAUs4bcPF1MN+nuKhFa8DC8QPj
	09OctthMd/nR88SeteihlRU7b1sCnprBk1lt2xPZtBociy2Erp/52hb4TFVvf1VI7OIu
	TopkILicUepHGoIj5ks9/qUDbopiXjCdogmLg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=WOpXQKgrTSpbNBHEvqKedcj1xxqqZHFm/UPsRUADsJ58tOv/+Fs8Za5hI0LkEWP/S3
	pFBqk6U066FnO7+hLx+gSOtLEH5zZF2/7ZTLX34yQpMrE/KeI/pmmMtUqLf1/zUr/58B
	AukYqv+wxQPIbqw7VokDJW808fRbltHWztM3s=
Received: by 10.223.18.2 with SMTP id u2mr494168faa.73.1277468399749;
	Fri, 25 Jun 2010 05:19:59 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p21sm37833943fak.45.2010.06.25.05.19.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:19:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:19:34 +0200
Message-Id: <1277468383-16679-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 72.14.220.156
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: recipes/mesa cleanup
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
X-List-Received-Date: Fri, 25 Jun 2010 12:28:46 -0000

Hi,

i know the rules about removing old versions, but in this dir there were versions 
really old and I'm pretty sure they cant be even built with current OE (I tried in
few cases and then refused to spend whole day just to confirm that some 6.0 version 
still builds after converting to new staging and cleanups..).

Please review/test.

FYI: all those patches are often rebased on top of oe.dev also here 
http://gitorious.org/~jama/angstrom/jama-shr-experimental 
if cherry-picking is more effective way for you to test

Regards,



