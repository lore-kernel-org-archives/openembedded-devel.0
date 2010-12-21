Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PV5st-0002SB-R7
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 18:20:23 +0100
Received: by mail-fx0-f42.google.com with SMTP id 11so4040249fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=Z56Zs9yjE1ufgYPlkEAJPYXQ2lBPIZ5pnk3SAKL9cX8=;
	b=R5dKEaaEjK2dcYEW/y4UDM8Y3hQtDYhzrsTtWV8OYVkzYeOYtZWMB9rukgsqDaMICG
	+IwihGVG44fcnMYMS84JKhihYUngS+SfCUT9JzHqmIZP+9ogIXUlmHKs5UlI3yBXjLdW
	IKFHrpFksT5AUnkDTcqhCHSN/4JhmeNJ5XwEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HTWSRKilm9baCmHnaJRpp61RmIKfAric/dnUwo8Q/ihWD6zC/TaWmLOTzeP2SikY9/
	hrydD2TfrbYMWN9r/AJLJw1VxHSO1q1L+7SkXsotQYU8VLlnrxG2aydWxA/y45nu9vrB
	6B7WL6t8e9v4b2gUvbRK/2HfQmOMTrA7rYqXk=
Received: by 10.223.83.199 with SMTP id g7mr6272553fal.81.1292952005460;
	Tue, 21 Dec 2010 09:20:05 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y14sm1401082fak.42.2010.12.21.09.20.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 09:20:04 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PV5sY-0004xX-TM; Tue, 21 Dec 2010 18:20:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 18:19:58 +0100
Message-Id: <1292951999-18969-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH] conditional patch-tool dep
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
X-List-Received-Date: Tue, 21 Dec 2010 17:20:24 -0000

Hi,

If a recipe doesn't reference any patch then patching doesn't make sense
and neither does depending on patch-tool.

I didn't look yet if i can say
addtask patch after do_unpack if needs_patching_at_all(d)
(or something like that).
So, for a start, don't depend do_patch on the patch tool if there is no
patch in the SRC_URI.

untested.

PS: There should be some oe.is_compressed(uri) shorthand that is used to
decide if an uri is in a compressed format, imho.

Bernhard Reutner-Fischer (1):
  patch.bbclass: conditional patch-tool dependency

 classes/patch.bbclass |   21 +++++++++++++++++++--
 1 files changed, 19 insertions(+), 2 deletions(-)

-- 
1.7.2.3



