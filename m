Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LyWm6-0005yF-RE
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 21:45:58 +0200
Received: by yx-out-1718.google.com with SMTP id 36so75057yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=RmuhkE7mpE1gBT0ztBU6Gt4ltvHz5Z70pP6UEzKgmxA=;
	b=TKkFqIb94B6WkubRukZ8ZCBA+bHmgSS8pEEfob64QL5FI/eyX8s3hQLgdYXwk4r8nx
	OjpsTqdJCCm0I29Lb1rrC6Husc/g9aJ4YoKk1Vow85V1lhrVeR1qgYWCC46mKfaPZVtj
	C/SXo0jG8wHiA2RKBrxeMNWwXPQyRZUlWjv5k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=nboBDZ9/ZbYZ78rEfE672+ziHYC+hYvAiwGDuJSNBJ0cKuknrIxMJH84yJr2edzpKk
	ELuOTWb1ZZSibrk1n4ORc/tFC7MrP0h4UmPCNYHQhRYwEa5pBUw/xWOwm++2+99RFsen
	mzamM3i/6gBqm5Aerq5/OWNOXICI6fA2HRPCU=
MIME-Version: 1.0
Received: by 10.90.118.8 with SMTP id q8mr7454581agc.40.1240861254084; Mon, 27 
	Apr 2009 12:40:54 -0700 (PDT)
Date: Mon, 27 Apr 2009 21:40:53 +0200
Message-ID: <c384c5ea0904271240p7450829fn26a7a7f6bf6752c3@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"Denis 'Gnutoo' Carikli" <GNUtoo@no-log.org>
Subject: TARGET_CC_ARCH += "${LDFLAGS}" ??
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
X-List-Received-Date: Mon, 27 Apr 2009 19:45:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I just came across this fix:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=413cc98aa563c9e6104d1104d5b24987ab9d12f8

which does:

+TARGET_CC_ARCH += "${LDFLAGS}"

to fix LDFLAGS QA(GNU-hash).

but doesn't this approach abuse TARGET_CC_ARCH?

Regards,
-- 
Leon


