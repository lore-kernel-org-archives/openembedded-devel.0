Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKotj-00073O-6J
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 11:43:10 +0200
Received: by fxm19 with SMTP id 19so1839226fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=8EKccb2bL0CX24YTZUorNqL6WcLVL2DA2aVx3tyFZss=;
	b=k9Em5xnrkyesozgjaw9bTeOsD9bivCPC9t7e9A+YjbwyQckAK6nC/LAdTeWQJdnZbS
	s+of+bTCYzAGQh+k5qBTR4Mdw/6ILNQgrqoZrIZALtjqGLOmJC3LI5gJlxre3KvQIdMp
	AVMUsnsFi5exYwiPCt1iGsASk6y9BM6Gfljjs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=b4h+eGs7Mq28kvFyXNeKE9m9gDzg1gEQeNkMCAxrilTkAVVMnrOtHvWNK4KyWvz7QD
	elbYl1pVHEPc7aRDYbFv8bnGkhZEPEipLJXVWtFgBS2eCtp1SZ0fUlf9rjuv54GeOIs1
	1SAirBqFhg4hlHBp2GlNlWGpeUGlozYUvutns=
Received: by 10.223.73.133 with SMTP id q5mr1448536faj.127.1305279614225;
	Fri, 13 May 2011 02:40:14 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 9sm774157fat.15.2011.05.13.02.40.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 02:40:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 11:40:04 +0200
Message-Id: <1305279609-31395-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: xserver-xorg upgrade to 1.10
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
X-List-Received-Date: Fri, 13 May 2011 09:43:10 -0000

Hi,

later today I plan to push this, so if someone else want to join 
xserver-1.10 it's good time to do so, to save at least one INC_PR bump
in xorg-driver-common.inc..

BTW: first 2 patches (with slightly older version) were sent to ML more
then month ago even when it's not marked as PATCHv2..

Tested on om-gta02/nokia900 and also used in meta-oe..

Later I plan to replace pointercal-xinput files (xinput calls) with xorg.conf.d
variants which are supported since xinput-calibrator-0.7

Cheers,



